-- =====================================================================
-- DCL: roles, usuarios y privilegios
--
-- Uso (como superusuario, después del DDL):
--   psql -U postgres -d hospitales_occidente -f 01_dcl.sql
--
-- Modelo de seguridad (roles de grupo + usuarios de inicio de sesión):
--   rol_auditor          -> solo lectura sobre todo el esquema (auditoría y reportes)
--   rol_administrador    -> privilegios administrativos completos sobre el esquema
--   rol_recepcion        -> operativo: agenda citas y registra facturación y pagos
--   usr_auditor / usr_administrador / usr_recepcion -> usuarios que heredan de cada rol
-- Las contraseñas son de prueba; cambiarlas en un entorno real.
-- =====================================================================

SET search_path TO hospital;

-- ---------------------------------------------------------------------
-- 0. Limpieza para poder re-ejecutar el script
-- ---------------------------------------------------------------------
DO $$
DECLARE
    r TEXT;
BEGIN
    FOREACH r IN ARRAY ARRAY['usr_auditor','usr_administrador','usr_recepcion',
                             'rol_auditor','rol_administrador','rol_recepcion']
    LOOP
        IF EXISTS (SELECT 1 FROM pg_roles WHERE rolname = r) THEN
            EXECUTE format('REASSIGN OWNED BY %I TO CURRENT_USER', r);
            EXECUTE format('DROP OWNED BY %I', r);
            EXECUTE format('DROP ROLE %I', r);
        END IF;
    END LOOP;
END $$;

-- ---------------------------------------------------------------------
-- 1. Endurecimiento: nadie se conecta ni crea objetos si no se le concede
-- ---------------------------------------------------------------------
REVOKE CONNECT ON DATABASE hospitales_occidente FROM PUBLIC;
REVOKE ALL ON SCHEMA hospital FROM PUBLIC;
REVOKE CREATE ON SCHEMA public FROM PUBLIC;

-- ---------------------------------------------------------------------
-- 2. Roles de grupo (sin inicio de sesión)
-- ---------------------------------------------------------------------
CREATE ROLE rol_auditor       NOLOGIN;
CREATE ROLE rol_administrador NOLOGIN;
CREATE ROLE rol_recepcion     NOLOGIN;

-- ---------------------------------------------------------------------
-- 3. Rol de SOLO LECTURA (auditoría / consulta de reportes)
-- ---------------------------------------------------------------------
GRANT CONNECT ON DATABASE hospitales_occidente TO rol_auditor;
GRANT USAGE   ON SCHEMA hospital TO rol_auditor;
GRANT SELECT  ON ALL TABLES IN SCHEMA hospital TO rol_auditor;
-- Tablas que se creen en el futuro también serán legibles por el auditor
ALTER DEFAULT PRIVILEGES IN SCHEMA hospital GRANT SELECT ON TABLES TO rol_auditor;

-- ---------------------------------------------------------------------
-- 4. Rol ADMINISTRATIVO con privilegios completos sobre el esquema
-- ---------------------------------------------------------------------
GRANT CONNECT, TEMPORARY ON DATABASE hospitales_occidente TO rol_administrador;
GRANT USAGE, CREATE ON SCHEMA hospital TO rol_administrador;
GRANT ALL PRIVILEGES ON ALL TABLES    IN SCHEMA hospital TO rol_administrador;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA hospital TO rol_administrador;
GRANT ALL PRIVILEGES ON ALL ROUTINES  IN SCHEMA hospital TO rol_administrador;
ALTER DEFAULT PRIVILEGES IN SCHEMA hospital GRANT ALL ON TABLES    TO rol_administrador;
ALTER DEFAULT PRIVILEGES IN SCHEMA hospital GRANT ALL ON SEQUENCES TO rol_administrador;
ALTER DEFAULT PRIVILEGES IN SCHEMA hospital GRANT ALL ON ROUTINES  TO rol_administrador;

-- ---------------------------------------------------------------------
-- 5. Rol OPERATIVO de recepción (privilegios mínimos necesarios)
-- ---------------------------------------------------------------------
GRANT CONNECT ON DATABASE hospitales_occidente TO rol_recepcion;
GRANT USAGE   ON SCHEMA hospital TO rol_recepcion;
-- Consulta de datos de pacientes y de la agenda
GRANT SELECT ON persona, paciente, paciente_encargado, medico, especialidad, medico_especialidad,
                hospital, unidad_medica, servicio, unidad_servicio, clinica, municipio, departamento,
                cita, factura, detalle_factura, cuota_pago
      TO rol_recepcion;
-- Registro de nuevos pacientes y agendamiento de citas
GRANT INSERT ON persona, paciente, paciente_encargado, cita TO rol_recepcion;
-- En una cita solo puede cambiar el estado y si la cancelación fue notificada
GRANT UPDATE (estado, cancelacion_notificada) ON cita TO rol_recepcion;
-- Facturación y registro de pagos
GRANT INSERT ON factura, detalle_factura, cuota_pago TO rol_recepcion;
GRANT UPDATE (fecha_pago) ON cuota_pago TO rol_recepcion;
-- Uso de las secuencias de identidad de las tablas donde inserta
GRANT USAGE ON SEQUENCE persona_id_persona_seq, cita_id_cita_seq, factura_id_factura_seq
      TO rol_recepcion;

-- ---------------------------------------------------------------------
-- 6. Usuarios de inicio de sesión que heredan de los roles
-- ---------------------------------------------------------------------
CREATE ROLE usr_auditor       LOGIN PASSWORD 'Auditor#2026'  IN ROLE rol_auditor;
CREATE ROLE usr_administrador LOGIN PASSWORD 'Admin#2026'    IN ROLE rol_administrador;
CREATE ROLE usr_recepcion     LOGIN PASSWORD 'Recepcion#2026' IN ROLE rol_recepcion;

-- El esquema por defecto de cada usuario es "hospital"
ALTER ROLE usr_auditor       SET search_path TO hospital;
ALTER ROLE usr_administrador SET search_path TO hospital;
ALTER ROLE usr_recepcion     SET search_path TO hospital;

-- ---------------------------------------------------------------------
-- 7. Pruebas (descomentar para verificar)
-- ---------------------------------------------------------------------
-- SET ROLE usr_auditor;
-- SELECT COUNT(*) FROM hospital.paciente;                     -- permitido
-- DELETE FROM hospital.calificacion WHERE id_calificacion = 9; -- ERROR: permission denied
-- RESET ROLE;
--
-- SET ROLE usr_recepcion;
-- UPDATE hospital.cita SET estado = 'Cancelada', cancelacion_notificada = TRUE WHERE id_cita = 10; -- permitido
-- UPDATE hospital.cita SET costo_base = 1 WHERE id_cita = 10;                                       -- ERROR
-- RESET ROLE;
--
-- Consultar privilegios otorgados:
-- SELECT grantee, table_name, privilege_type FROM information_schema.role_table_grants
--  WHERE table_schema = 'hospital' AND grantee LIKE 'rol_%' ORDER BY 1, 2;

-- =====================================================================
-- Proyecto 1 - Pruebas de integridad (opcional, para la defensa)
-- Cada sentencia DEBE FALLAR (o comportarse como se indica).
-- Se ejecuta dentro de una transacción que al final se revierte: no altera los datos.
--
-- Uso: psql -U postgres -d hospitales_occidente -f 02_pruebas_restricciones.sql
-- =====================================================================
SET search_path TO hospital;
\set ON_ERROR_STOP off
BEGIN;

-- CHECK de dominio: sexo solo Masculino/Femenino           -> ck_persona_sexo
SAVEPOINT p; INSERT INTO persona (nombres, apellidos, fecha_nacimiento, sexo, id_municipio, area)
             VALUES ('Prueba','Uno','2000-01-01','M',1,'Urbana'); ROLLBACK TO p;

-- CHECK de dominio: área solo Urbana/Rural                  -> ck_persona_area
SAVEPOINT p; INSERT INTO persona (nombres, apellidos, fecha_nacimiento, sexo, id_municipio, area)
             VALUES ('Prueba','Dos','2000-01-01','Femenino',1,'Centro'); ROLLBACK TO p;

-- CHECK: DPI de 13 dígitos                                  -> ck_persona_dpi
SAVEPOINT p; UPDATE persona SET dpi = '12345' WHERE id_persona = 18; ROLLBACK TO p;

-- CHECK: código de egreso con valores válidos               -> ck_ficha_egreso_codigo
SAVEPOINT p; UPDATE ficha_egreso SET codigo_egreso = 'Alta' WHERE id_egreso = 1; ROLLBACK TO p;

-- CHECK: egreso sin consentimiento exige motivo             -> ck_ficha_egreso_sin_consent
SAVEPOINT p; UPDATE ficha_egreso SET sin_consentimiento = TRUE WHERE id_egreso = 1; ROLLBACK TO p;

-- CHECK: carácter de cirugía Urgente/Programado             -> ck_solicitud_cirugia_caracter
SAVEPOINT p; UPDATE solicitud_cirugia SET caracter = 'Electiva' WHERE id_solicitud = 4; ROLLBACK TO p;

-- CHECK: una solicitud aprobada requiere fecha y quirófano  -> ck_solicitud_cirugia_agenda
SAVEPOINT p; UPDATE solicitud_cirugia SET estado = 'Aprobada', fecha_revision = '2026-09-19'
             WHERE id_solicitud = 4; ROLLBACK TO p;

-- CHECK: rango de edad 0-120                                -> ck_ficha_ingreso_edad
SAVEPOINT p; UPDATE ficha_ingreso SET edad_anios = 150 WHERE id_ingreso = 1; ROLLBACK TO p;

-- CHECK: consulta externa solo en turno matutino            -> ck_cita_horario
SAVEPOINT p; UPDATE cita SET fecha_hora = '2026-09-29 15:00' WHERE id_cita = 10; ROLLBACK TO p;

-- CHECK: reconsulta cobra 75% (no 100%)                     -> ck_cita_porcentaje
SAVEPOINT p; UPDATE cita SET porcentaje_costo = 100 WHERE id_cita = 11; ROLLBACK TO p;

-- CHECK: pago en máximo 12 cuotas                           -> ck_factura_cuotas
SAVEPOINT p; UPDATE factura SET numero_cuotas = 13 WHERE id_factura = 13; ROLLBACK TO p;

-- CHECK: resultado coherente con el tipo de verificación    -> ck_registro_verificacion_resultado
SAVEPOINT p; UPDATE registro_verificacion SET resultado = 'Aceptable'
             WHERE id_cirugia = 1 AND id_item = 1; ROLLBACK TO p;

-- FK RESTRICT: no se puede borrar un paciente con historial clínico
SAVEPOINT p; DELETE FROM persona WHERE id_persona = 24; ROLLBACK TO p;

-- FK RESTRICT: no se puede borrar un servicio del catálogo en uso
SAVEPOINT p; DELETE FROM servicio WHERE id_servicio = 24; ROLLBACK TO p;

-- FK compuesta: el encargado del ingreso debe estar registrado para ESE paciente
SAVEPOINT p; UPDATE ficha_ingreso SET id_encargado = 30 WHERE id_ingreso = 1; ROLLBACK TO p;

-- FK compuesta: la unidad debe ofrecer el servicio indicado en el ingreso
SAVEPOINT p; UPDATE ficha_ingreso SET id_servicio = 30 WHERE id_ingreso = 1; ROLLBACK TO p;

-- ON DELETE CASCADE (debe FUNCIONAR): borrar una factura elimina su detalle y sus cuotas
SAVEPOINT p;
DELETE FROM factura WHERE id_factura = 13;
SELECT (SELECT COUNT(*) FROM detalle_factura WHERE id_factura = 13) AS detalle_restante,
       (SELECT COUNT(*) FROM cuota_pago      WHERE id_factura = 13) AS cuotas_restantes;
ROLLBACK TO p;

-- ON DELETE SET NULL (debe FUNCIONAR): borrar la cita original deja la reprogramada sin referencia
SAVEPOINT p;
DELETE FROM cita WHERE id_cita = 8;
SELECT id_cita, id_cita_anterior FROM cita WHERE id_cita = 9;
ROLLBACK TO p;

ROLLBACK;

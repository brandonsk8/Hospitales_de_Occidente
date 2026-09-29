-- =====================================================================
-- Proyecto 1 - Sistemas de Bases de Datos 1 (CUNOC)
-- DML: inserción de datos de prueba
-- TODOS los datos de personas (nombres, DPI, teléfonos, direcciones) son FICTICIOS.
-- Los DPI usan un patrón secuencial inventado (1000000xx....) que no corresponde a nadie.
--
-- Uso: psql -U postgres -d hospitales_occidente -f 01_dml.sql   (después del DDL)
-- =====================================================================

SET search_path TO hospital;
BEGIN;

-- ---------------------------------------------------------------------
-- 1. Ubicación geográfica
-- ---------------------------------------------------------------------

-- Departamentos de Guatemala
INSERT INTO departamento (id_departamento, nombre) VALUES
 (1,'Alta Verapaz'),(2,'Baja Verapaz'),(3,'Chimaltenango'),(4,'Chiquimula'),
 (5,'El Progreso'),(6,'Escuintla'),(7,'Guatemala'),(8,'Huehuetenango'),
 (9,'Izabal'),(10,'Jalapa'),(11,'Jutiapa'),(12,'Petén'),(13,'Quetzaltenango'),
 (14,'Quiché'),(15,'Retalhuleu'),(16,'Sacatepéquez'),(17,'San Marcos'),
 (18,'Santa Rosa'),(19,'Sololá'),(20,'Suchitepéquez'),(21,'Totonicapán'),(22,'Zacapa');

-- Municipios usados en las pruebas (región occidente + capital)
INSERT INTO municipio (id_municipio, id_departamento, nombre) VALUES
 (1,13,'Quetzaltenango'),(2,13,'Salcajá'),(3,13,'Olintepeque'),(4,13,'Cantel'),
 (5,13,'La Esperanza'),(6,13,'Almolonga'),(7,13,'Zunil'),(8,13,'San Juan Ostuncalco'),
 (9,13,'Coatepeque'),(10,21,'Totonicapán'),(11,21,'San Cristóbal Totonicapán'),
 (12,17,'San Marcos'),(13,17,'San Pedro Sacatepéquez'),(14,17,'Malacatán'),
 (15,8,'Huehuetenango'),(16,8,'Chiantla'),(17,15,'Retalhuleu'),(18,20,'Mazatenango'),
 (19,19,'Sololá'),(20,7,'Guatemala'),(21,7,'Mixco');

-- ---------------------------------------------------------------------
-- 2. Personas (ficticias)
--    1-12 médicos | 13-17 enfermeros | 18-29 pacientes | 30-35 encargados
-- ---------------------------------------------------------------------
INSERT INTO persona (id_persona, nombres, apellidos, dpi, fecha_nacimiento, sexo, estado_civil, telefono, direccion, id_municipio, area) VALUES
 -- Médicos
 (1,'Carlos Alberto','Méndez López','1000000010901','1980-05-12','Masculino','Casado','55010001','4a. calle 10-20 zona 1',1,'Urbana'),
 (2,'Ana Lucía','Pérez Ramírez','1000000020901','1978-09-03','Femenino','Casado','55010002','13 avenida 5-40 zona 3',1,'Urbana'),
 (3,'Jorge Luis','Castillo Morales','1000000030901','1983-01-22','Masculino','Soltero','55010003','Diagonal 11 7-15 zona 1',1,'Urbana'),
 (4,'María Fernanda','Juárez Cifuentes','1000000040901','1985-11-30','Femenino','Soltero','55010004','Calle Rodolfo Robles 18-02 zona 1',1,'Urbana'),
 (5,'Roberto Daniel','Orozco Barrios','1000000050902','1990-07-14','Masculino','Soltero','55010005','Barrio El Calvario 3-10',2,'Urbana'),
 (6,'Lucía Gabriela','Ramos Velásquez','1000000060901','1991-03-08','Femenino','Unido','55010006','Colonia Los Altos 2-33 zona 7',1,'Urbana'),
 (7,'Héctor Manuel','Fuentes Aguilar','1000000070901','1975-12-19','Masculino','Casado','55010007','Avenida Las Américas 9-50 zona 9',1,'Urbana'),
 (8,'Sofía Alejandra','Monzón de León','1000000080901','1982-06-27','Femenino','Casado','55010008','Residenciales Los Cerezos casa 12',1,'Urbana'),
 (9,'Fernando José','Sandoval Rivas','1000000092001','1970-04-05','Masculino','Casado','55010009','5a. avenida 12-80 zona 10',20,'Urbana'),
 (10,'Diana Carolina','Escobar Tello','1000000100901','1981-10-10','Femenino','Divorciado','55010010','14 avenida A 3-21 zona 1',1,'Urbana'),
 (11,'Pablo Andrés','Recinos Coyoy','1000000110903','1999-02-17','Masculino','Soltero','55010011','Cantón Chuisuc lote 4',3,'Rural'),
 (12,'Andrea Beatriz','Chávez Soto','1000000120901','1987-08-01','Femenino','Soltero','55010012','Condominio Villa Real casa 7',1,'Urbana'),
 -- Enfermeros
 (13,'Karla Patricia','Tzul Ixcot','1000000132101','1989-05-25','Femenino','Casado','55020013','Paraje Chuicruz',10,'Rural'),
 (14,'Marvin Estuardo','Gómez Xicará','1000000140904','1992-09-09','Masculino','Soltero','55020014','Aldea Pachaj',4,'Rural'),
 (15,'Rosa Elena','Batz Tax','1000000150901','1986-12-12','Femenino','Unido','55020015','0 calle 1-45 zona 2',1,'Urbana'),
 (16,'José Miguel','Quiché Sac','1000000160906','2001-04-03','Masculino','Soltero','55020016','Cantón Xecaracoj',6,'Rural'),
 (17,'Wendy Marisol','Pac Ajanel','1000000170905','1994-01-28','Femenino','Casado','55020017','Barrio San José 6-12',5,'Urbana'),
 -- Pacientes
 (18,'Luis Enrique','García Hernández','1000000180901','1985-02-11','Masculino','Casado','55030018','8a. calle 15-30 zona 1',1,'Urbana'),
 (19,'María José','López Tista','1000000190902','1992-06-06','Femenino','Soltero','55030019','Barrio La Ciénaga 2-8',2,'Urbana'),
 (20,'Pedro Antonio','Xiloj Coyoy','1000000200903','1958-11-20','Masculino','Viudo','55030020','Aldea San Isidro',3,'Rural'),
 (21,'Carmen Rosa','Pérez Chan','1000000210908','1970-02-10','Femenino','Casado','55030021','Aldea Varsovia',8,'Rural'),
 (22,'Diego Alejandro','Vásquez Rojas',NULL,'2016-08-15','Masculino','Soltero',NULL,'Colonia Molina 4-17 zona 5',1,'Urbana'),
 (23,'Ana Sofía','Morales Ixchop','1000000231201','2001-03-19','Femenino','Soltero','55030023','3a. avenida 7-21 zona 1',12,'Urbana'),
 (24,'Juan Carlos','Ajcá Tzoc','1000000242101','1979-03-14','Masculino','Casado','55030024','Cantón Juchanep',10,'Rural'),
 (25,'Gloria Esperanza','Sic Yax','1000000250906','1965-12-01','Femenino','Casado','55030025','Zona 1 de Almolonga',6,'Urbana'),
 (26,'Mateo Samuel','Barrios Cano',NULL,'2019-04-18','Masculino','Soltero',NULL,'Lotificación El Mirador lote 21',5,'Urbana'),
 (27,'Rebeca Isabel','Gonzáles Ordóñez','1000000271301','1996-07-25','Femenino','Soltero','55030027','Aldea San Andrés Chápil',13,'Rural'),
 (28,'Óscar Rolando','Toj Chox','1000000282101','1950-06-02','Masculino','Viudo','55030028','Paraje Xolsacmalja',10,'Rural'),
 (29,'Elena Victoria','Rivas Say','1000000290901','1988-10-30','Femenino','Casado','55030029','Avenida Jesús Castillo 2-40 zona 1',1,'Urbana'),
 -- Encargados de pacientes
 (30,'Silvia Marina','Rojas de Vásquez','1000000300901','1988-01-09','Femenino','Casado','55040030','Colonia Molina 4-17 zona 5',1,'Urbana'),
 (31,'Ricardo','Vásquez Pérez','1000000310901','1986-10-02','Masculino','Casado','55040031','Colonia Molina 4-17 zona 5',1,'Urbana'),
 (32,'Manuel','Xiloj Tzul','1000000320903','1984-07-07','Masculino','Casado','55040032','Aldea San Isidro',3,'Rural'),
 (33,'Julia','Cano de Barrios','1000000330905','1993-03-03','Femenino','Casado','55040033','Lotificación El Mirador lote 21',5,'Urbana'),
 (34,'Tomás','Ajcá Tzoc','1000000342101','1982-11-11','Masculino','Soltero','55040034','Cantón Juchanep',10,'Rural'),
 (35,'Marta','Toj Pérez','1000000352101','1976-05-15','Femenino','Casado','55040035','Paraje Xolsacmalja',10,'Rural');

-- Subtipo paciente
INSERT INTO paciente (id_paciente, no_expediente, no_seguro_social, fecha_registro) VALUES
 (18,'EXP-2026-0001','IGSS-100018','2026-01-15'),
 (19,'EXP-2026-0002',NULL,'2026-02-03'),
 (20,'EXP-2026-0003','IGSS-100020','2026-02-20'),
 (21,'EXP-2026-0004',NULL,'2026-03-11'),
 (22,'EXP-2026-0005',NULL,'2026-04-02'),
 (23,'EXP-2026-0006',NULL,'2026-05-06'),
 (24,'EXP-2026-0007','IGSS-100024','2026-05-20'),
 (25,'EXP-2026-0008',NULL,'2026-06-01'),
 (26,'EXP-2026-0009',NULL,'2026-06-14'),
 (27,'EXP-2026-0010',NULL,'2026-07-09'),
 (28,'EXP-2026-0011','IGSS-100028','2026-08-01'),
 (29,'EXP-2026-0012',NULL,'2026-08-19');

-- Encargados de cada paciente (asociativa M:N)
INSERT INTO paciente_encargado (id_paciente, id_encargado, parentesco) VALUES
 (22,30,'Madre'),(22,31,'Padre'),(20,32,'Hijo'),(26,33,'Madre'),
 (24,34,'Hermano'),(28,35,'Hija'),(25,21,'Otro');

-- Especialidades médicas
INSERT INTO especialidad (id_especialidad, nombre) VALUES
 (1,'Medicina General'),(2,'Cardiología'),(3,'Pediatría'),(4,'Oftalmología'),
 (5,'Cirugía General'),(6,'Anestesiología'),(7,'Cirugía Ortopédica'),(8,'Medicina Interna'),
 (9,'Dermatología'),(10,'Ginecología Oncológica'),(11,'Urología'),(12,'Psicología');

-- Subtipo médico
INSERT INTO medico (id_medico, no_colegiado, tipo_medico, institucion_origen, costo_consulta) VALUES
 (1,'COL-10001','Residente',NULL,150.00),
 (2,'COL-10002','Residente',NULL,250.00),
 (3,'COL-10003','Residente',NULL,200.00),
 (4,'COL-10004','Residente',NULL,225.00),
 (5,'COL-10005','Interno',NULL,150.00),
 (6,'COL-10006','Interno',NULL,150.00),
 (7,'COL-10007','Residente',NULL,300.00),
 (8,'COL-10008','Residente',NULL,NULL),
 (9,'COL-10009','Externo','Clínica Ortopédica del Altiplano',NULL),
 (10,'COL-10010','Residente',NULL,275.00),
 (11,NULL,'Practicante',NULL,NULL),
 (12,'COL-10012','Residente',NULL,200.00);

-- Especialidades de cada médico
INSERT INTO medico_especialidad (id_medico, id_especialidad) VALUES
 (1,1),(2,2),(2,8),(3,3),(4,4),(5,1),(6,1),(7,5),(8,6),(9,7),(10,8),(12,9);

-- Subtipo enfermero
INSERT INTO enfermero (id_enfermero, no_registro, tipo_enfermero) VALUES
 (13,'ENF-2001','Registrado'),(14,'ENF-2002','Registrado'),(15,'ENF-2003','Registrado'),
 (16,NULL,'Practicante'),(17,'ENF-2005','Registrado');

-- ---------------------------------------------------------------------
-- 3. Hospitales, unidades, servicios y recursos
-- ---------------------------------------------------------------------

-- Hospitales de la cadena (1-3) y establecimientos externos (4-5)
INSERT INTO hospital (id_hospital, nombre, descripcion, direccion, id_municipio, telefono, pertenece_institucion) VALUES
 (1,'Hospital de Occidente Quetzaltenango','Sede central de la cadena; 120 camas','Diagonal 3, 12-40 zona 8',1,'77610001',TRUE),
 (2,'Hospital de Occidente San Marcos','Hospital departamental de la cadena; 60 camas','9a. calle 4-15 zona 1',12,'77610002',TRUE),
 (3,'Hospital de Occidente Huehuetenango','Hospital departamental de la cadena; 55 camas','Carretera a Chiantla km 2',15,'77610003',TRUE),
 (4,'Centro Médico Nacional de Referencia','Establecimiento externo de tercer nivel','Avenida Elena 9-01 zona 1',20,'22200004',FALSE),
 (5,'Clínica Ortopédica del Altiplano','Clínica privada externa de ortopedia','15 avenida 6-20 zona 3',1,'77620005',FALSE);

-- Unidades médicas: 4 por hospital de la cadena, 'Otro' para externos
INSERT INTO unidad_medica (id_unidad, id_hospital, tipo_unidad, telefono, costo_dia) VALUES
 (1,1,'Consulta externa','77610101',NULL),(2,1,'Emergencias','77610102',NULL),
 (3,1,'Cirugía','77610103',NULL),(4,1,'Hospitalización','77610104',450.00),
 (5,2,'Consulta externa','77610201',NULL),(6,2,'Emergencias','77610202',NULL),
 (7,2,'Cirugía','77610203',NULL),(8,2,'Hospitalización','77610204',400.00),
 (9,3,'Consulta externa','77610301',NULL),(10,3,'Emergencias','77610302',NULL),
 (11,3,'Cirugía','77610303',NULL),(12,3,'Hospitalización','77610304',380.00),
 (13,4,'Otro',NULL,NULL),(14,5,'Otro',NULL,NULL);

-- Servicios (tipos de atención) por tipo de unidad
INSERT INTO servicio (id_servicio, nombre, tipo_unidad) VALUES
 -- Consulta externa
 (1,'Cardiología','Consulta externa'),(2,'Dermatología','Consulta externa'),
 (3,'Fisioterapia','Consulta externa'),(4,'Ginecología Oncológica','Consulta externa'),
 (5,'Hematología','Consulta externa'),(6,'Medicina Física y Rehabilitación','Consulta externa'),
 (7,'Medicina General','Consulta externa'),(8,'Nutrición y Dietética','Consulta externa'),
 (9,'Odontología General','Consulta externa'),(10,'Oftalmología','Consulta externa'),
 (11,'Psicología','Consulta externa'),(12,'Pediatría','Consulta externa'),
 (13,'Urología','Consulta externa'),(14,'Terapia del Lenguaje','Consulta externa'),
 -- Emergencias (servicios básicos)
 (15,'Aislamiento y control de la vía aérea y ventilación','Emergencias'),
 (16,'Control cardiocirculatorio','Emergencias'),
 (17,'Atención de pacientes politraumatizados','Emergencias'),
 (18,'Manejo, control y administración de drogas protocolizadas','Emergencias'),
 (19,'Procedimientos de control y observación','Emergencias'),
 (20,'Procedimientos terapéuticos/diagnósticos','Emergencias'),
 (21,'Procedimientos diagnósticos','Emergencias'),
 -- Cirugía
 (22,'Cirugía Cardiovascular (Adulto y Pediátrica)','Cirugía'),(23,'Cirugía de la Mano','Cirugía'),
 (24,'Cirugía General','Cirugía'),(25,'Videolaparoscopia Quirúrgica','Cirugía'),
 (26,'Cirugía Ginecológica','Cirugía'),(27,'Cirugía Neurológica','Cirugía'),
 (28,'Cirugía Oftalmológica','Cirugía'),(29,'Cirugía Oncológica','Cirugía'),
 (30,'Cirugía Ortopédica','Cirugía'),(31,'Cirugía Otorrinolaringológica','Cirugía'),
 (32,'Cirugía Pediátrica','Cirugía'),(33,'Cirugía Plástica','Cirugía'),
 (34,'Cirugía de Tórax','Cirugía'),(35,'Cirugía Urológica','Cirugía'),
 -- Hospitalización
 (36,'Hematología','Hospitalización'),(37,'Medicina interna','Hospitalización'),
 (38,'Neumología','Hospitalización'),(39,'Neurología','Hospitalización'),
 (40,'Oncología','Hospitalización'),(41,'Ortopedia','Hospitalización'),
 (42,'Pediatría','Hospitalización'),(43,'Unidad de cuidados intermedios','Hospitalización'),
 (44,'Unidad de cuidado crítico de adultos','Hospitalización'),
 -- Establecimientos externos
 (45,'Atención especializada externa','Otro');

-- Servicios ofrecidos por cada unidad con su costo: tarifa base del hospital 1,
-- el hospital 2 cobra el 90% y el hospital 3 el 85% de esa tarifa
INSERT INTO unidad_servicio (id_unidad, id_servicio, costo)
SELECT u.id_unidad, s.id_servicio, ROUND(t.tarifa * f.factor, 2)
FROM (VALUES (1,250),(2,200),(3,150),(4,300),(5,250),(6,175),(7,150),(8,125),(9,150),(10,225),
             (11,200),(12,200),(13,250),(14,150),
             (15,800),(16,700),(17,1200),(18,500),(19,350),(20,450),(21,400),
             (22,25000),(23,9000),(24,8000),(25,10000),(26,9500),(27,30000),(28,7000),
             (29,20000),(30,18000),(31,8500),(32,9000),(33,12000),(34,22000),(35,9500),
             (36,600),(37,500),(38,550),(39,650),(40,700),(41,550),(42,450),(43,900),(44,1500)
     ) AS t(id_servicio, tarifa)
JOIN servicio s       ON s.id_servicio = t.id_servicio
JOIN unidad_medica u  ON u.tipo_unidad = s.tipo_unidad
JOIN (VALUES (1,1.00),(2,0.90),(3,0.85)) AS f(id_hospital, factor) ON f.id_hospital = u.id_hospital;

-- Emergencias del hospital 1 también ofrece atención especializada (mismas de consulta externa)
INSERT INTO unidad_servicio (id_unidad, id_servicio, costo) VALUES
 (2,1,300.00),(2,7,200.00),(2,12,250.00),
 -- Establecimientos externos: servicio genérico (costo definido por el externo)
 (13,45,0.00),(14,45,0.00);

-- Asignación de médicos a unidades (un médico puede trabajar en varias unidades/hospitales)
INSERT INTO medico_unidad (id_medico, id_unidad, fecha_inicio, jornada, es_jefe) VALUES
 (1,1,'2020-01-06','Matutina',FALSE),(1,2,'2020-01-06','Por turnos',FALSE),
 (2,1,'2018-03-01','Matutina',TRUE),(3,1,'2021-02-01','Matutina',FALSE),
 (4,1,'2022-07-01','Matutina',FALSE),(5,2,'2024-01-15','Por turnos',FALSE),
 (5,6,'2025-01-15','Por turnos',FALSE),(6,2,'2024-01-15','Por turnos',TRUE),
 (7,3,'2015-05-04','Mixta',TRUE),(8,3,'2016-08-01','Mixta',FALSE),
 (9,3,'2023-01-10','Por llamado',FALSE),(10,4,'2017-09-18','Mixta',TRUE),
 (11,2,'2026-01-12','Por turnos',FALSE),(12,1,'2023-03-01','Matutina',FALSE),
 (3,2,'2021-02-01','Por turnos',FALSE);

-- Asignación de enfermeros a unidades
INSERT INTO enfermero_unidad (id_enfermero, id_unidad, fecha_inicio, jornada, es_jefe) VALUES
 (13,3,'2014-02-03','Mixta',TRUE),(14,2,'2019-06-01','Por turnos',TRUE),
 (15,4,'2016-01-11','Mixta',TRUE),(16,3,'2026-01-12','Matutina',FALSE),
 (17,2,'2020-04-20','Por turnos',FALSE),(17,3,'2022-01-10','Por llamado',FALSE);

-- Turnos de 12 horas en Emergencias del hospital 1
INSERT INTO turno_emergencia (id_turno, id_unidad, fecha, jornada) VALUES
 (1,2,'2026-09-05','Diurno'),(2,2,'2026-09-05','Nocturno'),
 (3,2,'2026-09-10','Diurno'),(4,2,'2026-09-10','Nocturno');

-- Al menos 2 médicos por turno
INSERT INTO turno_medico (id_turno, id_medico) VALUES
 (1,1),(1,5),(2,6),(2,5),(2,11),(3,1),(3,6),(4,3),(4,5);

-- Clínicas de consulta externa
INSERT INTO clinica (id_clinica, id_unidad, numero) VALUES
 (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),
 (7,5,1),(8,5,2),(9,5,3),(10,9,1),(11,9,2),(12,9,3);

-- Camillas de Emergencias y Hospitalización
INSERT INTO camilla (id_camilla, id_unidad, codigo, estado) VALUES
 (1,2,'E-01','Disponible'),(2,2,'E-02','Disponible'),(3,2,'E-03','Disponible'),
 (4,2,'E-04','Disponible'),(5,2,'E-05','Mantenimiento'),(6,2,'E-06','Disponible'),
 (7,4,'H-101','Disponible'),(8,4,'H-102','Disponible'),(9,4,'H-103','Ocupada'),
 (10,4,'H-104','Disponible'),(11,4,'H-105','Disponible'),(12,4,'H-106','Inactiva'),
 (13,6,'E-01','Disponible'),(14,6,'E-02','Disponible'),(15,6,'E-03','Disponible'),
 (16,8,'H-101','Disponible'),(17,8,'H-102','Disponible'),(18,8,'H-103','Disponible'),
 (19,10,'E-01','Disponible'),(20,10,'E-02','Disponible'),(21,10,'E-03','Disponible'),
 (22,12,'H-101','Disponible'),(23,12,'H-102','Disponible'),(24,12,'H-103','Disponible');

-- Cuatro quirófanos por unidad de Cirugía
INSERT INTO quirofano (id_quirofano, id_unidad, numero, estado) VALUES
 (1,3,1,'Disponible'),(2,3,2,'Disponible'),(3,3,3,'Disponible'),(4,3,4,'Mantenimiento'),
 (5,7,1,'Disponible'),(6,7,2,'Disponible'),(7,7,3,'Disponible'),(8,7,4,'Disponible'),
 (9,11,1,'Disponible'),(10,11,2,'Disponible'),(11,11,3,'Disponible'),(12,11,4,'Disponible');

-- ---------------------------------------------------------------------
-- 4. Consulta externa
-- ---------------------------------------------------------------------

-- Catálogo de medicamentos
INSERT INTO medicamento (id_medicamento, nombre, presentacion) VALUES
 (1,'Paracetamol','Tabletas 500 mg'),(2,'Amoxicilina','Cápsulas 500 mg'),
 (3,'Losartán','Tabletas 50 mg'),(4,'Omeprazol','Cápsulas 20 mg'),
 (5,'Ibuprofeno','Tabletas 400 mg'),(6,'Metformina','Tabletas 850 mg'),
 (7,'Loratadina','Tabletas 10 mg'),(8,'Ketorolaco','Ampolla 30 mg/ml'),
 (9,'Hidrocortisona','Crema tópica 1%'),(10,'Salbutamol','Inhalador 100 mcg');

-- Citas: muestran primera consulta (100%), reconsulta (75%), referido (80%),
-- cancelación no notificada con recargo del 10% en la siguiente, reprogramación y citas futuras
INSERT INTO cita (id_cita, id_paciente, id_medico, id_clinica, fecha_hora, medio_solicitud, tipo_cita,
                  es_referido, id_hospital_referente, estado, cancelacion_notificada, id_cita_anterior,
                  costo_base, porcentaje_costo, recargo_cancelacion) VALUES
 (1,18,2,1,'2026-09-01 08:00','Teléfono','Primera consulta',FALSE,NULL,'Realizada',NULL,NULL,250.00,100,FALSE),
 (2,19,12,2,'2026-09-01 09:30','Correo','Primera consulta',FALSE,NULL,'Realizada',NULL,NULL,200.00,100,FALSE),
 (3,22,3,3,'2026-09-02 08:30','Recepción general','Primera consulta',FALSE,NULL,'Realizada',NULL,NULL,200.00,100,FALSE),
 (4,20,1,4,'2026-09-02 10:00','Teléfono','Primera consulta',TRUE,4,'Realizada',NULL,NULL,150.00,80,FALSE),
 (5,18,2,1,'2026-09-15 08:00','Teléfono','Reconsulta',FALSE,NULL,'Realizada',NULL,1,250.00,75,FALSE),
 (6,23,4,5,'2026-09-03 11:00','Correo','Primera consulta',FALSE,NULL,'Cancelada',FALSE,NULL,225.00,100,FALSE),
 (7,23,4,5,'2026-09-10 11:00','Teléfono','Primera consulta',FALSE,NULL,'Realizada',NULL,6,225.00,100,TRUE),
 (8,27,12,2,'2026-09-05 09:00','Teléfono','Primera consulta',FALSE,NULL,'Reprogramada',NULL,NULL,200.00,100,FALSE),
 (9,27,12,2,'2026-09-12 09:00','Teléfono','Primera consulta',FALSE,NULL,'Realizada',NULL,8,200.00,100,FALSE),
 (10,29,1,4,'2026-09-29 08:00','Recepción general','Primera consulta',FALSE,NULL,'Programada',NULL,NULL,150.00,100,FALSE),
 (11,19,12,2,'2026-10-01 09:30','Correo','Reconsulta',FALSE,NULL,'Programada',NULL,2,200.00,75,FALSE),
 (12,25,2,1,'2026-09-08 08:30','Recepción general','Primera consulta',FALSE,NULL,'Cancelada',TRUE,NULL,250.00,100,FALSE),
 (13,21,1,4,'2026-09-04 07:30','Teléfono','Primera consulta',FALSE,NULL,'Realizada',NULL,NULL,150.00,100,FALSE);

-- Fichas de consulta (una por cita realizada)
INSERT INTO consulta (id_consulta, id_cita, fecha_hora, diagnostico, orientacion, otros_datos, observaciones) VALUES
 (1,1,'2026-09-01 08:10','Hipertensión arterial estadio 1','Dieta baja en sodio y actividad física','PA 145/92 mmHg','Control en dos semanas'),
 (2,2,'2026-09-01 09:40','Dermatitis atópica','Evitar jabones perfumados',NULL,NULL),
 (3,3,'2026-09-02 08:40','Faringoamigdalitis bacteriana','Hidratación y reposo; acompañado por su madre',NULL,'Paciente menor de edad'),
 (4,4,'2026-09-02 10:10','Neumonía adquirida en la comunidad con insuficiencia respiratoria leve','Se explica a paciente e hijo la necesidad de hospitalización','SatO2 89%','Referido por Centro Médico Nacional de Referencia; se traslada a Hospitalización'),
 (5,5,'2026-09-15 08:05','Hipertensión arterial controlada','Continuar tratamiento','PA 128/84 mmHg',NULL),
 (6,7,'2026-09-10 11:05','Conjuntivitis alérgica','Compresas frías',NULL,'Se aplicó recargo por cancelación no notificada'),
 (7,9,'2026-09-12 09:10','Acné vulgar moderado','Limpieza facial dos veces al día',NULL,NULL),
 (8,13,'2026-09-04 07:40','Colelitiasis sintomática','Se refiere a Cirugía General para valoración','Glucosa en ayunas 190 mg/dl','Diabetes mellitus tipo 2 mal controlada');

-- Recetas médicas
INSERT INTO receta (id_receta, id_consulta, fecha, fecha_proxima_cita) VALUES
 (1,1,'2026-09-01','2026-09-15'),(2,2,'2026-09-01','2026-10-01'),(3,3,'2026-09-02',NULL),
 (4,5,'2026-09-15','2026-12-15'),(5,6,'2026-09-10',NULL),(6,8,'2026-09-04','2026-09-25');

-- Prescripción de cada receta
INSERT INTO receta_medicamento (id_receta, id_medicamento, dosis, duracion) VALUES
 (1,3,'1 tableta cada 24 horas','30 días'),
 (2,9,'Aplicar capa delgada cada 12 horas','10 días'),(2,7,'1 tableta cada 24 horas','15 días'),
 (3,2,'250 mg cada 8 horas (suspensión)','10 días'),(3,1,'250 mg cada 6 horas si hay fiebre','5 días'),
 (4,3,'1 tableta cada 24 horas','90 días'),
 (5,7,'1 tableta cada 24 horas','7 días'),
 (6,6,'1 tableta cada 12 horas con alimentos','30 días'),(6,4,'1 cápsula en ayunas','30 días');

-- Órdenes de laboratorio
INSERT INTO orden_laboratorio (id_orden, id_consulta, examen, indicaciones) VALUES
 (1,1,'Perfil lipídico','Ayuno de 12 horas'),(2,1,'Creatinina sérica',NULL),
 (3,4,'Hematología completa','Urgente'),(4,4,'Gasometría arterial','Urgente'),
 (5,8,'Hemoglobina glicosilada',NULL),(6,8,'Ultrasonido abdominal superior','Ayuno de 8 horas');

-- ---------------------------------------------------------------------
-- 5. Fichas de traslado, ingreso y egreso
--    Caso A: Consulta externa -> Hospitalización (paciente 20)
--    Caso B: Emergencias -> Cirugía (urgente) -> Hospitalización (paciente 24)
--    Caso C: Cirugía programada -> Emergencias (signos vitales anormales) -> Hospitalización (paciente 28)
--    Casos D-F: atenciones de Emergencias que terminan en egreso directo
-- ---------------------------------------------------------------------

-- Traslados (se insertan antes que los ingresos que originan)
INSERT INTO ficha_traslado (id_traslado, id_paciente, fecha_hora, edad_anios, id_medico_indica,
                            id_unidad_origen, id_servicio_origen, id_unidad_destino, id_servicio_destino,
                            id_consulta_origen, motivo, consentimiento_de, id_encargado) VALUES
 (1,20,'2026-09-02 10:45',67,1, 1,7, 4,37, 4,'Diagnóstico crítico: neumonía con insuficiencia respiratoria, requiere hospitalización','Encargado',32),
 (2,24,'2026-09-05 23:30',47,6, 2,21, 3,24, NULL,'Apendicitis aguda, requiere intervención quirúrgica urgente','Paciente',NULL),
 (3,24,'2026-09-06 02:00',47,7, 3,24, 4,43, NULL,'Recuperación postoperatoria en sala de hospitalización','Paciente',NULL),
 (4,28,'2026-09-14 10:50',76,9, 3,30, 2,16, NULL,'Signos vitales fuera de límites (hipotensión) en traslado postoperatorio; estabilizar','Encargado',35),
 (5,28,'2026-09-14 14:30',76,6, 2,16, 4,41, NULL,'Paciente estabilizado; continúa recuperación en Ortopedia','Encargado',35);

-- Fichas de ingreso
INSERT INTO ficha_ingreso (id_ingreso, id_paciente, edad_anios, id_encargado, id_unidad, id_servicio, fecha_hora,
                           id_medico, id_camilla, id_quirofano, id_traslado, motivo_ingreso,
                           diagnostico_presuntivo, estado_actual, prioridad) VALUES
 -- Caso A
 (1,20,67,32, 4,37,'2026-09-02 11:30',10, 7,NULL,1,'Traslado desde consulta externa','Neumonía adquirida en la comunidad','Consciente, disneico, SatO2 89%',NULL),
 -- Caso B
 (2,24,47,34, 2,21,'2026-09-05 22:15', 6, 1,NULL,NULL,'Dolor abdominal agudo en fosa ilíaca derecha','Apendicitis aguda','Consciente, febril 38.4 °C, dolor 8/10',2),
 (3,24,47,34, 3,24,'2026-09-06 00:20', 7,NULL,1,2,'Apendicectomía urgente','Apendicitis aguda','Estable, en ayuno',NULL),
 (4,24,47,34, 4,43,'2026-09-06 02:10',10, 8,NULL,3,'Recuperación postoperatoria','Postoperado de apendicectomía','Estable, somnoliento',NULL),
 -- Caso C
 (5,28,76,35, 3,30,'2026-09-14 07:30', 9,NULL,2,NULL,'Artroplastia total de cadera programada','Coxartrosis derecha severa','Estable',NULL),
 (6,28,76,35, 2,16,'2026-09-14 11:00', 6, 2,NULL,4,'Hipotensión postoperatoria','Hipotensión postanestésica','PA 82/50 mmHg',1),
 (7,28,76,35, 4,41,'2026-09-14 15:00',10, 9,NULL,5,'Continuar recuperación postoperatoria','Postoperado de artroplastia de cadera','Estable, PA 118/72 mmHg',NULL),
 -- Caso D: niño con crisis asmática
 (8,26,7,33, 2,15,'2026-09-10 19:40', 3, 3,NULL,NULL,'Dificultad respiratoria','Crisis asmática moderada','Tiraje intercostal, SatO2 91%',2),
 -- Caso E: esguince en el hospital de San Marcos
 (9,27,30,NULL, 6,20,'2026-09-12 14:00', 5,13,NULL,NULL,'Caída con torsión de tobillo izquierdo','Esguince de tobillo grado II','Dolor y edema en tobillo',4),
 -- Caso F: dolor torácico, egreso sin consentimiento médico
 (10,25,60,21, 2,19,'2026-09-15 20:00', 1, 4,NULL,NULL,'Dolor torácico opresivo','Síndrome coronario agudo a descartar','Consciente, diaforética',2);

-- Fichas de egreso (el ingreso 7 queda abierto: paciente aún hospitalizado)
INSERT INTO ficha_egreso (id_egreso, id_ingreso, fecha_hora, edad_anios, id_medico, diagnostico_principal,
                          motivo_egreso, codigo_egreso, sin_consentimiento, motivo_sin_consentimiento,
                          dias_hospitalizado, id_traslado, id_hospital_referido) VALUES
 (1,1,'2026-09-08 10:00',67,10,'Neumonía adquirida en la comunidad resuelta','Mejoría clínica','Vivo',FALSE,NULL,6,NULL,NULL),
 (2,2,'2026-09-05 23:40',47, 6,'Apendicitis aguda','Traslado a Cirugía','Vivo',FALSE,NULL,NULL,2,NULL),
 (3,3,'2026-09-06 02:00',47, 7,'Postoperado de apendicectomía laparoscópica','Traslado a sala de recuperación','Vivo',FALSE,NULL,NULL,3,NULL),
 (4,4,'2026-09-08 09:00',47,10,'Postoperado de apendicectomía, evolución satisfactoria','Alta médica','Vivo',FALSE,NULL,2,NULL,NULL),
 (5,5,'2026-09-14 10:50',76, 9,'Postoperado de artroplastia total de cadera derecha','Traslado a Emergencias por hipotensión','Vivo',FALSE,NULL,NULL,4,NULL),
 (6,6,'2026-09-14 14:30',76, 6,'Hipotensión postanestésica resuelta','Traslado a Hospitalización','Vivo',FALSE,NULL,NULL,5,NULL),
 (7,8,'2026-09-11 07:00',7, 3,'Crisis asmática moderada resuelta','Mejoría clínica','Vivo',FALSE,NULL,NULL,NULL,NULL),
 (8,9,'2026-09-12 17:00',30, 5,'Esguince de tobillo izquierdo grado II','Tratamiento completado; referida para seguimiento','Vivo',FALSE,NULL,NULL,NULL,5),
 (9,10,'2026-09-15 22:30',60, 1,'Dolor torácico en estudio','Retiro voluntario','Vivo',TRUE,'La paciente decide retirarse por motivos familiares',NULL,NULL,NULL);

-- Diagnósticos secundarios de egreso
INSERT INTO egreso_diagnostico (id_egreso, numero, descripcion) VALUES
 (1,1,'Hipertensión arterial'),(1,2,'Desnutrición leve'),
 (4,1,'Íleo postoperatorio leve resuelto'),
 (6,1,'Coxartrosis derecha operada'),
 (9,1,'Hipertensión arterial no controlada');

-- ---------------------------------------------------------------------
-- 6. Cirugía
-- ---------------------------------------------------------------------

-- Historias clínicas preoperatorias
INSERT INTO historia_clinica (id_historia, id_paciente, id_medico, fecha, tipo_interrogatorio, informante, edad_anios,
                              religion, ocupacion, lugar_nacimiento, lugar_residencia,
                              antecedentes_heredofamiliares, antecedentes_no_patologicos, antecedentes_patologicos,
                              padecimiento_actual, interrogatorio_sistemas, sintomas_terapeutica, estudios_previos) VALUES
 (1,24,7,'2026-09-05','Directo',NULL,47,'Católica','Agricultor','Totonicapán','Totonicapán',
  'Padre con diabetes','No fuma; consumo ocasional de alcohol','Ninguno',
  'Dolor abdominal de 18 horas de evolución, inicia en epigastrio y migra a fosa ilíaca derecha',
  'Náusea y vómito en dos ocasiones','Tomó paracetamol sin mejoría','Hematología: leucocitosis 16 500'),
 (2,28,9,'2026-09-07','Indirecto','Marta Toj Pérez (hija)',76,'Evangélica','Artesano retirado','Totonicapán','Totonicapán',
  'Sin datos relevantes','Camina con bastón','Hipertensión arterial controlada',
  'Dolor crónico de cadera derecha con limitación funcional progresiva',
  'Sin alteraciones cardiopulmonares','Analgésicos orales con respuesta parcial','Radiografía de pelvis: coxartrosis grado IV'),
 (3,21,7,'2026-09-09','Directo',NULL,56,'Católica','Comerciante','Quetzaltenango','San Juan Ostuncalco',
  'Madre con diabetes','Sedentaria','Diabetes mellitus tipo 2',
  'Dolor en hipocondrio derecho posprandial de 3 meses','Intolerancia a grasas','Omeprazol','Ultrasonido: colelitiasis múltiple'),
 (4,29,7,'2026-09-18','Directo',NULL,37,'Católica','Maestra','Quetzaltenango','Quetzaltenango',
  'Ninguno','Ejercicio regular','Ninguno','Masa en región inguinal derecha de 2 meses','Sin otros síntomas','Ninguna','Ultrasonido: hernia inguinal');

-- Exploración física de cada historia
INSERT INTO exploracion_fisica (id_historia, presion_sistolica, presion_diastolica, frecuencia_cardiaca,
                                frecuencia_respiratoria, temperatura, saturacion_o2, exploracion_general,
                                cabeza, cuello, torax, abdomen, extremidades, columna_vertebral, cavidades) VALUES
 (1,125,80,102,20,38.4,97,'Paciente álgido, deshidratación leve','Normocéfalo','Sin adenopatías','Campos pulmonares limpios',
  'Dolor a la palpación en punto de McBurney, rebote positivo','Sin edema','Sin alteraciones','Mucosa oral seca'),
 (2,138,85,78,16,36.6,95,'Paciente orientado, marcha antálgica','Normocéfalo','Sin alteraciones','Murmullo vesicular normal',
  'Blando, depresible','Limitación de rotación de cadera derecha','Cifosis leve','Sin alteraciones'),
 (3,142,88,84,18,36.8,98,'Paciente con sobrepeso','Normocéfalo','Sin alteraciones','Sin alteraciones',
  'Murphy positivo','Sin edema','Sin alteraciones','Sin alteraciones'),
 (4,118,76,72,16,36.5,99,'Buen estado general','Normocéfalo','Sin alteraciones','Sin alteraciones',
  'Masa reductible en región inguinal derecha','Sin alteraciones','Sin alteraciones','Sin alteraciones');

-- Agendamientos quirúrgicos: aprobada urgente, aprobada programada, rechazada y pendiente
INSERT INTO solicitud_cirugia (id_solicitud, id_paciente, edad_anios, id_historia, id_cirujano, id_unidad, caracter,
                               tiempo_estimado_min, tipo_anestesia, fecha_hora_solicitud, estado, fecha_revision,
                               fecha_hora_programada, id_quirofano) VALUES
 (1,24,47,1,7,3,'Urgente',60,'General','2026-09-05 23:35','Aprobada','2026-09-05','2026-09-06 00:30',1),
 (2,28,76,2,9,3,'Programado',150,'Regional','2026-09-07 10:00','Aprobada','2026-09-09','2026-09-14 08:00',2),
 (3,21,56,3,7,3,'Programado',90,'General','2026-09-10 09:00','Rechazada','2026-09-11',NULL,NULL),
 (4,29,37,4,7,3,'Programado',75,'Regional','2026-09-18 10:30','Pendiente',NULL,NULL,NULL);

-- Procedimientos a realizar en cada solicitud
INSERT INTO solicitud_procedimiento (id_solicitud, id_servicio, descripcion) VALUES
 (1,24,'Apendicectomía'),(1,25,'Abordaje laparoscópico'),
 (2,30,'Artroplastia total de cadera derecha'),
 (3,24,'Colecistectomía'),(3,25,'Abordaje laparoscópico'),
 (4,24,'Hernioplastia inguinal derecha');

-- Registro de cirugías rechazadas por el comité
INSERT INTO cirugia_rechazada (id_solicitud, fecha_rechazo, razones) VALUES
 (3,'2026-09-11','Glucemia descompensada (190 mg/dl); se requiere control metabólico antes de una cirugía programada');

-- Catálogo de insumos
INSERT INTO insumo (id_insumo, nombre, descripcion, material, tipo, precio_unitario) VALUES
 (1,'Guantes quirúrgicos estériles','Par de guantes talla 7.5','Látex','Quirúrgico',12.00),
 (2,'Gasa estéril 10x10','Paquete de gasa','Algodón','Médico',3.50),
 (3,'Sutura absorbible 2-0','Hilo de sutura con aguja','Poliglactina','Quirúrgico',85.00),
 (4,'Jeringa desechable 5 ml','Jeringa con aguja 21G','Polipropileno','Médico',2.50),
 (5,'Catéter intravenoso 18G','Catéter periférico','Poliuretano','Médico',15.00),
 (6,'Solución salina 0.9% 1000 ml','Bolsa de solución','PVC','Médico',35.00),
 (7,'Bata quirúrgica desechable','Bata estéril','Polipropileno SMS','Quirúrgico',45.00),
 (8,'Prótesis total de cadera','Componente acetabular y femoral','Titanio y polietileno','Quirúrgico',18500.00),
 (9,'Electrodo adhesivo ECG','Electrodo para monitoreo','Espuma Ag/AgCl','Médico',4.00),
 (10,'Mascarilla nebulizadora pediátrica','Kit de nebulización','PVC','Médico',25.00);

-- Catálogo de instrumental
INSERT INTO instrumento (id_instrumento, nombre, descripcion, tipo, funcion) VALUES
 (1,'Bisturí No. 4','Mango de bisturí','Quirúrgico','Corte'),
 (2,'Tijera Metzenbaum','Tijera de disección','Quirúrgico','Corte'),
 (3,'Pinza Kelly','Pinza hemostática curva','Quirúrgico','Hemostática'),
 (4,'Separador Farabeuf','Separador manual','Quirúrgico','Retractor'),
 (5,'Pinza de Allis','Pinza de sujeción de tejidos','Quirúrgico','Contenido'),
 (6,'Trocar laparoscópico 10 mm','Puerto de acceso','Quirúrgico','Accesorio'),
 (7,'Raspa femoral','Instrumento de preparación femoral','Quirúrgico','Implante');

-- Catálogo de equipos
INSERT INTO equipo (id_equipo, nombre, descripcion, tipo, funcion) VALUES
 (1,'Torre de laparoscopia','Cámara, fuente de luz e insuflador','Quirúrgico','Tratamiento'),
 (2,'Máquina de anestesia','Estación de anestesia con ventilador','Médico','Tratamiento'),
 (3,'Monitor multiparámetro','ECG, PA, SatO2 y temperatura','Médico','Diagnóstico'),
 (4,'Electrobisturí','Unidad electroquirúrgica','Quirúrgico','Tratamiento'),
 (5,'Arco en C','Fluoroscopía intraoperatoria','Médico','Exploración');

-- Requerimientos de insumos, instrumental y equipos por solicitud
INSERT INTO solicitud_insumo (id_solicitud, id_insumo, cantidad) VALUES
 (1,1,6),(1,2,20),(1,3,2),(1,7,4),(1,6,2),
 (2,8,1),(2,1,8),(2,2,30),(2,3,3),(2,7,5),
 (3,1,6),(3,3,2);
INSERT INTO solicitud_instrumento (id_solicitud, id_instrumento, cantidad) VALUES
 (1,6,3),(1,3,4),(1,2,1),
 (2,1,2),(2,3,6),(2,4,2),(2,7,1),
 (3,6,4);
INSERT INTO solicitud_equipo (id_solicitud, id_equipo, cantidad) VALUES
 (1,1,1),(1,2,1),(1,3,1),(1,4,1),
 (2,2,1),(2,3,1),(2,4,1),(2,5,1),
 (3,1,1);

-- Consentimientos informados de las solicitudes aprobadas
INSERT INTO consentimiento_informado (id_consentimiento, id_solicitud, nombre_procedimiento, objetivo, caracteristicas,
                                      riesgos, id_medico, firma_medico, nombre_firmante, tipo_firmante,
                                      firma_firmante, fecha_obtencion) VALUES
 (1,1,'Apendicectomía laparoscópica','Extirpar el apéndice inflamado',
  'Cirugía de mínima invasión con tres puertos bajo anestesia general',
  'Infección de herida, sangrado, absceso intraabdominal',7,TRUE,'Juan Carlos Ajcá Tzoc','Paciente',TRUE,'2026-09-05'),
 (2,2,'Artroplastia total de cadera derecha','Sustituir la articulación dañada para aliviar el dolor y recuperar movilidad',
  'Colocación de prótesis bajo anestesia regional',
  'Luxación, trombosis venosa, infección de prótesis, sangrado',9,TRUE,'Marta Toj Pérez','Familiar',TRUE,'2026-09-10');

-- Chequeos preanestésicos (clasificación ASA)
INSERT INTO chequeo_preanestesico (id_chequeo, id_solicitud, clasificacion_asa, id_medico_clasifica,
                                   firma_medico_clasifica, plan_anestesia, id_anestesista, fecha) VALUES
 (1,1,2,7,TRUE,'Anestesia general balanceada con intubación orotraqueal',8,'2026-09-05'),
 (2,2,3,9,TRUE,'Anestesia raquídea con sedación ligera',8,'2026-09-10');

-- Cirugías realizadas (una por solicitud aprobada)
INSERT INTO cirugia (id_cirugia, id_solicitud, id_quirofano, id_ingreso, id_enfermero_encargado, estado,
                     fecha_hora_inicio, fecha_hora_fin, condicion_evolucion) VALUES
 (1,1,1,3,13,'Finalizada','2026-09-06 00:35','2026-09-06 01:40','Sin complicaciones'),
 (2,2,2,5,13,'Finalizada','2026-09-14 08:10','2026-09-14 10:35','Complicaciones');

-- Equipo de salud de cada cirugía
INSERT INTO cirugia_personal (id_cirugia, id_persona, rol) VALUES
 (1,7,'Cirujano principal'),(1,8,'Anestesiólogo'),(1,11,'Practicante de medicina'),
 (1,13,'Enfermero circulante'),(1,16,'Practicante de enfermería'),
 (2,9,'Cirujano principal'),(2,7,'Cirujano asistente'),(2,8,'Anestesiólogo'),
 (2,13,'Enfermero circulante'),(2,17,'Enfermero instrumentista');

-- Catálogo de aspectos a verificar por etapa
INSERT INTO item_verificacion (id_item, fase, etapa, descripcion, tipo_resultado) VALUES
 (1,'Preoperatorio','Planificación','Disponibilidad de tabla quirúrgica','Éxito/Fallo'),
 (2,'Preoperatorio','Planificación','Preparación de equipos y quirófano previo al ingreso del paciente','Éxito/Fallo'),
 (3,'Preoperatorio','Planificación','Recepción y acogida del paciente en el quirófano','Éxito/Fallo'),
 (4,'Preoperatorio','Entrada','Brazalete de identificación: paciente confirma nombre, procedimiento y lado a operar','Éxito/Fallo'),
 (5,'Preoperatorio','Entrada','Ficha clínica: laboratorios, consentimiento firmado y evaluación preanestésica','Éxito/Fallo'),
 (6,'Preoperatorio','Entrada','Arsenal instrumental estéril, implantes y equipos disponibles y operativos','Éxito/Fallo'),
 (7,'Preoperatorio','Entrada','Anestesista comprueba medicamentos, drogas y materiales anestésicos','Éxito/Fallo'),
 (8,'Intraoperatorio','Chequeo en quirófano','Presencia completa de equipo quirúrgico','Éxito/Fallo'),
 (9,'Intraoperatorio','Chequeo en quirófano','Traslado correcto de camilla a mesa quirúrgica','Éxito/Fallo'),
 (10,'Intraoperatorio','Chequeo en quirófano','Posicionamiento correcto en mesa operatoria','Éxito/Fallo'),
 (11,'Intraoperatorio','Chequeo en quirófano','Placa instalada en el lugar correcto','Éxito/Fallo'),
 (12,'Intraoperatorio','Pausa quirúrgica','Confirmación de todo el equipo de quirófano','Éxito/Fallo'),
 (13,'Intraoperatorio','Pausa quirúrgica','Confirmación del paciente','Éxito/Fallo'),
 (14,'Intraoperatorio','Pausa quirúrgica','Confirmación de buenas condiciones de esterilidad','Éxito/Fallo'),
 (15,'Intraoperatorio','Pausa quirúrgica','Revisión de máquina de anestesia','Éxito/Fallo'),
 (16,'Intraoperatorio','Pausa quirúrgica','Confirmación de suministro de anestesia','Éxito/Fallo'),
 (17,'Intraoperatorio','Pausa quirúrgica','Cirujano indica plan quirúrgico','Éxito/Fallo'),
 (18,'Intraoperatorio','Pausa quirúrgica','Incisión','Éxito/Fallo'),
 (19,'Intraoperatorio','Cuidados intraoperatorios','Registro de balance hídrico','Valoración'),
 (20,'Intraoperatorio','Cuidados intraoperatorios','Registro de seguridad en administración de medicamentos','Valoración'),
 (21,'Intraoperatorio','Cuidados intraoperatorios','Registro de transfusión de sangre','Valoración'),
 (22,'Intraoperatorio','Salida quirúrgica','El cirujano anuncia el fin de los procedimientos quirúrgicos','Éxito/Fallo'),
 (23,'Intraoperatorio','Salida quirúrgica','Confirmación de procedimiento quirúrgico efectivamente realizado','Éxito/Fallo'),
 (24,'Intraoperatorio','Salida quirúrgica','Conteo del instrumental satisfactorio','Éxito/Fallo'),
 (25,'Intraoperatorio','Salida quirúrgica','Cierre de la incisión','Éxito/Fallo'),
 (26,'Postoperatorio','Ingreso a sala de recuperación','Registro de condiciones de evolución durante la cirugía','Éxito/Fallo'),
 (27,'Postoperatorio','Ingreso a sala de recuperación','Confirmación del tipo de cama para el paciente','Éxito/Fallo'),
 (28,'Postoperatorio','Ingreso a sala de recuperación','Infraestructura: cama post anestésica','Éxito/Fallo'),
 (29,'Postoperatorio','Ingreso a sala de recuperación','Infraestructura: gases clínicos','Éxito/Fallo'),
 (30,'Postoperatorio','Ingreso a sala de recuperación','Infraestructura: bombas de infusión','Éxito/Fallo'),
 (31,'Postoperatorio','Ingreso a sala de recuperación','Infraestructura: monitores','Éxito/Fallo'),
 (32,'Postoperatorio','Ingreso a sala de recuperación','Infraestructura: electrodos','Éxito/Fallo'),
 (33,'Postoperatorio','Ingreso a sala de recuperación','Confirmación de la disposición de personal','Éxito/Fallo'),
 (34,'Postoperatorio','Ingreso a sala de recuperación','Insumos: medicamentos disponibles','Éxito/Fallo'),
 (35,'Postoperatorio','Ingreso a sala de recuperación','Insumos: portasueros','Éxito/Fallo'),
 (36,'Postoperatorio','Traslado seguro','Signos vitales dentro de los límites normales','Éxito/Fallo'),
 (37,'Postoperatorio','Traslado seguro','Zona operatoria limpia','Éxito/Fallo'),
 (38,'Postoperatorio','Traslado seguro','Documentación: ficha clínica (laboratorios, consentimiento, evaluación preanestésica)','Éxito/Fallo'),
 (39,'Postoperatorio','Traslado seguro','Documentación: chequeo preanestésico','Éxito/Fallo'),
 (40,'Postoperatorio','Traslado seguro','Sueros de mantención pasando correctamente','Éxito/Fallo');

-- Registro de verificación de la cirugía 1: todos los aspectos exitosos / aceptables
INSERT INTO registro_verificacion (id_cirugia, id_item, tipo_resultado, resultado, fecha_hora, descripcion, id_enfermero)
SELECT 1, i.id_item, i.tipo_resultado,
       CASE WHEN i.tipo_resultado = 'Valoración' THEN 'Aceptable' ELSE 'Éxito' END,
       CASE i.fase WHEN 'Preoperatorio'   THEN TIMESTAMP '2026-09-06 00:25'
                   WHEN 'Intraoperatorio' THEN TIMESTAMP '2026-09-06 01:00'
                   ELSE                        TIMESTAMP '2026-09-06 01:55' END,
       NULL, 13
FROM item_verificacion i;

-- Registro de verificación de la cirugía 2: balance hídrico medianamente aceptable y
-- signos vitales fuera de límites en el traslado (origina el traslado a Emergencias)
INSERT INTO registro_verificacion (id_cirugia, id_item, tipo_resultado, resultado, fecha_hora, descripcion, id_enfermero)
SELECT 2, i.id_item, i.tipo_resultado,
       CASE WHEN i.id_item = 19 THEN 'Medianamente aceptable'
            WHEN i.id_item = 36 THEN 'Fallo'
            WHEN i.tipo_resultado = 'Valoración' THEN 'Aceptable'
            ELSE 'Éxito' END,
       CASE i.fase WHEN 'Preoperatorio'   THEN TIMESTAMP '2026-09-14 08:00'
                   WHEN 'Intraoperatorio' THEN TIMESTAMP '2026-09-14 09:15'
                   ELSE                        TIMESTAMP '2026-09-14 10:45' END,
       CASE WHEN i.id_item = 19 THEN 'Pérdida sanguínea mayor a la esperada (900 ml)'
            WHEN i.id_item = 36 THEN 'PA 82/50 mmHg; se redirige a Emergencias'
            END,
       13
FROM item_verificacion i;

-- Documentación de cada fase enviada a secretaría
INSERT INTO cirugia_documento (id_cirugia, fase, id_enfermero, fecha_envio, observaciones) VALUES
 (1,'Preoperatorio',13,'2026-09-06',NULL),(1,'Intraoperatorio',13,'2026-09-06',NULL),
 (1,'Postoperatorio',13,'2026-09-06',NULL),
 (2,'Preoperatorio',13,'2026-09-14',NULL),(2,'Intraoperatorio',17,'2026-09-14','Sangrado mayor al esperado'),
 (2,'Postoperatorio',13,'2026-09-14','Traslado a Emergencias por hipotensión');

-- Insumos consumidos por ingreso (base del cobro de cirugía y hospitalización)
INSERT INTO consumo_insumo (id_consumo, id_ingreso, id_insumo, fecha_hora, cantidad, precio_unitario) VALUES
 -- Ingreso 1 (hospitalización, 6 días): 420 + 30 + 75 = 525.00
 (1,1,6,'2026-09-02 12:00',12,35.00),(2,1,5,'2026-09-02 12:00',2,15.00),(3,1,4,'2026-09-03 08:00',30,2.50),
 -- Ingreso 2 (emergencias): 15 + 70 = 85.00
 (4,2,5,'2026-09-05 22:30',1,15.00),(5,2,6,'2026-09-05 22:30',2,35.00),
 -- Ingreso 3 (cirugía): 72 + 70 + 170 + 180 + 70 = 562.00
 (6,3,1,'2026-09-06 00:35',6,12.00),(7,3,2,'2026-09-06 00:35',20,3.50),(8,3,3,'2026-09-06 01:30',2,85.00),
 (9,3,7,'2026-09-06 00:30',4,45.00),(10,3,6,'2026-09-06 00:40',2,35.00),
 -- Ingreso 4 (hospitalización, 2 días): 140 + 25 = 165.00
 (11,4,6,'2026-09-06 03:00',4,35.00),(12,4,4,'2026-09-06 03:00',10,2.50),
 -- Ingreso 5 (cirugía ortopédica): 18500 + 96 + 105 + 255 + 225 = 19181.00
 (13,5,8,'2026-09-14 09:00',1,18500.00),(14,5,1,'2026-09-14 08:10',8,12.00),(15,5,2,'2026-09-14 08:10',30,3.50),
 (16,5,3,'2026-09-14 10:20',3,85.00),(17,5,7,'2026-09-14 08:00',5,45.00),
 -- Ingreso 6 (emergencias): 20 + 70 = 90.00
 (18,6,9,'2026-09-14 11:00',5,4.00),(19,6,6,'2026-09-14 11:05',2,35.00),
 -- Ingreso 7 (hospitalización en curso)
 (20,7,6,'2026-09-14 16:00',3,35.00),
 -- Ingreso 8 (emergencias pediátrica): 25 + 5 = 30.00
 (21,8,10,'2026-09-10 19:50',1,25.00),(22,8,4,'2026-09-10 19:50',2,2.50);

-- ---------------------------------------------------------------------
-- 7. Facturación y calificaciones
-- ---------------------------------------------------------------------

-- Facturas: consulta externa (1 cuota) y servicios de ingreso (1 a 12 cuotas)
INSERT INTO factura (id_factura, numero, id_hospital, id_paciente, nit, fecha_emision, descripcion,
                     id_cita, id_ingreso, numero_cuotas, total) VALUES
 (1,'HOQ-000001',1,18,'1234567K','2026-09-01 08:40','Consulta externa de Cardiología',1,NULL,1,250.00),
 (2,'HOQ-000002',1,19,'CF','2026-09-01 10:00','Consulta externa de Dermatología',2,NULL,1,200.00),
 (3,'HOQ-000003',1,22,'CF','2026-09-02 09:00','Consulta externa de Pediatría',3,NULL,1,200.00),
 (4,'HOQ-000004',1,20,'CF','2026-09-02 10:40','Consulta externa de Medicina General (referido, 80%)',4,NULL,1,120.00),
 (5,'HOQ-000005',1,18,'1234567K','2026-09-15 08:30','Reconsulta de Cardiología (75%)',5,NULL,1,187.50),
 (6,'HOQ-000006',1,23,'CF','2026-09-10 11:30','Consulta de Oftalmología con recargo del 10% por cancelación no notificada',7,NULL,1,247.50),
 (7,'HOQ-000007',1,27,'CF','2026-09-12 09:30','Consulta externa de Dermatología',9,NULL,1,200.00),
 (8,'HOQ-000008',1,21,'CF','2026-09-04 08:00','Consulta externa de Medicina General',13,NULL,1,150.00),
 (9,'HOQ-000009',1,20,'CF','2026-09-08 11:00','Hospitalización Medicina interna, 6 días',NULL,1,3,3725.00),
 (10,'HOQ-000010',1,24,'98765432','2026-09-05 23:45','Atención de emergencia: procedimientos diagnósticos',NULL,2,1,485.00),
 (11,'HOQ-000011',1,24,'98765432','2026-09-06 02:05','Apendicectomía laparoscópica urgente',NULL,3,6,8562.00),
 (12,'HOQ-000012',1,24,'98765432','2026-09-08 09:30','Hospitalización postoperatoria, 2 días',NULL,4,2,1965.00),
 (13,'HOQ-000013',1,28,'CF','2026-09-14 11:00','Artroplastia total de cadera derecha',NULL,5,12,37181.00),
 (14,'HOQ-000014',1,28,'CF','2026-09-14 14:35','Atención de emergencia: control cardiocirculatorio',NULL,6,1,790.00),
 (15,'HOQ-000015',1,26,'CF','2026-09-11 07:15','Atención de emergencia: crisis asmática',NULL,8,2,830.00),
 (16,'HOSM-000001',2,27,'CF','2026-09-12 17:10','Atención de emergencia: esguince de tobillo',NULL,9,1,405.00),
 (17,'HOQ-000016',1,25,'CF','2026-09-15 22:35','Atención de emergencia: control y observación',NULL,10,1,350.00);

-- Detalle de cada factura
INSERT INTO detalle_factura (id_factura, linea, concepto, cantidad, precio_unitario) VALUES
 (1,1,'Consulta de Cardiología',1,250.00),
 (2,1,'Consulta de Dermatología',1,200.00),
 (3,1,'Consulta de Pediatría',1,200.00),
 (4,1,'Consulta de Medicina General (80% por referencia)',1,120.00),
 (5,1,'Reconsulta de Cardiología (75%)',1,187.50),
 (6,1,'Consulta de Oftalmología',1,225.00),(6,2,'Recargo 10% por cancelación no notificada',1,22.50),
 (7,1,'Consulta de Dermatología',1,200.00),
 (8,1,'Consulta de Medicina General',1,150.00),
 (9,1,'Servicio de Medicina interna',1,500.00),(9,2,'Estancia hospitalaria (días)',6,450.00),(9,3,'Insumos médicos',1,525.00),
 (10,1,'Procedimientos diagnósticos',1,400.00),(10,2,'Insumos médicos',1,85.00),
 (11,1,'Cirugía General',1,8000.00),(11,2,'Insumos quirúrgicos',1,562.00),
 (12,1,'Unidad de cuidados intermedios',1,900.00),(12,2,'Estancia hospitalaria (días)',2,450.00),(12,3,'Insumos médicos',1,165.00),
 (13,1,'Cirugía Ortopédica',1,18000.00),(13,2,'Insumos quirúrgicos (incluye prótesis)',1,19181.00),
 (14,1,'Control cardiocirculatorio',1,700.00),(14,2,'Insumos médicos',1,90.00),
 (15,1,'Aislamiento y control de la vía aérea y ventilación',1,800.00),(15,2,'Insumos médicos',1,30.00),
 (16,1,'Procedimientos terapéuticos/diagnósticos',1,405.00),
 (17,1,'Procedimientos de control y observación',1,350.00);

-- Cuotas de pago (pagadas y pendientes)
INSERT INTO cuota_pago (id_factura, numero_cuota, monto, fecha_vencimiento, fecha_pago, lugar_pago) VALUES
 (1,1,250.00,'2026-09-01','2026-09-01','Recepción del médico'),
 (2,1,200.00,'2026-09-01','2026-09-01','Recepción del médico'),
 (3,1,200.00,'2026-09-02','2026-09-02','Recepción del médico'),
 (4,1,120.00,'2026-09-02','2026-09-02','Recepción del médico'),
 (5,1,187.50,'2026-09-15','2026-09-15','Recepción del médico'),
 (6,1,247.50,'2026-09-10','2026-09-10','Recepción del médico'),
 (7,1,200.00,'2026-09-12','2026-09-12','Recepción del médico'),
 (8,1,150.00,'2026-09-04','2026-09-04','Recepción del médico'),
 (9,1,1241.67,'2026-09-08','2026-09-08','Recepción de hospitalización'),
 (9,2,1241.67,'2026-10-08',NULL,'Recepción de hospitalización'),
 (9,3,1241.66,'2026-11-08',NULL,'Recepción de hospitalización'),
 (10,1,485.00,'2026-09-06','2026-09-06','Recepción de hospitalización'),
 (11,1,1427.00,'2026-09-06','2026-09-06','Recepción de cirugía'),
 (11,2,1427.00,'2026-10-06',NULL,'Recepción de cirugía'),
 (11,3,1427.00,'2026-11-06',NULL,'Recepción de cirugía'),
 (11,4,1427.00,'2026-12-06',NULL,'Recepción de cirugía'),
 (11,5,1427.00,'2027-01-06',NULL,'Recepción de cirugía'),
 (11,6,1427.00,'2027-02-06',NULL,'Recepción de cirugía'),
 (12,1,982.50,'2026-09-08','2026-09-08','Recepción de hospitalización'),
 (12,2,982.50,'2026-10-08',NULL,'Recepción de hospitalización'),
 (13,1,3098.42,'2026-09-14','2026-09-14','Recepción de cirugía'),
 (13,2,3098.42,'2026-10-14',NULL,'Recepción de cirugía'),
 (13,3,3098.42,'2026-11-14',NULL,'Recepción de cirugía'),
 (13,4,3098.42,'2026-12-14',NULL,'Recepción de cirugía'),
 (13,5,3098.42,'2027-01-14',NULL,'Recepción de cirugía'),
 (13,6,3098.42,'2027-02-14',NULL,'Recepción de cirugía'),
 (13,7,3098.42,'2027-03-14',NULL,'Recepción de cirugía'),
 (13,8,3098.42,'2027-04-14',NULL,'Recepción de cirugía'),
 (13,9,3098.42,'2027-05-14',NULL,'Recepción de cirugía'),
 (13,10,3098.42,'2027-06-14',NULL,'Recepción de cirugía'),
 (13,11,3098.42,'2027-07-14',NULL,'Recepción de cirugía'),
 (13,12,3098.38,'2027-08-14',NULL,'Recepción de cirugía'),
 (14,1,790.00,'2026-09-14','2026-09-15','Recepción de hospitalización'),
 (15,1,415.00,'2026-09-11','2026-09-11','Recepción de hospitalización'),
 (15,2,415.00,'2026-10-11',NULL,'Recepción de hospitalización'),
 (16,1,405.00,'2026-09-12','2026-09-12','Recepción de hospitalización'),
 (17,1,350.00,'2026-09-15',NULL,'Recepción de hospitalización');

-- Calificaciones de hospitales, médicos, enfermeros y encargados de unidad
INSERT INTO calificacion (id_calificacion, id_hospital, tipo_calificado, id_persona_calificada, id_paciente,
                          puntuacion, comentario, fecha) VALUES
 (1,1,'Hospital',NULL,18,5,'Atención puntual y ordenada','2026-09-01'),
 (2,1,'Médico',2,18,5,'Explicó claramente el tratamiento','2026-09-15'),
 (3,1,'Enfermero',13,24,4,'Muy atenta durante la cirugía','2026-09-08'),
 (4,1,'Encargado',10,20,4,'La jefa de Hospitalización resolvió dudas de la familia','2026-09-08'),
 (5,2,'Hospital',NULL,27,3,'Tiempo de espera largo en Emergencias','2026-09-12'),
 (6,1,'Médico',12,19,4,NULL,'2026-09-01'),
 (7,1,'Enfermero',15,20,5,'Excelente trato','2026-09-08'),
 (8,1,'Médico',9,28,3,'Poca comunicación con la familia','2026-09-20'),
 (9,1,'Hospital',NULL,NULL,2,'Encuesta anónima: falta de parqueo','2026-09-21'),
 (10,1,'Encargado',6,26,5,'La jefa de Emergencias atendió con rapidez','2026-09-11');

COMMIT;

-- ---------------------------------------------------------------------
-- 8. Sincronizar las secuencias de identidad con los id insertados manualmente
-- ---------------------------------------------------------------------
DO $$
DECLARE
    r RECORD;
BEGIN
    FOR r IN
        SELECT c.table_name, c.column_name
        FROM information_schema.columns c
        WHERE c.table_schema = 'hospital' AND c.is_identity = 'YES'
    LOOP
        EXECUTE format(
            'SELECT setval(pg_get_serial_sequence(%L, %L), COALESCE((SELECT MAX(%I) FROM hospital.%I), 0) + 1, false)',
            'hospital.' || r.table_name, r.column_name, r.column_name, r.table_name);
    END LOOP;
END $$;

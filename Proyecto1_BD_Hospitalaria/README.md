# Proyecto 1 — Modelado y Gestión de una Base de Datos Hospitalaria

**Curso:** Sistemas de Bases de Datos 1 (Laboratorio) — USAC, CUNOC  
**Estudiante:** Brandon Gustavo Güinac Román — Carné 201931217  
**Catedrático:** Ing. Bryan Gómez  
**SGBD:** PostgreSQL 16 o superior · **Notación del modelo:** Barker

Base de datos `hospitales_occidente` (esquema `hospital`) para la cadena Hospitales de Occidente:
personal, pacientes y encargados, Consulta externa, Emergencias, Cirugía, Hospitalización, fichas de
ingreso/egreso/traslado, facturación en cuotas y calificaciones de calidad. 53 tablas, 95 llaves foráneas
con acción referencial explícita y más de 100 restricciones CHECK.

## Contenido del repositorio

| Carpeta | Contenido |
|---|---|
| `modelo/` | `modelo_barker_hospitales.drawio`: archivo nativo de draw.io (diagrams.net), una página por área. `diagrama_N_*.png`: imágenes del modelo (también en `.svg`). |
| `sql/ddl/` | `01_ddl.sql`: creación del esquema, tablas, llaves, restricciones CHECK y acciones referenciales. |
| `sql/dml/` | `01_dml.sql`: inserción de datos de prueba ficticios. `02_pruebas_restricciones.sql`: pruebas opcionales de las restricciones (revierte todo al terminar). |
| `sql/dcl/` | `01_dcl.sql`: roles `rol_auditor` (solo lectura), `rol_administrador` (privilegios completos) y `rol_recepcion` (operativo), con sus usuarios. |
| `backup/` | Respaldo con `pg_dump` (estructura y datos): `hospitales_occidente.sql` (texto plano) y `hospitales_occidente.backup` (formato personalizado para `pg_restore`). |
| `documentacion/` | `Proyecto1_Documentacion.pdf`: decisiones de diseño, imágenes del modelo, diccionario de datos y sentencias SQL. |

## Ejecución desde cero

```bash
psql -U postgres -c "CREATE DATABASE hospitales_occidente ENCODING 'UTF8';"
psql -U postgres -d hospitales_occidente -f sql/ddl/01_ddl.sql
psql -U postgres -d hospitales_occidente -f sql/dml/01_dml.sql
psql -U postgres -d hospitales_occidente -f sql/dcl/01_dcl.sql
# opcional
psql -U postgres -d hospitales_occidente -f sql/dml/02_pruebas_restricciones.sql
```

## Restaurar el respaldo

```bash
# formato personalizado (los roles se crean con el script DCL)
createdb -U postgres hospitales_occidente
psql -U postgres -d hospitales_occidente -f sql/dcl/01_dcl.sql   # opcional: crea roles antes de restaurar permisos
pg_restore -U postgres -d hospitales_occidente --no-owner backup/hospitales_occidente.backup

# o texto plano (incluye CREATE DATABASE)
psql -U postgres -f backup/hospitales_occidente.sql
```

Si los roles no existen al restaurar, PostgreSQL solo muestra advertencias en los `GRANT`; la estructura
y los datos se restauran igual.

## Usuarios de prueba (DCL)

| Usuario | Rol | Permisos |
|---|---|---|
| `usr_auditor` | `rol_auditor` | `SELECT` sobre todo el esquema |
| `usr_administrador` | `rol_administrador` | Todos los privilegios sobre el esquema |
| `usr_recepcion` | `rol_recepcion` | Registra pacientes, citas, facturas y pagos |

Las contraseñas están en `sql/dcl/01_dcl.sql` y son solo de prueba.

> Todos los datos de personas (nombres, DPI, teléfonos, direcciones) son ficticios.

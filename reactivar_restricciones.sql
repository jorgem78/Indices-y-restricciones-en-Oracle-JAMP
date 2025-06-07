-- Reactivar restricciones en EMPLEADOS y DEPARTAMENTOS

-- Habilitar la restricción de clave foránea de EMPLEADOS a DEPARTAMENTOS
ALTER TABLE empleados ENABLE CONSTRAINT SYS_C008504;

-- Habilitar la restricción de clave primaria de EMPLEADOS
ALTER TABLE empleados ENABLE CONSTRAINT SYS_C008503;

-- Habilitar la restricción de clave foránea de DEPARTAMENTOS a LOCATIONS (o similar)
ALTER TABLE departamentos ENABLE CONSTRAINT SYS_C008502;

-- Habilitar la restricción de clave primaria de DEPARTAMENTOS
ALTER TABLE departamentos ENABLE CONSTRAINT SYS_C008500;

-- Habilitar la restricción única en NOMBRE_DEPARTAMENTO (en DEPARTAMENTOS)
ALTER TABLE departamentos ENABLE CONSTRAINT SYS_C008501;
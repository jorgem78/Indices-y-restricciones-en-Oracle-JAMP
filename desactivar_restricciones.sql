-- Desactivar la restricción de clave foránea de EMPLEADOS y DEPARTAMENTOS
ALTER TABLE empleados DISABLE CONSTRAINT SYS_C008504;

-- Desactivar la restricción de clave primaria de EMPLEADOS
ALTER TABLE empleados DISABLE CONSTRAINT SYS_C008503;

-- Desactivar la restricción de clave foránea de DEPARTAMENTOS a LOCATIONS (o similar)
ALTER TABLE departamentos DISABLE CONSTRAINT SYS_C008502;

-- Desactivar la restricción de clave primaria de DEPARTAMENTOS
ALTER TABLE departamentos DISABLE CONSTRAINT SYS_C008500;
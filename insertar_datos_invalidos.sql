-- Insertar datos que violan las restricciones
-- Para DEPARTAMENTOS:
-- Usamos un ID de departamento (1) que podría existir, y un nombre ('NuevoDeptoInvalido')
-- qe no debería chocar con una restricción única inmediata si el ID no es la PK de SYS_C008501
-- El '999' es para violar la FK a la tabla de ubicaciones (SYS_C008502).
INSERT INTO departamentos VALUES (1, 'NuevoDeptoInvalido', 999); 

-- Para EMPLEADOS:
-- Usamos un ID de empleado (100) que podría existir, y un depto_id (999)
-- que violará la FK a DEPARTAMENTOS (SYS_C008504).
INSERT INTO empleados VALUES (100, 'NombrePrueba', 'ApellidoPrueba', 'email@ejemplo.com', 999);
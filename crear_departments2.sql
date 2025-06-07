-- Crear copia de DEPARTAMENTOS
CREATE TABLE departamentos2 AS SELECT * FROM departamentos;

-- Insertar tres tuplas en departamentos2
INSERT INTO departamentos2 VALUES (10, 'Compras', 1);
INSERT INTO departamentos2 VALUES (11, 'TI', 2);
INSERT INTO departamentos2 VALUES (12, 'Investigación', 3);

-- Consultar tabla para verificar
SELECT * FROM departamentos2; 


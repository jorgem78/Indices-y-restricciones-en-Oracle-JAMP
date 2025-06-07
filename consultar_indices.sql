-- Consultar los índices de las tablas EMPLEADOS y DEPARTAMENTOS
SELECT index_name, table_name, column_name
FROM all_ind_columns
WHERE table_name IN ('EMPLEADOS', 'DEPARTAMENTOS')
ORDER BY table_name, index_name;

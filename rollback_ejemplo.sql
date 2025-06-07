-- Ejemplo de cómo deshacer una transacción con ROLLBACK
BEGIN
   DBMS_OUTPUT.PUT_LINE('Inicia transacción con ROLLBACK');

   -- Insertamos un departamento temporal
   INSERT INTO departamentos2 VALUES (99, 'Temporal', 4);

   -- Deshacemos la operación
   ROLLBACK;

   DBMS_OUTPUT.PUT_LINE('Transacción deshecha con ROLLBACK');
END;
/

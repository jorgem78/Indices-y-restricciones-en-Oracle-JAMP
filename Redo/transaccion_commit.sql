SET SERVEROUTPUT ON;

BEGIN
   DBMS_OUTPUT.PUT_LINE('Inicio de la transacción con COMMIT');

   -- Insertamos un departamento de prueba
   INSERT INTO departamentos2 VALUES (101, 'DepartamentoCommit', 5);

   -- Confirmamos los cambios
   COMMIT;

   DBMS_OUTPUT.PUT_LINE('Transacción confirmada con COMMIT');
END;
/


SET SERVEROUTPUT ON;

BEGIN
   DBMS_OUTPUT.PUT_LINE('Inicio de la transacción con ROLLBACK');

   -- Insertamos un departamento temporal
   INSERT INTO departamentos2 VALUES (102, 'DepartamentoRollback', 6);

   -- Cancelamos la transacción
   ROLLBACK;

   DBMS_OUTPUT.PUT_LINE('Transacción cancelada con ROLLBACK');
END;
/

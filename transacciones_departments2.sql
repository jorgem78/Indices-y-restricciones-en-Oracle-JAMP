-- Bloque anónimo con transacción sobre departamentos2
BEGIN
  DBMS_OUTPUT.PUT_LINE('Inicia transacción');

  INSERT INTO departamentos2 VALUES (13, 'Seguridad', 3);
  DELETE FROM departamentos2 WHERE departamento_id = 10;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Transacción finalizada');
END;
/

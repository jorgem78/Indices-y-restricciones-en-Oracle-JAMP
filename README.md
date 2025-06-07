# Indices y Restricciones en Oracle

Bienvenido al repositorio **Índices y Restricciones en Oracle**! Este proyecto contiene los archivos y documentación para una actividad práctica realizada con **Oracle 11g** y **SQL Developer**, enfocada en la gestión de índices, restricciones, transacciones y archivos de Redo en el esquema **HR** (Human Resources).

---

## 	Objetivo

Explorar y dominar conceptos clave de Oracle mediante:

- 	Consultar y gestionar **índices** en las tablas `EMPLOYEES` y `DEPARTMENTS`.
- 	**Desactivar** y **reactivar** restricciones de integridad.
- 	Insertar datos que violen restricciones desactivadas.
- 	Crear y manipular una tabla duplicada (`DEPARTMENTS2`).
- 	Gestionar **transacciones** con bloques anónimos, `COMMIT` y `ROLLBACK`.
- 	Entender el rol de los **archivos de Redo** en la recuperación.

---

## Requisitos Previos

Antes de empezar, asegúrate de tener:

- 	**Oracle 11g** instalado.
- 	**SQL Developer** para interactuar con la base de datos.
- 	Acceso al esquema **HR** (usuario `hr`).
- 	Conexión activa a la base de datos Oracle.

---

## Instrucciones de Ejecución

Sigue estos pasos en SQL Developer para completar la actividad. ¡Conéctate con el usuario hr primero!


1. Consultar índices disponibles

	- Acción: Ejecuta sql/consultar_indices.sql.

	- Resultado: Lista los índices de EMPLOYEES y DEPARTMENTS con nombres y columnas asociadas.


2. Desactivar restricciones

	- Acción: Ejecuta sql/desactivar_restricciones.sql.

	- Resultado: Mensajes como "Table altered." para ambas tablas.


3. Insertar datos inválidos

	- Acción: Ejecuta sql/insertar_datos_invalidos.sql.

	- Resultado: Inserciones exitosas ("1 row inserted.") porque las restricciones están desactivadas.


4. Reactivar restricciones

	- Acción: Ejecuta sql/reactivar_restricciones.sql.

	- Resultado: Errores (e.g., ORA-02298, ORA-02291) por datos inválidos insertados.


5. Crear tabla DEPARTMENTS2

	- Acción: Ejecuta sql/crear_departments2.sql.

	- Resultado: Tabla creada con 3 filas insertadas, visibles con SELECT.
	

6. Cerrar sesión

	- Acción: En SQL Developer, haz clic derecho en la conexión HR > "Desconectar".

	- Resultado: Sesión cerrada.
	

7.  Consultar DEPARTMENTS2

	- Acción: Reconecta con hr y ejecuta SELECT * FROM DEPARTMENTS2;.

	- Resultado: Los datos insertados persisten, confirmando COMMIT implícito.


8. Bloque anónimo con transacción

	- Acción: Ejecuta sql/transacciones_departments2.sql.

	- Resultado: Transacción confirmada con COMMIT, visible en DEPARTMENTS2.


9. Ejemplo de ROLLBACK

	- Acción: Ejecuta sql/rollback_ejemplo.sql.

	- Resultado: Inserción cancelada, verificable con SELECT.



10. Transacciones con COMMIT y ROLLBACK

	- Acción: Ejecuta sql/transaccion_commit.sql y sql/transaccion_rollback.sql.

	- Resultado: Verifica efectos con SELECT * FROM DEPARTMENTS2;.
	
---
	
## Archivos de Redo en Oracle

# ¿Qué son?

Los archivos de Redo registran todos los cambios realizados en la base de datos antes de un COMMIT. Son clave para la recuperación tras fallos, garantizando la integridad de los datos.

# Modos de Funcionamiento


- NOARCHIVELOG 
				Redo Logs se sobrescriben cíclicamente. Recuperación limitada al último backup. Se recomienda en entornos de desarrollo.


- ARCHIVELOG 
				Redo Logs se archivan antes de sobrescribirse. Permite recuperación hasta un punto específico. Se recomienda en entornos de producción.
	
---

## Transacciones en Oracle

# COMMIT

Confirma los cambios, haciéndolos permanentes.

Ejemplo: sql/transaccion_commit.sql inserta department_id = 101 y lo guarda con COMMIT.

	INSERT INTO DEPARTMENTS2 (department_id, department_name) VALUES (101, 'IT Support');
	COMMIT;

# ROLLBACK

Cancela los cambios, restaurando el estado anterior.

Ejemplo: sql/transaccion_rollback.sql inserta department_id = 102 pero lo elimina con ROLLBACK.

	INSERT INTO DEPARTMENTS2 (department_id, department_name) VALUES (102, 'Marketing');
	ROLLBACK;
	
---

## Conclusiones

Índices: Optimizan consultas y soportan restricciones de integridad.



Restricciones: Su desactivación permite flexibilidad, pero la reactivación valida consistencia.



Persistencia: Operaciones DDL/DML con COMMIT aseguran datos permanentes.



Redo Logs: Claves para recuperación en entornos productivos.



Transacciones: COMMIT y ROLLBACK ofrecen control preciso.
	
---

## 📂 Estructura del Repositorio

```plaintext
├──    sql/
│   ├── consultar_indices.sql          # 	Consulta índices de EMPLOYEES y DEPARTMENTS
│   ├── desactivar_restricciones.sql   # 	Desactiva restricciones
│   ├── insertar_datos_invalidos.sql   # 	Inserta datos inválidos
│   ├── reactivar_restricciones.sql    # 	Reactiva restricciones
│   ├── crear_departments2.sql         # 	Crea DEPARTMENTS2 e inserta datos
│   ├── transacciones_departments2.sql # 	Bloque anónimo para transacciones
│   ├── transaccion_commit.sql         # 	Ejemplo de COMMIT
│   ├── transaccion_rollback.sql       # 	Ejemplo de ROLLBACK
│   ├── rollback_ejemplo.sql           # 	Ejemplo adicional de ROLLBACK
├──    docs/
│   ├──    capturas/                  # Imágenes de resultados
│   ├──    documentacion.pdf          # Documentación completa
├──    README.md                      # Este archivo
	Actividades 

	Trabajo: Índices y restricciones en Oracle

	Descripción de la actividad

En esta actividad vamos a trabajar con los índices y restricciones de uno de los esquemas que se instalan por defecto con Oracle 11g: HR (human resources). Al usar SQL Developer, tenemos opciones gráficas para realizar algunas de las tareas que se indican; se pide incluir también el código SQL correspondiente.

 	Utilizando SQL Developer:

o	Iniciar sesión con el usuario hr.
o	Consultar los índices disponibles en las tablas employees y departments
o	Desactivar las restricciones de estas tablas del esquema hr.
o	Insertar tuplas en ambas tablas que no cumplan las restricciones establecidas aunque se encuentran desactivadas. 
o	Volver a establecer las restricciones. 

 	A continuación, realiza las siguientes tareas y, para cada una de ellas, documentar lo que ocurre y a qué se debe:

o	Crear un duplicado de la tabla departments, llamada departments2.
o	Insertar tres tuplas en dicha tabla.
o	Cerrar sesión.
o	Consultar la tabla departments2. 
o	Crea un bloque anónimo en Oracle que indique el comienzo y finalización de una transacción sobre la tabla departments2. 

 	¿Cómo se puede deshacer una transacción en Oracle? Pon un ejemplo práctico. 

 	¿Qué son los archivos de Redo en Oracle? ¿Qué modo de funcionamiento podemos observar en la base de datos atendiendo a estos ficheros? Pon un ejemplo. 

	Entrega

 	Ficheros SQL con todas las instrucciones ejecutas.
 	Documentación de la actividad, incluyendo descripciones de las tareas y capturas de pantalla para cada uno de los ítems solicitados, donde se vea el código ejecutado y la respuesta obtenida.

	Solución
Para realizar esta actividad con los archivos SQL que he estado trabajado, voy a realizar la secuencia con un orden específico en Oracle SQL Developer.
A continuación detallaré el orden de ejecución y cuál es su resultado en cada paso:
Orden de Ejecución en Oracle SQL Developer
Requisito previo: Asegurarse de que ha iniciado la sesión con el usuario HR en SQL Developer.
 
	
	Paso 1: Consultar los índices disponibles: se corre el contenido del archivo consultar_indices.sql. 
 

•	Acción: se abre consultar_indices.sql.
 
 
•	Resultado: se ve una lista de los índices asociados a las tablas EMPLEADOS y DEPARTAMENTOS, incluyendo los nombres y las columnas a las que están asociados. Esto es de gran utilidad ya que ayuda a que se verifique los índices subyacentes a las PK/FK existentes.


	Paso 2: Desactivar las restricciones de las tablas: se corre el contenido del archivo desactivar_restricciones.sql.
 
•	Acción: se abre desactivar_restricciones.sql y se ejecuta.
 
 
•	Resultado: se ve los mensajes como "Table EMPLEADOS alterado." y "Table DEPARTAMENTOS alterado." para cada restricción. Lo cual confirma que las restricciones han sido deshabilitadas temporalmente.
Paso 3: Insertar tuplas que no cumplan con las restricciones: se corre el contenido del archivo insertar_datos_invalidos.sql.
 

•	Acción: se abre insertar_datos_invalidos.sql y se ejecuta.
 
 
•	Resultado: como las restricciones fueron deshabilitadas correctamente en el paso anterior, se ve "1 fila insertadas." para cada INSERT. Esto demuestra que, al estar las restricciones deshabilitadas, la base de datos permite la inserción de datos inconsistentes. 


	Paso 4: Volver a establecer las restricciones: se corre el contenido del archivo reactivar_restricciones.sql.
 
•	Acción: se abre reactivar_restricciones.sql y se ejecuta.
 

 
 
•	Resultado: en esta parte es donde se observan los errores por la violación de las restricciones. Obteniendo mensajes como: 
o	ORA-02298: no se puede validar (etc.) - claves principales no encontradas (para la clave foránea de DEPARTAMENTOS a LOCATIONS, porque 999 no existe).
o	ORA-02291: restricción de integridad (etc.) violada - clave principal no encontrada (para la clave foránea de EMPLEADOS a DEPARTAMENTOS, porque 999 no existe en DEPARTAMENTOS).
o	ORA-02437: no se puede validar (etc.) - clave primaria violada (si empleado_id = 100 o departamento_id = 1 ya existían y los DELETE no los eliminaron).


	Paso 5: Crear un duplicado de la tabla departments, llamada departments2: se corre el contenido del archivo crear_departments2.sql.
 
•	Acción: se abre crear_departments2.sql y se ejecuta.
 

 
•	Resultado: se observa que "Table DEPARTAMENTOS2 creado." y luego "3 filas insertadas." después de los INSERT´s, y finalmente los datos al hacer el SELECT.
	
	
	Paso 6: Cerrar sesión.
•	Acción: En SQL Developer, me dirijo a la conexión HR en el panel de Conexiones, se da clic derecho y se selecciona "Desconectar".
 
•	Resultado: La conexión se cerrará.


	Paso 7: Consultar la tabla departments2.
 

•	Acción: se vuelve a iniciar sesión con el usuario HR, y se intenta un SELECT * FROM departamentos2;.
 
 
•	Resultado: se pueden observar los datos que se insertaron en el Paso 5. Esto demuestra que los COMMIT implícitos después de CREATE TABLE e INSERT han guardado los datos de una forma persistente.


	Paso 8: Se crea un bloque anónimo con una transacción sobre departments2.
Se corre el contenido del archivo transacciones_departments2.sql.
 

•	Acción: se abre transacciones_departments2.sql y se ejecuta.
 
 
 
 
•	Resultado: Se observa "Procedimiento PL/SQL terminado correctamente" en la salida de Script Output o DBMS Output (asegúrate de tenerlo habilitado). Después de esto, si se consulta departamentos2, se puede ver que el departamento 13 (Seguridad) y el departamento 10 han sido eliminados, ya que la transacción se confirmó con el COMMIT.


	Paso 9: Ejemplo de cómo deshacer una transacción con ROLLBACK.
Se corre el contenido del archivo rollback_ejemplo.sql.
 
•	Acción: Abre rollback_ejemplo.sql y ejecútalo.

 
•	Resultado: El bloque se ejecutará e indica que el bloque anónimo en PL/SQL se ha ejecutado sin errores.

Solo es esta confirmando que el código se ejecutó bien; pero como en este mensaje no se muestra directamente si los datos se insertaron o se eliminaron.
Ahora procedí a verificar si el departamento 99 existe; agregando al código:

 

Al ejecutarlo me arrojo: 

 
Con este comando no se muestra ninguna fila ya que el ROLLBACK canceló la inserción. 



	Estructura del Repositorio
.
├── README.md
├── capturas/
│   └── (Imágenes con evidencia de cada paso)
├── consultar_indices.sql
├── desactivar_restricciones.sql
├── insertar_datos_invalidos.sql
├── reactivar_restricciones.sql
├── crear_departments2.sql
├── transacciones_departments2.sql
├── rollback_ejemplo.sql
├── documentacion_actividad.pdf



	Requisitos
Oracle Database 11g o superior

Oracle SQL Developer

Usuario HR desbloqueado y con permisos suficientes

	Pasos principales ejecutados
1. Consultar índices
Se listaron los índices de employees y departments mediante el script consultar_indices.sql.

2. Desactivar restricciones
Se ejecutó desactivar_restricciones.sql para eliminar temporalmente restricciones de integridad.

3. Insertar datos inválidos
Con las restricciones desactivadas, se insertaron tuplas inválidas (archivo insertar_datos_invalidos.sql).

4. Reactivar restricciones
Al intentar reactivarlas (reactivar_restricciones.sql), Oracle lanzó errores ORA-02291 y ORA-02298 por violaciones de claves foráneas o primarias.

5. Crear y llenar tabla departments2
Se creó un duplicado (crear_departments2.sql), se insertaron datos, y se verificó su persistencia tras cerrar sesión.

6. Transacción con bloque PL/SQL
Se ejecutó transacciones_departments2.sql para eliminar registros dentro de una transacción explícita con COMMIT.

7. ROLLBACK
Mediante rollback_ejemplo.sql, se demostró cómo deshacer una transacción no confirmada.


	Evidencias
Las capturas de pantalla se encuentran en la carpeta capturas/ y dentro del documento documentacion_actividad.pdf, donde se detalla:

Código SQL ejecutado

Mensajes de éxito o error

Resultados visibles de las consultas

	Autor
Nombre: Jorge A.Martínez P.


	Estado del Proyecto
Esta ha sido completado y probado en SQL Developer con Oracle 11g.
## Indices y Restricciones en Oracle – Actividad Práctica

Bienvenido a este repositorio, donde encontrarás la solución completa a la actividad sobre **índices, restricciones y transacciones en Oracle 11g**, utilizando el esquema `HR` y el entorno **SQL Developer**.

> 🔍 **Objetivo:** Explorar el funcionamiento de los índices y restricciones, manipular datos y practicar el uso de transacciones en PL/SQL de manera segura y controlada.

---

## Contenidos del Proyecto

Este repositorio contiene:

	Repositorio/
├── consultar_indices.sql
├── desactivar_restricciones.sql
├── insertar_datos_invalidos.sql
├── reactivar_restricciones.sql
├── crear_departments2.sql
├── transacciones_departments2.sql
├── rollback_ejemplo.sql
├── capturas/ Evidencias gráficas (pantallazos)
└── documentacion_actividad.pdf

---

## Herramientas utilizadas

-  **Oracle Database 11g**
-  **SQL Developer**
-  **PL/SQL y SQL estándar**
-  Capturas de pantalla para evidencias

---

## Pasos Realizados

A continuación, se describen los pasos seguidos en esta actividad y los resultados esperados:

###  1. Consulta de índices

- Se usó `consultar_indices.sql` para listar los índices en `employees` y `departments`.
- Resultado: Se visualizaron los índices relacionados con claves primarias y foráneas.

###  2. Desactivación de restricciones

- Se ejecutó `desactivar_restricciones.sql`.
- Resultado: Restricciones deshabilitadas exitosamente.

###  3. Inserción de datos inválidos

- Script: `insertar_datos_invalidos.sql`
- Resultado: Datos inconsistentes insertados gracias a la desactivación temporal de restricciones.

###  4. Reactivación de restricciones

- Script: `reactivar_restricciones.sql`
- Resultado: Oracle lanza errores como `ORA-02291`, `ORA-02298`, indicando violaciones de claves.

###  5. Creación de tabla duplicada `departments2`

- Script: `crear_departments2.sql`
- Resultado: Tabla clonada, datos insertados y confirmados automáticamente.

### 6. Cierre de sesión y verificación de persistencia

- Resultado: Datos permanecen en `departments2` gracias a commits implícitos tras `CREATE` e `INSERT`.

### 7 - 8. Bloque anónimo con transacción

- Script: `transacciones_departments2.sql`
- Resultado: Operaciones ejecutadas y confirmadas con `COMMIT`.

### 9. Ejemplo de ROLLBACK

- Script: `rollback_ejemplo.sql`
- Resultado: Se revierte una inserción antes del commit, lo cual se valida mediante una consulta posterior.


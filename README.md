
<img src="FOTO/CODER_CURSO.png" alt="Texto alternativo" width="300"/>

---

<h3>Indice</h3>

- [Introducción](#Introducción)
- [Objetivos](#Objetivos)
- [Situación Problemática](#Situación-Problematica)
- [Modelo de Negocios](#Modelo-de-Negocios)
- [Listado de Tablas](#Listado-de-Tablas)
- [Listado de Vistas](#Listado-de-vistas)
- [Listado de funciones](#Listado-de-funciones)
- [Listado de Store procedures](#Listado-de-Store-procedures)
- [Listado de triggers](#Listado-de-triggers)
- [Listado de Transacciones](#Listado-de-Transacciones)
- [Listado de tablas de hecho](#Listado-de-tablas-de-hecho)

---

<h2>Introducción</H2>

<p align="justify">El presente proyecto consiste en el diseño e implementación de una base de datos destinada a la gestión de cepas microbiológicas dentro de un laboratorio. La solución contempla la trazabilidad completa de las cepas desde su adquisición, etapas de conservación y uso en la rutina de trabajo. Este sistema asegura el registro y trazabilidad desde la adquisición hasta la destrucción final, facilitando su control de calidad para una auditoría.  </p>

<h2>Objetivos</h2>

<li align="justify"> Establecer un sistema para garantizar la trazabilidad total de cada cepa adquirida a través de sus distintas etapas de uso pudiendo asociar todos los movimientos y firmas de los analistas responsables.

<li align="justify"> Posibilitar la consulta histórica y control de las unidades en stock.

<h2>Situación problemática</h2>

<p align="justify">
En los laboratorios microbiológicos se trabaja con gran cantidad de cepas para control de calidad, ensayos de rutina y control de medios de cultivo. Actualmente se encuentra el laboratorio registrando todo de manera manual con planillas de papel en varios registros distintos que presenta dificultades al momento de una auditoria. Por otro lado, los registros en papel con la necesidad normativa se conservar los registros por 8 años obligan a destinar áreas destinadas al guardado de estos documentos lo que podría implicar riesgo de pérdida o deterioro de las mismas con el tiempo.
La implementación de esta base de datos soluciona estos problemas ya que no será necesario un área para el acopio de estos documentos, tener un sistema que facilita la trazabilidad rápidamente y la posibilidad de tener la información de mayor cantidad de años. 

</p>

<h2>Modelo de Negocios</h2>

<p align="justify"> A raíz de los problemas mencionados y al no contar con soluciones informáticas disponibles en el mercado se diseñó la siguiente base de datos pensando en laboratorios de microbiología donde el uso de cepas controladas es parte de la rutina diaria y mandatorio en el sistema de calidad. 
Dicha propuesta no solo sirve para control de stock, sino que también te permite demostrar la trazabilidad para cumplir con las normativas de los organismos oficiales como ANMAT, SENASA, INAL, entre otros.
</p>

<h2>Listado de Tablas</h2>
<ul>1. TABLA CEPAS</ul>
<li>Descripción: Tabla base que contiene los microorganismos disponibles.</li>

<li>Campos:</li>

MOO_ID (INT, auto_incremental, PRIMARY KEY). Clave primaria.

NOMBRE (VARCHAR(100), UNIQUE, NOT NULL). Nombre de la cepa.

<li>Relaciones (CEPAS 1:n SOTCK_CEPAS):</li>

MOO_ID Usado como clave foránea en: STOCK_CEPAS.

<ul>2. TABLA ANALISTA_FIRMA </ul>
<li>Descripción: Registro de los analistas autorizados para intervenir sobre las cepas.</li>

<li>Campos: </li>

ID_ANALISTA (INT, auto_incremental, PRIMARY KEY). Clave primaria.

NOMBRE (VARCHAR(100), UNIQUE, NOT NULL). Iniciales de los analistas.

<li>Relaciones (ANALISTA_FIRMA 1:n con STOCK_CEPAS, CEPA_RESERVA, CEPA_TRABAJO): </li>

ID_ANALISTA Usado como clave foránea en: STOCK_CEPAS, CEPA_RESERVA, CEPA_TRABAJO.

<ul> 3. TABLA OBSERVAC_RESERVA</ul>
<li>Descripción: Observaciones posibles luego de la reactivacion de cepa.</li>

<li>Campos:</li>

ID_OBSERVACION (INT, AUTO_INCREMENT, NOT NULL, PRIMARY KEY). Clave primaria

DESCRIPCION (VARCHAR(255), UNIQUE, NOT NULL). Descripcion de posibles causas predeterminadas

<li>Relaciones (OBSERVAC_RESERVA 1:n CEPA_RESERVA):</li>

ID_OBSERVACION Usado como clave foránea en: CEPA_RESERVA.

<ul> 4. TABLA PRUEBAS_CEPAS </ul>
<li>Descripción: Contiene los distintos tipos de pruebas bioquímicas posibles.</li>

<li>Campos:</li>

ID_PRUEBAS (INT, AUTO_INCREMENT, NOT NULL, PRIMARY KEY). Clave primaria.

TIPOS (VARCHAR(200), NOT NULL, UNIQUE). tipos de puebas de calidad que existen.

<li>Relaciones (PRUEBAS_CEPAS 1:n STOCK_CEPAS, CEPA_TRABAJO):</li>

ID_PRUEBAS Usado como clave foránea en: STOCK_CEPAS, CEPA_TRABAJO.

<ul>5. TABLA OBSERVACION_TRABAJO</ul>
<li>Descripción: Observaciones predefinidas al uso o baja de cepas.</li>

<li>Campos:</li>

ID_OBSERVACIONTRABAJO (INT, NOT NULL, AUTO_INCREMENT, PRIMARY KEY). Clave primaria.

DESCRIPCION (VARCHAR (200), NOT NULL, UNIQUE). descripcion de aceptacion o no.

<li>Relaciones (OBSERVACION_TRABAJO 1:n CEPA_TRABAJO):</li>

ID_OBSERVACIONTRABAJO Usado como clave foránea en: CEPA_TRABAJO.

<ul>6. TABLA STOCK_CEPAS</ul>
<li>Descripción: Tabla principal que registra la incorporación y datos principales de una cepa en stock.</li>

<li>Campos:</li>

ID_STOCK (INT, AUTO_INCREMENT, PRIMARY KEY). Clave primaria.

NUMERACION (INT, NOT NULL). corresponde a la numeracion para el control de stock

FECHA_RECEPCION, FECHA_VTO, FECHA_RECONSTITUCION (DATE, NOT NULL)

ID_PRUEBAS (INT) Clave foránea a PRUEBAS_CEPAS.

RESULTADO, OBSERVACIONES (VARCHAR(500))

ID_ANALISTA (INT) Clave foránea a ANALISTA_FIRMA.

MOO_ID (INT) Clave foránea a CEPAS.

<li>Relaciones (STOCK_CEPAS 1:n CEPA_RESERVA; STOCK_CEPAS n:1 ANALISTA_FIRMA; STOCK_CEPAS n:1 CEPAS; STOCK_CEPAS n:1 PRUEBAS_CEPAS):</li>

ID_STOCK Usado como clave foránea en: CEPA_RESERVA.


<ul>7. CEPA_RESERVA</ul>
<li>Descripción: Tabla que registra las alícuotas reservadas desde el stock.</li>

<li>Campos:</li>

ID_RESERVA (INT, AUTO_INCREMENT, PRIMARY KEY). Clave primaria

ID_STOCK (VARCHAR(50), NOT NULL). Clave foránea a STOCK_CEPAS.

NUMERO_ALICUOTA (VARCHAR (10), NOT NULL). Cantidad de alicuotas generadas por cada cepa de reserva

FECHA_RECONSTITUCION (DATE).

ID_OBSERVACION (INT). Clave foránea a OBSERVAC_RESERVA.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

<li>Relaciones (CEPA_RESERVA 1:1 CEPA_TRABAJO; CEPA_RESERVA n:1 ANALISTA_FIRMA; CEPA_RESERVA n:1 OBSERVAC_RESERVA; CEPA_RESERVA n:1 STOCK_CEPAS):</li>

ID_RESERVA Usado como clave foránea en: CEPA_TRABAJO.


<ul>8. CEPA_TRABAJO</ul>
<li>Descripción: Segunda etapa de uso de una cepa, derivada de reserva.</li>

<li>Campos:</li>

ID_TRABAJO (INT, PRIMARY KEY, AUTO_INCREMENT). Clave primaria

NIVEL (INT, NOT NULL). Representa el nivel de pasaje de la cepa

ID_RESERVA_ORIGEN (INT). Clave foránea a CEPA_RESERVA.

ID_TRABAJO_ORIGEN (INT). 

FECHA_ACTIVACION, FECHA_BAJA (DATE, NOT NULL). 

ID_PRUEBAS (INT). Clave foránea a PRUEBAS_CEPAS.

RESULTADO (VARCHAR(500)).

ID_OBSERVACIONTRABAJO (INT). Clave foránea a OBSERVACION_TRABAJO.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

ID_PREPARACION INT NULL. Clave foránea a PREPARACION_MEDIO_CULTIVO.

<li>Relaciones (CEPA_RESERVA 1:1 CEPA_TRABAJO; CEPA_TRABAJO 1:1 CEPA_TRABAJO; CEPA_TRABAJO n:1 ANALISTA_FIRMA; CEPA_TRABAJO n:1 ID_OBSERVACIONTRABAJO; CEPA_TRABAJO n:1 PRUEBAS_CEPAS; PREPARACION_MEDIO_CULTIVO 1:n CEPA_TRABAJO):</li>

ID_TRABAJO_ORIGEN Usado como clave foránea recursiva en: CEPA_TRABAJO.

SE MODIFICA LA TABLA ORIGINAL PARA AGREGARLE EL CAMPO PREPARACION_MEDIO_CULTIVO Y SU RELACION.

<ul>9. MEDIO_CULTIVO_STOCK</ul>
<li>Descripción: Registro del stock de medios de cultivo disponibles en el laboratorio.</li> 

<li>Campos:</li>

ID_MEDIO (INT, PRIMARY KEY, AUTO_INCREMENT). Clave primaria.

NOMBRE (VARCHAR(100), NOT NULL). Nombre del medio de cultivo.

FABRICANTE (VARCHAR(100)). Fabricante del medio.

LOTE (VARCHAR(50)). Número de lote del medio.

VENCIMIENTO (DATE). Fecha de vencimiento del medio.

<li>Relaciones (PREPARACION_MEDIO_CULTIVO n:1 MEDIO_CULTIVO_STOCK): </li>

ID_MEDIO usado como clave forane en: PREPARACION_MEDIO_CULTIVO.

<ul>10. ECOMETRICO</ul> 
<li>Descripción: Tabla de control ecométrico de los medios de cultivo para validar la calidad microbiológica.</li>
<li>Campos:</li>

ID_ECOMETRICO (INT, PRIMARY KEY, AUTO_INCREMENT). Clave primaria.

FECHA (DATE, NOT NULL). Fecha del control ecométrico.

ICA (INT, NOT NULL). Índice de control.

ICE (INT, NOT NULL). Índice de control.

RESULTADO (VARCHAR(100), NOT NULL). Resultado del control.

<li>Relaciones (PREPARACION_MEDIO_CULTIVO n:1 ECOMETRICO):</li>
ID_ECOMETRICO usado como clave foranea en: PREPARACION_MEDIO_CULTIVO.

<ul>11. AGUA_DEST</ul>
<li>Descripción: Registro para control del agua destilada utilizada en la preparación de medios de cultivo.</li>
<li>Campos:</li>

ID_AGUA (INT, PRIMARY KEY, AUTO_INCREMENT). Clave primaria.

FECHA_ENTRADA (DATE, NOT NULL). Fecha de control del agua destilada.

CONTROL (VARCHAR(100)). Resultado del control de calidad del agua.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

<li>Relaciones (AGUA_DEST n:1 ANALISTA_FIRMA, PREPARACION_MEDIO_CULTIVO n:1 AGUA_DEST): </li>
ID_AGUA usado como clave foranea en: PREPARACION_MEDIO_CULTIVO.

<ul>12. PREPARACION_MEDIO_CULTIVO</ul>
<li>Descripción: Registro de la preparación de medios de cultivo en el laboratorio.</li>
<li>Campos:</li>

ID_PREPARACION (INT, PRIMARY KEY, AUTO_INCREMENT). Clave primaria.

ID_MEDIO (INT, NOT NULL). Clave foránea a MEDIO_CULTIVO_STOCK.

FECHA_PREPARACION (DATE, NOT NULL). Fecha de preparación del medio.

ID_ECOMETRICO (INT). Clave foránea a ECOMETRICO.

ID_AGUA (INT). Clave foránea a AGUA_DEST.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

PH (INT). Valor de pH medido en la preparación.

OBSERVACIONES (VARCHAR(500)). Observaciones generales.

ID_CICLO (INT). Clave foránea a ESTERILIZACION.

<li>Relaciones (PREPARACION_MEDIO_CULTIVO n:1 MEDIO_CULTIVO_STOCK, PREPARACION_MEDIO_CULTIVO n:1 ECOMETRICO, PREPARACION_MEDIO_CULTIVO n:1 AGUA_DEST, PREPARACION_MEDIO_CULTIVO n:1 ANALISTA_FIRMA, PREPARACION_MEDIO_CULTIVO n:1 ESTERILIZACION, CEPA_TRABAJO n:1 PREPARACION_MEDIO_CULTIVO):</li>
ID_PREPARACION usado como clave foranea en: CEPA_TRABAJO.

<ul>13. EQUIPOS</ul>
<li>Descripción: Registro de los equipos del laboratorio y su control.</li>
<li>Campos:</li>

ID_EQUIPO (INT, PRIMARY KEY, AUTO_INCREMENT). Clave primaria.

MARCA (VARCHAR(100)). Marca del equipo.

FECHA_CALIBRACION (DATE). Fecha de última calibración.

VTO_CALIBRACION (DATE). Fecha de vencimiento de la calibración.

<li>Relaciones (ESTERILIZACION n:1 EQUIPOS, AUTOCLAVE_VERIF n:1 EQUIPOS):</li>
ID_EQUIPO usado como clave foranea en: ESTERILIZACION y AUTOCLAVE_VERIF.

<ul>14. ESTERILIZACION</ul>
<li>Descripción: Registro de los ciclos de esterilización realizados en autoclaves.</li>
<li>Campos:</li>

ID_CICLO (INT, PRIMARY KEY, AUTO_INCREMENT). Clave primaria.

ID_EQUIPO (INT, NOT NULL). Clave foránea a EQUIPOS.

FECHA (DATE, NOT NULL). Fecha del ciclo de esterilización.

TIEMPO (INT). Tiempo del ciclo en minutos.

TEMPERATURA (INT). Temperatura alcanzada.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

<li>Relaciones (ESTERILIZACION n:1 EQUIPOS, ESTERILIZACION n:1 ANALISTA_FIRMA, PREPARACION_MEDIO_CULTIVO n:1 ESTERILIZACION):</li>
ID_CICLO usado como clave foranea en: PREPARACION_MEDIO_CULTIVO.

<ul>15. AUTOCLAVE_VERIF</ul>
<li>Descripción: Registro de la verificación de los autoclaves como control de calidad.</li>
<li>Campos:</li>

ID_AUTOCLAVE (INT, PRIMARY KEY, AUTO_INCREMENT). Clave primaria.

ID_EQUIPO (INT, NOT NULL). Clave foránea a EQUIPOS.

FECHA (DATE, NOT NULL). Fecha de la verificación.

LECTURA_1 (DECIMAL(8,3)). Lectura 1 registrada.

LECTURA_2 (DECIMAL(8,3)). Lectura 2 registrada.

CUMPLE (BOOLEAN). Indica si el autoclave cumple con las condiciones establecidas.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

<li>Relaciones (AUTOCLAVE_VERIF n:1 EQUIPOS, AUTOCLAVE_VERIF n:1 ANALISTA_FIRMA):</li>

<h2>Listado de Vistas</h2>

<ul>VISTA "CEPAS_RECONSTITUIDAS"</ul>

<li>Descripción:
Esta vista muestra todas las cepas que fueron reconstituídas en stock. Dicha tabla incluye el dato de la cepa, su numeracion, fechas de recepción y vencimiento, fecha de reconstitución, resultado, observaciones y analista responsable.</li>

<li>Objetivo:
El objetivo de esta vista es facilitar la identificación y control de las cepas que ya han sido reconstituídas.</li>

<li>Tablas que la componen:

Tabla "STOCK_CEPAS": Contiene información principal de cada cepa en stock, incluyendo fechas, resultados, observaciones y referencias a analistas y pruebas.

Tabla "CEPAS": Contiene los nombres de las cepas. Se utiliza para obtener el nombre asociado a cada registro de stock.

Tabla "ANALISTA_FIRMA": Contiene los nombres de los analistas responsables de la reconstitución.</li>


<ul>VISTA "CEPAS_VENCIDAS_SIN_USAR"</ul>

<li>Descripción:
Esta vista muestra todas las cepas que se encuentran vencidas y que no han sido reconstituídas, incluyendo información de la cepa (nombre), numeración de lote, fechas (VTO, reconstitución, recepción), observaciones y analista responsable.</li>

<li>Objetivo:
Identificar las cepas vencidas sin uso para poder tomar decisiones sobre su disposición o eliminación.</li>

<li>Tablas que la componen:

Tabla "STOCK_CEPAS": Contiene la información de fechas, numeracion, observaciones y resultados de las cepas.

Tabla "CEPAS": Permite obtener el nombre de la cepa asociada.

Tabla "ANALISTA_FIRMA": Permite obtener el nombre del analista responsable.</li>


<ul>VISTA "CEPAS_NO_VENCIDAS_SIN_USAR"</ul>

<li>Descripción:
Esta vista muestra las cepas que aún no han vencido y que no han sido reconstituídas, con información del lote (numeración), resultado, observaciones, fechas y analista responsable.</li>

<li>Objetivo:
Permitir el control de stock de cepas disponibles para uso, asegurando que las unidades válidas no se desperdicien.</li>

<li>Tablas que la componen:

Tabla "STOCK_CEPAS": numeración, fechas, resultados y observaciones.

Tabla "CEPAS": Nombre de la cepa asociada.

Tabla "ANALISTA_FIRMA": Nombre del analista responsable.</li>

<ul>VISTA "CEPAS_RESERVA_RECONSTITUIDAS"</ul>

<li>Descripción:
Esta vista muestra las alícuotas de reserva que han sido reconstituídas, incluyendo el número de alícuota, fecha de reconstitución, observación, analista responsable, nombre de la cepa y numeración de lote.</li>

<li>Objetivo:
Permitir el seguimiento de las alícuotas que han sido reconstituídas, garantizando el seguimiento y control de calidad.</li>

<li>Tablas que la componen:

Tabla "CEPA_RESERVA": Contiene información de cada alícuota de reserva reconstituida, fechas y referencias a observaciones y analistas.

Tabla "STOCK_CEPAS": Permite obtener la numeración del lote de la cepa asociada.

Tabla "CEPAS": Permite obtener el nombre de la cepa.

Tabla "OBSERVACION_RESERVA": Contiene las descripciones de las observaciones asociadas a la reconstitución.

Tabla "ANALISTA_FIRMA": Contiene los nombres de los analistas responsables.</li>

<ul>VISTA "CEPAS_RESERVA_NO_RECONSTITUIDAS"</ul>

<li>Descripción:
Esta vista muestra las alícuotas de reserva que aún no han sido reconstituídas, con información del número de alícuota, nombre de la cepa, fecha y número de lote.</li>

<li>Objetivo:
Identificar alícuotas de reserva pendientes de reconstitución para tener un orden en el uso y seguimiento.</li>

<li>Tablas que la componen:

Tabla "CEPA_RESERVA": Información de las alícuotas pendientes.

Tabla "STOCK_CEPAS": Permite obtener la numeración del lote.

Tabla "CEPAS": Permite obtener el nombre de la cepa.</li>

<ul>VISTA "TRAZABILIDAD_CEPA_TRABAJO"</ul>

<li>Descripción:
Esta vista permite ver la trazabilidad completa de las cepas desde reserva hasta los niveles 2, 3 y 4 de trabajo, incluyendo fechas de activación, fecha de baja, tipo de prueba, resultados de pruebas, observaciones y analistas responsables en cada nivel.</li>

<li>Objetivo:
Facilitar el seguimiento y auditoría de la trazabilidad de las cepas en sus diferentes etapas de uso dentro del laboratorio.</li>

<li>Tablas que la componen:</li>

Tabla "CEPA_RESERVA": Contiene información de las alícuotas y referencias a nivel 2 de trabajo.

Tabla "STOCK_CEPAS": Información de numeración y asociación a tabla CEPAS.

Tabla "CEPAS": Nombre de la cepa.

Tabla "CEPA_TRABAJO": Información de los niveles de trabajo 2, 3 y 4, incluyendo fechas, resultados y referencias a observaciones y analista.

Tabla "PRUEBAS_CEPAS": Tipos de pruebas bioquímicas asociadas a cada nivel de trabajo.

Tabla "OBSERVACION_TRABAJO": Observaciones registradas en cada nivel de trabajo.

Tabla "ANALISTA_FIRMA": Analistas responsables en cada nivel de trabajo.</li>

<ul>VISTA "TRAZABILIDAD_PREPARACION_ESTERILIZACION"</ul>

<li>Descripción: Esta vista muestra la trazabilidad completa del proceso de preparación y esterilización de un medio de cultivo. Incluye los datos de preparación del medio (fecha, pH, observaciones y analista), los parámetros del ciclo de esterilización (fecha, tiempo, temperatura y analista), la información del equipo utilizado (marca, calibraciones) y los controles de verificación del autoclave (lecturas y cumplimiento).</li> 

<li>Objetivo: El objetivo de esta vista es tener en un solo registro la información de todo el proceso de preparación y esterilización para conocer su trazabilidad.</li> 

<li>Tablas que la componen:</li>

Tabla "PREPARACION_MEDIO_CULTIVO": Contiene la información de cada preparación realizada (fecha, pH, observaciones y analista responsable).

Tabla "ESTERILIZACION": Registra los datos de cada ciclo de esterilización (fecha, tiempo, temperatura y analista).

Tabla "EQUIPOS": Incluye información del equipo utilizado en el ciclo (marca, fecha de calibración y vencimiento).

Tabla "AUTOCLAVE_VERIF": Contiene los resultados de verificación del autoclave (lecturas y cumplimiento).

Tabla "ANALISTA_FIRMA": Se utiliza para identificar a los analistas responsables de la preparación y esterilización.</li>

<ul>VISTA "V_TRAZABILIDAD_MEDIOS"</ul>

<li>Descripción: Esta vista muestra la trazabilidad completa de los medios de cultivo preparados para control de calidad. Incluye la preparación del medio (fecha, pH, observaciones y analista), los datos del medio en stock (nombre, fabricante, lote y vencimiento), los resultados de los controles ecométricos (fecha, ICA, ICE y resultado), y el control del agua utilizada (fecha, resultado y analista responsable).</li> 

<li>Objetivo: El objetivo de esta vista es facilitar la trazabilidad y control de cada medio preparado.</li>

<li>Tablas que la componen:</li>

Tabla "PREPARACION_MEDIO_CULTIVO": Contiene la información de cada preparación de medio (fecha, pH, observaciones y analista).

Tabla "MEDIO_CULTIVO_STOCK": Registra los medios de cultivo disponibles (nombre, fabricante, lote, vencimiento).

Tabla "ECOMETRICO": Incluye los resultados de los controles ecométricos (fecha, ICA, ICE y resultado).

Tabla "AGUA_DEST": Registra los datos del agua destilada utilizada en la preparación (fecha y resultado de control).

Tabla "ANALISTA_FIRMA": Identifica a los analistas responsables de la preparación del medio y del control de agua.

<h2>Listado de funciones</h2>
<ul>FUNCIÓN "dias_hasta_vencimiento"</ul>
<li>Descripción:
Esta función calcula cuántos días faltan para el vencimiento de una cepa en stock. Si el vencimiento ya pasó, devuelve el estado como “vencida”, sino devuelve la cantidad de dias.</li>

<li>Objetivo:
Facilitar el seguimiento de las cepas que se encuentran vencidas o saber cual es el tiempo hasta su caducidad.</li>

<li>Tablas que usa:</li>
Tabla "STOCK_CEPAS": utiliza el campo FECHA_VTO para calcular los días de diferencia contra la fecha actual (CURDATE()).

Datos que devuelve:
Un texto (VARCHAR) indicando: La cantidad de días restantes (ejemplo: "15 días restantes") o "vencida" en caso de que el vencimiento ya haya ocurrido.</li>

<ul>FUNCIÓN "proxima_alicuota"</ul>
<li>Descripción:
Esta función determina cuál es la próxima alícuota disponible para un stock de cepas. Busca la alícuota de menor numeración que aún no tenga registrada una fecha de reconstitución.</li>

<li>Objetivo:
Garantizar el uso ordenado de las alícuotas.</li>

<li>Tablas que usa:</li>
Tabla "CEPA_RESERVA": utiliza los campos NUMERO_ALICUOTA (para ordenar de menor a mayor) y FECHA_RECONSTITUCION (para verificar si ya fue utilizada).

Datos que devuelve:
El número de la próxima alícuota disponible (INT) o si no hay alicuotas creadas devuelve 1.</li>

<h2>Listado de Store procedures</h2>
<ul>Store procedure "agregar_cepa"</ul>
<li>Descripción:
Permite insertar una nueva cepa en la tabla CEPAS. Antes de insertar, verifica si ya existe una cepa con el mismo nombre para evitar duplicados. Devuelve un mensaje indicando si la cepa fue agregada correctamente o si ya existía.</li>

<li>Objetivo:
Poder agregar cepas y garantiza la integridad de los datos evitando duplicados.</li>

<li>Tablas que usa: "CEPAS"</li>

<ul>Store procedure "agregar_analista"</ul>
<li>Descripción:
Inserta un nuevo analista en la tabla ANALISTA_FIRMA. Antes de insertar, comprueba si ya existe un analista con ese nombre para prevenir duplicados. Devuelve un mensaje indicando si se agrego o ya existia.</li>

<li>Objetivo:
Poder agregar analistas y garantiza la integridad de los datos evitando duplicados.</li>

<li>Tablas que usa: "ANALISTA_FIRMA"</li>

<ul>Store procedure "agregar_prueba"</ul>
<li>Descripción:
Inserta un nuevo tipo de prueba en la tabla PRUEBAS_CEPAS. Antes de insertar, verifica si el tipo de prueba ya existe, evitando duplicados. Retorna un mensaje si se agrego o si ya existia.</li>

<li>Objetivo:
Poder agregar pruebas y garantizar la integridad de los datos evitando duplicados.</li>

<li>Tablas que usa: "PRUEBAS_CEPAS"</li>

<ul>Store procedure "borrar_cepa"</ul>
<li>Descripción:
Permite eliminar una cepa existente en la tabla CEPAS buscando por nombre. Antes de borrar, verifica si la cepa existe y devuelve un mensaje según corresponda.</li>

<li>Objetivo:
Facilita la eliminación segura de cepas evitando errores de eliminar registros completos.</li>

<li>Tablas que usa: "CEPAS"</li>

<ul>Store procedure "borrar_analista"</ul>
<li>Descripción:
Permite eliminar un analista de la tabla ANALISTA_FIRMA por nombre. Verifica previamente si el analista existe y devuelve un mensaje según corresponda.</li>

<li>Objetivo:
Facilita la eliminación segura de firmas de analistas evitando errores de eliminar registros completos.</li>

<li>Tablas que usa: "ANALISTA_FIRMA"</li>

<ul>Store procedure "borrar_prueba"</ul>
<li>Descripción:
Permite eliminar una prueba de la tabla PRUEBAS_CEPAS por nombre. Verifica previamente si la prueba existe y devuelve un mensaje según corresponda.</li>

<li>Objetivo:
Facilita la eliminación segura de pruebas evitando errores de eliminar registros completos.</li>

<li>Tablas que usa: "PRUEBAS_CEPAS"</li>

<h2>Listado de Triggers</h2>
<ul>Trigger "tr_insert_stock_cepas"</ul>
<li>Descripción: Registra en la tabla espejo STOCK_CEPAS_AUDITORIA toda nueva inserción realizada en STOCK_CEPAS.</li>

<li>Objetivo: Mantener un historial de las cepas ingresadas en stock, junto con usuario, fecha y detalle de la acción.</li>

<li>Tablas que usa: "STOCK_CEPAS" y realiza una accion de AFTER INSERT para que quede registrado en la tabla espejo luego de la insercion de datos</li>

<ul>Trigger "tr_delete_stock_cepas"</ul>
<li>Descripción: Registra en la tabla espejo STOCK_CEPAS_AUDITORIA los datos de una cepa de stock antes de ser eliminada.</li>

<li>Objetivo: Garantizar que antes de una eliminacion se tenga un registro de los datos que fueron eliminados para evitar pérdida de información relevante.</li>

<li>Tablas que usa: "STOCK_CEPAS" y realiza una accion de BEFORE DELETE para que quede registrado en la tabla espejo antes de la eliminación de datos</li>

<ul>Trigger "tr_insert_cepa_reserva"</ul>
<li>Descripción: Inserta en CEPA_RESERVA_AUDITORIA un registro con los datos de cada nueva reserva creada con usuario, fecha y detalle de la acción.</li>

<li>Objetivo: Mantener un historial de las cepas ingresadas en reserva, junto con usuario, fecha y detalle de la acción.</li>

<li>Tablas que usa: "CEPA_RESERVA" y realiza una accion de AFTER INSERT para que quede registrado en la tabla espejo despues de la inserción de los datos.</li>

<ul>Trigger "tr_delete_cepa_reserva"</ul>
<li>Descripción: Registra en la tabla espejo CEPA_RESERVA_AUDITORIA los datos de una cepa de stock antes de ser eliminada.</li>

<li>Objetivo: Garantizar que antes de una eliminacion se tenga un registro de los datos que fueron eliminados para evitar pérdida de información relevante para fines de auditoria y control.</li>

<li>Tablas que usa: "CEPA_RESERVA" y realiza una accion de BEFORE DELETE para que quede registrado en la tabla espejo antes de la eliminación de datos</li>

<ul>Trigger "tr_insert_cepa_trabajo"</ul>
<li>Descripción: Registra en la tabla espejo CEPA_TRABAJO_AUDITORIA los datos de una nueva cepa de trabajo al momento de ser creada, con usuario, fecha y acción.</li>

<li>Objetivo: Mantener un historial de las cepas ingresadas en trabajo, junto con usuario, fecha y detalle de la acción necesaria para cumplir con la normativa vigente.</li>

<li>Tablas que usa: "CEPA_TRABAJO" y realiza una accion de AFTER INSERT para que quede registrado en la tabla espejo luego de ser insertada.</li>

<ul>Trigger "tr_delete_cepa_trabajo"</ul>
<li>Descripción: Guarda en CEPA_TRABAJO_AUDITORIA los datos de una cepa de trabajo antes de que sea eliminada.</li>

<li>Objetivo: Mantener un historial de las cepas eliminadas en trabajo, junto con usuario, fecha y detalle de la acción necesaria para cumplir con la normativa vigente como asi tambien Evitar pérdida de información y proporcionar trazabilidad completa de los registros eliminados.</li>

<li>Tablas que usa: "CEPA_TRABAJO" y realiza una accion de BEFORE DELETE para que quede registrado en la tabla espejo antes de ser eliminada.</li>

<h2>Listado de Transacciones</h2>

<h2>Listado de tablas de hecho</h2>
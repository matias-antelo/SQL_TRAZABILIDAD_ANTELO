
<img src="FOTO/CODER_CURSO.png" alt="Texto alternativo" width="300"/>

---

<h3>Indice</h3>

- [Introducción](#Introducción)
- [Objetivos](#Objetivos)
- [Situación Problemática](#Situación-Problematica)
- [Modelo de Negocios](#Modelo-de-Negocios)
- [Listado de Tablas](#Listado-de-Tablas)
- [Listado de Vistas](#Listado-de-vistas)
- [Listado de triggers](#Listado-de-triggers)
- [Listado de funciones](#Listado-de-funciones)
- [Listado de Store procedures](#Listado-de-Store-procedures)

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

<li>Relaciones (CEPA_RESERVA 1:1 CEPA_TRABAJO; CEPA_TRABAJO 1:1 CEPA_TRABAJO; CEPA_TRABAJO n:1 ANALISTA_FIRMA; CEPA_TRABAJO n:1 ID_OBSERVACIONTRABAJO; CEPA_TRABAJO n:1 PRUEBAS_CEPAS):</li>

ID_TRABAJO_ORIGEN Usado como clave foránea recursiva en: CEPA_TRABAJO.

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

<h2>Listado de Triggers</h2>
<h2>Listado de funciones</h2>
<h2>Listado de Store procedures</h2>
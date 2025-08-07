
<img src="FOTO/CODER_CURSO.png" alt="Texto alternativo" width="300"/>

---

<h3>Indice</h3>

- [Introducción](#Introducción)
- [Objetivos](#Objetivos)
- [Situación Problemática](#Situación-Problematica)
- [Modelo de Negocios](#Modelo-de-Negocios)
- [Listado de Tablas](#Listado-de-Tablas)

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

<li>Relaciones (ANALISTA_FIRMA 1:n con STOCK_CEPAS, CEPA_RESERVA, CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5): </li>

ID_ANALISTA Usado como clave foránea en: STOCK_CEPAS, CEPA_RESERVA, CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5.

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

<li>Relaciones (PRUEBAS_CEPAS 1:n STOCK_CEPAS, CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5):</li>

ID_PRUEBAS Usado como clave foránea en: STOCK_CEPAS, CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5.

<ul>5. TABLA OBSERVACION_TRABAJO</ul>
<li>Descripción: Observaciones predefinidas al uso o baja de cepas.</li>

<li>Campos:</li>

ID_OBSERVACIONTRABAJO (INT, NOT NULL, AUTO_INCREMENT, PRIMARY KEY). Clave primaria.

DESCRIPCION (VARCHAR (200), NOT NULL, UNIQUE). descripcion de aceptacion o no.

<li>Relaciones (OBSERVACION_TRABAJO 1:n CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5):</li>

ID_OBSERVACIONTRABAJO Usado como clave foránea en: CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5.

<ul>6. TABLA STOCK_CEPAS</ul>
<li>Descripción: Tabla principal que registra la incorporación y datos principales de una cepa en stock.</li>

<li>Campos:</li>

ID_STOCK (VARCHAR(50), PRIMARY KEY, NOT NULL). Clave primaria.

FECHA_RECEPCION, FECHA_VTO, FECHA_RECONSTITUCION (DATE, NOT NULL)

ID_PRUEBAS (INT) Clave foránea a PRUEBAS_CEPAS.

RESULTADO, OBSERVACIONES (TEXT)

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

<li>Relaciones (CEPA_RESERVA 1:1 CEPA_TRABAJO2; CEPA_RESERVA n:1 ANALISTA_FIRMA; CEPA_RESERVA n:1 OBSERVAC_RESERVA; CEPA_RESERVA n:1 STOCK_CEPAS):</li>

ID_RESERVA Usado como clave foránea en: CEPA_TRABAJO2.


<ul>8. CEPA_TRABAJO2</ul>
<li>Descripción: Segunda etapa de uso de una cepa, derivada de reserva.</li>

<li>Campos:</li>

ID_TRABAJO2 (INT, PRIMARY KEY, UNIQUE, NOT NULL, AUTO_INCREMENT). Clave primaria

ID_RESERVA (INT). Clave foránea a CEPA_RESERVA.

FECHA_ACTIVACION, FECHA_BAJA (DATE, NOT NULL). 

ID_PRUEBAS (INT). Clave foránea a PRUEBAS_CEPAS.

RESULTADO (TEXT).

ID_OBSERVACIONTRABAJO (INT). Clave foránea a OBSERVACION_TRABAJO.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

<li>Relaciones (CEPA_RESERVA 1:1 CEPA_TRABAJO2; CEPA_TRABAJO3 1:1 CEPA_TRABAJO2; CEPA_TRABAJO2 n:1 ANALISTA_FIRMA; CEPA_TRABAJO2 n:1 ID_OBSERVACIONTRABAJO; CEPA_TRABAJO2 n:1 PRUEBAS_CEPAS):</li>

ID_TRABAJO2 Usado como clave foránea en: CEPA_TRABAJO3.

<ul>9. CEPA_TRABAJO3</ul>
<li>Descripción: tercer pasaje de la cepa, derivado de la cepa de trabajo 2.</li>

<li>Campos:</li>

ID_TRABAJO3 (INT, PRIMARY KEY, UNIQUE, NOT NULL, AUTO_INCREMENT) Clave primaria

ID_TRABAJO2 (INT) Clave foránea a CEPA_TRABAJO2

FECHA_ACTIVACION (DATE, NOT NULL)

ID_PRUEBAS (INT). Clave foránea a PRUEBAS_CEPAS.

RESULTADO (TEXT). Se ponen los resultados esperados de las pruebas bioquimicas

ID_OBSERVACIONTRABAJO (INT). Clave foránea a OBSERVACION_TRABAJO.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

FECHA_BAJA (DATE, NOT NULL). Fecha que se termina la vida util de este pasaje

<li>Relación (CEPA_TRABAJO2 1:1 CEPA_TRABAJO3; CEPA_TRABAJO3 1:1 CEPA_TRABAJO4; CEPA_TRABAJO3 n:1 ANALISTA_FIRMA; CEPA_TRABAJO3 n:1 ID_OBSERVACIONTRABAJO; CEPA_TRABAJO3 n:1 PRUEBAS_CEPAS):</li>

ID_TRABAJO3 Usado como clave foránea en: CEPA_TRABAJO4.

<ul>10. CEPA_TRABAJO4</ul>
<li>Descripción: cuarto pasaje de la cepa, derivado de la cepa de trabajo 3.</li>

<li>Campos:</li>

ID_TRABAJO4 (INT, PRIMARY KEY, UNIQUE, NOT NULL, AUTO_INCREMENT). CLave primaria

ID_TRABAJO3 (INT) Clave foránea a CEPA_TRABAJO3

FECHA_ACTIVACION (DATE, NOT NULL). 

ID_PRUEBAS (INT). Clave foránea a PRUEBAS_CEPAS.

RESULTADO (TEXT). Se ponen los resultados esperados de las pruebas bioquimicas

ID_OBSERVACIONTRABAJO (INT). Clave foránea a OBSERVACION_TRABAJO.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

FECHA_BAJA (DATE, NOT NULL). Fecha de baja final de este pasaje.

<li>Relación (CEPA_TRABAJO3 1:1 CEPA_TRABAJO4; CEPA_TRABAJO4 1:1 CEPA_TRABAJO5; CEPA_TRABAJO4 n:1 ANALISTA_FIRMA; CEPA_TRABAJO4 n:1 ID_OBSERVACIONTRABAJO; CEPA_TRABAJO4 n:1 PRUEBAS_CEPAS):</li>

ID_TRABAJO4 Usado como clave foránea en: CEPA_TRABAJO5.

<ul>11. CEPA_TRABAJO5</ul>
<li>Descripción: Quinto y último pasaje para uso de cepas, derivado de trabajo 4.</li>

<li>Campos:</li>
ID_TRABAJO5 (INT, PRIMARY KEY, UNIQUE, NOT NULL, AUTO_INCREMENT). Clave primaria

ID_TRABAJO4 (INT). Clave foránea a CEPA_TRABAJO4

FECHA_ACTIVACION (DATE, NOT NULL).

ID_PRUEBAS (INT). Clave foránea a PRUEBAS_CEPAS.

RESULTADO (TEXT). Se ponen los resultados esperados de las pruebas bioquimicas

ID_OBSERVACIONTRABAJO (INT). Clave foránea a OBSERVACION_TRABAJO.

ID_ANALISTA (INT). Clave foránea a ANALISTA_FIRMA.

FECHA_BAJA (DATE, NOT NULL). Fecha de baja final

<li>Relación (CEPA_TRABAJO4 1:1 CEPA_TRABAJO5; CEPA_TRABAJO5 n:1 ANALISTA_FIRMA; CEPA_TRABAJO5 n:1 ID_OBSERVACIONTRABAJO; CEPA_TRABAJO5 n:1 PRUEBAS_CEPAS):</li>
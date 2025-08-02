
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
<ul>1. CEPAS</ul>
<li>Descripción: Tabla base que contiene los microorganismos disponibles.</li>

<li>Campos:</li>

MOO_ID → INT, Clave primaria, autoincremental.

NOMBRE → VARCHAR(100), Único, nombre de la cepa.

<li>Relaciones:</li>

Se relaciona con STOCK_CEPAS mediante MOO_ID.

<ul>2. ANALISTA_FIRMA </ul>
<li>Descripción: Registro de los analistas autorizados para intervenir sobre las cepas.</li>

<li>Campos: </li>

ID_ANALISTA → INT, Clave primaria, autoincremental.

NOMBRE → VARCHAR(100), Único.

<li>Relaciones: </li>

Usado como clave foránea en: STOCK_CEPAS, CEPA_RESERVA, CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5.

<ul> 3. OBSERVAC_RESERVA</ul>
<li>Descripción: Observaciones posibles durante la reserva de cepas.</li>

<li>Campos:</li>

ID_OBSERVACION → INT, Clave primaria.

DESCRIPCION → VARCHAR(255), Único.

<li>Relaciones:</li>

Referenciada en CEPA_RESERVA mediante ID_OBSERVACION.

---

4. PRUEBAS_CEPAS
Descripción: Contiene los distintos tipos de pruebas bioquímicas posibles.

Campos:

ID_PRUEBAS → INT, Clave primaria.

TIPOS → VARCHAR(200), Único.

Relaciones:

Clave foránea en: STOCK_CEPAS, CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5.

5. OBSERVACION_TRABAJO
Descripción: Observaciones predefinidas aplicables al uso o baja de cepas.

Campos:

ID_OBSERVACIONTRABAJO → INT, Clave primaria.

DESCRIPCION → VARCHAR(200), Único.

Relaciones:

Clave foránea en: CEPA_TRABAJO2, CEPA_TRABAJO3, CEPA_TRABAJO4, CEPA_TRABAJO5.

6. STOCK_CEPAS
Descripción: Tabla central que registra la incorporación y datos principales de una cepa en stock.

Campos:

ID_STOCK → INT, Clave primaria.

FECHA_RECEPCION, FECHA_VTO, FECHA_RECONSTITUCION → DATE.

ID_PRUEBAS → INT, Clave foránea a PRUEBAS_CEPAS.

RESULTADO, OBSERVACIONES → TEXT.

ID_ANALISTA → INT, Clave foránea a ANALISTA_FIRMA.

MOO_ID → INT, Clave foránea a CEPAS.

NUMERO_ID → VARCHAR(50).

Relaciones:

Claves foráneas a: ANALISTA_FIRMA, PRUEBAS_CEPAS, CEPAS.

Es referenciada por: CEPA_RESERVA.

7. CEPA_RESERVA
Descripción: Tabla que registra las alícuotas reservadas desde el stock.

Campos:

ID_RESERVA → INT, Clave primaria.

ID_STOCK → INT, Clave foránea a STOCK_CEPAS.

NUMERO_ALICUOTA → VARCHAR(10).

FECHA_RECONSTITUCION → DATE.

ID_OBSERVACION → INT, Clave foránea a OBSERVAC_RESERVA.

ID_ANALISTA → INT, Clave foránea a ANALISTA_FIRMA.

Relaciones:

Relacionada con: STOCK_CEPAS, OBSERVAC_RESERVA, ANALISTA_FIRMA.

Es referenciada por: CEPA_TRABAJO2.

8. CEPA_TRABAJO2
Descripción: Segunda etapa de uso de una cepa, derivada de reserva.

Campos:

ID_TRABAJO2 → INT, Clave primaria.

ID_RESERVA → INT, Clave foránea a CEPA_RESERVA.

FECHA_ACTIVACION, FECHA_BAJA → DATE.

ID_PRUEBAS → INT, Clave foránea a PRUEBAS_CEPAS.

RESULTADO → TEXT.

ID_OBSERVACIONTRABAJO → INT, Clave foránea a OBSERVACION_TRABAJO.

ID_ANALISTA → INT, Clave foránea a ANALISTA_FIRMA.

Relaciones:

Es referenciada por: CEPA_TRABAJO3.

9. CEPA_TRABAJO3
Descripción: Tercer ciclo de uso de una cepa, derivado de trabajo 2.

Campos similares a CEPA_TRABAJO2

Relación:

Clave foránea a CEPA_TRABAJO2.

10. CEPA_TRABAJO4
Descripción: Cuarto ciclo de uso de una cepa, derivado de trabajo 3.

Relación:

Clave foránea a CEPA_TRABAJO3.

11. CEPA_TRABAJO5
Descripción: Quinto y último ciclo previsto para uso de cepas, derivado de trabajo 4.

Relación:

Clave foránea a CEPA_TRABAJO4.


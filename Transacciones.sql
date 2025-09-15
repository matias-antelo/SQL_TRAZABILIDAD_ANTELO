USE `trazabilidad+Antelo`;

-- TRANSACCIONES
START TRANSACTION;
SET FOREIGN_KEY_CHECKS = 0;
-- Inserto primer equipo
INSERT INTO EQUIPOS (MARCA, FECHA_CALIBRACION, VTO_CALIBRACION)
VALUES ('Sanyo', '2029-01-10', '2026-01-10');
SAVEPOINT sp1;
-- Inserto segundo equipo
INSERT INTO EQUIPOS (MARCA, FECHA_CALIBRACION, VTO_CALIBRACION)
VALUES ('Binder', '2027-02-05', '2026-02-05');
-- decido deshacer el segundo insert
SET FOREIGN_KEY_CHECKS = 1;
ROLLBACK TO sp1;
-- Confirmo la transacción
COMMIT;

-- Iniciamos una nueva transacción.
-- Utilizamos la sentencia "INSERT INTO" para agregar registros a la tabla "EQUIPOS". 
-- Agregamos un savepoint sp1 luego de la insercion del primer equipo.
-- Utilizamos la sentencia "INSERT INTO" nuevamente para agregar otro equipo.
-- se utiliza el ROLLBACK para volver al punto sp1.
-- se realiza el COMMIT para confirmar la transaccion.

START TRANSACTION;
SET FOREIGN_KEY_CHECKS = 0;
-- Inserto ciclo de esterilización.
INSERT INTO ESTERILIZACION (ID_EQUIPO, FECHA, TIEMPO, TEMPERATURA, ID_ANALISTA)
VALUES (1, '2028-03-01', 45, 121, 1);
SAVEPOINT sp2;
-- Inserto otro ciclo de esterilización.
INSERT INTO ESTERILIZACION (ID_EQUIPO, FECHA, TIEMPO, TEMPERATURA, ID_ANALISTA)
VALUES (1, '2029-03-05', 50, 123, 2);
SET FOREIGN_KEY_CHECKS = 1;
-- Decido cancelar todo.
ROLLBACK;

COMMIT;

-- Iniciamos una nueva transacción.
-- Utilizamos la sentencia "INSERT INTO" para agregar registros a la tabla "ESTERILIZACION". 
-- Agregamos un savepoint sp2 luego de la insercion del primer ciclo.
-- Utilizamos la sentencia "INSERT INTO" nuevamente para agregar otro ciclo.
-- En este caso se utiliza el ROLLBACK que nada se guarda en la tabla.
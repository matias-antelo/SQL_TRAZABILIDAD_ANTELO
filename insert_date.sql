USE `trazabilidad+Antelo`;


-- insercion de datos en CEPAS 
INSERT INTO CEPAS (NOMBRE)
VALUES
    ('Salmonella'),
    ('E. coli'),
    ('Listeria monocytogenes'),
    ('Pseudomonas aeruginosa'),
    ('Staphylococcus aureus');

-- insercion de datos en ANALISTA_FIRMA 
INSERT INTO ANALISTA_FIRMA (NOMBRE)
VALUES
    ('MA'),
    ('GR'),
    ('JM'),
    ('IB');

-- insercion de datos en OBSERVAC_RESERVA
INSERT INTO OBSERVACION_RESERVA (DESCRIPCION)
VALUES
    ('Sin crecimiento'),
    ('Descarte'),
    ('Contaminación');

-- insercion de datos en PRUEBAS_CEPAS
INSERT INTO PRUEBAS_CEPAS (TIPOS)
VALUES
    ('Pruebas bioquímicas'),
    ('API WEB'),
    ('PCR'),
    ('MALDI-TOF'),
    ('Prueba confirmatoria');

-- insercion de datos en OBSERVACION_TRABAJO
INSERT INTO OBSERVACION_TRABAJO (DESCRIPCION)
VALUES
    ('Sin crecimiento'),
    ('Descarte por contaminación'),
    ('Descarte'),
    ('Ok');

-- insercion de datos en STOCK_CEPAS
INSERT INTO STOCK_CEPAS (MOO_ID, NUMERACION, FECHA_RECEPCION, FECHA_VTO, FECHA_RECONSTITUCION, ID_PRUEBAS, RESULTADO, OBSERVACIONES, ID_ANALISTA)
VALUES
(1, 1, '2024-06-15', '2025-06-15', '2025-02-01', 1, 'TSI positivos, urea negativo, LIA positivo', 'Reconstitución según protocolo estándar', 1),
(1, 2, '2024-07-10', '2025-07-10', NULL, NULL, NULL, NULL, NULL),
(1, 3, '2024-08-05', '2025-08-05', NULL, NULL, NULL, NULL, NULL),
(2, 1, '2024-06-20', '2025-06-20', '2025-03-01', 2, 'TSI negativos, urea positivo', 'Reconstitución según protocolo estándar', 2),
(2, 2, '2024-07-12', '2025-07-12', NULL, NULL, NULL, NULL, NULL),
(3, 1, '2024-06-25', '2025-06-25', '2025-02-15', 3, 'Crecimiento positivo en agar selective', 'Reconstitución según protocolo estándar', 3),
(3, 2, '2024-07-20', '2025-07-20', NULL, NULL, NULL, NULL, NULL),
(3, 3, '2024-08-10', '2025-08-10', NULL, NULL, NULL, NULL, NULL),
(4, 1, '2024-07-01', '2025-07-01', '2025-03-05', 4, 'Crecimiento rápido en agar Pseudomonas', 'Reconstitución según protocolo estándar', 4),
(5, 1, '2024-06-18', '2025-06-18', '2025-02-10', 5, 'Crecimiento positivo, coagulasa positivo', 'Reconstitución según protocolo estándar', 1),
(5, 2, '2024-07-15', '2025-07-15', NULL, NULL, NULL, NULL, NULL),
(5, 3, '2024-08-12', '2025-08-12', NULL, NULL, NULL, NULL, NULL);

-- insercion de datos en CEPAS_RESERVA
INSERT INTO CEPA_RESERVA (ID_STOCK, NUMERO_ALICUOTA, FECHA_RECONSTITUCION, ID_OBSERVACION, ID_ANALISTA)
VALUES
(1, '1', '2025-02-01', 1, 1),
(1, '2', NULL, NULL, NULL),
(1, '3', NULL, NULL, NULL),
(1, '4', NULL, NULL, NULL),
(1, '5', NULL, NULL, NULL),
(4, '1', '2025-03-01', 2, 2),
(4, '2', NULL, NULL, NULL),
(4, '3', NULL, NULL, NULL),
(4, '4', NULL, NULL, NULL),
(4, '5', NULL, NULL, NULL),
(6, '1', '2025-02-15', 3, 3),
(6, '2', NULL, NULL, NULL),
(6, '3', NULL, NULL, NULL),
(6, '4', NULL, NULL, NULL),
(6, '5', NULL, NULL, NULL),
(9, '1', '2025-03-05', 1, 4),
(9, '2', NULL, NULL, NULL),
(9, '3', NULL, NULL, NULL),
(9, '4', NULL, NULL, NULL),
(9, '5', NULL, NULL, NULL),
(10, '1', '2025-02-10', 2, 1),
(10, '2', NULL, NULL, NULL),
(10, '3', NULL, NULL, NULL),
(10, '4', NULL, NULL, NULL),
(10, '5', NULL, NULL, NULL);

-- insercion de datos en CEPAS_TRABAJO
-- CEPA_TRABAJO Nivel 2
INSERT INTO CEPA_TRABAJO (NIVEL, ID_RESERVA_ORIGEN, FECHA_ACTIVACION, ID_PRUEBAS, RESULTADO, ID_OBSERVACIONTRABAJO, ID_ANALISTA)
VALUES
(2, 1, '2025-02-15', 1, 'TSI y urea positivos', 1, 1),
(2, 6, '2025-03-10', 2, 'API WEB OK', 2, 2),
(2, 11, '2025-02-20', 3, 'Crecimiento en agar selective', 3, 3),
(2, 16, '2025-03-15', 1, 'Crecimiento rápido en agar Pseudomonas', 1, 4),
(2, 21, '2025-02-18', 2, 'Coagulasa positivo', 2, 1);

-- CEPA_TRABAJO Nivel 3
INSERT INTO CEPA_TRABAJO (NIVEL, ID_TRABAJO_ORIGEN, FECHA_ACTIVACION, ID_PRUEBAS, RESULTADO, ID_OBSERVACIONTRABAJO, ID_ANALISTA)
VALUES
(3, 1, '2025-03-01', 1, 'TSI y urea positivos confirmados', 1, 2),
(3, 2, '2025-03-15', 2, 'API WEB OK', 2, 3),
(3, 3, '2025-03-05', 3, 'Crecimiento consistente', 3, 1),
(3, 4, '2025-03-25', 1, 'Crecimiento rápido confirmado', 1, 4),
(3, 5, '2025-03-10', 2, 'Coagulasa confirmado', 2, 2);

-- CEPA_TRABAJO Nivel 4
INSERT INTO CEPA_TRABAJO 
(NIVEL, ID_TRABAJO_ORIGEN, FECHA_ACTIVACION, ID_PRUEBAS, RESULTADO, ID_OBSERVACIONTRABAJO, ID_ANALISTA, FECHA_BAJA)
VALUES
(4, 6, '2025-03-20', 1, 'TSI y urea positivos repetidos', 1, 3, '2025-12-31'),
(4, 7, '2025-04-01', 2, 'API WEB OK confirmado', 2, 4, '2025-12-31'),
(4, 8, '2025-03-25', 3, 'Crecimiento estable', 3, 2, '2025-12-31'),
(4, 9, '2025-04-05', 1, 'Crecimiento rápido OK', 1, 1, '2025-12-31'),
(4, 10, '2025-03-28', 2, 'Coagulasa positivo repetido', 2, 3, '2025-12-31');

-- Insercion en medios de cultivo STOCK
INSERT INTO MEDIO_CULTIVO_STOCK (NOMBRE, FABRICANTE, LOTE, VENCIMIENTO)
VALUES
('Agar MacConkey', 'Oxoid', 'MC-2025', '2026-01-15'),
('Agar Nutriente', 'Merck', 'AN-4578', '2026-03-20'),
('Agar Sangre', 'Biokar', 'AS-3350', '2025-12-10'),
('Caldo Lactosado', 'Oxoid', 'CL-9987', '2026-05-30');

-- registro de stock y control de calibraciones de equipos
INSERT INTO EQUIPOS (MARCA, FECHA_CALIBRACION, VTO_CALIBRACION)
VALUES
('Autoclave Raypa', '2025-01-10', '2026-01-10'),
('Balanza Ohaus', '2025-02-05', '2026-02-05'),
('Incubadora Memmert', '2025-03-01', '2026-03-01');

-- registro de ciclo de esterilizacion
INSERT INTO ESTERILIZACION (ID_EQUIPO, FECHA, TIEMPO, TEMPERATURA, ID_ANALISTA)
VALUES
(1, '2025-02-01', 30, 121, 1),
(1, '2025-02-15', 35, 121, 2),
(1, '2025-03-01', 30, 121, 3);

-- insercion para control de calidad de equipos
INSERT INTO AUTOCLAVE_VERIF (ID_EQUIPO, FECHA, LECTURA_1, LECTURA_2, CUMPLE, ID_ANALISTA)
VALUES
(1, '2025-02-01', 121.0, 121.2, TRUE, 1),
(1, '2025-02-15', 120.8, 121.1, TRUE, 2),
(1, '2025-03-01', 119.5, 121.0, FALSE, 3);

-- control de calidad de agua destilada 
INSERT INTO AGUA_DEST (FECHA_ENTRADA, CONTROL, ID_ANALISTA)
VALUES
('2025-01-20', 'Conductividad < 1 µS/cm', 1),
('2025-02-10', 'pH dentro de rango', 2),
('2025-03-05', 'Libre de contaminantes', 3);

-- insercion para control de calidad de medios
INSERT INTO ECOMETRICO (FECHA, ICA, ICE, RESULTADO)
VALUES
('2025-02-01', 95, 98, 'Aceptado'),
('2025-02-15', 90, 96, 'Aceptado'),
('2025-03-01', 80, 85, 'Rechazado');

-- INSERCION para preparacion de Medios de cultivo
INSERT INTO PREPARACION_MEDIO_CULTIVO 
(ID_MEDIO, FECHA_PREPARACION, ID_ECOMETRICO, ID_AGUA, ID_ANALISTA, PH, OBSERVACIONES, ID_CICLO)
VALUES
(1, '2025-02-02', 1, 1, 1, 7, 'Preparación estándar de MacConkey', 1),
(2, '2025-02-16', 2, 2, 2, 7, 'Preparación de Agar Nutriente', 2),
(3, '2025-03-02', 3, 3, 3, 6, 'Preparación de Agar Sangre - lote crítico', 3);


-- CEPA_TRABAJO Nivel 2 (incluye ID_PREPARACION)
INSERT INTO CEPA_TRABAJO 
(NIVEL, ID_RESERVA_ORIGEN, FECHA_ACTIVACION, ID_PRUEBAS, RESULTADO, 
 ID_OBSERVACIONTRABAJO, ID_ANALISTA, ID_PREPARACION)
VALUES
(2, 1,  '2025-02-15', 1, 'TSI y urea positivos', 1, 1, 1),
(2, 6,  '2025-03-10', 2, 'API WEB OK', 2, 2, 2),
(2, 11, '2025-02-20', 3, 'Crecimiento en agar selectivo', 3, 3, 3),
(2, 16, '2025-03-15', 1, 'Crecimiento rápido en agar Pseudomonas', 1, 4, 1),
(2, 21, '2025-02-18', 2, 'Coagulasa positivo', 2, 1, 2);

-- CEPA_TRABAJO Nivel 3 (incluye ID_PREPARACION)
INSERT INTO CEPA_TRABAJO 
(NIVEL, ID_TRABAJO_ORIGEN, FECHA_ACTIVACION, ID_PRUEBAS, RESULTADO, 
 ID_OBSERVACIONTRABAJO, ID_ANALISTA, ID_PREPARACION)
VALUES
(3, 1,  '2025-03-01', 1, 'TSI y urea positivos confirmados', 1, 2, 1),
(3, 2,  '2025-03-15', 2, 'API WEB OK confirmado', 2, 3, 2),
(3, 3,  '2025-03-05', 3, 'Crecimiento consistente', 3, 1, 3),
(3, 4,  '2025-03-25', 1, 'Crecimiento rápido confirmado', 1, 4, 1),
(3, 5,  '2025-03-10', 2, 'Coagulasa confirmado', 2, 2, 2);

-- CEPA_TRABAJO Nivel 4 (incluye ID_PREPARACION)
INSERT INTO CEPA_TRABAJO 
(NIVEL, ID_TRABAJO_ORIGEN, FECHA_ACTIVACION, ID_PRUEBAS, RESULTADO, 
 ID_OBSERVACIONTRABAJO, ID_ANALISTA, FECHA_BAJA, ID_PREPARACION)
VALUES
(4, 6,  '2025-03-20', 1, 'TSI y urea positivos repetidos', 1, 3, '2025-12-31', 1),
(4, 7,  '2025-04-01', 2, 'API WEB OK confirmado', 2, 4, '2025-12-31', 2),
(4, 8,  '2025-03-25', 3, 'Crecimiento estable', 3, 2, '2025-12-31', 3),
(4, 9,  '2025-04-05', 1, 'Crecimiento rápido OK', 1, 1, '2025-12-31', 1),
(4, 10, '2025-03-28', 2, 'Coagulasa positivo repetido', 2, 3, '2025-12-31', 2);
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
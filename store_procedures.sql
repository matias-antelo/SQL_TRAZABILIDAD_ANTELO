-- STORE PROCEDURES
-- Procedimiento para agregar una nueva cepa
DELIMITER //

CREATE PROCEDURE agregar_cepa(
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si ya existe una cepa con ese nombre
    SELECT COUNT(*) INTO v_existente
    FROM CEPAS
    WHERE NOMBRE = p_nombre;

    IF v_existente = 0 THEN
        -- Insertar la nueva cepa
        INSERT INTO CEPAS (NOMBRE)
        VALUES (p_nombre);
        SELECT 'Cepa agregada correctamente' AS mensaje;
    ELSE
        SELECT 'La cepa ya existe' AS mensaje;
    END IF;
END //

DELIMITER ;

-- Procedimiento para agregar un nuevo analista
DELIMITER //

CREATE PROCEDURE agregar_analista(
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si ya existe un analista con ese nombre
    SELECT COUNT(*) INTO v_existente
    FROM ANALISTA_FIRMA
    WHERE NOMBRE = p_nombre;

    IF v_existente = 0 THEN
        -- Insertar el nuevo analista
        INSERT INTO ANALISTA_FIRMA (NOMBRE)
        VALUES (p_nombre);
        SELECT 'Analista agregado correctamente' AS mensaje;
    ELSE
        SELECT 'El analista ya existe' AS mensaje;
    END IF;
END //

DELIMITER ;

-- Procedimiento para agregar una nueva prueba
DELIMITER //

CREATE PROCEDURE agregar_prueba(
    IN p_tipo VARCHAR(200)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si ya existe una prueba con ese tipo
    SELECT COUNT(*) INTO v_existente
    FROM PRUEBAS_CEPAS
    WHERE TIPOS = p_tipo;

    IF v_existente = 0 THEN
        -- Insertar la nueva prueba
        INSERT INTO PRUEBAS_CEPAS (TIPOS)
        VALUES (p_tipo);
        SELECT 'Prueba agregada correctamente' AS mensaje;
    ELSE
        SELECT 'La prueba ya existe' AS mensaje;
    END IF;
END //

DELIMITER ;

-- Procedimiento para borrar una cepa
DELIMITER //

CREATE PROCEDURE borrar_cepa(
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si existe la cepa
    SELECT COUNT(*) INTO v_existente
    FROM CEPAS
    WHERE NOMBRE = p_nombre;

    IF v_existente > 0 THEN
        DELETE FROM CEPAS
        WHERE NOMBRE = p_nombre;
        SELECT 'Cepa eliminada correctamente' AS mensaje;
    ELSE
        SELECT 'La cepa no existe en la base de datos' AS mensaje;
    END IF;
END //

DELIMITER ;

-- Procedimiento para borrar un analista
DELIMITER //

CREATE PROCEDURE borrar_analista(
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si existe el analista
    SELECT COUNT(*) INTO v_existente
    FROM ANALISTA_FIRMA
    WHERE NOMBRE = p_nombre;

    IF v_existente > 0 THEN
        DELETE FROM ANALISTA_FIRMA
        WHERE NOMBRE = p_nombre;
        SELECT 'Analista eliminado correctamente' AS mensaje;
    ELSE
        SELECT 'El analista no existe en la base de datos' AS mensaje;
    END IF;
END //

DELIMITER ;

-- Procedimiento para borrar una prueba
DELIMITER //

CREATE PROCEDURE borrar_prueba(
    IN p_tipo VARCHAR(200)
)
BEGIN
    DECLARE v_existente INT;

    -- Verificar si existe la prueba
    SELECT COUNT(*) INTO v_existente
    FROM PRUEBAS_CEPAS
    WHERE TIPOS = p_tipo;

    IF v_existente > 0 THEN
        DELETE FROM PRUEBAS_CEPAS
        WHERE TIPOS = p_tipo;
        SELECT 'Prueba eliminada correctamente' AS mensaje;
    ELSE
        SELECT 'La prueba no existe en la base de datos' AS mensaje;
    END IF;
END //

DELIMITER ;
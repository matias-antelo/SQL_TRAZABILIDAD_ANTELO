-- FUNCIONES
-- Función para calcular los días hasta el vencimiento de un stock de cepas

DELIMITER //
CREATE FUNCTION dias_hasta_vencimiento(p_id_stock INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE v_fecha_vto DATE;
    DECLARE v_dias INT;
    DECLARE v_resultado VARCHAR(50);

    SELECT FECHA_VTO INTO v_fecha_vto
    FROM STOCK_CEPAS
    WHERE ID_STOCK = p_id_stock;

    SET v_dias = DATEDIFF(v_fecha_vto, CURDATE());

    IF v_dias > 0 THEN
        SET v_resultado = CONCAT(v_dias, ' días restantes');
    ELSE
        SET v_resultado = 'vencida';
    END IF;

    RETURN v_resultado;
END //
DELIMITER ;

-- Función para obtener la próxima alícuota disponible para una cepa en reserva
DELIMITER //
CREATE FUNCTION proxima_alicuota(p_id_stock INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_num INT;

    SELECT NUMERO_ALICUOTA
    INTO v_num
    FROM CEPA_RESERVA
    WHERE ID_STOCK = p_id_stock
      AND FECHA_RECONSTITUCION IS NULL
    ORDER BY NUMERO_ALICUOTA ASC
    LIMIT 1;

    IF v_num IS NULL THEN
        RETURN 1;
    END IF;

    RETURN v_num;
END //
DELIMITER ;
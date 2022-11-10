DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE s VARCHAR(400) DEFAULT '';

    WHILE i < 4 DO
        SET s = CONCAT(s, 'i=', i, ' | ');
        SET i = i + 1;
    END WHILE;

    SELECT s AS message;

END //

DELIMITER ;
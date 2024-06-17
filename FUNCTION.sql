DELIMITER //

CREATE FUNCTION calculate_total_cost(rate_value FLOAT, hours_value FLOAT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_cost FLOAT;
    SET total_cost = rate_value * hours_value;
    RETURN total_cost;
END//

DELIMITER ;

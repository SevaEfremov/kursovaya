DELIMITER $$

CREATE PROCEDURE CreateNewReservation(
    IN p_date_to DATETIME,
    IN p_date_after DATETIME,
    IN p_user_id INT,
    IN p_admin_id INT,
    IN p_comp_name VARCHAR(255),
    IN p_comp_rate ENUM('vip', 'general', 'bootcamp'),
    IN p_comp_description TEXT,
    IN p_comp_cost FLOAT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Error handling: rollback the transaction in case of an error
        ROLLBACK;
        -- Signal an error to the calling application
        RESIGNAL;
    END;
    
    -- Start transaction
    START TRANSACTION;

    -- Insert into reservation table
    INSERT INTO `mydb`.`reservation` (`date_to`, `date_after`, `user_id`, `admin_id`)
    VALUES (p_date_to, p_date_after, p_user_id, p_admin_id);
    
    -- Get the last inserted ID from the reservation table
    SET @last_reservation_id = LAST_INSERT_ID();
    
    -- Insert into compucter table
    INSERT INTO `mydb`.`compucter` (`name`, `rate`, `description`, `cost`, `reservation_id`)
    VALUES (p_comp_name, p_comp_rate, p_comp_description, p_comp_cost, @last_reservation_id);

    -- Commit the transaction
    COMMIT;
END $$

DELIMITER ;
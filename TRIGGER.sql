DELIMITER $$

CREATE TRIGGER trg_delete_last_passport
BEFORE INSERT ON pasport
FOR EACH ROW
BEGIN
    DECLARE passport_count INT;
    DECLARE admin_id INT;

    SELECT COUNT(*) INTO passport_count FROM pasport WHERE admin_id = NEW.admin_id;

    IF passport_count > 1 THEN
        DELETE FROM pasport WHERE admin_id = NEW.admin_id ORDER BY id DESC LIMIT 1;
    END IF;
END$$

DELIMITER ;

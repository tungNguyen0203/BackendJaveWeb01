-- insert date < now()
SET GLOBAL log_bin_trust_function_creators = 1;
DROP TRIGGER IF EXISTS insert_order_date;
DELIMITER $$
	CREATE TRIGGER insert_order_date
    BEFORE INSERT ON `car_order`
    FOR EACH ROW
    BEGIN
		IF(NEW.order_date > NOW()) THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'ngay nhap khong dung';
        END IF;
    END $$
DELIMITER ;

-- Dùng để đóng gói
-- fruction có thể mang đi để sử dụng
-- store nó giống trả ra void trong các nn khác
-- store có thể insert update .....
-- delimiter là đổi dấu kết thúc câu lệnh đổi từ ; sang $$

-- Exercise 1: Function
-- 1.Tạo function có đầu vào là department_id và return ra level của department Level sẽ được tính như sau
--  Nếu tổng số account trong department = 0 thì return ra 'No account'
--  Nếu tổng số account trong department < 3 thì return ra 'Small'
--  Nếu tổng số account trong department < 3 thì return ra 'Large'
-- Viết câu Select để test
SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
	CREATE FUNCTION department_account(in_id_department INT) RETURNS TEXT
		BEGIN
			DECLARE department_level TEXT;
            DECLARE account_count INT;
        
			SELECT COUNT(1) INTO account_count
            FROM `account`
            WHERE department_id = in_id_department;
            
            IF account_count = 0 THEN
				SET department_level = 'No account';
			ELSEIF account_count < 3 THEN
				SET department_level = 'Small';
			ELSE
				SET department_level = 'Large';
			END IF;
            
            RETURN department_level;
            
		END $$
DELIMITER ;

SELECT *, department_account(id)
FROM department;

-- 2.Tạo function có đầu vào là question_id và return ra tổng số answer của question đó
-- Viết câu Select để test
DROP FUNCTION IF EXISTS get_answer;
DELIMITER $$
	CREATE FUNCTION get_answer(in_id_question INT) RETURNS INT
		BEGIN
			DECLARE answer_count INT;
        
			SELECT COUNT(1) INTO answer_count
            FROM answer a
            WHERE a.question_id = in_id_question;
            
            RETURN answer_count;
		END $$
DELIMITER ;

SELECT id, get_answer(id)
FROM question;

-- 3 dùng concat
-- 3. Tạo function có đầu vào là created_date và return ra text có dạng DD-MM-YYYY'
-- Viết câu Select để test
DROP FUNCTION IF EXISTS format_date;
DELIMITER $$
	CREATE FUNCTION format_date(in_date DATETIME) RETURNS TEXT
		BEGIN
			DECLARE format_date TEXT;
        
			SELECT CONCAT(DAY(in_date), '-', MONTH(in_date), '-', YEAR(in_date)) INTO format_date;
           
            RETURN format_date;
        END $$
DELIMITER ;

SELECT format_date(created_date)
FROM `account`;
-- 4. Tạo function có đầu vào là email và return ra domain (VD: email là duynn03@gmail.com thì return ra gmail.com
-- Viết câu Select để test
DROP FUNCTION IF EXISTS format_email;
DELIMITER $$
	CREATE FUNCTION format_email(in_email TEXT) RETURNS TEXT
		BEGIN
			DECLARE format_email TEXT;
        
			SELECT SUBSTRING_INDEX(in_email, '@', -1) INTO format_email;
           
            RETURN format_email;
        END $$
DELIMITER ;

SELECT *, format_email(email)
FROM `account`;


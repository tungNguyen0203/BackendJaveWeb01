-- Exercise 2: Store Procedure
-- 1. Tạo procedure để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
-- DELIMITER $$ -- dấu phân cách 
DROP PROCEDURE IF EXISTS print_account;
DELIMITER $$
CREATE PROCEDURE print_account(IN insert_name_department TEXT)
BEGIN
   /*Xu ly*/
   
		SELECT a.fullname, d.`name` AS department_name
        FROM `account` a
        JOIN department d ON d.id = a.department_id
        WHERE d.`name` = insert_name_department;
	END; $$
DELIMITER ;

call print_account('Sale');
-- 2. Tạo procedure để người dùng nhập vào tên phòng ban và vị trí, sau đó in ra tất cả các account thuộc phòng ban đó và vị trí tương ứng
DROP PROCEDURE IF EXISTS print_account_02;  
DELIMITER $$
CREATE PROCEDURE print_account_02(IN insert_name_department TEXT, IN insert_name_position TEXT)
	BEGIN
		SELECT a.id, a.fullname, d.`name` AS department_name, p.`name` AS position_name
        FROM `account` a
        JOIN department d ON d.id = a.department_id
        JOIN position p ON p.id = a.position_id
        WHERE d.`name` = insert_name_department AND p.`name` = insert_name_position;
	END; $$
DELIMITER ;

call print_account_02('HR', 'Test');
		
-- 3. Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS print_account_in_group;
DELIMITER $$
CREATE PROCEDURE print_account_in_group()
	BEGIN
		SELECT g.id, COUNT(account_id) AS count_account
		FROM group_account ga
		RIGHT JOIN `group` g ON g.id = ga.account_id
		GROUP BY g.id;
	END; $$
DELIMITER ;

CALL print_account_in_group; 

-- 4. Viết 1 procedure cho phép người dùng nhập vào thông tin fullName, email, department name và 
-- trong procedure sẽ tự động insert account với yêu cầu như sau:
--  username sẽ giống email nhưng bỏ phần @..mail đi
-- VD: email = duynn03@gmail.com  username sẽ là duynn03
--  position = developer
--  created_date = now()
-- Sau đó in ra kết quả tạo thành công

-- SELECT .... INTO .... GẮN VÀO BIẾN
-- DECLARE TẠO RA BIẾN ĐỂ LUW CÁC GIÁ TRỊ(GIỐNG NHƯ KHIA BÁO BIẾN)

DELIMITER $$
-- DROP PROCEDURE IF EXISTS insert_account;   
CREATE PROCEDURE insert_account(IN in_fullname TEXT, IN in_email TEXT, IN in_name_department TEXT)
	BEGIN
		DECLARE insert_username  VARCHAR(100);
		DECLARE insert_id_department SMALLINT;
        DECLARE insert_id_position SMALLINT;
         
 		SELECT SUBSTRING_INDEX(in_email, '@', 1) INTO insert_username;
         
        INSERT INTO department	(`name`)
        VALUES					(in_name_department);
		
		SELECT MAX(id) INTO insert_id_department 
		FROM department
        WHERE `name` = in_name_department;
         
         SELECT id INTO insert_id_position
         FROM position
         WHERE `name` = 'Dev';
         
		INSERT INTO  `account`  (	email, 		username, 			fullname, 		department_id,			position_id,		created_date	)
 		VALUES
							(in_email,		insert_username,	in_fullname,		insert_id_department,	insert_id_position,			NOW()			);

	END; $$
DELIMITER ;

call testing_system.insert_account('NguyenXuanTung', 'turngnx@gmail.com', 'newdpartment');

-- 5. Không sử dụng ON DELETE CASCADE, hãy viết 1 procedure cho phép người dùng xóa exam dựa vào ID
-- Gợi ý: viết nhiều câu delete trong procedure (VD: delete exam_question, delete exam,...)
DROP PROCEDURE IF EXISTS delete_exam;   
DELIMITER $$
CREATE PROCEDURE delete_exam(IN insert_id_exam INT)
	BEGIN
		DELETE 
        FROM exam
        WHERE id = insert_id_exam;
        
        DELETE 
        FROM exam_question
        WHERE exam_id = insert_id_exam;
        
	END; $$
DELIMITER ;

CALL testing_system.delete_exam(1);

-- 6. Viết store cho phép người dùng nhập vào tên phòng ban để xóa phòng ban đó với yêu cầu các account thuộc phòng ban đó sẽ được chuyển về phòng ban "Sale"
DROP PROCEDURE IF EXISTS delete_department;   
DELIMITER $$
CREATE PROCEDURE delete_department(IN insert_name_department TEXT)
	BEGIN
		DECLARE id_department SMALLINT;
		DECLARE id_Sale SMALLINT;
        
		SELECT id INTO id_department
        FROM department
        WHERE `name` = insert_name_department;
       
		SELECT id INTO id_Sale
        FROM department
        WHERE `name` = 'Sale';
        
        UPDATE `account`
        SET department_id = id_Sale
        WHERE department_id = id_department;
        
        DELETE 
        FROM department
        WHERE `name` = insert_name_department;
        
	END; $$
DELIMITER ;

CALL testing_system.delete_department('Sercurity');

-- 7. Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm 2019, 2020, 2021,2022 
-- (Nếu tháng nào không có thì sẽ in ra 0)

-- tạo ra 1 bảng có đủ 12 tháng để join vào đếm
DROP PROCEDURE IF EXISTS check_account;
DELIMITER $$
	CREATE PROCEDURE check_account()
		BEGIN
			WITH month_all AS (
				SELECT 1 AS `month`
				UNION
				SELECT 2 AS `month`
				UNION
				SELECT 3 AS `month`
				UNION
				SELECT 4 AS `month`
				UNION
				SELECT 5 AS `month`
				UNION
				SELECT 6 AS `month`
				UNION
				SELECT 7 AS `month`
				UNION
				SELECT 8 AS `month`
				UNION
				SELECT 9 AS `month`
				UNION
				SELECT 10 AS `month`
				UNION
				SELECT 11 AS `month`
				UNION
				SELECT 12 AS `month`
			),

			year_ AS (
				SELECT 2019 AS `year`
				UNION
				SELECT 2020 AS `year`
				UNION
				SELECT 2021 AS `year`
				UNION
				SELECT 2022 AS `year`
			),
			join_month_year AS (
				SELECT * 
				FROM year_
				CROSS JOIN month_all
			)
			SELECT ym.`month`, ym.`year`, COUNT(q.id) AS SL_ACCOUNT
			FROM question q
			RIGHT JOIN join_month_year ym ON YEAR(q.created_date) = ym.`year`
										AND
										MONTH(q.created_date) = ym.`month`
			GROUP BY ym.`month`, ym.`year`;
        END $$;
DELIMITER ;

call testing_system.check_account();

-- 8. Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra 0)
DELIMITER $$
CREATE PROCEDURE check_account_02 ()
	BEGIN
    -- tạo ra bảng 6 tháng gần đây để check
		WITH six_month_latter AS (
				SELECT MONTH(CURRENT_DATE - INTERVAL 5 MONTH) AS `month`, YEAR(CURRENT_DATE - INTERVAL 5 MONTH) AS `year`
                UNION ALL
                SELECT MONTH(CURRENT_DATE - INTERVAL 4 MONTH) AS `month`, YEAR(CURRENT_DATE - INTERVAL 4 MONTH) AS `year`
                UNION ALL
                SELECT MONTH(CURRENT_DATE - INTERVAL 3 MONTH) AS `month`, YEAR(CURRENT_DATE - INTERVAL 3 MONTH) AS `year`
                UNION ALL
                SELECT MONTH(CURRENT_DATE - INTERVAL 2 MONTH) AS `month`, YEAR(CURRENT_DATE - INTERVAL 2 MONTH) AS `year`
                UNION ALL
                SELECT MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AS `month`, YEAR(CURRENT_DATE - INTERVAL 1 MONTH) AS `year`
                UNION ALL
                SELECT MONTH(CURRENT_DATE - INTERVAL 0 MONTH) AS `month`, YEAR(CURRENT_DATE - INTERVAL 0 MONTH) AS `year`
			)
            SELECT ml.`year`, ml.`month` , COUNT(q.id) AS sl_account
            FROM question  q
            RIGHT JOIN six_month_latter ml ON YEAR(q.created_date) = ml.`year`
										AND 
                                        MONTH(q.created_date) = ml.`month`
			GROUP BY ml.`month`, ml.`year`
            ;
    END $$
DELIMITER ;

CALL check_account_02;

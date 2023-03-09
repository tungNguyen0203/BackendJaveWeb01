-- Exercise 2: Transaction
-- 1.	Rollback
-- a.	Tắt mode autocommit
SET autocommit = OFF;
-- b.	Thực hiện insert 1 group
INSERT INTO `group` (`name`, 		creator_id, 	created_date	)
VALUES 				('Java',			15,			'2020-11-02'	);
-- c.	Thực hiện rollback lại group vừa insert
ROLLBACK;
SET autocommit = ON;

SELECT * FROM `group`;

-- 2. Commit
-- a. Tắt mode autocommit
SET autocommit = OFF;
-- b. Thực hiện insert 1 group
INSERT INTO `group` (`name`, 		creator_id, 	created_date	)
VALUES 				('Javahehe',			15,			'2020-11-02'	);
-- c. Commit để lưu xuống database
COMMIT;

-- 3. Autocommit
-- a. Bật mode autocommit
SET autocommit = ON;
-- b. Thực hiện insert 1 group
INSERT INTO `group` (`name`, 		creator_id, 	created_date	)
VALUES 				('JavaheheGA',			15,			'2020-11-02'	);
-- c. Thực hiện rollback & check xem có thể rollback lại group vừa insert không?
ROLLBACK;
--  Không thể rollback lại tại vì commit đơn giản là commit thủ công bằng tay nên khi conmit rồi không thể rollback, lúc này data đã đc insert xuống bên dưới

-- 4. Transaction
-- a. Tạo 1 position mới là 'TechLead Dev' 
-- b. Tạo 1 department mới là 'Leader Department'
-- c. Tạo 1 group mới là 'Leader Group'
-- d. Tạo 2 accounts mới với vị trí 'TechLead Dev' thuộc department 'Leader 
-- Department' và add vào group 'Leader Group'
-- Yêu cầu: Nếu có lỗi thì sẽ rollback lại hết các lệnh Inser

DROP PROCEDURE IF EXISTS insert_new_account;
DELIMITER $$
CREATE PROCEDURE insert_new_account()
	BEGIN
    -- rollback nếu xảy ra lỗi vào sẽ không có gì được thực hiện
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
			BEGIN
				SHOW ERRORS;
                ROLLBACK;
            END;
		
        START TRANSACTION;
        -- insert data theo đề bài
			INSERT INTO position (`name`)
			VALUES				('TechLead Dev');
		
			INSERT INTO department	(`name`)
            VALUES					('Leader Department');
			
            INSERT INTO `group`	(`name`, creator_id)
            VALUES				('TechLead Dev', 2);
            
		-- add 2 account mới vào 
            INSERT INTO `account` (email, username, fullname, department_id, position_id, created_date)
				WITH id_position AS (
					SELECT id
					FROM position
					ORDER BY id DESC
					LIMIT 1
				),
				id_department AS (
					SELECT id
					FROM department
					ORDER BY id DESC
					LIMIT 1
				)
				SELECT 'nguyenvana@gmail.com',	'anv',	'Nguyễn Văn A', (SELECT id FROM id_department), (SELECT id FROM id_position), NOW()
				UNION 
				SELECT 'nguyenvanb@gmail.com',	'bnv',	'Nguyễn Văn B', (SELECT id FROM id_department), (SELECT id FROM id_position), NOW();
		
        -- add 2 account mới vào group mới
			INSERT INTO `group_account` (group_id, account_id)
			   WITH id_group AS (
					SELECT id
					FROM `group`
					ORDER BY id DESC
					LIMIT 1
				),
				id_new_account AS (
					SELECT id
					FROM `account`
					ORDER BY id DESC
					LIMIT 2
				)
				SELECT g.id AS id_group, a.id AS id_account
				FROM id_group g
				CROSS JOIN id_new_account a;
				
		COMMIT;
    END $$
DELIMITER ;

CALL insert_new_account();

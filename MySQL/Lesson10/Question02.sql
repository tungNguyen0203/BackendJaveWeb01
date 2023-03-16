-- Exercise 2: Trigger
-- 1. Tạo trigger chỉ cho phép người dùng nhập vào Group có ngày tạo trong năm nay và nhỏ hơn hiện tại
-- VD: hôm nay là 08-03-2023 thì chỉ cho nhập từ ngày 1-1-2023  08-03-2023
DELIMITER $$
	CREATE TRIGGER check_date_insert
    BEFORE INSERT ON `group`
    FOR EACH ROW
    BEGIN
		IF (NEW.created_date > NOW() OR YEAR(NEW.created_date != YEAR(NOW()))) THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'khong the them group';
        END IF;
    END $$

DELIMITER ;
-- insert loi
INSERT INTO `group` (`name`, creator_id, created_date)
VALUES				('java', 15, '2030-11-02');
-- insert thanh cong
INSERT INTO `group` (`name`, creator_id, created_date)
VALUES				('java', 15, '2000-11-02');

SELECT *
FROM `GROUP`
order by id desc;

-- 2. Cấu hình 1 group có nhiều nhất là 5 user
DROP TRIGGER IF EXISTS insert_user;
DELIMITER $$
	CREATE TRIGGER insert_user
	BEFORE INSERT ON `group_account`
	FOR EACH ROW	
    BEGIN
        DECLARE count_account INT;
        
		SELECT COUNT(account_id) INTO count_account
        FROM group_account
		WHERE group_id = NEW.group_id;
        
		IF (count_account >= 5) THEN
			SIGNAL SQLSTATE '12345'
			SET MESSAGE_TEXT = 'NHAP TOI DA 5 USER';
		END IF;
	END $$
DELIMITER ;

INSERT INTO group_account	(group_id, account_id, join_date)
VALUES						(1, 		8,			'2020-12-12'),
							(1,			10,			'2020-12-12');

SELECT *
FROM group_account;

-- 3. Tạo trigger không cho phép người dùng xóa tài khoản có email là duynn03@gmail.com (đây là tài khoản admin, không cho phép user xóa), 
-- còn lại các tài khoản khác thì sẽ cho phép xóa và sẽ xóa tất cả các thông tin liên quan tới user đó)
DROP TRIGGER IF EXISTS DELETE_ACCOUNT;
DELIMITER $$
	CREATE TRIGGER DELETE_ACCOUNT
    BEFORE DELETE ON `account`
    FOR EACH ROW
    BEGIN
		IF (OLD.email = 'duynn03@gmail.com') THEN
			SIGNAL SQLSTATE '12345'
            SET MESSAGE_TEXT = 'KHONG THE XOA TAI KHOAN ADMIN';
		END IF;
    END $$
DELIMITER ;

DELETE 
FROM	`account`
WHERE	id = 1;
-- 4. Thêm field total_account vào trong table department, config mỗi khi thêm 1 record vào
-- table account thì sẽ update field total_ account trong table department
DROP TRIGGER IF EXISTS INSERT_ACCOUNT;
DELIMITER $$
	CREATE TRIGGER INSERT_ACCOUNT
    AFTER INSERT ON `account`
    FOR EACH ROW
    BEGIN
		DECLARE in_deparment SMALLINT;
        
        SELECT total_account INTO in_deparment
        FROM department
        WHERE id = NEW.department_id;
    
		UPDATE `department`
        SET total_account = (in_deparment + 1)
        WHERE id = NEW.department_id;
    END $$
DELIMITER ;

INSERT INTO  `account`  (	email, 						username, 				fullname, 				department_id,	position_id,	created_date	)
VALUES
						('HEHE@gmail.com',			'HEHE',				'Nguyễn VAN HEHE',			6,				4,			'2019-10-01'	);

SELECT *
FROM department;

-- 5. Thêm field total_answer vào trong table question, config mỗi khi thêm 1 record vào table 
-- answer thì sẽ update field total_answer trong table question
DROP TRIGGER IF EXISTS insert_anwer;
DELIMITER $$
	CREATE TRIGGER insert_anwer
    AFTER INSERT ON `answer`
    FOR EACH ROW
    BEGIN
		DECLARE total_answer_old SMALLINT;
    
		SELECT total_answer INTO total_answer_old
        FROM question q
        WHERE q.id = NEW.question_id;
        
        UPDATE question
        SET total_answer = (total_answer_old + 1)
        WHERE id = NEW.question_id;
    END $$
DELIMITER ;

SELECT *
FROM answer;
-- 6. Tạo trigger chỉ cho phép người dùng thêm tối đa 4 account trong department "Sale", khi
-- nhập tới account thứ 5 thì hiện ra thông báo "Department 'Sale' cannot add more user"


-- 7. Viết trigger chỉ cho phép người dùng chỉ được update, delete các question khi question
-- đó chưa nằm trong exam nào
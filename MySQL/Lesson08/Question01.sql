-- Exercise 1: Insert, Update, Delete Statement
-- 1. Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account`
SET fullname = 'Nguyễn Bá Lộc',
	email = 'loc.nguyenba@vti.com.vn'
WHERE id = 5;

-- 2. Update account có username là duynn03 sẽ thuộc phòng ban Sale
UPDATE `account`
SET department_id = (SELECT id FROM department WHERE `name` = 'Sale')
WHERE username = 'duynn03';

-- 3. Chuyển tất cả các account trong group B.O.Y về department Marketing
WITH ID_GROUP AS (
	SELECT id
	FROM `group`
    WHERE `name` = 'B.O.Y'
),
ID_GROUP_UPD AS (
	SELECT id
	FROM `group`
    WHERE `name` = 'Blackpink'
)
UPDATE group_account
SET	group_id = (SELECT * FROM ID_GROUP_UPD)
WHERE group_id = (SELECT * FROM ID_GROUP);

-- 4. Chuyển tất cả các account trong group Blackpink vào 1 department mới tạo (học viên tự đặt tên cho department mới)
-- Tạo một department mới
INSERT INTO department	(`name`)
VALUES					('Sale 02');

WITH ID_BLACKPINK_GROUP AS (
	SELECT id
    FROM `group`
    WHERE `name` = 'Blackpink'
),
ID_ACCOUNT AS (
	SELECT account_id
    FROM group_account
    WHERE group_id = (SELECT * FROM ID_BLACKPINK_GROUP)
)
UPDATE `account`
SET department_id = 21
WHERE department_id IN (SELECT * FROM ID_ACCOUNT);

-- 5. Tạo 1 group mới và add tất cả các tester của department HR vào
-- Tạo ra group mới
INSERT INTO `group`	(`name`, creator_id)
VALUES				('new_group', 5);

-- Add tất cả tester của department HR vào
INSERT INTO group_account	(group_id, account_id, created_date)
WITH ID_ACCOUNT AS (
	SELECT a.id
	FROM `account` a
	JOIN department d ON d.id = a.department_id
	JOIN position p ON p.id = a.position_id
	WHERE d.`name` = 'HR' AND p.`name` = 'Test'
),
ID_NEW_GROUP AS (
	SELECT id
	FROM `group`
	WHERE `name` = 'new_group'
)
SELECT 		g.id AS group_id, t.id AS account_id, NOW()
FROM		ID_NEW_GROUP t
CROSS JOIN	ID_ACCOUNT g; 

-- Subquery
INSERT INTO group_account	(group_id, account_id)
VALUES						((	SELECT id
								FROM `group`
								WHERE `name` = 'J95'), (SELECT a.id
														FROM `account` a
														JOIN department d ON d.id = a.department_id
														JOIN position p ON p.id = a.position_id
														WHERE d.`name` = 'HR' AND p.`name` = 'Test'));

SELECT *
FROM group_account;

-- 6. Setting ON DELETE CASCADE, ON UPDATE CASCADE, ... cho các table trong database sao cho hợp lý

-- 7. Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE 
FROM	`exam`
WHERE	created_date < '2019-12-20';

-- 8. Xóa các question có nhiều câu trả lời nhất
WITH SL_ANSWER AS (
	SELECT 		question_id, COUNT(1) AS DEM_ANSWER
    FROM		answer
    GROUP BY	question_id
),
MAX_ANSWER AS (
	SELECT 	MAX(DEM_ANSWER)
    FROM	SL_ANSWER
),
ID_QUESTION_MAX AS (
	SELECT 	question_id
	FROM	SL_ANSWER
	WHERE	DEM_ANSWER = (SELECT * FROM MAX_ANSWER)
)
DELETE 
FROM	question
WHERE	id IN (SELECT question_id FROM ID_QUESTION_MAX);

-- 9. Xóa các question không có câu trả lời nào
WITH count_question AS (
	SELECT q.id, COUNT(question_id) AS count_q
	FROM question q
	LEFT JOIN answer asr ON asr.question_id = q.id
	GROUP BY q.id
),
count_min AS (
	SELECT MIN(count_q)
    FROM count_question
),
delete_question AS (
	SELECT id
    FROM count_question
    WHERE count_q = (SELECT * FROM count_min)
)
DELETE
FROM question
WHERE id IN (SELECT * FROM delete_question);

SELECT *
FROM quention;

-- 10. Xóa tất cả các exam được tạo trước ngày 20/12/2020
WITH id_exam AS (
	SELECT *
	FROM exam
	WHERE created_date < '2020-12-20'
)
DELETE
FROM id_exam;

-- 11. Thêm 1 column isDeletedFlag (default = 0) vào table account, khi xóa account sẽ chuyển isDeleteFlag = 1
-- a. Delete account có username duynn03
-- b. Lấy ra tất cả các nhân viên có tài khoản active
-- c. Lấy ra các nhân viên active trong department Sale

UPDATE `account`
SET isDeletedFlag = 1
WHERE username = 'duynn03';

SELECT 	*
FROM	`account`
WHERE	isDeletedFlag = 0;

-- c. Lấy ra các nhân viên active trong department Sale
SELECT 	a.id, a.fullname, d.id, d.`name`
FROM	`account` a
JOIN	department d ON a.department_id = d.id
WHERE	a.isDeletedFlag = 0 AND d.`name` = 'Sale';


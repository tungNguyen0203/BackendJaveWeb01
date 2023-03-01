-- Exercise 2: CTE
-- 1. Lấy ra id, fullname của nhân viên trong phòng ban Sale
WITH id_Sale AS (
	SELECT id
    FROM department
    WHERE `name` = 'Sale'
)
SELECT id, fullname
FROM `account`
WHERE department_id = (SELECT * FROM id_Sale);

-- 2. Lấy ra 3 tên phòng ban đã có nhân viên, sắp xếp theo thứ tự id giảm dần
WITH department_id_account AS (
	SELECT DISTINCT department_id 
				FROM `account` 
				ORDER BY department_id DESC 
                LIMIT 3
)
SELECT id, `name`
FROM department
WHERE id In (SELECT * FROM department_id_account);

-- 3. Lấy ra tên của các phòng ban chưa có nhân viên
WITH department_id_account AS (
	SELECT DISTINCT department_id 
				FROM `account` 
				ORDER BY department_id DESC
)
SELECT id, `name`
FROM department
WHERE id NOT In (SELECT * FROM department_id_account);

-- 4. Lấy ra mã code của các exam chưa có question
WITH CODE_EXAM AS (
	SELECT 	DISTINCT(exam_id)
	FROM 	`exam_question`
)
SELECT 	`code`
FROM 	`exam`
WHERE	id NOT IN (SELECT * FROM CODE_EXAM);

-- 5. Lấy ra id, fullname của nhân viên trong phòng ban Sale có position là Dev hoặc Test
WITH id_sale_department AS (
	SELECT id
    FROM	department
    WHERE `name` = 'Sale'
),
id_position_dev_test AS (
	SELECT id
	FROM position
    WHERE `name` = 'Dev' OR `name` = 'Test'
)
SELECT id, fullname
FROM `account`
WHERE (department_id = (SELECT id FROM id_sale_department)) AND
	(position_id IN (SELECT id FROM id_position_dev_test))
;

-- 6. Lấy ra question_id của các đề kiểm tra có mã code là E_11, E_10, E_45
WITH QUES_ID_CODE AS (
	SELECT id
	FROM exam
	WHERE `code` = 'E_11' OR `code` = 'E_10' OR `code` = 'E_45'
)
SELECT question_id
FROM exam_question
WHERE exam_id IN (SELECT * FROM QUES_ID_CODE);

-- 7. Viết lệnh để lấy ra id & content của câu hỏi được sử dụng trong đề thi nhiều nhất
WITH `MAX_SO_LUONG` AS (
	SELECT COUNT(question_id)
	FROM exam_question
	GROUP BY question_id
	ORDER BY  COUNT(question_id) DESC
	LIMIT 1
),
`BANG_DEM_SO_LUONG_CAU_HOI` AS (
	SELECT question_id, COUNT(question_id) AS `COUNT_Q`
	FROM exam_question
	GROUP BY question_id
),
`ID_CUA_EXAM` AS (
	SELECT question_id
    FROM `BANG_DEM_SO_LUONG_CAU_HOI`
    WHERE `COUNT_Q` = (SELECT * FROM `MAX_SO_LUONG`)
)
SELECT id, content
FROM question
WHERE id IN (SELECT * FROM`ID_CUA_EXAM`);

-- 8. Viết lệnh để lấy ra id & fullname của account tham gia vào nhiều group nhất
WITH `BANG_DEM_A` AS (
	SELECT account_id, COUNT(account_id) AS DEM_GROUP_A_TG
	FROM group_account
	GROUP BY account_id
),
`MAX_GROUP` AS (
	SELECT MAX(DEM_GROUP_A_TG) AS `MAX_ACCOUNT`
    FROM `BANG_DEM_A`
),
`ID_ACCOUNT` AS (
	SELECT account_id
    FROM BANG_DEM_A
    WHERE DEM_GROUP_A_TG = (SELECT * FROM MAX_GROUP)
)
SELECT id, fullname
FROM `account`
WHERE id IN (SELECT * FROM ID_ACCOUNT);

-- 9. Viết lệnh để lấy mã code của đề thi có duration lớn hơn các đề liên quan tới Java
WITH DURATION_JAVA AS (
	SELECT duration
	FROM exam
	WHERE title LIKE '%Java'
)
SELECT *
FROM exam
WHERE duration > (SELECT * FROM DURATION_JAVA);
-- 10. Liệt kê id của tất cả các câu hỏi được tạo bởi nhân viên phòng Sale
WITH SALE_DEPARTMENT AS (
	SELECT id
	FROM department
	WHERE `name` = 'Sale'
),
ID_ACCOUNT AS (
	SELECT id
	FROM `account`
	WHERE department_id = (SELECT * FROM SALE_DEPARTMENT)
)
SELECT id
FROM question
WHERE creator_id IN (SELECT * FROM ID_ACCOUNT);

-- 11. Liệt kê id & fullname của nhân viên tham gia vào cả 2 group B.O.Y & Bling Bling
-- TẠO 3 BẢNG LINK NỐI TIẾP TỪ TRÊN XUỐNG (XỬ LÝ THEO TỪNG BƯỚC)
-- TÌM RA IA THAM RA 2 GROUP
-- TÌM RA ACCOUNT JOUN VÀO CẢ 2 THẰNG

WITH NAME_GROUP AS (
	SELECT id
	FROM `group`
	WHERE `name` = 'B.O.Y' OR `name` = 'Bling Bling'
),
ID_ACCOUNT AS (
	SELECT account_id
	FROM group_account
	WHERE group_id IN (SELECT * FROM NAME_GROUP)
)
SELECT id, fullname
FROM `account`
WHERE id IN (SELECT * FROM ID_ACCOUNT);
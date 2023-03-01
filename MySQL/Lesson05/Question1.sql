-- Exercise 1: Subquery
-- 1. Lấy ra id, fullname của nhân viên trong phòng ban Sale
SELECT id, fullname
FROM `account`
WHERE department_id = (SELECT id FROM department WHERE `name` = 'Sale');

-- 2. Lấy ra 3 tên phòng ban đã có nhân viên, sắp xếp theo thứ tự id giảm dần
-- C1
SELECT id, `name`
FROM department
WHERE id IN (	SELECT DISTINCT department_id 
				FROM `account` 
				ORDER BY department_id 
				DESC LIMIT 3
);

-- C2
SELECT id, `name`
FROM department
WHERE EXISTS (	SELECT 1
				FROM `account`
				WHERE `account`.department_id = department.id
)
ORDER BY id DESC
LIMIT 3;

-- 3. Lấy ra tên của các phòng ban chưa có nhân viên
SELECT id, `name`
FROM department
WHERE NOT EXISTS (	SELECT 1
					FROM `account`
					WHERE `account`.department_id = department.id 
);
-- 4. Lấy ra mã code của các exam chưa có question
SELECT 	`code`
FROM 	`exam`
WHERE	id NOT IN (	SELECT 	DISTINCT(exam_id)
					FROM 	`exam_question`);

-- 5. Lấy ra id, fullname của nhân viên trong phòng ban Sale có position là Dev hoặc Test
SELECT * 
FROM `account`
WHERE	department_id = (	SELECT id
							FROM	department
							WHERE `name` = 'Sale') 

		AND position_id IN (SELECT `name`
							FROM	position
							WHERE `name` = 'Dev' OR `name` = 'Test' 
							);

-- 6. Lấy ra question_id của các đề kiểm tra có mã code là E_11, E_10, E_45
SELECT question_id
FROM exam_question
WHERE exam_id IN 	(SELECT id
					FROM exam
					WHERE `code` = 'E_11' OR `code` = 'E_10' OR `code` = 'E_45') 
;

-- 7. Viết lệnh để lấy ra id & content của câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT id, content
FROM question
WHERE id IN	(SELECT question_id
			FROM	
					(SELECT question_id, COUNT(question_id) AS `DEM_SO_LUONG_CAU_HOI`
					FROM exam_question
					GROUP BY question_id
                    ) AS `BANG_DEM`
			WHERE	
					`DEM_SO_LUONG_CAU_HOI` = (	SELECT COUNT(question_id) AS `SL_SU_DUNG`
												FROM exam_question
												GROUP BY question_id
												ORDER BY SL_SU_DUNG DESC
												LIMIT 1)
                    
			)
;

-- 8. Viết lệnh để lấy ra id & fullname của account tham gia vào nhiều group nhất
SELECT id, fullname 
FROM `account`
WHERE id = (SELECT account_id
			FROM (	SELECT account_id, COUNT(group_id) AS `DEM_SL`
					FROM `group_account`
					GROUP BY group_id
					) AS `BANG_DEM_SL`
			WHERE DEM_SL = (SELECT COUNT(group_id)
							FROM `group_account`
							GROUP BY group_id
							ORDER BY COUNT(group_id) DESC
							LIMIT 1)
			)
;

-- 9. Viết lệnh để lấy mã code của đề thi có duration lớn hơn các đề liên quan tới Java
SELECT `code`
FROM exam
WHERE duration > (	SELECT duration
					FROM exam
					WHERE title LIKE '%Java')
;

-- 10. Liệt kê id của tất cả các câu hỏi được tạo bởi nhân viên phòng Sale
SELECT id
FROM question
WHERE creator_id IN (	SELECT id
						FROM `account`
						WHERE department_id = (SELECT id
												FROM department
												WHERE `name` = 'Sale')
);

-- 11. Liệt kê id & fullname của nhân viên tham gia vào cả 2 group B.O.Y & Bling Bling
SELECT  id, fullname
FROM	`account`
WHERE	id IN (SELECT  	account_id
				FROM 	group_account
				WHERE	group_id IN (SELECT id
										FROM	`group`
										WHERE	`name` IN ('B.O.Y', 'Bling Bling')
									)
				)
;
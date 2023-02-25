-- Exercise 2: Group By & Aggregate functions, Having
-- 1. Thống kê mỗi department có bao nhiêu nhân viên, sắp xếp theo department id giảm dần
SELECT department_id, COUNT(department_id) AS `SL_NHAN_VIEN`
FROM `account`
GROUP BY department_id
ORDER BY department_id;

-- 2. Thống kê mỗi department có bao nhiêu nhân viên đã cập nhập email, sắp xếp theo department id giảm dần
SELECT department_id, COUNT(email)
FROM `account`
GROUP BY department_id
ORDER BY department_id DESC;

-- 3. Thống kê mỗi group có bao nhiêu nhân viên
SELECT group_id, COUNT(group_id) AS `SO_NHAN_VIEN`
FROM `group_account`
GROUP BY group_id;

-- 4. Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT department_id, position_id, COUNT(1)
FROM `account`
GROUP BY department_id, position_id;

-- 5. Thông kê mỗi category có bao nhiêu Question
SELECT category_id, COUNT(category_id) AS `SL_QUESTION`
FROM question
GROUP BY category_id;

-- 6. Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT type_question_id, COUNT(type_question_id) AS `SL`
FROM question
GROUP BY type_question_id;

-- 7. In ra tổng số phòng ban trong công ty
SELECT COUNT(id) AS `TONG_SO_PHONG`
FROM department;

-- 8. In ra tổng số group trong công ty
SELECT COUNT(id) AS `TONG_SO_PHONG`
FROM `group`;

-- 9. In ra id phòng ban có nhiều nhân viên nhất
SELECT department_id, COUNT(department_id) AS `SL_NHAN_VIEN`
FROM `account`
GROUP BY department_id
ORDER BY `SL_NHAN_VIEN` DESC
LIMIT 1;

-- 10. Lấy ra ID của question có >= 3 câu trả lời
SELECT question_id, COUNT(question_id) AS `SL_CAU_TRA_LOI`
FROM `answer`
GROUP BY question_id
HAVING `SL_CAU_TRA_LOI` >= 3;

-- 11. Viết lệnh để lấy ra id của các phòng ban có > 3 nhân viên
SELECT department_id, COUNT(department_id) AS `SL_NHAN_VIEN`
FROM `account`
GROUP BY department_id
HAVING `SL_NHAN_VIEN` > 3;

-- 12. Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT question_id, COUNT(question_id) AS `SL`
FROM exam_question
GROUP BY question_id;

-- 13. Lấy ra Question có nhiều câu trả lời nhất
SELECT 		question_id, COUNT(1) AS `SL`
FROM		`answer`
GROUP BY	question_id 
ORDER BY	`SL` DESC
LIMIT		1;

-- 14. Tìm position có ít người nhất 
SELECT 		position_id, COUNT(1) AS `SL`
FROM		`account`
GROUP BY	position_id 
ORDER BY	SL 
LIMIT		1;
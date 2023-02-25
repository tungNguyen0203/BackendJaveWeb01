-- Exercise 1: Distinct, Order by, Limit
-- 1. Lấy ra id của các phòng ban đã có nhân viên, sắp xếp theo thứ tự id giảm dần
SELECT DISTINCT department_id
FROM `account`
ORDER BY department_id DESC;

-- 2. Lấy ra 3 id của các phòng ban đã có nhân viên, sắp xếp theo thứ tự id giảm dần
SELECT DISTINCT department_id
FROM `account`
ORDER BY department_id DESC
LIMIT 3;

-- 3. Lấy ra tất cả các ngày (duy nhất) nhân viên tham gia vào hệ thống, sắp xếp theo thứ tự giảm dần
-- Lấy riêng ngày
SELECT created_date, CONVERT(created_date, date), COUNT(CONVERT(created_date, date))
FROM `account`
GROUP BY DAY(CONVERT(created_date, date))
HAVING COUNT(CONVERT(created_date, date)) = 1
ORDER BY CONVERT(created_date, date) DESC;

-- Lấy cả năm tháng ngày
SELECT created_date, COUNT(created_date)
FROM `account`
GROUP BY created_date
HAVING COUNT(created_date) = 1
ORDER BY created_date DESC;

-- 4. a. Lấy ra id và tên của 5 nhân viên được tạo gần đây nhất (page 1)
SELECT id, fullname
FROM `account`
ORDER BY id DESC
LIMIT 5;

-- b. Viết thêm lệnh để lấy page 2, page 3
SELECT id, fullname
FROM `account`
ORDER BY id DESC
LIMIT 5 OFFSET 5;

SELECT id, fullname
FROM `account`
ORDER BY id DESC
LIMIT 5 OFFSET 10;

-- 5. a. Lấy ra id và tên của 5 nhân viên được tạo sớm nhất (page 1)
SELECT id, created_date
FROM `account`
ORDER BY created_date
LIMIT 5;

-- b. Viết thêm lệnh để lấy page 2, page 3
SELECT id, created_date
FROM `account`
ORDER BY created_date
LIMIT 5 OFFSET 5;

SELECT id, created_date
FROM `account`
ORDER BY created_date
LIMIT 5 OFFSET 10;

-- 6. Lấy ra tên của 5 phòng ban tạo gần đây nhất
SELECT *
FROM `department`
ORDER BY id
LIMIT 5 ;

-- 7. Lấy ra id của tất cả những nhân viên đã tham gia tạo group
SELECT DISTINCT creator_id
FROM `group`;

-- 8. Lấy ra id của tất cả những nhân viên đã tham gia tạo question
SELECT DISTINCT creator_id
FROM `question`;

-- 9. Lấy ra id của tất cả các nhóm đã có người tham gia
SELECT DISTINCT group_id
FROM `group_account`;

-- 10. In ra các category (duy nhất) đã có exam
SELECT DISTINCT category_id
FROM exam;

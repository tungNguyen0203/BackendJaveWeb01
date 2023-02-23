-- Exercise 2: Slect & Where

-- 2. Lấy ra các thông tin của phòng ban
SELECT * FROM `account`;

-- 3. Lấy id, trên nhân viên thuộc phòng ban có id = 3
SELECT id, fullname, department_id
FROM `account`
WHERE department_id = 3;

-- 4. lấy id, tên nhân viên không thuộc phòng ban có id = 5
SELECT id, fullname, department_id
FROM `account`
WHERE id != 5;

-- 5. Lấy id của phòng ban của phòng ban tên là "qui"
SELECT id, `name`
FROM department
WHERE `name` = "qui";

-- 6. Lấy id, tên nhân viên thuộc phòng ban có id = 3 hoặc id = 5
SELECT id, fullname, department_id
FROM `account`
WHERE department_id = 3 OR department_id = 5;

-- 7. Lấy id, tên nhân viên phòng ban có id = 3 và position = 4
SELECT id, fullname, id, department_id,position_id
FROM `account`
WHERE (department_id = 3 OR department_id = 5) AND position_id = 4;

-- 8. LẤY ra tên group được tạo trước ngày 20/12/2005
SELECT id, `name`, created_date
FROM `group`
WHERE created_date <= '2005-12-20';

-- 9. Lấy ra tên group được tạo vào năm 2005, 2006, 2007, 2008 (4 năm liền nhau)
SELECT *
FROM `group`
WHERE YEAR(created_date) BETWEEN 2005 AND 2008;

-- 10. Lấy ra tên group đc tạo vào 4 năm bất kì (2005, 2006, 2010, 2016)
SELECT *
FROM `group`
WHERE YEAR(created_date) IN(2005, 2006, 2010, 2016);

-- 11. Lấy ra tên nhân viên có username bắt đầu bằng chữ "M", kết thức bằng chữ "U" chứa chữ "A"
SELECT *
FROM `account`
WHERE username LIKE 'm%u%a';

-- 12. Lấy ra tên group không có ngày tạo (created_date = null)
SELECT *
FROM `account`
WHERE created_date IS NULL;

-- 13. Lấy ra id, tên nhân viên có độ dài tên > 15 ký tự
SELECT *
FROM `account`
WHERE LENGTH(fullname) < 13;

-- 14. Lấy ra id của cây hỏi có content > 100 ký tự
SELECT *
FROM `question`
WHERE LENGTH(content) < 100;
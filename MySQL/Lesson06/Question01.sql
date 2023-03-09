/*thường điều kiện join là p key và j key
-	có thể join đc nhiều bẳng một lúc
-	*/
SELECT *
FROM `account` AS A
JOIN department AS D ON a.department_id = D.id;

-- 1. Viết lệnh để lấy ra tất cả các developer
SELECT *
FROM `account` a
JOIN position p ON a.position_id = p.id
WHERE p.name = 'Dev';

-- 2. Lấy ra id, fullname của nhân viên trong phòng ban Sale có position là Dev hoặc Test
SELECT a.id, a.fullname
FROM `account` a
JOIN position p ON a.position_id = p.id
JOIN department d ON a.department_id = d.id
WHERE p.name = 'Dev' OR p.name = 'Test' AND d.name = 'Sale';

-- 3. Lấy ra question_id của các đề kiểm tra có mã code là E_11, E_10, E_45
SELECT e.code, eq.question_id
FROM exam e
JOIN exam_question eq ON e.id = eq.exam_id
JOIN question q ON q.id = eq.question_id
WHERE e.code = 'E_11' OR e.code = 'E_10' OR e.code = 'E_45';

-- 4. Liệt kê id, content của tất cả các câu hỏi được tạo bởi nhân viên phòng Sale
SELECT q.id, q.content
FROM `question` q 
JOIN `account` a ON  q.creator_id = a.id
JOIN department d ON d.id = a.department_id
WHERE d.name = 'Sale';

-- 5. Viết lệnh để lấy ra tên của các phòng ban có > 3 nhân viên
SELECT a.department_id, d.name, COUNT(a.department_id)
FROM `account` a
JOIN department d ON d.id = a.department_id
GROUP BY a.department_id
HAVING COUNT(a.department_id) > 1;

-- 6. Viết lệnh để lấy ra id, fullname của nhân viên và tên phòng ban của họ (nếu có)
SELECT a.id, a.fullname, d.`name`
FROM `account` a
LEFT JOIN department d ON d.id = a.department_id 
WHERE a.department_id IS NOT NULL;

-- 7. Thống kê số lượng account trong mỗi group (in ra 0 nếu group không có account nào)
SELECT g.id, g.`name`, COUNT(ga.group_id)
FROM `group_account` ga
RIGHT JOIN `group` g ON g.id = ga.group_id
GROUP BY g.id
;

-- 8. In ra tên của department có ít người nhất (Nếu có nhiều department không có account nào thì in hết ra)
WITH COUNT_ACCOUNT AS (
	SELECT d.id, d.`name`, COUNT(a.department_id) AS COUNT_D
	FROM `account` a
	RIGHT JOIN department d ON d.id = a.department_id
	GROUP BY d.id
),
MIN_DEPARTMENT AS (
	SELECT MIN(COUNT_D)
    FROM COUNT_ACCOUNT
)
SELECT id, `name`, COUNT_D
FROM COUNT_ACCOUNT
WHERE COUNT_D = (SELECT * FROM MIN_DEPARTMENT);

-- 9. Thông kê mỗi Category Question có bao nhiêu Question (in ra 0 nếu category không có question nào)
SELECT cq.id, cq.`name`, COUNT(category_id)
FROM question q
RIGHT JOIN category_question cq ON cq.id = q.category_id 
GROUP BY cq.id;

-- 10. Lấy ra tên của các phòng ban chưa có nhân viên
SELECT d.id, d.`name`
FROM `account` a
RIGHT JOIN department d ON d.id = a.department_id
WHERE a.department_id IS NULL;

-- 11. In ra số lượng phòng ban chưa có nhân viên
SELECT COUNT(1) AS SL_NV_CHUA_PHONG_BAN
FROM `account` a
RIGHT JOIN department d ON d.id = a.department_id
WHERE a.department_id IS NULL;

-- 12. In ra số lượng phòng ban đã có nhân viên
SELECT COUNT(1) AS SL_NV_CO_PHONG_BAN
FROM `account` a
JOIN department d ON d.id = a.department_id
WHERE a.department_id IS NOT NULL;

-- 13. In ra mã code của các exam chưa có question nào
SELECT e.id, e.`code`
FROM exam_question eq
RIGHT JOIN exam e ON e.id = eq.exam_id
WHERE exam_id IS NULL;

-- 14. Lấy ra question không có answer nào
SELECT q.id, q.content
FROM answer a
RIGHT JOIN question q ON q.id = a.question_id
WHERE a.question_id IS NULL;

-- 15. Thống kê mỗi phòng ban có bao nhiêu nhân viên là dev, test, scrum master, PM 
-- (in ra 0 nếu department & position không có account nào)




-- 16. Viết lệnh để lấy ra id & fullname của account tham gia vào nhiều group nhất
WITH COUNT_ACCOUNT AS (
	SELECT a.id, a.fullname, COUNT(ga.account_id) AS COUNT_
	FROM `group_account`ga
	RIGHT JOIN `account` a ON a.id = ga.account_id
	GROUP BY ga.account_id
),
MAX_SL AS (
	SELECT MAX(COUNT_)
    FROM COUNT_ACCOUNT
)
SELECT id, fullname, COUNT_
FROM `COUNT_ACCOUNT`
WHERE COUNT_ = (SELECT * FROM MAX_SL);

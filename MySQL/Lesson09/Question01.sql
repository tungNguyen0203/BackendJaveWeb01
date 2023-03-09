-- Exercise 1: View
-- 1. Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW ACCOUNT_SALE_DEPARTMENT AS 
	SELECT a.id AS ACCOUNT_ID, fullname AS ACCOUNT_FULLNAME, d.id AS DEPARTMENT_ID, d.`name` DEPARTMENT_NAME
    FROM `account` a
    JOIN department d ON d.id = a.department_id
    WHERE d.`name` = 'Sale'; 

-- CREATE VIEW TABLE DÙNG CHUNG CHO 2, 3, 4 
DROP VIEW IF EXISTS ACCOUNT_COUNT_JOIN_GP;
CREATE VIEW ACCOUNT_COUNT_JOIN_GP AS 
	SELECT a.id AS account_id, COUNT(ga.account_id) AS DEM_SL
	FROM group_account ga
    RIGHT JOIN `account` a ON a.id = ga.account_id
	GROUP BY a.id;

SELECT * FROM ACCOUNT_COUNT_JOIN_GP;
-- 2. Tạo view có chứa thông tin mỗi account tham gia vào bao nhiêu group
CREATE VIEW ACCONUT_COUNT AS 
	SELECT *
	FROM ACCOUNT_COUNT_JOIN_GP t
	JOIN `account` a ON a.id = t.account_id;

-- 3. Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS ACCONUT_COUNT_MAX;
CREATE VIEW ACCONUT_COUNT_MAX AS 
	WITH MAX_SL AS (
		SELECT MAX(DEM_SL) AS MAXSL
        FROM ACCOUNT_COUNT_JOIN_GP 
    )
    SELECT a.id, a.email, a.username, a.fullname, a.department_id, a.position_id, a. created_date, a.isDeleteFlag
	FROM ACCOUNT_COUNT_JOIN_GP t
	JOIN `account` a ON a.id = t.account_id
    WHERE t.DEM_SL = (SELECT * FROM MAX_SL);

SELECT * FROM ACCONUT_COUNT_MAX;

-- 4. Tạo view có chứa thông tin các account tham gia vào ít group nhất
DROP VIEW IF EXISTS ACCONUT_COUNT_MIN;
CREATE VIEW ACCONUT_COUNT_MIN AS 
	WITH MIN_SL AS (
		SELECT MIN(DEM_SL) AS MINSL
        FROM ACCOUNT_COUNT_JOIN_GP 
    )
    SELECT a.id, a.email, a.username, a.fullname, a.department_id, a.position_id, a. created_date, a.isDeleteFlag
	FROM ACCOUNT_COUNT_JOIN_GP t
	JOIN `account` a ON a.id = t.account_id
    WHERE t.DEM_SL = (SELECT * FROM MIN_SL);

SELECT * FROM ACCONUT_COUNT_MIN;


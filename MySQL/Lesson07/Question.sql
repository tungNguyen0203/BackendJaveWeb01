-- Exercise 1:
-- 1. Viết 1 query lấy ra các thông tin EmployeeID, ContactID, Title của employee và sắp xếp theo Title giảm dần
SELECT EmployeeID, ContactID, Title
FROM employee;

-- 2. Viết 1 query lấy ra danh sách Title (Unique) của employee và sắp xếp theo Title giảm dần
SELECT Title
FROM employee
ORDER BY Title DESC;

-- 3. Viết 1 query lấy ra tổng hàng hóa (freight) của mỗi customer, sắp xếp theo customer id
-- Gợi ý: query từ table salesorderheader
SELECT CustomerID, freight, SUM(freight)
FROM salesorderheader
GROUP BY CustomerID;

-- 4. Viết 1 query lấy "Name" của Product có Subcategory là 'Saddles'
SELECT *
FROM product p
JOIN productsubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE ps.`Name` LIKE 'Saddles';

-- 5. Lấy ra các product có "Name" bắt đầu bằng chữ "Bo"
-- Gợi ý: sử dụng function SUBSTRING_INDEX với tham số thứ 3 là -1
WITH TACH_STRING AS (
	SELECT SUBSTRING_INDEX(`Name`, ' ',-1) AS STRING_NAME
	FROM product
)
SELECT STRING_NAME
FROM TACH_STRING
WHERE STRING_NAME LIKE 'Bo%';

-- 6. Viết câu query trả về tất cả các product có giá rẻ nhất (lowest ListPrice) và là loại Touring Bike
WITH TOURING_BIKE AS (
	SELECT ps.`Name`, p.ListPrice
	FROM product p
	JOIN productsubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
	WHERE ps.`Name` = 'Touring Bikes'
),
MIN_LISTPRICE AS (
	SELECT MIN(ListPrice)
    FROM TOURING_BIKE
)
SELECT *
FROM TOURING_BIKE
WHERE ListPrice IN (SELECT * FROM MIN_LISTPRICE);

-- 7
SELECT cr.`Name` AS couuntry , sp.`Name` AS province
FROM stateprovince sp
JOIN countryregion cr ON sp.CountryRegionCode = cr.CountryRegionCode;

-- 8
SELECT cr.`Name` AS couuntry , sp.`Name` AS province
FROM stateprovince sp
JOIN countryregion cr ON sp.CountryRegionCode = cr.CountryRegionCode
WHERE cr.`Name` = 'Germany' OR sp.`Name` = 'Canada';

-- 9






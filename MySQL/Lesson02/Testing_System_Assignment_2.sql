DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

-- create table
CREATE TABLE department (
	id	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `name`	VARCHAR(50) UNIQUE KEY
);
CREATE TABLE position (
	id	TINYINT AUTO_INCREMENT PRIMARY KEY,
    name	ENUM('Dev', 'Test', 'Scrum Master', 'PM')
);
CREATE TABLE `account` (
	id	INT AUTO_INCREMENT PRIMARY KEY,
    email	VARCHAR(500) UNIQUE KEY,
    username	VARCHAR(50) UNIQUE KEY,
    fullname	VARCHAR(50),
    department_id	TINYINT,
    position_id		TINYINT,
    created_date	DATE,
    FOREIGN KEY (department_id) REFERENCES department (id),
    FOREIGN KEY (position_id) REFERENCES position (id)
);
CREATE TABLE `group` (
	id	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `name`	VARCHAR(50) UNIQUE KEY,
    creator_id	INT,
    created_date	DATE,
    FOREIGN KEY (creator_id) REFERENCES `account` (id)
);

CREATE TABLE group_account (
	group_id	TINYINT,
    account_id	INT,
    join_date	DATE,
    PRIMARY KEY(group_id, account_id),
	FOREIGN KEY (group_id) REFERENCES `group` (id),
	FOREIGN KEY (account_id) REFERENCES `account` (id)
);

CREATE TABLE type_question (
	id	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `name`	ENUM('(Essay', 'Multiple-Choice')
);

CREATE TABLE category_question (
	id	TINYINT AUTO_INCREMENT PRIMARY KEY,
    name	VARCHAR(50)
);

CREATE TABLE question (
	id	TINYINT AUTO_INCREMENT PRIMARY KEY,
    content	VARCHAR(2000),
    type_question_id	TINYINT UNIQUE KEY,
    category_id	TINYINT UNIQUE KEY,
    creator_id	INT,
    created_date	DATE,
    FOREIGN KEY (type_question_id) REFERENCES type_question (id),
    FOREIGN KEY (category_id) REFERENCES category_question (id),
    FOREIGN KEY (creator_id) REFERENCES `account` (id)
);

CREATE TABLE answer (
	id	TINYINT AUTO_INCREMENT PRIMARY KEY,
    content	VARCHAR(2000),
    question_id	TINYINT UNIQUE KEY,
    is_correct	ENUM('YES', 'NO'),
    FOREIGN KEY (question_id) REFERENCES question (id)
);

CREATE TABLE exam (
	id	TINYINT AUTO_INCREMENT PRIMARY KEY,
    `code`	TINYINT,
    title	VARCHAR(500),
    category_id	TINYINT,
    duration VARCHAR(500),
    creator_id	INT,
    created_date	DATE,
    FOREIGN KEY (category_id) REFERENCES category_question (id),
    FOREIGN KEY (creator_id) REFERENCES `account` (id)
);

CREATE TABLE exam_question (
	exam_id	TINYINT,
    question_id	TINYINT,
	FOREIGN KEY (exam_id) REFERENCES exam (id),
	FOREIGN KEY (question_id) REFERENCES question (id)
);


-- INSERT DEPARTMENT
------------------------------------------
INSERT INTO `department` (`id`, `name`) VALUES (7, 'adipisci');
INSERT INTO `department` (`id`, `name`) VALUES (1, 'assumenda');
INSERT INTO `department` (`id`, `name`) VALUES (30, 'aut');
INSERT INTO `department` (`id`, `name`) VALUES (15, 'dolorum');
INSERT INTO `department` (`id`, `name`) VALUES (4, 'est');
INSERT INTO `department` (`id`, `name`) VALUES (19, 'eum');
INSERT INTO `department` (`id`, `name`) VALUES (6, 'fuga');
INSERT INTO `department` (`id`, `name`) VALUES (13, 'hic');
INSERT INTO `department` (`id`, `name`) VALUES (24, 'id');
INSERT INTO `department` (`id`, `name`) VALUES (9, 'impedit');
INSERT INTO `department` (`id`, `name`) VALUES (21, 'ipsum');
INSERT INTO `department` (`id`, `name`) VALUES (27, 'libero');
INSERT INTO `department` (`id`, `name`) VALUES (25, 'maiores');
INSERT INTO `department` (`id`, `name`) VALUES (8, 'necessitatibus');
INSERT INTO `department` (`id`, `name`) VALUES (12, 'nesciunt');
INSERT INTO `department` (`id`, `name`) VALUES (26, 'nobis');
INSERT INTO `department` (`id`, `name`) VALUES (11, 'non');
INSERT INTO `department` (`id`, `name`) VALUES (16, 'occaecati');
INSERT INTO `department` (`id`, `name`) VALUES (2, 'optio');
INSERT INTO `department` (`id`, `name`) VALUES (5, 'possimus');
INSERT INTO `department` (`id`, `name`) VALUES (14, 'qui');
INSERT INTO `department` (`id`, `name`) VALUES (20, 'recusandae');
INSERT INTO `department` (`id`, `name`) VALUES (29, 'repellendus');
INSERT INTO `department` (`id`, `name`) VALUES (17, 'sed');
INSERT INTO `department` (`id`, `name`) VALUES (3, 'soluta');
INSERT INTO `department` (`id`, `name`) VALUES (10, 'tempore');
INSERT INTO `department` (`id`, `name`) VALUES (18, 'totam');
INSERT INTO `department` (`id`, `name`) VALUES (28, 'ut');
INSERT INTO `department` (`id`, `name`) VALUES (23, 'vitae');
INSERT INTO `department` (`id`, `name`) VALUES (22, 'voluptatum');
----------------------------------------------


-- INSERT POSITION
---------------------------------------------------
INSERT INTO `position` (`id`, `name`) VALUES (1, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (2, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (3, 'Dev');
INSERT INTO `position` (`id`, `name`) VALUES (4, 'PM');
INSERT INTO `position` (`id`, `name`) VALUES (5, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (6, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (7, 'PM');
INSERT INTO `position` (`id`, `name`) VALUES (8, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (9, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (10, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (11, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (12, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (13, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (14, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (15, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (16, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (17, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (18, 'Dev');
INSERT INTO `position` (`id`, `name`) VALUES (19, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (20, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (21, 'PM');
INSERT INTO `position` (`id`, `name`) VALUES (22, 'PM');
INSERT INTO `position` (`id`, `name`) VALUES (23, 'Test');
INSERT INTO `position` (`id`, `name`) VALUES (24, 'Scrum Master');
INSERT INTO `position` (`id`, `name`) VALUES (25, 'PM');
INSERT INTO `position` (`id`, `name`) VALUES (26, 'Dev');
INSERT INTO `position` (`id`, `name`) VALUES (27, 'PM');
INSERT INTO `position` (`id`, `name`) VALUES (28, 'PM');
INSERT INTO `position` (`id`, `name`) VALUES (29, 'PM');
INSERT INTO `position` (`id`, `name`) VALUES (30, 'Test');
------------------------------------------------------


-- INSERT ACCOUNT
-------------------------------
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (1, 'alessandro18@example.net', 'streich.brendon', 'Prof. Augustus Little Sr.', 1, 1, '1975-12-10');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (2, 'sim92@example.net', 'mkuvalis', 'Douglas Runolfsson', 2, 2, '2007-02-28');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (3, 'xtorp@example.org', 'stanton.linwood', 'Luis Walker', 3, 3, '1998-01-18');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (4, 'marlon95@example.net', 'krajcik.jasper', 'Idella Lemke', 4, 4, '1985-05-31');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (5, 'stefanie31@example.org', 'jkautzer', 'Leilani Gaylord', 5, 5, '1971-01-28');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (6, 'boyle.casimir@example.com', 'efriesen', 'Mrs. Berneice Reynolds', 6, 6, '2013-07-26');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (7, 'candido.monahan@example.com', 'harber.larissa', 'Prof. Riley Larson DVM', 7, 7, '2014-09-03');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (8, 'lola23@example.org', 'bschumm', 'River Johnston', 8, 8, '1970-02-16');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (9, 'green17@example.org', 'fwest', 'Ila Metz III', 9, 9, '2022-11-08');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (10, 'runte.wilmer@example.net', 'casper63', 'Kiarra Nitzsche', 10, 10, '2003-09-19');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (11, 'kara.crona@example.net', 'aliyah79', 'Dr. Justen Homenick DVM', 11, 11, '1972-07-20');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (12, 'allan.schmitt@example.org', 'hvolkman', 'Gia Padberg', 12, 12, '2009-11-09');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (13, 'kailyn.hessel@example.com', 'efren.lakin', 'Dr. Damian Jones', 13, 13, '1982-06-27');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (14, 'thalvorson@example.com', 'iwillms', 'Ms. Isabel O\'Hara MD', 14, 14, '2010-12-17');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (15, 'schaden.kaitlyn@example.net', 'flo.altenwerth', 'Carleton Langosh', 15, 15, '2021-07-19');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (16, 'harber.israel@example.net', 'grady.christopher', 'Timmy Dicki', 16, 16, '1984-10-28');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (17, 'klocko.maeve@example.org', 'carmella.nader', 'Amy Rutherford V', 17, 17, '2013-12-16');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (18, 'zcole@example.com', 'cristopher65', 'Chloe Muller', 18, 18, '1993-12-01');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (19, 'ofranecki@example.net', 'travon.jones', 'Cordia Rodriguez', 19, 19, '1976-05-14');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (20, 'everett16@example.org', 'cormier.santa', 'Emilie Homenick', 20, 20, '2021-10-16');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (21, 'keeling.santos@example.com', 'marcel.fritsch', 'Bobby O\'Kon II', 21, 21, '2011-08-24');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (22, 'terry.diamond@example.net', 'qkling', 'Kameron Larson', 22, 22, '2016-07-20');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (23, 'carson66@example.net', 'chris89', 'Laurence Terry', 23, 23, '1982-05-29');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (24, 'schroeder.ellen@example.net', 'wiley58', 'Uriah Ryan', 24, 24, '1997-02-04');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (25, 'hhowe@example.net', 'howell.cortez', 'Paul Powlowski III', 25, 25, '1975-03-01');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (26, 'lorena84@example.com', 'lyla93', 'Jalon Halvorson', 26, 26, '1997-03-28');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (27, 'icrist@example.net', 'shania.bahringer', 'Dr. Coralie Gusikowski', 27, 27, '1997-09-28');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (28, 'welch.dulce@example.com', 'yasmin28', 'Dexter Wolff', 28, 28, '1981-11-19');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (29, 'frami.devin@example.org', 'bsatterfield', 'Zita Johns DDS', 29, 29, '1996-08-26');
INSERT INTO `account` (`id`, `email`, `username`, `fullname`, `department_id`, `position_id`, `created_date`) VALUES (30, 'hiram.murazik@example.com', 'melba.huels', 'Verner Ward', 30, 30, '1971-08-09');
-------------------------------------------

-- INSERT GROUP
------------------------------------
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (1, 'sit', 1, '1978-01-16');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (2, 'earum', 2, '2008-03-11');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (3, 'ut', 3, '1993-08-12');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (4, 'qui', 4, '1970-01-30');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (5, 'sed', 5, '1987-02-20');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (6, 'iste', 6, '1981-01-12');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (7, 'non', 7, '2012-11-25');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (8, 'est', 8, '1988-09-28');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (9, 'iure', 9, '2001-10-15');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (10, 'veniam', 10, '1986-08-02');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (11, 'quibusdam', 11, '1996-05-15');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (12, 'sint', 12, '1992-12-09');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (13, 'neque', 13, '1980-03-29');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (14, 'et', 14, '1986-12-16');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (15, 'quis', 15, '2019-12-20');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (16, 'exercitationem', 16, '1991-12-03');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (17, 'illum', 17, '1970-02-23');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (18, 'quam', 18, '1994-03-10');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (19, 'aliquam', 19, '2006-12-12');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (20, 'vero', 20, '2015-01-02');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (21, 'nulla', 21, '2022-07-13');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (22, 'dolor', 22, '1992-02-20');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (23, 'laudantium', 23, '1997-10-30');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (24, 'voluptates', 24, '1994-06-13');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (25, 'voluptatem', 25, '2017-07-24');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (26, 'maiores', 26, '2006-11-11');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (27, 'rerum', 27, '2009-07-29');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (28, 'blanditiis', 28, '1993-09-07');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (29, 'voluptas', 29, '2014-10-17');
INSERT INTO `group` (`id`, `name`, `creator_id`, `created_date`) VALUES (30, 'corrupti', 30, '2022-02-08');
------------------------------------

-- INSERT GROUP_ACCOUNT
------------------------------
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (1, 1, '1976-07-16');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (2, 2, '1983-05-05');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (3, 3, '1994-07-12');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (4, 4, '1998-11-30');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (5, 5, '2019-02-04');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (6, 6, '1999-03-20');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (7, 7, '1996-06-10');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (8, 8, '1981-07-30');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (9, 9, '1999-05-20');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (10, 10, '1997-06-04');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (11, 11, '1992-05-20');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (12, 12, '1998-11-14');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (13, 13, '1999-03-17');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (14, 14, '2011-11-01');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (15, 15, '2005-03-30');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (16, 16, '1992-08-13');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (17, 17, '2016-03-27');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (18, 18, '2019-02-01');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (19, 19, '2018-09-09');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (20, 20, '1981-03-21');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (21, 21, '1997-05-09');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (22, 22, '2020-08-14');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (23, 23, '1997-07-08');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (24, 24, '2002-07-04');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (25, 25, '2009-01-21');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (26, 26, '1993-03-30');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (27, 27, '2022-11-13');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (28, 28, '1972-03-29');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (29, 29, '1991-11-03');
INSERT INTO `group_account` (`group_id`, `account_id`, `join_date`) VALUES (30, 30, '2000-02-27');
----------------------------------------------------------

-- INSERT TYPE_QUESTION
-----------------------------------------
INSERT INTO `type_question` (`id`, `name`) VALUES (1, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (2, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (3, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (4, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (5, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (6, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (7, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (8, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (9, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (10, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (11, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (12, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (13, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (14, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (15, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (16, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (17, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (18, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (19, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (20, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (21, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (22, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (23, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (24, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (25, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (26, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (27, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (28, '(Essay');
INSERT INTO `type_question` (`id`, `name`) VALUES (29, 'Multiple-Choice');
INSERT INTO `type_question` (`id`, `name`) VALUES (30, 'Multiple-Choice');
------------------------------------------------

-- INSERT CATEGORY_QUESTION
--------------------------------------------
INSERT INTO `category_question` (`id`, `name`) VALUES (1, 'consequatur');
INSERT INTO `category_question` (`id`, `name`) VALUES (2, 'omnis');
INSERT INTO `category_question` (`id`, `name`) VALUES (3, 'ex');
INSERT INTO `category_question` (`id`, `name`) VALUES (4, 'tempore');
INSERT INTO `category_question` (`id`, `name`) VALUES (5, 'nam');
INSERT INTO `category_question` (`id`, `name`) VALUES (6, 'omnis');
INSERT INTO `category_question` (`id`, `name`) VALUES (7, 'ad');
INSERT INTO `category_question` (`id`, `name`) VALUES (8, 'voluptatem');
INSERT INTO `category_question` (`id`, `name`) VALUES (9, 'alias');
INSERT INTO `category_question` (`id`, `name`) VALUES (10, 'deserunt');
INSERT INTO `category_question` (`id`, `name`) VALUES (11, 'quasi');
INSERT INTO `category_question` (`id`, `name`) VALUES (12, 'beatae');
INSERT INTO `category_question` (`id`, `name`) VALUES (13, 'est');
INSERT INTO `category_question` (`id`, `name`) VALUES (14, 'autem');
INSERT INTO `category_question` (`id`, `name`) VALUES (15, 'odio');
INSERT INTO `category_question` (`id`, `name`) VALUES (16, 'enim');
INSERT INTO `category_question` (`id`, `name`) VALUES (17, 'et');
INSERT INTO `category_question` (`id`, `name`) VALUES (18, 'reprehenderit');
INSERT INTO `category_question` (`id`, `name`) VALUES (19, 'sit');
INSERT INTO `category_question` (`id`, `name`) VALUES (20, 'hic');
INSERT INTO `category_question` (`id`, `name`) VALUES (21, 'officia');
INSERT INTO `category_question` (`id`, `name`) VALUES (22, 'nam');
INSERT INTO `category_question` (`id`, `name`) VALUES (23, 'qui');
INSERT INTO `category_question` (`id`, `name`) VALUES (24, 'voluptatum');
INSERT INTO `category_question` (`id`, `name`) VALUES (25, 'ipsam');
INSERT INTO `category_question` (`id`, `name`) VALUES (26, 'iste');
INSERT INTO `category_question` (`id`, `name`) VALUES (27, 'ipsum');
INSERT INTO `category_question` (`id`, `name`) VALUES (28, 'tempora');
INSERT INTO `category_question` (`id`, `name`) VALUES (29, 'sunt');
INSERT INTO `category_question` (`id`, `name`) VALUES (30, 'maiores');
---------------------------------------------

-- INSERT QUESTION
---------------------------------------------
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (1, 'Facere nam rerum non. Tempore hic earum eligendi necessitatibus. Sit eaque sit ipsum quia quia.', 1, 1, 1, '1986-02-16');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (2, 'Velit minus neque sed impedit et aut aspernatur. Nihil iusto autem sapiente nihil.\nAt est hic saepe ab fugiat ut sapiente. Doloremque possimus aut libero.', 2, 2, 2, '1979-01-07');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (3, 'Ullam quam aut pariatur repellat. Ea laborum quisquam necessitatibus alias animi odio dolor. Error quod voluptatem sed laborum quas minima quae aut. Nihil recusandae vero sint ad magnam sequi est.', 3, 3, 3, '2015-12-26');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (4, 'Quasi facere quos non facilis. Laboriosam sint qui et voluptatibus excepturi occaecati.', 4, 4, 4, '1992-10-31');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (5, 'Ut nobis assumenda sunt nihil. Voluptatibus reiciendis voluptatem tempora maiores. Voluptas error quo magnam et.', 5, 5, 5, '2008-08-11');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (6, 'Aut voluptas nostrum est et. Debitis velit et dolores quae repellat repellat rerum.', 6, 6, 6, '1972-04-17');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (7, 'Quam et consequatur magni eligendi. Asperiores saepe distinctio placeat animi quod. Aut dolores eos dolorem.', 7, 7, 7, '1975-07-22');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (8, 'Necessitatibus ab et consequuntur et nisi ut facere. Voluptas culpa magni sed.\nSaepe quibusdam eius rerum eos est deleniti quaerat. Sit iure sint sint sed dolorem itaque aut.', 8, 8, 8, '1993-05-19');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (9, 'Repellat soluta quis pariatur voluptas pariatur ad quod. Molestias tenetur qui non ea et quae.', 9, 9, 9, '2020-02-06');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (10, 'Voluptatem et omnis possimus magnam. Tenetur illum sequi non eum repellat est in. Veritatis autem ea architecto voluptatem nesciunt magnam ut. Earum laudantium qui labore dolor est consequatur sunt.', 10, 10, 10, '1983-06-10');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (11, 'Ipsum quo nobis et maxime. Nostrum nulla quibusdam sit. Perferendis illum rerum debitis quas. Iste aut quisquam vel non quae reiciendis.', 11, 11, 11, '1982-09-16');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (12, 'Quaerat quam error atque eveniet sed. Facere illo perferendis ut velit consequatur quo. Eaque repellat eligendi quisquam rem quis aut.', 12, 12, 12, '1993-04-19');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (13, 'Minima accusamus nihil aut. Illo delectus qui aut vel officiis consequatur. Quo beatae omnis repudiandae voluptatum iste. Temporibus illum est ut consectetur.', 13, 13, 13, '2006-04-15');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (14, 'Corporis et quisquam mollitia. Aut quis distinctio aut porro cumque necessitatibus minima.\nRerum non quia vel. Autem sapiente assumenda hic porro. Doloremque quos et reiciendis.', 14, 14, 14, '1983-12-11');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (15, 'Et alias officia aut et. Rem non exercitationem aliquam aliquam. Quidem quia cumque ab est enim. Officiis rerum reprehenderit quae quas.', 15, 15, 15, '1999-11-06');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (16, 'Expedita suscipit blanditiis omnis accusantium velit provident aliquid. Sit quod consequuntur quod. Soluta quisquam est aut dolorem tenetur quia et earum.', 16, 16, 16, '2017-08-24');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (17, 'Cumque corporis nostrum quae impedit ad. Unde hic ea debitis explicabo. Eum a quo molestiae nihil officiis et. Porro consequuntur nemo quisquam maxime odit numquam qui sed.', 17, 17, 17, '2003-07-05');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (18, 'Molestiae aut magni sit eos. Et quo magnam tenetur vel atque dolore. Magni voluptas perspiciatis quia sapiente ex.', 18, 18, 18, '2009-03-11');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (19, 'In odit aperiam rem cumque alias. Voluptas dolorem neque aperiam excepturi aut voluptates. Illum qui incidunt numquam harum in nihil explicabo exercitationem. Rem omnis et sit porro.', 19, 19, 19, '2001-07-17');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (20, 'Et ex repudiandae explicabo fuga rerum et. Molestiae ea aliquid illum provident est ad. Dolores qui numquam itaque perferendis deleniti.', 20, 20, 20, '1981-10-27');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (21, 'Excepturi delectus voluptas quam sed cumque ut rem eum. Non accusamus ut molestias aut sit dolores.', 21, 21, 21, '2021-05-18');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (22, 'Reprehenderit sed rem adipisci. Id voluptas a ipsam culpa necessitatibus. Excepturi illum cum qui quia. Cum doloremque qui cupiditate hic nam dolores.', 22, 22, 22, '1976-07-18');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (23, 'Accusamus amet blanditiis aliquam aliquid quo. Ipsam commodi voluptatem possimus voluptatem quis eos. Repudiandae corporis vel fugit quibusdam iste.', 23, 23, 23, '2014-09-28');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (24, 'Non nesciunt vero aperiam laboriosam qui aspernatur. Optio ex soluta id culpa aut.\nId maxime rem qui incidunt. Minima tempora voluptatibus rem ut. Quia laborum in error provident labore.', 24, 24, 24, '2014-02-21');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (25, 'Excepturi in occaecati culpa vero. Molestiae perferendis nostrum quos consequatur et. Officiis est asperiores voluptatem quis assumenda officiis ab.', 25, 25, 25, '1986-08-14');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (26, 'Sequi consequuntur cupiditate aut. Et perferendis impedit ut consequatur tempora. Reprehenderit molestias modi doloribus.', 26, 26, 26, '2021-07-29');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (27, 'Et voluptatem autem eligendi necessitatibus quibusdam. Qui omnis dolorem numquam inventore numquam voluptas ab. Perferendis et voluptates quia mollitia pariatur quasi quibusdam.', 27, 27, 27, '2001-04-13');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (28, 'Et autem nisi debitis adipisci rerum est dolor. Quis velit quia aut. Cum magni ullam labore unde modi velit.', 28, 28, 28, '2012-12-07');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (29, 'Id temporibus totam soluta. Tempore neque provident ut ut et omnis quas. Et et qui non a aperiam. Ut esse qui ut.', 29, 29, 29, '2000-09-26');
INSERT INTO `question` (`id`, `content`, `type_question_id`, `category_id`, `creator_id`, `created_date`) VALUES (30, 'Explicabo rerum a ducimus qui. Iusto sunt dolor ducimus. Iste sint debitis qui sunt aut. Dolor repellat nihil esse laboriosam.', 30, 30, 30, '1990-02-14');
---------------------------------------------------

-- INSERT ANSWER
----------------------------------------------------
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (1, 'Qui nam harum et consectetur numquam ut. Sit aut dolorem molestias id. Omnis non voluptate dolores officiis est. Ducimus animi beatae mollitia soluta et enim nulla.', 1, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (2, 'Deleniti fugiat tempora nobis. Ea quaerat illo natus. Sequi porro sunt dolor id praesentium aut et. Amet exercitationem corporis consequatur distinctio.', 2, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (3, 'Quaerat non blanditiis dolorum omnis. Qui qui minima hic et aspernatur nisi quidem.\nUt aut consectetur architecto voluptatibus. Voluptas qui ut quo iure dolore minima.', 3, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (4, 'Id quidem sit sed blanditiis iure tempore quia. Enim beatae omnis id libero non doloribus. Cumque aut occaecati itaque iure et id.', 4, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (5, 'Iusto quis ut quam adipisci iusto sunt officia. Tempore vero tempora nihil voluptates perspiciatis.', 5, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (6, 'Harum doloremque voluptates quod et aut voluptatum similique. Nihil qui dolores voluptas. Vero a dicta rem quibusdam. Assumenda inventore impedit nihil harum ea ex voluptatem.', 6, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (7, 'Minima et inventore molestias officiis. Mollitia atque ipsum enim ut consequatur. Possimus nisi quasi non et qui officiis.', 7, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (8, 'Qui rerum itaque nobis incidunt esse in nihil perferendis. Dolor id tempore placeat ipsum rem. Iste non cum a.', 8, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (9, 'Repellat incidunt culpa atque iste eaque. Sit aliquid voluptatem eos dolore explicabo. Quam deleniti dolorem repellat quis hic. Voluptatem sit eius ea aut ut nihil.', 9, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (10, 'Asperiores eos mollitia dolore eligendi. Sit consequuntur vitae necessitatibus quam occaecati dolorem.', 10, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (11, 'Dolor ad iure sit eum ut laudantium nemo. Voluptatem aspernatur fuga non.', 11, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (12, 'Est quia rem rem vel quia dolores quo veniam. Aspernatur delectus quas ratione dolores. Autem laudantium sit maxime. Maxime corrupti sed hic. Expedita optio quia sit.', 12, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (13, 'Accusamus eaque et ab. Consectetur praesentium voluptate accusamus commodi iusto sit omnis eius. Illum dolorem corrupti totam dignissimos maxime.', 13, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (14, 'Eveniet iure rerum porro voluptatem vel rerum ullam iusto. Eius debitis autem eligendi asperiores autem expedita sed rem. Eum exercitationem nihil quaerat deserunt.', 14, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (15, 'Amet quisquam voluptas ut et. Cum qui minima nisi dignissimos reiciendis qui. Cumque quia itaque est sequi sapiente molestiae. Voluptatibus possimus facilis sint voluptas earum.', 15, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (16, 'Ut cum fugiat est corrupti doloremque ex. Rerum eos totam omnis labore delectus accusantium. Labore aut ea magni est et. Eaque mollitia voluptatem autem mollitia minus.', 16, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (17, 'Distinctio sit nulla cupiditate odit harum. Tempora nemo sit quia consequatur sunt. Nam in id totam assumenda distinctio.', 17, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (18, 'Ex aut velit quia rerum qui aspernatur consequuntur. Voluptates placeat rerum facere voluptate vel in quaerat. Consequatur magnam facere nostrum doloribus sed.', 18, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (19, 'Expedita qui non molestias deleniti excepturi sunt. Quibusdam est eius quod nobis temporibus doloribus. Fuga expedita dolorum est iste qui et.', 19, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (20, 'Neque enim dignissimos cumque quas eveniet. Aut et est et omnis dolorem. Non minus eveniet architecto voluptatem nemo. Illum dolorem id quam aut voluptatem.', 20, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (21, 'Hic ut qui dignissimos quis nulla similique quo. Rerum quia voluptatem harum facere velit explicabo. Dolores aut nihil officia et iusto aperiam fuga.', 21, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (22, 'Autem esse facilis unde ut et ut. Aliquam quis et quo illo. Facilis et culpa commodi eos aut deserunt iste nemo. Praesentium consectetur voluptatum quibusdam sit dolorem id.', 22, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (23, 'Sint ut id saepe ut. Voluptate ratione cumque quia sit accusamus. Laudantium quisquam quo ratione ut. Provident ab tenetur iste ea illum nam earum.', 23, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (24, 'Nostrum maiores labore adipisci. Ut delectus ea animi et aut provident. Iusto dicta nihil odit nihil. Dolores quibusdam quod quo sit ad nemo minus sapiente.', 24, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (25, 'Ut quia dolores omnis. Laborum eligendi rerum rerum saepe nulla nulla nemo. Doloremque eaque qui qui commodi velit voluptatem quo.', 25, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (26, 'Ea eum doloremque quibusdam non. Delectus est aut doloribus facere consequatur quia temporibus. Laborum vero delectus dolor recusandae sed.', 26, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (27, 'Ut qui dolor possimus non repellat eligendi. Unde et id reiciendis deserunt. Ut error ab dolor sit recusandae. Explicabo veritatis sapiente in nobis autem.', 27, 'YES');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (28, 'Corporis minima sunt aut occaecati quam fugit aliquid ut. Ut dicta qui ipsa non suscipit suscipit. Unde sed reiciendis occaecati rerum.', 28, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (29, 'Dolores sit perferendis pariatur sed omnis. Optio corporis dolorem ratione est laboriosam sed. Nihil rerum laboriosam quae.', 29, 'NO');
INSERT INTO `answer` (`id`, `content`, `question_id`, `is_correct`) VALUES (30, 'Qui iure et asperiores pariatur nobis. Aliquid occaecati consequatur asperiores sed repellendus dignissimos. Libero molestiae quibusdam eveniet possimus accusantium corporis.', 30, 'NO');
----------------------------------------------------

-- INSERT EXAM
---------------------------------------------------
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (1, 0, 'Vero et debitis qui nemo.', 1, NULL, 1, '2010-01-03');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (2, 0, 'Quos ipsum et quia sed dolorum eaque velit.', 2, NULL, 2, '2010-03-18');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (3, 0, 'Neque id quibusdam molestiae quidem officiis iste aspernatur.', 3, NULL, 3, '1995-02-10');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (4, 0, 'Ipsum dolorem magni consequatur velit ad eius.', 4, NULL, 4, '1977-08-14');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (5, 0, 'Iste mollitia facere doloremque nesciunt amet.', 5, NULL, 5, '1998-07-13');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (6, 0, 'Id qui incidunt occaecati voluptatibus cumque rerum.', 6, NULL, 6, '2013-12-13');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (7, 0, 'Accusantium consequatur consequatur dolore.', 7, NULL, 7, '2017-04-27');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (8, 0, 'Maiores consectetur maxime cumque est natus.', 8, NULL, 8, '1980-09-09');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (9, 0, 'Aut mollitia eius voluptatem perferendis magni nesciunt similique.', 9, NULL, 9, '1980-12-23');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (10, 0, 'Soluta accusamus vel quisquam cumque culpa.', 10, NULL, 10, '2021-12-07');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (11, 0, 'Autem accusamus nostrum amet eius ipsa.', 11, NULL, 11, '2007-09-01');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (12, 0, 'Iure itaque quia incidunt architecto facilis quasi.', 12, NULL, 12, '1992-05-27');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (13, 0, 'Aspernatur eligendi explicabo consequuntur quos voluptatem.', 13, NULL, 13, '1993-10-08');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (14, 0, 'Aperiam molestiae sed facere omnis ut velit.', 14, NULL, 14, '1978-09-15');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (15, 0, 'Aut ea quia repellat nam blanditiis.', 15, NULL, 15, '1971-01-27');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (16, 0, 'Placeat dolore voluptatum non beatae quis veritatis placeat eligendi.', 16, NULL, 16, '1981-05-03');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (17, 0, 'Quia ea praesentium veritatis enim beatae.', 17, NULL, 17, '2007-04-06');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (18, 0, 'Eum et beatae quaerat dolorem voluptates quod ea.', 18, NULL, 18, '2013-08-01');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (19, 0, 'Nulla fugiat sed nobis vel.', 19, NULL, 19, '1977-06-13');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (20, 0, 'Quasi fugiat qui sed repellat.', 20, NULL, 20, '1993-03-19');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (21, 0, 'Perferendis quod sint id.', 21, NULL, 21, '1995-08-28');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (22, 0, 'Sequi aut quidem id esse dolor molestiae nihil.', 22, NULL, 22, '2013-09-17');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (23, 0, 'Ipsa aut optio eligendi reprehenderit dignissimos minus recusandae nesciunt.', 23, NULL, 23, '2013-10-01');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (24, 0, 'Aut deserunt tempore eum dolorem minima qui qui.', 24, NULL, 24, '1984-04-24');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (25, 0, 'Odio libero autem hic ut alias vitae odit reprehenderit.', 25, NULL, 25, '1984-08-22');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (26, 0, 'Nemo omnis velit ipsum ut eius dolor debitis.', 26, NULL, 26, '1976-02-10');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (27, 0, 'Repellat iste aut dolor nihil.', 27, NULL, 27, '1974-06-11');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (28, 0, 'Natus cupiditate odit beatae sequi.', 28, NULL, 28, '2012-07-22');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (29, 0, 'Voluptates omnis fugiat repellat eaque.', 29, NULL, 29, '1970-11-08');
INSERT INTO `exam` (`id`, `code`, `title`, `category_id`, `duration`, `creator_id`, `created_date`) VALUES (30, 0, 'Beatae in quaerat occaecati fuga.', 30, NULL, 30, '1979-12-04');
-------------------------------------------------------------

-- INSERT EXAM_QUESTION
------------------------------
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (1, 1);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (2, 2);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (3, 3);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (4, 4);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (5, 5);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (6, 6);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (7, 7);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (8, 8);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (9, 9);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (10, 10);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (11, 11);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (12, 12);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (13, 13);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (14, 14);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (15, 15);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (16, 16);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (17, 17);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (18, 18);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (19, 19);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (20, 20);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (21, 21);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (22, 22);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (23, 23);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (24, 24);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (25, 25);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (26, 26);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (27, 27);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (28, 28);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (29, 29);
INSERT INTO `exam_question` (`exam_id`, `question_id`) VALUES (30, 30);
--------------------------------

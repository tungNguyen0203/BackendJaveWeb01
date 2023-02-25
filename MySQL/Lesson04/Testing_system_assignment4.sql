DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

-- create table 1: department
CREATE TABLE department(
	id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`name` 			VARCHAR(50) UNIQUE KEY NOT NULL
);

-- create table 2: Position
CREATE TABLE `position` (
	id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`name` 			ENUM('Dev', 'Test', 'Scrum Master', 'PM') UNIQUE KEY NOT NULL
);

-- create table 3: account
CREATE TABLE `account` (
	id 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	email 			VARCHAR(50) UNIQUE KEY,
	username		VARCHAR(50) UNIQUE KEY NOT NULL,
	fullname 		NVARCHAR(50) NOT NULL,
	department_id	TINYINT UNSIGNED NOT NULL,
	position_id		TINYINT UNSIGNED NOT NULL DEFAULT 1,
	created_date	DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (position_id) REFERENCES `position`(id)
);

-- create table 4: group
CREATE TABLE `group`(
	id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`name` 			VARCHAR(50) UNIQUE KEY NOT NULL,
	creator_id		SMALLINT UNSIGNED NOT NULL,
	created_date	DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (creator_id) REFERENCES `account`(id)
);

-- create table 5: group_account
CREATE TABLE group_account (
	group_id 		TINYINT UNSIGNED NOT NULL,
	account_id 		SMALLINT UNSIGNED NOT NULL,
	join_date		DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(group_id, account_id),
    FOREIGN KEY (group_id) REFERENCES `group`(id),
    FOREIGN KEY (account_id) REFERENCES `account`(id)
);

-- create table 6: type_question
CREATE TABLE type_question (
	id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`name` 			ENUM('Essay', 'Multiple-Choice') UNIQUE KEY NOT NULL
);

-- create table 7: category_question
CREATE TABLE category_question (
	id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`name` 			VARCHAR(50) UNIQUE KEY NOT NULL
);

-- create table 8: question
CREATE TABLE question (
	id					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	content				TEXT NOT NULL,
    type_question_id	TINYINT UNSIGNED NOT NULL DEFAULT 2,
	category_id			TINYINT UNSIGNED NOT NULL,
	creator_id			SMALLINT UNSIGNED NOT NULL,
	created_date		DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (type_question_id) REFERENCES type_question(id),
    FOREIGN KEY (category_id) REFERENCES category_question(id),
    FOREIGN KEY (creator_id) REFERENCES `account`(id)
);

-- create table 9: answer
CREATE TABLE answer (
	id	 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	content				TEXT NOT NULL,
    question_id			SMALLINT UNSIGNED NOT NULL,
    is_correct			BIT NOT NULL DEFAULT 0, -- 0: sai, 1: đúng
    FOREIGN KEY (question_id) REFERENCES `question`(id)
);

-- create table 10: exam
CREATE TABLE exam (
	id	 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`code`				CHAR(10) UNIQUE KEY NOT NULL,
    title				VARCHAR(200) NOT NULL,
    category_id			TINYINT UNSIGNED NOT NULL,
    duration			TINYINT UNSIGNED NOT NULL DEFAULT 30,
    creator_id			SMALLINT UNSIGNED NOT NULL,
    created_date		DATETIME NOT NULL DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES category_question(id),
    FOREIGN KEY (creator_id) REFERENCES `account`(id)
);

-- create table 11: exam_question
CREATE TABLE exam_question (
	exam_id	 			SMALLINT UNSIGNED NOT NULL,
	question_id			SMALLINT UNSIGNED NOT NULL,
	PRIMARY KEY(exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES exam(id),
    FOREIGN KEY (question_id) REFERENCES `question`(id)
);
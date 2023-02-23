DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

-- create table	
CREATE TABLE department (
	id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`	VARCHAR(50) UNIQUE KEY NOT NULL
);
CREATE TABLE position (
	id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`	ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL
);
CREATE TABLE `account` (
	id	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email	VARCHAR(500) UNIQUE KEY NOT NULL,
    username	VARCHAR(50) UNIQUE KEY NOT NULL,
    fullname	VARCHAR(50) NOT NULL,
    department_id	TINYINT UNSIGNED NOT NULL,
    position_id		TINYINT UNSIGNED NOT NULL,
    created_date	DATETIME DEFAULT NOW(),
    FOREIGN KEY (department_id) REFERENCES department (id),
    FOREIGN KEY (position_id) REFERENCES `position` (id)
);
CREATE TABLE `group` (
	id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`	VARCHAR(50) UNIQUE KEY NOT NULL,
    creator_id	INT UNSIGNED NOT NULL,
    created_date	DATETIME DEFAULT NOW(),
    FOREIGN KEY (creator_id) REFERENCES `account` (id)
);

CREATE TABLE group_account (
	group_id	TINYINT UNSIGNED NOT NULL,
    account_id	INT UNSIGNED NOT NULL,
    join_date	DATETIME DEFAULT NOW(),
    PRIMARY KEY(group_id, account_id),
	FOREIGN KEY (group_id) REFERENCES `group` (id),
	FOREIGN KEY (account_id) REFERENCES `account` (id)
);

CREATE TABLE type_question (
	id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`	ENUM('Essay', 'Multiple-Choice')
);

CREATE TABLE category_question (
	id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`	VARCHAR(50) NOT NULL
);

CREATE TABLE question (
	id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content	TEXT(2000),
    type_question_id	TINYINT UNSIGNED NOT NULL,
    category_id	TINYINT UNSIGNED NOT NULL,
    creator_id	INT UNSIGNED NOT NULL,
    created_date	DATETIME DEFAULT NOW(),
    FOREIGN KEY (type_question_id) REFERENCES type_question (id),
    FOREIGN KEY (category_id) REFERENCES category_question (id),
    FOREIGN KEY (creator_id) REFERENCES `account` (id)
);

CREATE TABLE answer (
	id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content	TEXT(2000),
    question_id	TINYINT UNSIGNED NOT NULL,
    is_correct	ENUM('YES', 'NO') NOT NULL,
    FOREIGN KEY (question_id) REFERENCES question (id)
);

CREATE TABLE exam (
	id	TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code`	TINYINT UNSIGNED UNIQUE KEY NOT NULL,
    title	VARCHAR(500) NOT NULL,
    category_id	TINYINT UNSIGNED NOT NULL,
    duration TINYINT UNSIGNED,
    creator_id	INT UNSIGNED NOT NULL,
    created_date	DATETIME DEFAULT NOW(),
    FOREIGN KEY (category_id) REFERENCES category_question (id),
    FOREIGN KEY (creator_id) REFERENCES `account` (id)
);


CREATE TABLE exam_question (
	exam_id	TINYINT UNSIGNED NOT NULL,
    question_id	TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY	(exam_id, question_id),
	FOREIGN KEY (exam_id) REFERENCES exam (id),
	FOREIGN KEY (question_id) REFERENCES question (id)
);

DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

-- create table: Project
CREATE TABLE project(
	id				TINYINT UNSIGNED AUTO_INCREMENT, 
    `name`			VARCHAR(50),
    member_size		TINYINT DEFAULT 0,
    manager_id		SMALLINT UNSIGNED DEFAULT NULL,
    created_date	DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(id)
);

-- create table: department
CREATE TABLE department(
	id 				TINYINT UNSIGNED AUTO_INCREMENT,
	`name` 			VARCHAR(50)NOT NULL,
	member_size		TINYINT DEFAULT 0,
	created_date	DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(id)
);

-- create table: User
CREATE TABLE `user` (
	id 				SMALLINT UNSIGNED AUTO_INCREMENT,
	username		VARCHAR(50) NOT NULL,
    `password`		VARCHAR(50) NOT NULL,
	department_id	TINYINT UNSIGNED,
    fullname 		NVARCHAR(50) NOT NULL,
    phone			VARCHAR(50) NOT NULL,
    email			VARCHAR(50) NOT NULL,
	project_id		TINYINT UNSIGNED DEFAULT NULL,  
	created_date	DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(id),
    UNIQUE KEY(username, phone, email),
    FOREIGN KEY (department_id) REFERENCES department(id)ON DELETE SET NULL,
    FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE SET NULL
);

-- create table: Employee
CREATE TABLE employee (
	user_id			SMALLINT UNSIGNED,
    proskill		VARCHAR(50),
    PRIMARY KEY(user_id),
    FOREIGN KEY (user_id) REFERENCES `user`(id) ON DELETE CASCADE
);
-- create table: Manager
CREATE TABLE manager (
	user_id			SMALLINT UNSIGNED,
    exp_in_year		TINYINT DEFAULT 1,
	PRIMARY KEY(user_id),
    FOREIGN KEY (user_id) REFERENCES `user`(id) ON DELETE CASCADE
);

-- FOREIGN KEY project
ALTER TABLE project
ADD FOREIGN KEY(manager_id) REFERENCES `user`(id) ON DELETE SET NULL;		



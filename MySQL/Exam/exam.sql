DROP DATABASE IF EXISTS exam;
CREATE DATABASE exam;
USE exam;

CREATE TABLE customer(
	id 		SMALLINT UNSIGNED AUTO_INCREMENT,
    `name`	VARCHAR(100) NOT NULL,
    phone	VARCHAR(50) NOT NULL,
	email	VARCHAR(50),
    address	VARCHAR(1000) NOT NULL,
    note	TEXT,
    PRIMARY KEY(id),
    UNIQUE KEY (phone, email)
);

CREATE TABLE car(
	id		SMALLINT UNSIGNED AUTO_INCREMENT,
    maker	ENUM('HONDA', 'TOYOTA', 'NISSAN'),
    model	VARCHAR(100),
    rear	DATE,
    color	VARCHAR(50),
    note	TEXT,
    PRIMARY KEY(id),
    UNIQUE KEY(model)
);

CREATE TABLE car_order(
	id					SMALLINT UNSIGNED AUTO_INCREMENT,
    customer_id			SMALLINT UNSIGNED NOT NULL,
    car_id				SMALLINT UNSIGNED NOT NULL,
    amount				INT UNSIGNED NOT NULL DEFAULT 1,
    sale_price			INT UNSIGNED NOT NULL,
    order_date			DATETIME, -- them trigger khi insert
    delivery_date		DATETIME NOT NULL,
    delivery_address	TEXT NOT NULL,
    staus				VARCHAR(50) DEFAULT 0, -- 0: Đã đặt hàng, 1: đã giao, 2: đã hủy
    note				TEXT,
	PRIMARY KEY(id),
    FOREIGN KEY(car_id) REFERENCES car(id),
    FOREIGN KEY(customer_id) REFERENCES customer(id)
);

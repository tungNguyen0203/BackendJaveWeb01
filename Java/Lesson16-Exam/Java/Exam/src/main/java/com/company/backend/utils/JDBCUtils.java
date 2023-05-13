package com.company.backend.utils;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class JDBCUtils {

	private Connection connection;

	public Connection getConnection() {// check điều kiện có đóng kết nối chưa hoặc = null thì kết nối chưa thành công
		try {
			if (connection == null || connection.isClosed()) {
				initConnection();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return connection;
	}

	private void initConnection() {// Kết nối với sql
		try {
			Properties properties = new Properties();
			properties.load(new FileInputStream("src/main/resource/database.properties"));

			Class.forName("com.mysql.cj.jdbc.Driver");

			connection = DriverManager.getConnection(properties.getProperty("url"), properties.getProperty("username"),
					properties.getProperty("password"));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void closeConnection() {// dùng để đóng kết nối
		try {
			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

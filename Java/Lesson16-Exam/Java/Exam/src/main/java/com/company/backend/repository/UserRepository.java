package com.company.backend.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.company.backend.entity.Department;
import com.company.backend.entity.Project;
import com.company.backend.entity.User;
import com.company.backend.utils.JDBCUtils;

public class UserRepository {
	
	private JDBCUtils jdbc;

	public UserRepository() {
		jdbc = new JDBCUtils();
	}
	
	public List<User> getAllUsers() throws SQLException {

		List<User> users = new ArrayList<>();

		// b2: Tạo câu lệnh sql dạng String, thông qua Statement để thực hiện câu lệnh
		String sql = "SELECT u.id, u.username, d.`name` AS department_name, u.fullname, u.phone, u.email, p.`name` AS project_name, uj.fullname AS fullname_manager \r\n"
				+ "FROM `user` u\r\n"
				+ "LEFT JOIN project p ON p.id = u.project_id\r\n"
				+ "LEFT JOIN department d ON d.id = u.department_id\r\n"
				+ "LEFT JOIN `user` uj ON uj.id = p.manager_id\r\n"
				+ "ORDER BY u.created_date DESC";
		
		Statement statement = jdbc.getConnection().createStatement();

		// b3: thực hiện câu lệnh SQL
		ResultSet resultSet = statement.executeQuery(sql);

		// b4: format lại dữ liệu trả về
		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String fullname = resultSet.getString("fullname");
			String phone = resultSet.getString("phone");
			String email = resultSet.getString("email");
			String username = resultSet.getString("username");
			Department departmentName = new Department(resultSet.getString("department_name"));
			Project projectName = new Project(resultSet.getString("project_name"));
			String fullnameManager = resultSet.getString("fullname_manager");

			users.add(new User(id, fullname, phone, email, username, departmentName, projectName, fullnameManager));
		}

		jdbc.closeConnection();

		return users;
	}
	
	public List<User> getAllUserByDepartmentId(int departmentId) throws SQLException {

		List<User> users = new ArrayList<>();
		
		String sql = "SELECT u.id, u.username, d.`name` AS department_name, u.fullname, u.phone, u.email, p.`name` AS project_name, uj.fullname AS fullname_manager\r\n"
				+ "FROM `user` u\r\n"
				+ "LEFT JOIN project p ON p.id = u.project_id\r\n"
				+ "LEFT JOIN department d ON d.id = u.department_id\r\n"
				+ "LEFT JOIN `user` uj ON uj.id = p.manager_id\r\n"
				+ "WHERE d.id = ?\r\n"
				+ "ORDER BY department_name ASC;";
		
		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sql);
		
		preparedStatement.setInt(1, departmentId);

		
		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String fullname = resultSet.getString("fullname");
			String phone = resultSet.getString("phone");
			String email = resultSet.getString("email");
			String username = resultSet.getString("username");
			Department departmentName = new Department(resultSet.getString("department_name"));
			Project projectName = new Project(resultSet.getString("project_name"));
			String fullnameManager = resultSet.getString("fullname_manager");

			users.add(new User(id, fullname, phone, email, username, departmentName, projectName, fullnameManager));
		}

		jdbc.closeConnection();

		return users;
	}
	
	public List<User> searchUser(String keyword) throws SQLException {

		List<User> users = new ArrayList<>();
		
		String sql = "SELECT u.id, u.username, d.`name` AS department_name, u.fullname, u.phone, u.email, p.`name` AS project_name, uj.fullname AS fullname_manager\r\n"
				+ "FROM `user` u\r\n"
				+ "LEFT JOIN project p ON p.id = u.project_id\r\n"
				+ "LEFT JOIN department d ON d.id = u.department_id\r\n"
				+ "LEFT JOIN `user` uj ON uj.id = p.manager_id\r\n"
				+ "WHERE d.`name` LIKE ? OR p.`name` LIKE ? OR u.fullname LIKE ? OR u.phone LIKE ? OR u.email LIKE ? OR u.username LIKE ?";
		
		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sql);
		
		preparedStatement.setString(1, "%" + keyword + "%");
		preparedStatement.setString(2, "%" + keyword + "%");
		preparedStatement.setString(3, "%" + keyword + "%");
		preparedStatement.setString(4, "%" + keyword + "%");
		preparedStatement.setString(5, "%" + keyword + "%");
		preparedStatement.setString(6, "%" + keyword + "%");
		
		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String fullname = resultSet.getString("fullname");
			String phone = resultSet.getString("phone");
			String email = resultSet.getString("email");
			String username = resultSet.getString("username");
			Department departmentName = new Department(resultSet.getString("department_name"));
			Project projectName = new Project(resultSet.getString("project_name"));
			String fullnameManager = resultSet.getString("fullname_manager");

			users.add(new User(id, fullname, phone, email, username, departmentName, projectName, fullnameManager));
		}

		jdbc.closeConnection();

		return users;
	}
	
	public User login(String usernameLogin, String passwordLogin) throws SQLException {
		
		String sql = "SELECT u.id, u.username, d.`name` AS department_name, u.fullname, u.phone, u.email, p.`name` AS project_name, uj.fullname AS fullname_manager, m.user_id AS idManager, d.id AS department_id, d.member_size AS de_mem_size, p.id AS project_id, p.member_size AS pr_mem_size\r\n"
				+ "FROM `user` u\r\n"
				+ "LEFT JOIN project p ON p.id = u.project_id\r\n"
				+ "LEFT JOIN department d ON d.id = u.department_id\r\n"
				+ "LEFT JOIN `user` uj ON uj.id = p.manager_id\r\n"
				+ "LEFT JOIN manager m ON m.user_id = u.id\r\n"
				+ "WHERE u.username = ? AND u.`password` = ? \n";
		
		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sql);
		
		preparedStatement.setString(1, usernameLogin);
		preparedStatement.setString(2, passwordLogin);
		
		ResultSet resultSet = preparedStatement.executeQuery();

		if (!resultSet.next()) {
			return null;
		}
		
		int id = resultSet.getInt("id");
		String fullname = resultSet.getString("fullname");
		String phone = resultSet.getString("phone");
		String email = resultSet.getString("email");
		String username = resultSet.getString("username");
		
		Department departmentName = new Department(resultSet.getInt("department_id"), resultSet.getString("department_name"), resultSet.getInt("de_mem_size"));
		Project projectName = new Project(resultSet.getInt("project_id"), resultSet.getString("project_name"), resultSet.getInt("pr_mem_size"));
		
		String fullnameManager = resultSet.getString("fullname_manager");
		int idManager = resultSet.getInt("idManager");

		boolean isManager = false;
		
		if (idManager != 0) {
			isManager = true;
		}
		
		jdbc.closeConnection();
		
		return new User(id, fullname, phone, email, username, departmentName, projectName, fullnameManager, isManager);
	}
	
	public boolean insertUser(String inFullname, String inPhone, String inEmail, String inPassword, int inDepartmentId, int inProjectId) throws SQLException {
		
		String sql = "INSERT INTO  `user`  (username, `password`, fullname, department_id, phone,	email, project_id)\r\n"
				+ "VALUES	(?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sql);
		
		// username sẽ bằng email bỏ đuôi @ đi		
		String inUsername = inEmail.substring(0, inEmail.indexOf("@"));
		preparedStatement.setString(1, inUsername); // username sẽ bằng email bỏ đuôi @ đi
		
		preparedStatement.setString(2, inPassword);
		preparedStatement.setString(3, inFullname);
		
		// lấy ra id của department vừa insert
//		int departmentId = insertDepartment(inDepartmentId);
		preparedStatement.setInt(4, inDepartmentId); // nhap department name
		
		preparedStatement.setString(5, inPhone);
		preparedStatement.setString(6, inEmail);
		
		// lấy ra id của project vừa insert
//		int projectID = insertProject(inProjectId);
		preparedStatement.setInt(7, inProjectId); // nhap project name
		
		int check = preparedStatement.executeUpdate();
		
		jdbc.closeConnection();
		
		if (check == 0) {
			return false;
		}

		return true;
	}
	
	// insert name department và lấy ra id
//	private int insertDepartment(String inDepartmentName) throws SQLException {
//
//		String sqlInsert = "INSERT INTO  department  (`name`)\r\n" + "VALUES	(?)";
//		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sqlInsert,
//				Statement.RETURN_GENERATED_KEYS);
//
//		preparedStatement.setString(1, inDepartmentName);
//		int check = preparedStatement.executeUpdate();
//
//		if (check == 0) {
//			throw new SQLException("Insert user failed, no rows affected.");
//		}
//
//		try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
//			if (generatedKeys.next()) {
//				int id = generatedKeys.getInt(1);
//				return id;
//			} else {
//				throw new SQLException("Insert user failed, no ID obtained.");
//			}
//		}
//	}
	
	// insert name project và lấy ra id
//	private int insertProject(String inProjectName) throws SQLException {
//
//		String sqlInsert = "INSERT INTO  project  (`name`)\r\n" + "VALUES	(?)";
//		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sqlInsert,
//				Statement.RETURN_GENERATED_KEYS);
//
//		preparedStatement.setString(1, inProjectName);
//		int check = preparedStatement.executeUpdate();
//
//		if (check == 0) {
//			throw new SQLException("Insert user failed, no rows affected.");
//		}
//
//		try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
//			if (generatedKeys.next()) {
//				int id = generatedKeys.getInt(1);
//				return id;
//			} else {
//				throw new SQLException("Insert user failed, no ID obtained.");
//			}
//		}
//	}

}

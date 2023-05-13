package com.company.backend.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.company.backend.entity.Department;
import com.company.backend.utils.JDBCUtils;

public class DepartmentRepository {

	private JDBCUtils jdbc;

	public DepartmentRepository() {
		jdbc = new JDBCUtils();
	}

	public List<Department> getAllDepartment() throws SQLException {

		List<Department> departments = new ArrayList<>();

		// b2: Tạo câu lệnh sql dạng String, thông qua Statement để thực hiện câu lệnh
		String sql = "SELECT * FROM department ORDER BY `name` ASC";
		Statement statement = jdbc.getConnection().createStatement();

		// b3: thực hiện câu lệnh SQL
		ResultSet resultSet = statement.executeQuery(sql);

		// b4: format lại dữ liệu trả về
		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			int memberSize = resultSet.getInt("member_size");

			departments.add(new Department(id, name, memberSize));
		}

		jdbc.closeConnection();

		return departments;
	}

	public List<Department> getDetailDepartmentId(int idIn) throws SQLException {
		
		List<Department> departments = new ArrayList<>();
		
		String sql = "SELECT d.id, d.`name`, d.member_size, u.fullname \n"
					+ "FROM department d \n"
					+ "RIGHT JOIN `user` u ON u.department_id = d.id \n"
					+ "WHERE d.id = ?";
		
		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sql);
		
		preparedStatement.setInt(1, idIn);
		
		ResultSet resultSet = preparedStatement.executeQuery();

		
		while(resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			int memberSize = resultSet.getInt("member_size");
			String fullname = resultSet.getString("fullname");
			
			departments.add(new Department(id, name, memberSize, fullname));
		}
		jdbc.closeConnection();
		
		return departments;
	}
	
	// insert department và lấy ra id
//	public int insertDepartment(String inDepartmentName) throws SQLException {
//
//		String sqlInsert = "INSERT INTO  department  (`name`)\r\n" + "VALUES	(?)";
//		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sqlInsert, Statement.RETURN_GENERATED_KEYS);
//
//		preparedStatement.setString(1, inDepartmentName);
//		int check = preparedStatement.executeUpdate();
//	    
//	    if (check == 0) {
//	        throw new SQLException("Insert user failed, no rows affected.");
//	    }
//	    
//	    try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
//	        if (generatedKeys.next()) {
//	            int id = generatedKeys.getInt(1);
//	            jdbc.closeConnection();
//	            return id;
//	        } else {
//	            throw new SQLException("Insert user failed, no ID obtained.");
//	        }
//	    }
//	}
	
}

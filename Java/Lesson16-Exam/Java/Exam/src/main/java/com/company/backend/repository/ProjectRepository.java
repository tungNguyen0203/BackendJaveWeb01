package com.company.backend.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.company.backend.entity.Project;
import com.company.backend.utils.JDBCUtils;

public class ProjectRepository {

	private JDBCUtils jdbc;

	public ProjectRepository() {
		jdbc = new JDBCUtils();
	}

	public List<Project> getAllProjects() throws SQLException {

		List<Project> projects = new ArrayList<>();

		// b2: Tạo câu lệnh sql dạng String, thông qua Statement để thực hiện câu lệnh
		String sql = "SELECT  p.id, p.`name`, p.member_size, u.fullname \n"
					+ "FROM project p \n"
					+ "LEFT JOIN `user` u ON u.id = p.manager_id \n"
					+ "ORDER BY p.created_date DESC";
		
		Statement statement = jdbc.getConnection().createStatement();

		// b3: thực hiện câu lệnh SQL
		ResultSet resultSet = statement.executeQuery(sql);

		// b4: format lại dữ liệu trả về
		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			int memberSize = resultSet.getInt("member_size");
			String fullname = resultSet.getString("fullname");

			projects.add(new Project(id, name, memberSize, fullname));
		}

		jdbc.closeConnection();

		return projects;
	}
	
	public List<Project> getDetailProjectId(int idIn) throws SQLException {

		List<Project> projects = new ArrayList<>();
		
		String sql = "SELECT p.id, p.`name`, p.member_size, u.fullname \n"
					+ "FROM project p \n"
					+ "RIGHT JOIN `user` u ON u.project_id = p.id \n"
					+ "WHERE p.id = ?";
		
		PreparedStatement preparedStatement = jdbc.getConnection().prepareStatement(sql);
		
		preparedStatement.setInt(1, idIn);
		
		ResultSet resultSet = preparedStatement.executeQuery();

		while (resultSet.next()) {
			int id = resultSet.getInt("id");
			String name = resultSet.getString("name");
			int memberSize = resultSet.getInt("member_size");
			String fullname = resultSet.getString("fullname");

			projects.add(new Project(id, name, memberSize, fullname));
		}

		jdbc.closeConnection();

		return projects;
	}

}

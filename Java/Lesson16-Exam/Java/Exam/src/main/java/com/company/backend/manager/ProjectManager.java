package com.company.backend.manager;

import java.sql.SQLException;
import java.util.List;

import com.company.backend.entity.Project;
import com.company.backend.repository.ProjectRepository;
import com.company.backend.utils.ScannerUtils;

public class ProjectManager {

	private ProjectRepository projectRepository;

	public ProjectManager() {
		projectRepository = new ProjectRepository();
	}

	public void getAllProjects() throws SQLException {
		System.out.println("Get All Projects");

		List<Project> projects = projectRepository.getAllProjects();

		for (Project project : projects) {
			System.out.println(project);
		}
	}

	public void getDetailProjectId(int idIn) throws SQLException {
		System.out.println("Get Detail Project Id");
		System.out.print("Nhap id: ");
		int insertId = ScannerUtils.inputId();

		List<Project> projects = projectRepository.getDetailProjectId(insertId);

		for (Project project : projects) {
			System.out.println(project);
		}
	}

}

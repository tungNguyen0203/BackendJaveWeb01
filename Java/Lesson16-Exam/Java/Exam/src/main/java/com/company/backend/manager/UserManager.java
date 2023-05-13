package com.company.backend.manager;

import java.sql.SQLException;
import java.util.List;

import com.company.backend.entity.Department;
import com.company.backend.entity.Project;
import com.company.backend.entity.User;
import com.company.backend.repository.DepartmentRepository;
import com.company.backend.repository.ProjectRepository;
import com.company.backend.repository.UserRepository;
import com.company.backend.utils.ScannerUtils;

public class UserManager {
	private UserRepository userRepository;
	
	private DepartmentRepository departmentRepository;
	
	private ProjectRepository projectRepository;

	public UserManager() {
		userRepository = new UserRepository();
		departmentRepository = new DepartmentRepository();
		projectRepository = new ProjectRepository();
	}

	public User login() throws SQLException {
		while (true) {
			System.out.print("Username: ");
			String usernameIn = ScannerUtils.inputUsername();

			System.out.print("Password: ");
			String passwordIn = ScannerUtils.inputPassword();

			User user = userRepository.login(usernameIn, passwordIn);

			if (user != null) {
				return user;
			}
			System.out.println("Username hoac Password khong dung! Moi nhap lai");
		}
	}
		
	public void printUser(User user) {
		System.out.println("In thong tin:");
		System.out.println("Id: " + user.getId());
		System.out.println("Fullname: " + user.getFullname());
		System.out.println("Phone: " + user.getPhone());
		System.out.println("Email: " + user.getEmail());
		System.out.println("Department Name: " + user.getDepartment().getName());
		System.out.println("Project Name: " + user.getProject().getName());
		System.out.println("Manager Name: " + user.getFullnameManager());
	}
	
	public void getAllUsers() throws SQLException {
		System.out.println("Get All Users");
		
		List<User> users = userRepository.getAllUsers();
		
		for (User user : users) {
			System.out.println(user);
		}
	}
	
	public void getAllUserByDepartmentId() throws SQLException {
		System.out.println("Get All User By Department Id");
		System.out.print("Nhap Department Id: ");
		int inDepartmentId = ScannerUtils.inputDepartmentId();
		
		List<User> users = userRepository.getAllUserByDepartmentId(inDepartmentId);
		
		for (User user : users) {
			System.out.println(user);
		}
	}

	public void searchUser() throws SQLException {
		System.out.println("Search User");
		System.out.print("Nhap Keyword: ");
		String keyword = ScannerUtils.inputKeyword();
		
		List<User> users = userRepository.searchUser(keyword);
		
		for (User user : users) {
			System.out.println(user);
		}
		
	}
	
	public void insertUser() throws SQLException {
		System.out.println("Insert User");
		System.out.print("Nhap Fullname: ");
		String inFullname = ScannerUtils.inputFullName();
		
		System.out.print("Nhap Phone: ");
		String inPhone = ScannerUtils.inputPhone();
		
		System.out.print("Nhap Email: ");
		String inEmail = ScannerUtils.inputEmail();
		
		// tach username tu email
		String inUsername = inEmail.substring(0, inEmail.indexOf("@"));
		
		String inPassword;
		
		while (true) {
			System.out.print("Nhap Password: ");
			inPassword = ScannerUtils.inputPassword();
			if (inPassword.contains(inUsername)) {
				System.out.println("Password khong duoc chua username. Hay nhap lai!");
				continue;
			} 
			break;
		}
		
		// gọi 1 hàm để in ra toàn bộ department và lấy id lớn nhất
		int maxDepartmentId = getAllDepartmentIdAndName();
		
		int inDepartmentId;
		while (true) {
			System.out.print("Nhap Department id: ");
			inDepartmentId = ScannerUtils.inputDepartmentId();
			if (inDepartmentId <= maxDepartmentId && inDepartmentId > 0) {
				break;
			}
			System.out.println("Department Id khum ton tai. Hay nhap Lai!");
		}
		
		// gọi 1 hàm để in ra toàn bộ project
		int maxProjectId = getAllProjectIdAndName();
		
		int inProjectId;
		while (true) {
			System.out.print("Nhap Project id: ");
			inProjectId = ScannerUtils.inputProjectId();
			if (inProjectId <= maxProjectId && inProjectId > 0) {
				break;
			}
			System.out.println("Project Id khum ton tai. Hay nhap Lai!");
		}
		
		boolean checkInsert = userRepository.insertUser(inFullname, inPhone, inEmail, inPassword, inDepartmentId, inProjectId);
		
		if (!checkInsert) {
			System.out.println("Insert User khong thanh cong");
		} else {
			System.out.println("Insert User thanh cong");
		}

	}
	
	// lấy id và name của department
	private int getAllDepartmentIdAndName() throws SQLException {
		List<Department> departments = departmentRepository.getAllDepartment();

		int DId = 0;
		
		System.out.println("Danh sach Department:");
		for (Department d : departments) {
			System.out.println("Id: " + d.getId() + " - " + "Name: " + d.getName());
			if (DId < d.getId()) {
				DId = d.getId();
			}
		}
		
		return DId;
	}
	
	// lấy id và name của project
	private int getAllProjectIdAndName() throws SQLException {
		List<Project> projects = projectRepository.getAllProjects();

		int PId = 0;
		
		System.out.println("Danh sach Project:");
		for (Project p : projects) {
			System.out.println("Id: " + p.getId() + " - " + "Name: " + p.getName());
			if (PId < p.getId()) {
				PId = p.getId();
			}
		}
		
		return PId;
	}

	public void printDepartmentInUser(User user) throws SQLException {
		System.out.println("Xem thong tin department hien tai cua minh");
				
		int idDepartment = user.getDepartment().getId();
				
		List<Department> department = departmentRepository.getDetailDepartmentId(idDepartment);
		
		for (Department d : department) {
			System.out.println(d);
		}
	}

	public void printProjectInUser(User user) throws SQLException {
		System.out.println("Xem thong tin project hien tai cua minh");
		
		ProjectRepository projectRepository = new ProjectRepository();
		
		int idProject = user.getProject().getId();
				
		List<Project> projects = projectRepository.getDetailProjectId(idProject);
		
		for (Project project : projects) {
			System.out.println(project);
		}
	}


}

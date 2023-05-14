package com.company.frontend;

import java.sql.SQLException;

import com.company.backend.entity.User;
import com.company.backend.manager.DepartmentManager;
import com.company.backend.manager.ProjectManager;
import com.company.backend.manager.UserManager;
import com.company.backend.utils.ScannerUtils;

public class Program {
	public static void main(String[] args) throws SQLException {
		loadMenu();
	}
	
	public static void loadMenu() throws SQLException {
		
		ProjectManager projectManager = new ProjectManager();
		
		DepartmentManager departmentManager = new DepartmentManager();
		
		UserManager userManager = new UserManager();
		
		System.out.println("Chao mung den voi chuong trinh :3");
		User user = userManager.login();
		
		if (user.getRole()) {
			loadMenuManager(userManager, user, departmentManager, projectManager);
		} else {
			loadMenuEmployee(userManager, user, departmentManager, projectManager);
		}
		
	}
	
	public static void loadMenuEmployee(UserManager userManager, User user, DepartmentManager departmentManager, ProjectManager projectManager) throws SQLException {
		while (true) {
			System.out.println("Chon chuc nang");
			System.out.println("1 - Xem thong tin ca nhan");
			System.out.println("2 - Xem thong tin department hien tai");
			System.out.println("3 - Xem thong tin project hien tai");
			System.out.println("4 - Thoat");
			System.out.print("Lua chon: ");
			int choose = ScannerUtils.inputNumber(1, 4);
			System.out.println("----------------------------------");
			switch (choose) {
			case 1:
				userManager.printUser(user);
				break;
			case 2:
				userManager.printDepartmentInUser(user);
				System.out.println("Thuc hien thanh cong!");
				break;
			case 3:
				userManager.printProjectInUser(user);
				System.out.println("Thuc hien thanh cong!");
				break;
			case 4:
				return;
			}
			
			System.out.println("----------------------------------");
		}
	}
	
	public static void loadMenuManager(UserManager userManager, User user, DepartmentManager departmentManager, ProjectManager projectManager) throws SQLException {
		while (true) {
			System.out.println("Chon chuc nang");
			System.out.println("1 - Xem thong tin ca nhan");
			System.out.println("2 - Xem thong tin department hien tai");
			System.out.println("3 - Xem thong tin project hien tai");
			System.out.println("4 - getAllDepartments");
			System.out.println("5 - getAllProject");
			System.out.println("6 - insertUser");
			System.out.println("7 - getAllUsers");
			System.out.println("8 - getAllUserByDepartmentId");
			System.out.println("9 - searchUser");
			System.out.println("10 - Thoat");
			System.out.print("Lua chon: ");
			int choose = ScannerUtils.inputNumber(1, 10);
			System.out.println("----------------------------------");
			switch (choose) {
			case 1:
				userManager.printUser(user);
				System.out.println("Thuc hien thanh cong!");
				break;
			case 2:
				userManager.printDepartmentInUser(user);
				System.out.println("Thuc hien thanh cong!");
				break;
			case 3:
				userManager.printProjectInUser(user);
				System.out.println("Thuc hien thanh cong!");
				break;
			case 4:
				departmentManager.getAllDepartment();
				System.out.println("Thuc hien thanh cong!");
				break;
			case 5:
				projectManager.getAllProjects();
				System.out.println("Thuc hien thanh cong!");
				break;
			case 6:
				userManager.insertUser();
				System.out.println("Thuc hien thanh cong!");
				break;
			case 7:
				userManager.getAllUsers();
				System.out.println("Thuc hien thanh cong!");
				break;
			case 8:
				userManager.getAllUserByDepartmentId();
				System.out.println("Thuc hien thanh cong!");
				break;
			case 9:
				userManager.searchUser();
				System.out.println("Thuc hien thanh cong!");
				break;
			case 10:
				System.out.println("Bye bye :3");
				return;
			}
			System.out.println("----------------------------------");
		}

	}
	
	
	
}

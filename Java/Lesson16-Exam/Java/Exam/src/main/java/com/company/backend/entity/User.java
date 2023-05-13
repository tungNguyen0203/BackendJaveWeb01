package com.company.backend.entity;

public class User {

	private int id;
	private String fullname;
	private String phone;
	private String email;
	private String username;
	private Department department;
	private Project project;	
	private String fullnameManager; // tên người quản lý
	private boolean role;

	public User(int id, String fullname, String phone, String email, String username, Department departmentName,
			Project projectName, String fullnameManager) {
		this.id = id;
		this.fullname = fullname;
		this.phone = phone;
		this.email = email;
		this.username = username;
		this.department = departmentName;
		this.project = projectName;
		this.fullnameManager = fullnameManager;
	}
	
	public User(int id, String fullname, String phone, String email, String username, Department departmentName,
			Project projectName, String fullnameManager, Boolean role) {
		this.id = id;
		this.fullname = fullname;
		this.phone = phone;
		this.email = email;
		this.username = username;
		this.department = departmentName;
		this.project = projectName;
		this.fullnameManager = fullnameManager;
		this.role = role;
	}
	
	public int getId() {
		return id;
	}

	public String getFullname() {
		return fullname;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getUsername() {
		return username;
	}

	public Department getDepartment() {
		return department;
	}

	public Project getProject() {
		return project;
	}

	public String getFullnameManager() {
		return fullnameManager;
	}

	public boolean getRole() {
		return role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", fullname=" + fullname + ", phone=" + phone + ", email=" + email + ", username="
				+ username + ", departmentName=" + department.getName() + ", projectName=" + project.getName() + ", fullnameManager="
				+ fullnameManager + "]";
	}

	
	
}

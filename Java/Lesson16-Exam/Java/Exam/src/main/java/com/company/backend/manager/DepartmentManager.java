package com.company.backend.manager;

import java.sql.SQLException;
import java.util.List;

import com.company.backend.entity.Department;
import com.company.backend.repository.DepartmentRepository;
import com.company.backend.utils.ScannerUtils;

public class DepartmentManager {
	private DepartmentRepository departmentRepository;

	public DepartmentManager() {
		departmentRepository = new DepartmentRepository();
	}
	
	public void getAllDepartment() throws SQLException {
		System.out.println("Get All Department");
		
		List<Department> departments = departmentRepository.getAllDepartment();
		
		for (Department department : departments) {
			System.out.println(department);
		}
	}
	
	public void getDetailDepartmentId() throws SQLException {
		System.out.println("Get department by id");
		System.out.print("Nhap id: ");
		int insertId = ScannerUtils.inputId();
		
		List<Department> departments = departmentRepository.getDetailDepartmentId(insertId);
		
		for (Department department : departments) {
			System.out.println(department);
		}
	}
	
}

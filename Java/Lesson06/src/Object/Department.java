package Object;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;


public class Department implements Comparable<Department> {
	public int id;
	public String name;
	public int totalSalary;
	public LocalDate createdDate;

	Department() {
		this.createdDate = LocalDate.now();
	}

	Department(int id_, String name_, int totalSalary) {
		this.id = id_;
		this.name = name_;
		this.createdDate = LocalDate.now();
		this.totalSalary = totalSalary;
	}

	Department(int id_, String name_, int totalSalary, LocalDate createdDate_) {
		this.id = id_;
		this.name = name_;
		this.totalSalary = totalSalary;
		this.createdDate = createdDate_;
	}

	private Scanner scanner = new Scanner(System.in);

//	exercise question 4
	public void insertDepartment() {
		System.out.println("Tao department");
		System.out.print("Nhap Id: ");
		id = scanner.nextInt();
		System.out.print("Nhap name: ");
		name = scanner.next();
		System.out.println("Department vua nhap: \n" + "Id: " + id + ", Name: " + name);
	}

	@Override
	public String toString() {
		String result = "";
		result += "Id: " + id + "\n";
		result += "Name: " + name + "\n";
		result += "totalSalary: " + totalSalary + "\n";
		result += "CreatedDate: " + createdDate + "\n";

		return result;
	}

//	ex01Question01A
	@Override
	public boolean equals(Object obj) {
		Department d = (Department) obj;
		if (totalSalary == d.totalSalary) {
			return true;
		}
		return false;
	}

	@Override
	public int compareTo(Department o) {
		// TODO Auto-generated method stub
		return 0;
	}

//	ex01Question01C
//	@Override
//	public int compareTo(Department d) {
//		if (totalSalary < d.totalSalary) {
//			return 1;
//		}
//
//		if (totalSalary > d.totalSalary) {
//			return -1;
//		}
//		return 0;
//	}
	
//	ex01Question02A
//	@Override
//	public int compareTo(Department d) {
//		return name.compareTo(d.name);
//	}
	
//	ex01Question02B
	
	
}
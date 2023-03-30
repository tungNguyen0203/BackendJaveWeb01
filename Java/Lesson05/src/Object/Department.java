package Object;

import java.time.LocalDate;
import java.util.Scanner;

public class Department {
	public int id;
	public String name;
	public LocalDate createdDate;

	Department() {
		createdDate = LocalDate.now();
	}

	Department(int id_, String name_) {
		id = id_;
		name = name_;
		createdDate = LocalDate.now();
	}

	Department(int id_, String name_, LocalDate createdDate_) {
		id = id_;
		name = name_;
		createdDate = createdDate_;
	}

	public void printInformation() {
		System.out.println("Id: " + id);
		System.out.println("Name: " + name);
		System.out.println("CreatedDate: " + createdDate);
	}

	private Scanner scanner = new Scanner(System.in);

//	exercise question 4
	public void insertDepartment() {
		System.out.println("Tao department");
		System.out.println("Nhap Id: ");
		id = scanner.nextInt();
		System.out.println("Nhap name: ");
		name = scanner.next();
		System.out.println("Department vua nhap: " + "Id: " + id + ", Name: " + name);
	}
	
	public String toString() {
		return id + " " + name + " " + createdDate;
	}
}
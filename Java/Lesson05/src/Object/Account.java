package Object;

import java.util.Scanner;

public class Account {
	public int id;
	public String firstname;
	public String lastname;
	public int age;
	public Department department;
	public Position position;

	Account() {
	}

	Account(int id_, String firstname_, String lastname_) {
		id = id_;
		firstname = firstname_;
		lastname = lastname_;
	}

	Account(int id_, String firstname_, String lastname_, int age_, Department department_, Position position_) {
		id = id_;
		firstname = firstname_;
		lastname = lastname_;
		age = age_;
		department = department_;
		position = position_;
	}

	public void printInformation() {
		System.out.println("Id: " + id);
		System.out.println("firstname: " + firstname);
		System.out.println("lastname: " + lastname);
		System.out.println("age: " + age);
		System.out.println("department: " + department);
		System.out.println("position: " + position);
	}

	private Scanner scanner = new Scanner(System.in);

	public void insertAccount() {
		System.out.println("Tao Account");
		System.out.println("Nhap Id: ");
		id = scanner.nextInt();
		System.out.println("Nhap firstname: ");
		firstname = scanner.next();
		System.out.println("Nhap lastname: ");
		lastname = scanner.next();
		System.out.println("Nhap age: ");
		age = scanner.nextInt();

		System.out.println("Nhap departmentId: ");
		int departmentId = scanner.nextInt();
		System.out.println("Nhap departmentName: ");
		String departmentName = scanner.next();

		department = new Department(departmentId, departmentName);

		System.out.println("Nhap positionId: ");
		int positionId = scanner.nextInt();
		System.out.println("Nhap positionName: ");
		String positionName = scanner.next();

		position = new Position(positionId, positionName);
	}

	public String toString() {
		return id + " " + firstname + " " + lastname + " " + age + " " + department + " " + position;
	}
}

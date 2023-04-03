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
		this.id = id_;
		this.firstname = firstname_;
		this.lastname = lastname_;
	}

	Account(int id_, String firstname_, String lastname_, int age_, Department department_, Position position_) {
		this.id = id_;
		this.firstname = firstname_;
		this.lastname = lastname_;
		this.age = age_;
		this.department = department_;
		this.position = position_;
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
		System.out.print("Nhap id: ");
		id = scanner.nextInt();
		System.out.print("Nhap firstname: ");
		firstname = scanner.next();
		System.out.print("Nhap lastname: ");
		lastname = scanner.next();
		
		scanner.nextLine();
		
		System.out.print("Nhap age: ");
		age = scanner.nextInt();

		System.out.print("Nhap departmentId: ");
		int departmentId = scanner.nextInt();
		System.out.print("Nhap departmentName: ");
		String departmentName = scanner.next();

		department = new Department(departmentId, departmentName);

		System.out.print("Nhap positionId: ");
		int positionId = scanner.nextInt();
		System.out.print("Nhap positionName: ");
		String positionName = scanner.next();

		position = new Position(positionId, positionName);
	}

	@Override
	public String toString() {
		return id + "\n" + firstname + "\n" + lastname + "\n" + age + "\n" + "Departmet:\n" + department + "\n" + "Position:\n" + position;
	}
}

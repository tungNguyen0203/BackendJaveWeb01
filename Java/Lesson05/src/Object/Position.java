package Object;

import java.time.LocalDate;
import java.util.Scanner;

public class Position {
	public int id;
	public String name;
	public LocalDate createdDate;

	Position() {
		createdDate = LocalDate.now();
	}

	Position(int id_, String name_) {
		id = id_;
		name = name_;
		createdDate = LocalDate.now();
	}

	Position(int id_, String name_, LocalDate cradredDate_) {
		id = id_;
		name = name_;
		createdDate = cradredDate_;
	}

	public void printInformation() {
		System.out.println("Id: " + id);
		System.out.println("Name: " + name);
		System.out.println("CreatedDate: " + createdDate);
	}

	private Scanner scanner = new Scanner(System.in);
	
	public void insertPosition() {
		System.out.println("Tao Position");
		System.out.println("Nhap Id: ");
		id = scanner.nextInt();
		System.out.println("Nhap name: ");
		name = scanner.next();
		System.out.println("Position vua nhap: " + "Id: " + id + ", Name: " + name);
	}
	
	public String toString() {
		return id + " " + name + " " + createdDate;
	}
}

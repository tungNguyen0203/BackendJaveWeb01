package Object;

import java.time.LocalDate;
import java.util.Scanner;

public class Position {
	public int id;
	public enumPosition name;
	public LocalDate createdDate;

	private Scanner scanner = new Scanner(System.in);

	Position() {
		this.createdDate = LocalDate.now();
	}

	Position(int id_, enumPosition name_) {
		this.id = id_;
		this.name = name_;
		this.createdDate = LocalDate.now();
	}

	Position(int id_, enumPosition name_, LocalDate cradredDate_) {
		this.id = id_;
		this.name = name_;
		this.createdDate = cradredDate_;
	}

	public void printInformation() {
		System.out.println("Id: " + id);
		System.out.println("Name: " + name);
		System.out.println("CreatedDate: " + createdDate);
	}

	
	public void insertPosition() {
		System.out.println("Tao Position");
		System.out.print("Nhap id: ");
		id = scanner.nextInt();
		System.out.print("Nhap name: ");
		System.out.println("Position vua nhap: \n" + "Id: " + id + ", Name: " + name);
	}
	
	@Override
	public String toString() {
		String result = "";
		result += "Id: " + id + "\n";
		result += "Name: " + name + "\n";
		result += "CreatedDate: " + createdDate + "\n";
		
		return result;
	}
}

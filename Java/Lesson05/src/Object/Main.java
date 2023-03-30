package Object;

import java.time.LocalDate;

public class Main {
	public static void main(String[] args) {
		
//	Exercise 02: Object
		Department d1 = new Department();
		d1.id = 1;
		d1.name = "Sale";
		d1.createdDate = LocalDate.of(20203, 10, 20);

		Department d2 = new Department();
		d2.id = 2;
		d2.name = "Marketing";
		d2.createdDate = LocalDate.of(2022, 07, 20);

		Position p1 = new Position();
		p1.id = 1;
		p1.name = "Test";
		p1.createdDate = LocalDate.of(2023, 9, 25);

		Position p2 = new Position();
		p2.id = 2;
		p2.name = "Test";
		p2.createdDate = LocalDate.of(2023, 9, 25);

		Account a1 = new Account();
		a1.id = 1;
		a1.firstname = "Tung";
		a1.lastname = "Nguyen";
		a1.age = 19;
		a1.department = d1;
		a1.position = p1;

		Account a2 = new Account();
		a2.id = 2;
		a2.firstname = "Trang";
		a2.lastname = "Vi";
		a2.age = 18;
		a2.department = d2;
		a2.position = p2;

		
//	Exercise 03: constructor	
		Department d3 = new Department(3, "Sale2", LocalDate.of(2006, 12, 15));
		Department d4 = new Department(4, null);
		
		Position p3 = new Position(3, null, LocalDate.of(2023, 12, 20));
		Position p4	= new Position(4, null);
		
		Account a3 = new Account(3, "A", "Nguyen", 10, d3, p2);
		Account a4 = new Account(4, "c", "Nguyen");
		
		
//		exercise question 4
//		Department d5 = new Department();
//		d5.insertDepartment();
//		System.out.println(d4);
//		
//		Position p5 = new Position();
//		p5.insertPosition();
//		System.out.println(p5.createdDate);
		
//		Account a5 = new Account();
//		a5.insertAccount();
		System.out.println(a4);
	}
}

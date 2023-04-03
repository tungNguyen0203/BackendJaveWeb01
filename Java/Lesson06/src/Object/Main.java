package Object;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Main {
	public static void main(String[] args) {
//		ex01Question02B();
		
//		Position p1 = new Position(1, enumPosition.DEV);
//		System.out.println(p1);
		
		String string = "DEV";
		enumPosition neww = enumPosition.valueOf(string);
		
		System.out.println(neww);
	}

//	Exercise 1: Comparing Object

//	a. Khai báo department a & b bất kì, sau đó
//	 In ra "equal" nếu 2 department có totalSalary bằng nhau,
//	 In ra "Not equal" nếu 2 department có totalSalary khác nhau
	static void ex01Question01A() {
		Department d3 = new Department(4, "Sale1", 6000);
		Department d4 = new Department(5, "Sale2", 6000);

		if (d3.equals(d4)) {
			System.out.println("equal");
		} else {
			System.out.println("Not equal");
		}
	}

//	b. Khai báo 1 list có 5 department bất kì, có salary lần lượt là 5000, 6000, 7000,
//	6000, 6000 và in ra các department có totalSalary = 6000
	public static void ex01Question01B() {
		Department d1 = new Department(1, "Marketing", 5000);
		Department d2 = new Department(2, "Marketing", 6000);
		Department d3 = new Department(4, "Sale1", 7000);
		Department d4 = new Department(5, "Sale2", 6000);
		Department d5 = new Department(5, "Sale3", 9000);

		List<Department> departmentList = Arrays.asList(d1, d2, d3, d4, d5);

		for (int i = 0; i < departmentList.size(); i++) {
			if (departmentList.get(i).totalSalary == 6000) {
				System.out.println(departmentList.get(i));
			}
		}
	}

//	c. Khai báo 1 list có 5 department bất kì và in ra các department sắp xếp giảm dần
//	theo totalSalary
	public static void ex01Question01C() {
		Department d1 = new Department(1, "Marketing", 5000);
		Department d2 = new Department(2, "Marketing", 6000);
		Department d3 = new Department(4, "Sale1", 7000);
		Department d4 = new Department(5, "Sale2", 6000);
		Department d5 = new Department(5, "Sale3", 9000);

		List<Department> departmentList = Arrays.asList(d1, d2, d3, d4, d5);

		Collections.sort(departmentList);

		System.out.println(departmentList);
		for (Department department : departmentList) {
			System.out.println(department);
		}
	}

//	2. Khai báo department có id, name và khai báo 1 list 5 department, sau đó
//		a. In ra danh sách phòng ban theo thứ tự tăng dần theo tên (sắp xếp theo vần ABCD)
//		VD:
//		Accounting
//		Boss of Director
//		Marketing
//		Sale
//		Waiting Room

	public static void ex01Question02A() {
		Department d1 = new Department(1, "Accounting", 5000);
		Department d2 = new Department(2, "Marketing", 6000);
		Department d3 = new Department(3, "Boss of Director", 7000);
		Department d4 = new Department(4, "Sale", 6000);
		Department d5 = new Department(5, "Waiting Room", 9000);

		List<Department> departmentList = Arrays.asList(d1, d2, d3, d4, d5);

		Collections.sort(departmentList);
		for (Department departments : departmentList) {
			System.out.println(departments);
		}
	}

//	b. In ra danh sách phòng ban theo thứ tự tăng dần theo tên (sắp xếp theo vần ABCD)
//		VD:
//		Accounting
//		Boss of Director
//		Marketing
//		Waiting Room
//		Sale
	public static void ex01Question02B() {
		Department d1 = new Department(1, "Accounting", 5000);
		Department d2 = new Department(2, "Marketing", 6000);
		Department d3 = new Department(3, "Boss of Director", 7000);
		Department d4 = new Department(4, "Sale", 6000);
		Department d5 = new Department(5, "Waiting Room", 9000);

		List<Department> departmentList = Arrays.asList(d1, d2, d3, d4, d5);

		Collections.sort(departmentList, new DepartmentNameOrderByNameComparator());
		
		for (Department departments : departmentList) {
			System.out.println(departments);
		}

	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

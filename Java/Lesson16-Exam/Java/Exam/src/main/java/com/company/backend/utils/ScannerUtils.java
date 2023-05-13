package com.company.backend.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class ScannerUtils {

	public static Scanner scanner = new Scanner(System.in);

//	4. tạo 1 method inputNumber()
	public static int inputNumber() {
		int a;
		while (true) {
			try {
				String string = scanner.nextLine();
				a = Integer.parseInt(string);
				break;
			} catch (Exception e) {
				System.out.println("Wrong inputing! Please input a number as int! Input again.");
			}
		}
		return a;
	}

	public static int inputNumber(int min, int max) {
		while (true) {
			int a = inputNumber();
			if (a < min || a > max) {
				System.out.print("Phai nhap trong khoang " + min + " den " + max + ". Nhap lai: ");
				continue;
			}
			return a;
		}
	}

//	5. Tạo 1 method inputPositiveNumber()
	public static int inputPositiveNumber() {
		while (true) {
			int x = inputNumber();
			if (x < 0) {
				System.out.println("Please input positive number!Input again.");
				continue;

			}
			return x;
		}
	}

//	6. Tạo 1 method inputId() và trả về 1 số nguyên dương >= 1
	public static int inputId() {
		while (true) {
			int x = inputNumber();
			if (x < 1) {
				System.out.println("Please input a id which is greater than or equal 1 !Input again: ");
				continue;
			}
			return x;
		}
	}

//	7. tạo 1 method inputAge()
	public static int inputAge() {
		while (true) {
			int a = inputNumber();
			if (a < 18) {
				System.out.print("Please input an age which is greater than or equal 18! Input again: ");
				continue;
			}
			return a;
		}
	}

//	8. Tạo 1 method inputFullName()
//	public static String inputFullName() {
//		while (true) {
//			String s = scanner.nextLine();
//			s = removeSpaces(s);
//
//			List<String> words = Arrays.asList(s.split(" "));
//
//			if (words.size() < 1) {
//				System.out.print("Your name is too short! Input again: ");
//				continue;
//			}
//
//			if (words.size() > 6) {
//				System.out.print("Your name is too long! Input again: ");
//				continue;
//			}
//
//			s = uppercaseFirstCharacterOfWord(s);
//			return s;
//		}
//	}
	
	public static String inputFullName() {
		while (true) {
			String s = scanner.nextLine();
			s = removeSpaces(s);

			if (s.length() < 10) {
				System.out.print("Your name is too short! Input again: ");
				continue;
			}

			if (s.length() > 50) {
				System.out.print("Your name is too long! Input again: ");
				continue;
			}

			s = uppercaseFirstCharacterOfWord(s);
			return s;
		}
	}

//	method removeSpaces() để loại bỏ các dấu space thừa về thành còn 1 space
//	VD: "tung      nguyen" => "tung nguyen"
	private static String removeSpaces(String s) {
		// remove before & after spaces
		s = s.trim();
		// remove middle spaces
		while (s.contains("  ")) {
			s = s.replace("  ", " ");
		}
		return s;
	}

//	Method uppercaseFirstCharacterOfWord() để loại bỏ space ở 2 biên ngoài cùng
//	và viết hoa các chữ cái đầu
	private static String uppercaseFirstCharacterOfWord(String s) {
		s = s.toLowerCase();
		List<String> words = new ArrayList<>(Arrays.asList(s.split(" ")));
		String newStr = "";
		for (String word : words) {
			String firstCharacter = word.charAt(0) + "";
			String leftCharacter = word.substring(1);
			newStr += firstCharacter.toUpperCase() + leftCharacter + " ";
		}
		return newStr.trim();
	}

//	9. Tạo 1 method inputEmail
	public static String inputEmail() {
		while (true) {
			String s = scanner.nextLine();

			if (s.length() < 5) {
				System.out.print("Your email is too short! Input again: ");
				continue;
			}

			if (s.length() > 20) {
				System.out.print("Your email is too long! Input again: ");
				continue;
			}

			if (!s.contains("@") || !s.contains(".com")) {
				System.out.print("Wrong format! Input again: ");
				continue;
			}

			return s;
		}
	}

//	10. Tạo 1 method inputYesOrNo() và trả về boolean.
	public static boolean inputYesOrNo() {
		while (true) {
			String s = scanner.nextLine();

			if (s.equalsIgnoreCase("Y")) {
				return true;
			}

			if (s.equalsIgnoreCase("N")) {
				return false;
			}

			System.out.println("Please input Y or N !Input again: ");
		}
	}

	public static String inputUsername() {
		while (true) {
			String s = scanner.nextLine();
			if (s.length() < 2) {
				System.out.print("Nhap khong dung moi nhap lai: ");
				continue;
			}
			if (s.length() > 50) {
				System.out.print("Nhap khong dung moi nhap lai: ");
				continue;
			}
			return s;
		}
	}

	public static String inputPassword() {
		while (true) {
			String s = scanner.nextLine();
			if (s.length() < 6) {
				System.out.print("Nhap khong dung moi nhap lai: ");
				continue;
			}
			if (s.length() > 20) {
				System.out.print("Nhap khong dung moi nhap lai: ");
				continue;
			}
			return s;
		}
	}
	
	public static int inputDepartmentId() {
		while (true) {
			int x = inputNumber();
			if (x < 1) {
				System.out.println("Please input a id which is greater than or equal 1 !Input again: ");
				continue;
			}
			return x;
		}
	}
	
	public static int inputProjectId() {
		while (true) {
			int x = inputNumber();
			if (x < 1) {
				System.out.println("Please input a id which is greater than or equal 1 !Input again: ");
				continue;
			}
			return x;
		}
	}
	
	public static String inputPhone() {
		while (true) {
			String s = scanner.nextLine();
			s = removeSpaces(s);

			if (s.length() < 9) {
				System.out.print("Your name is too short! Input again: ");
				continue;
			}

			if (s.length() > 12) {
				System.out.print("Your name is too long! Input again: ");
				continue;
			}
			return s;
		}
	}	
	
	public static String inputKeyword() {
		while (true) {
			String s = scanner.nextLine();
			s = removeSpaces(s);

			List<String> words = Arrays.asList(s.split(" "));

			if (words.size() < 1) {
				System.out.print("Your name is too short! Input again: ");
				continue;
			}

			return s;
		}
	}
}

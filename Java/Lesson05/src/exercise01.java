import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class exercise01 {
	public static void main(String[] args) {
		question06();
	}

//	scanner
	private static Scanner scan = new Scanner(System.in);

//	Format lại date
	public static void dateFormat() {
		System.out.println("Please input your birthday");
		String birthdayString = scan.nextLine();

//	tạo ra String định dạng ngày nhập vào "dd-MM-yyyy"
		String patternString = "dd-MM-yyyy";
//	dùng hàm để format theo dạng vừa nhập
		DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern(patternString);
//	truyền birthdayString nhập từ bàn phím 
		LocalDate date = LocalDate.parse(birthdayString, dateFormat);

		System.out.println("Your birthday is " + date);
	}

//	1. Viết lệnh cho phép User nhập vào firstname và lastname, sau đó in ra fullname của họ
	public static void question01() {
		String firstName, lastName;
		System.out.print("Nhập vào first name: ");
		
		scan.nextLine();
		
		firstName = scan.nextLine();
		
		System.out.print("Nhập vào last name: ");
		lastName = scan.nextLine();
		
		String fullname = lastName + " " + firstName;
		System.out.println("Fullname: " + fullname);
		System.out.println("firstname: " + firstName);
	}

//	2. Viết lệnh cho phép User nhập vào age, sau đó in ra năm sinh của họ
	public static void question02() {
		System.out.println("Nhap age: ");
		int age = scan.nextInt();
		LocalDate dateNow = LocalDate.now();
		int namSinh = (int) dateNow.getYear() - age;

		System.out.println("Nam sinh: " + namSinh);
	}

//	3. Viết lệnh cho phép User nhập vào birthday, và in ra tuổi hiện tại của họ
	public static void question03() {
		System.out.println("Nhap ngay sinh theo dinh dang: dd-MM-yyyy");
		String birthday = scan.next();
		
		// định dạng chuỗi ngày sinh
		DateTimeFormatter datrFormatter03 = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		LocalDate dateF = LocalDate.parse(birthday, datrFormatter03);

		// tính tuổi từ ngày sinh
		LocalDate dateNow = LocalDate.now();
		int age = (int) dateNow.getYear() - dateF.getYear();

		System.out.println("Age: " + age);
	}

//	4. Viết lệnh cho phép User nhập vào số chẵn, nếu user nhập số lẻ thì sẽ yêu cầu User nhập lại
	public static void question04() {
		int a;
		do {
			System.out.println("nhap so chan: ");
			a = scan.nextInt();
			if (a % 2 != 0) {
				System.out.println("phai nhap so chan! moi nhap lai");
			}
		} while (a % 2 != 0);
	}

//	5. Viết lệnh cho phép User nhập vào 1 số nguyên từ 1  3
//	 Nếu nhập vào 1 thì in ra "Thực hiện tính năng 1"
//	 Nếu nhập vào 2 thì in ra "Thực hiện tính năng 2"
//	 Nếu nhập vào 3 thì in ra "Thực hiện tính năng 3"
//	 Nếu nhập vào 1 số khác thì in ra "Mời bạn nhập lại!", và yêu cầu User nhập lại
	public static void question05() {
		int input;

		do {
			System.out.println("Nhap 1 -3 de thuc hien cac chuc nang! ");
			System.out.println("1-Chuc nang 1");
			System.out.println("2-Chuc nang 2");
			System.out.println("3-Chuc nang 3");

			input = scan.nextInt();

			if (input < 1 || input > 3) {
				System.err.println("Phai nhap 1-3. Moi nhap lai!");
			}
		} while (input < 1 || input > 3);

		switch (input) {
		case 1:
			System.out.println("Thuc hien chuc nang 1!");
			break;
		case 2:
			System.out.println("Thuc hien chuc nang 2!");
			break;
		case 3:
			System.out.println("Thuc hien chuc nang 3!");
			break;
		}

	}

//	6. Viết lệnh cho phép User nhập vào 1 số nguyên từ 1  3
//	 Nếu nhập vào 1 thì thực hiện question 1
//	 Nếu nhập vào 2 thì thực hiện question 2
//	 Nếu nhập vào 3 thì thực hiện question 3
//	Sau khi User nhập vào 1 số để thực hiện tính năng xong thì in ra "Bạn có muốn thực hiện
//	chức năng khác không?". Nếu User viết "Có" thì in quay lại từ đầu cho User nhập, nếu
//	User viết "Không" thì kết thúc chương trình
	public static void question06() {
		int input;
		do {
			do {
				System.out.println("Nhap 1 -3 de thuc hien cac chuc nang! ");
				System.out.println("1-Nhap ten");
				System.out.println("2-Tinh nam sinh dua vao so tuoi");
				System.out.println("3-Tinh tuoi dua vao nam sinh");

				input = scan.nextInt();

				if (input < 1 || input > 3) {
					System.err.println("Phai nhap 1-3. Moi nhap lai!");
				}
			} while (input < 1 || input > 3);

			switch (input) {
			case 1:
				System.out.println("Thuc hien chuc nang 1");
				question01();
				break;
			case 2:
				System.out.println("Thuc hien chuc nang 2");
				question02();
				break;
			case 3:
				System.out.println("Thuc hien chuc nang 3");
				question03();
				break;
			}
			do {
				System.out.println("---------------------------------------");
				System.out.println("Ban co thuc hien chuc nang khac khong?");
				System.out.println("1-co");
				System.out.println("2-khong");
				input = scan.nextInt();

				if (input != 1 && input != 2) {
					System.err.println("Gia tri khong hop le! Moi nhap lai:");
				}
			} while (input != 1 && input != 2);
		} while (input == 1);
	}

}

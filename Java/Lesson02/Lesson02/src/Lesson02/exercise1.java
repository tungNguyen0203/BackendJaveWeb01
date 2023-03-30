package Lesson02;

public class exercise1 {
	public static void main(String[] args) {
		
	}

	static int a = 20;
	static int b = 2;

//	Exercise 1: Operator
//	1. Thực hiện các bước sau
	public static void ex01Question01() {
//		1. Thực hiện các bước sau:
//			 B1: Khai báo 2 số nguyên a & b
//			 B2: In ra
//			o Tổng 2 số 
		System.out.println(a + b);
//			o Hiệu 2 số
		System.out.println(a - b);
//			o Thương 2 số
		System.out.println(a / b);
//			o Số dư khi a chia b
		System.out.println(a % b);
	}

//	2. In ra các kết quả
	public static void ex01Question02() {
//		2. In ra các kết quả
//		a. -5 + 8 * 6
		System.out.println(-5 + 8 * 6);
//		b. (55+9) % 9
		System.out.println((55 + 9) % 9);
//		c. 20 + -3*5 / 8
		System.out.println(20 + -3 * 5 / 8);
//		d. 5 + 15 / 3 * 2 - 8 % 3
		System.out.println(5 + 15 / 3 * 2 - 8 % 3);
//		e. ((25.5 * 3.5 - 3.5 * 3.5) / (40.5 - 4.5))
		System.out.println(((25.5 * 3.5 - 3.5 * 3.5) / (40.5 - 4.5)));
	}

//	3. Khai báo 1 biến float là bán kính hình tròn (Radius), sau đó in ra chu vi và diện tích của  hình tròn
	public static void ex01Question03() {
		float radius = 3.0f;
		System.out.println(2 * radius * 3.14);
		System.out.println(2 * radius * radius);
	}

//	4. dien tich chu vi hinh chu nhat
	public static void ex01Question04() {
		float height = 3.0f;
		float width = 5.0f;

		System.out.println(2 * (height + width));
	}

//	5. doi bien cho nhau?
	public static void ex01Question05() {
		int temp;
		temp = a;
		a = b;
		b = temp;
		System.out.println(a);
		System.out.println(b);
	}

//	6. Thực hiện các bước sau:
//		 B1: Khai báo 1 số thực (Đơn vị tính cho số này là centimet). VD: 5.3
//		 B2: In ra số tương đương tính bằng foot và inch theo công thức 1 inch = 2.54 cm 
//		và 1 foot = 12 inches
	public static void ex01Question06() {
		float x = 5.3f;
		float doiIch = (float) (x / 2.54);
		float douFoot = (float) (doiIch / 12);

		System.out.println("ich = " + doiIch);
		System.out.println("foot = " + douFoot);
	}

//	7. Thực hiện các bước sau:
//		 B1: Khai báo 1 số nguyên (Đơn vị tính là số giây). VD: 67 00 5
//		 B2: Đổi số giây trên thành dạng [giờ:phút:giây] và in ra. VD: 03:05:50
	public static void ex01Question07() {
//		ép kiểu qua string rùi gắn vào
//		int x = 202020;
//
//		ArrayList<Integer> doiString = new ArrayList<>();
//		int temp;
//		int i = 0;
//		
//		while (x > 0) {
//			temp = x % 10;
//			doiString.add((doiString.size() - i), temp);
//			x /= 10;
//			i += 1;
//		}
//		System.out.println(doiString);
//		System.out.printf("%d%d : %d%d : %d%d", doiString.get(0), doiString.get(1), doiString.get(2),doiString.get(3), doiString.get(4), doiString.get(5));
		
		int y = 67005;
		int doiGio = y / 3600;
		int doiPhut = (y%3600)/60;
		int doiGiay = (y%3600) % 60;

		System.out.printf("%d : %d : %d", doiGio, doiPhut, doiGiay);
		
	}
}

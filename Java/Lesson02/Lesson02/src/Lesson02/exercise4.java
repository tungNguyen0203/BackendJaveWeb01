package Lesson02;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class exercise4 {

	public static void main(String[] args) {
		question05();
	}

	public static void question01() {
		List<Integer> nums = Arrays.asList(1, -4, 5, 2, -3, 6, -7, 4, 2, 3);
		int sum = 0;
		for (int i = 0; i < nums.size(); i++) {
			sum += nums.get(i);
		}
		System.out.println(sum);

		for (int i = 0; i < nums.size(); i++) {
			if (nums.get(i) % 2 == 0) {
				sum += nums.get(i);
			}
		}
	}

//	2. Khai báo 1 số nguyên n từ 1  9 và in ra bảng cửu chương
	public static void question02() {
		int n = 8;

		for (int i = 01; i <= 10; i++) {
			System.out.println(n + " x " + i + " = " + n * i);
		}
	}

//	3. Khai báo 1 list có 16 số nguyên. In ra các số thành 4 hàng, mỗi hàng có 4 số
	public static void question03() {
		List<Integer> nums = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
		for (int i = 0; i < nums.size(); i++) {
			if (i % 4 == 0 && i != 0) {
				System.out.println();
			}
			System.out.print(nums.get(i) + " ");
		}

	}

//	4. Nhập vào 1 số n > 0 và in ra theo pattern sau
	public static void question04() {
		int n = 5;

		for (int i = 1; i <= n; i++) {
			for (int j = 0; j < i; j++) {
				System.out.print(i);
			}
			System.out.println();
		}
	}

//	5. In ra hinh duoi
	public static void question05() {
		int n = 10;
//		a,
//		for (int i = 1; i < n; i++) {
//			for (int j = 0; j < i; j++) {
//				System.out.print("# ");
//			}
//			System.out.println("");
//		}
		
//		b,
//		for (int i = 1; i < n; i++) {
//			for (int j = 0; j < n - i; j++) {
//				System.out.print("# ");
//			}
//			System.out.println("");
//		}
		
//		c,
//		for (int i = 0; i < 10; i++) {
//			for (int j = 0 ;j < 10; j++) {
//
//					if (j>=i) {
//						
//						System.out.print("# ");
//					} else {
//                         System.out.print("  ");
//					}
//			}
//			System.out.println();
//		}
		
//		d.
		for (int i = 0; i < 10; i++) {
			for (int j = 0 ;j < 10; j++) {

					if (j>= (n - i -1)) {
						
						System.out.print("# ");
					} else {
                         System.out.print("  ");
					}
			}
			System.out.println();
		}
		
	}
	
	
	
}

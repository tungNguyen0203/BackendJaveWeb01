import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class exercise2 {
	public static void main(String[] args) {
//      question04  
//		int n = 50;
//		for (int i = 0; i < n; i++) {
//            if (checkSNT(i) == true) {
//                System.out.print(i + " ");
//            }
//        }
		
//		question05
//		int n = scan.nextInt();
//		int count = 0;
//		int i = 2;
//		
//		while (count <= n) {
//			if (checkSNT(i) == true) {
//				System.out.print(i + " ");
//				count++;
//			}
//			i++;
//		}
		
//		question06
		List<Integer> numbList = new ArrayList<>();
		numbList.add(1);
		numbList.add(3);
		numbList.add(4);
		numbList.add(5);
		numbList.add(8);
		numbList.add(9);
//		System.out.println(numbList);
		ques06(7, numbList);
		System.out.println(numbList);

	}

//	private static Scanner scan = new Scanner(System.in);
		
//	1. Khai báo 1 list các số nguyên (VD: 1, 4, 5, 2, 3, 6, 7, 4, 2, 3), và khai báo 1 số nguyên n
//	a. In ra vị trí index đầu tiên xuất hiện n (VD: n = 3 thì index = 4)
//	b. In ra vị trí index thứ 2 xuất hiện n (VD: n = 3 thì index = 9)
	public static void question1() {
		List<Integer> numbList = Arrays.asList(1, 4, 5, 2, 3, 6, 7, 4, 2, 3);
		int n = 3;
		int i = 0;
		int count = 0;

		while (i < numbList.size()) {
			if (numbList.get(i) == n) {
				count++;
			}
			
			if (count == 1) {
				System.out.println("vi tri " + i);
				break;
			}
			i++;
		}

	}
	
//	2. Khai báo 1 số n, liệt kê tất cả các số chẵn nhỏ hơn n cho trước
	public static void question2() {
		int n = 20;
		int i = 0;
		while (i <= n) {
			if (i % 2 == 0) {
				System.out.println(i + " ");
			}
			i++;
		}
	}
	
//	4. Khai báo 1 số n, liệt kê tất cả các số nguyên tố nhỏ hơn n cho trước
//	Hướng dẫn:
//	 Khai báo riêng 1 method có parameter là 1 số nguyên và check xem có phải là số
//	nguyên tố hay không, nếu là số nguyên tố thì return true, nếu không thì return
//	false
//	 Sau đó sẽ sử dụng method này trong vòng for để check từng số cho tới n
	
	public static boolean checkSNT(int x) {
		if (x < 2) {
			return false;
		}
		int canBacHi = (int) Math.sqrt(x);
		for (int i = 2; i <= canBacHi; i++) {
			if (x % i == 0) {
				return false;
			}
		}
		return true;
	}
	
//	5. Khai báo 1 số n, liệt kê n số nguyên tố đầu tiên
//	dung method o question04

//	6. Cho 1 list đã được sắp xếp tăng dần. (VD: 1, 3, 4, 5, 8, 9). Hãy viết method để insert 1 số
//	bất kỳ mà vẫn đảm bảo tính tăng dần
	public static List<Integer> ques06(int x, List<Integer> numbListIn) {
		for (int i = 0; i < numbListIn.size(); i++) {
			if (x < numbListIn.get(i)) {
				numbListIn.add(i, x);
				break;
			}
		}
		
		return numbListIn;
	}
	
}

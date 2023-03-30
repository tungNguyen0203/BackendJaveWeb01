import java.util.Scanner;

public class exercise03 {
	public static void main(String[] args) {
//		int n = scan.nextInt();
		
//		question01
//		if (checkSoChan(n) == true) {
//			System.out.println("n = "+ n + " la so chan");
//		} else {
//			System.out.println("n = "+ n + " la so le");
//		}
		
//		question02
		int count = 0;
		int i = 2;
		
		while (count <= n) {
			if (checkSNT(i) == true) {
				System.out.print(i + " ");
				count++;
			}
			i++;
		}
	}
	
//	scanner
//	private static Scanner scan = new Scanner(System.in);
	
//	1. Thực hiện các bước sau
//	 B1: Khai báo 1 method có 1 parameter là số nguyên n, method sẽ thực hiện kiểm
//	tra xem số nguyên n có phải số chẵn hay không. Nếu là số chẵn thì return true,
//	nếu không thì return false
//	 B2: sử dụng method, truyền vào tham số n = 8, in ra kết quả "Số chẵn" hoặc "Số
//	lẻ"
	
	public static boolean checkSoChan(int x) {
		if (x % 2 != 0) {
			return false;
		}
		return true;
//		cach rut gon
//		return checkSNT(x % 2 == 0);
	}
	
//	2. Thực hiện các bước sau
//	 B1: Khai báo 1 method có 1 parameter là số nguyên n, method sẽ thực hiện kiểm
//	tra xem số nguyên n có phải số nguyên tố hay không. Nếu là số nguyên tố thì
//	return true, nếu không thì return false
//	 B2: sử dụng method, truyền vào tham số n = 8, in ra kết quả "Số nguyên tố" hoặc
//	"Không phải số nguyên tố"
	
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
}

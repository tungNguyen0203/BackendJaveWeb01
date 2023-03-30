import java.util.Arrays;
import java.util.List;

public class exercise01 {
	public static void main(String[] args) {
		question3();
		
	}
	
//	1. In ra các số từ 1 tới 20, ngoại trừ số 10
//	Làm theo cả 2 cách break & continue
	public static void question1() {
		for (int i = 0; i < 20; i++) {
			if (i == 10) {
				break;
			}
			System.out.println(i);
		}
	}
	
//	2. In ra các số từ 1 tới 20, ngoại trừ số 10
	public static void question2() {
		for (int i = 1; i < 21; i++) {
			if (i == 10) {
				continue;
			}
			System.out.println(i);
		}
	}
	
	
//	3. Khai báo 1 list các số nguyên (VD: 1,4,5,2,3,6,7,4,2,3,4,3,5,3, 5, 7), và khai báo 1 số
//	nguyên n
	public static void question3() {
		List<Integer> numbArrayList = Arrays.asList(1,4,5,2,3,6,7,4,2,3,4,3,5,3, 5,7);
		
		System.out.println(numbArrayList);
		
//		a. In ra vị trí index đầu tiên xuất hiện n (VD: n = 3 thì index = 4)
//		int n = 3;
//		for (int i = 0; i < numbArrayList.size(); i++) {
//			if (numbArrayList.get(i) == n) {
//				System.out.println(i);
//				break;
//			}
//		}
		
//		b. In ra vị trí index thứ 2 xuất hiện n (VD: n = 3 thì index = 4)
//		int s=0;
//		for (int i = 0; i < numbArrayList.size(); i++) {
//			if (numbArrayList.get(i) == 3) {	
//				s++;
//			}
//			if (s == 2) {
//				System.out.println(i);
//				break;
//			}
//		}
		
//		c. Khai báo 1 biến count = 4, in ra vị trí index thứ count xuất hiện n (VD: count = 4,
//		n = 3 thì index = 13)
		
//		int n = 3;
//		int count = 4;
//		int nCount = 0;
//		
//		for (int i = 0; i < numbArrayList.size(); i++) {
//			if (numbArrayList.get(i) == n) {
//				nCount++;
//			}
//			if (nCount == count) {
//				System.out.println(i);
//				break;
//			}
//		}
		
//		d. In ra vị trí index đầu tiên xuất hiện số chẵn
		for (int i = 0; i < numbArrayList.size(); i++) {
			if (numbArrayList.get(i) % 2 == 0) {
				System.out.println("n = " + numbArrayList.get(i) + " index = " + i);
				break;
			}
		}
		
		
	}
	

}

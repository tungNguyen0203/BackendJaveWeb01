package Lesson02;

public class exercise2 {
	public static void main(String[] args) {
		ex02Question05();
	}
	
	static int a = 20;
	static int b = 5;
	
//	Exercise 2: If else
		public static void ex02Question01() {
//			1. Khai báo hai số nguyên bất kỳ a và b. Tính hiệu của hai số đó.
//			 Nếu hiệu số lớn hơn 0 thì in ra dòng chữ [Số thứ nhất lớn hơn số thứ hai]
//			 Nếu hiệu số nhỏ hơn 0 thì in ra dòng chữ [Số thứ nhất nhỏ hơn số thứ hai]
//			Làm theo cả 2 cách if else và ternary

			if (a - b > 0) {
				System.out.println("so thu nhat lon hơn so thu hai");
			} else {
				System.out.println("so thu nhat nho hon so thu hai");
			}
//			ternary: viet tat cua cau lenh if- else
			System.out.println(a - b > 0 ? "so thu nhat lon hơn so thu hai" : "so thu nhat nho hon so thu hai");

		}
		
		
//			2. Khai báo 1 số nguyên a. In ra a là "positive" hoặc "Negative
		public static void ex02Question02() {
			if (a < 0) {
				System.out.println("Negative");
			} else if (a == 0) {
				System.out.println("a bang 0");
			} else {
				System.out.println("positive");
			}
			System.out.println(a < b ? a == 0 ? "Negative" : " bang 0" : "positive");
		}
		
//			3. Khai báo 2 số nguyên a và b. Kiểm tra xem a có chia hết cho b không, in ra kết quả "Yes" 
//			hoặc "No"
		public static void ex02Question03() {
			if (a % b == 0) {
				System.out.println("Yes");
			} else {
				System.out.println("No");
			}
//			ternary:
			System.out.println(a % b == 0 ? "Yes" : "No");
		}
		
//			4. Khai báo 3 điểm toán, lý, hóa là 3 số thực. Sau đó in ra điểm trung bình và học lực của 
//			học sinh với công thức tính như sau:
		public static void ex02Question04() {
			float toan = 8.0f;
			float ly = 8.0f;
			float hoa = 8.0f;

			float tb = (float) ((toan * 2 + ly + hoa) / 4.0);

			if (tb < 5.0) {
				System.out.println("loai kem");
			} else if (tb < 6.0) {
				System.out.println("loai yeu");
			} else if (tb < 7.0) {
				System.out.println("loai trung binh");
			} else if (tb < 8.0) {
				System.out.println("loai kha");
			} else if (tb < 9.0) {
				System.out.println("loai gioi");
			} else {
				System.out.println("loai xuat sac");
			}
		}
		
//		5. Thực hiện các bước sau:
		public static void ex02Question05() {
			int tongThuNhap = 500000000; // 100 trieu
			int soNguoiPhuThuoc = 5;

			int giamTruBanThan = 11000000; // 11 trieu
			int giamTruNguoiPhuThuoc = soNguoiPhuThuoc * 4400000;
			
			int thuNhapChiuThue = tongThuNhap - giamTruBanThan - giamTruNguoiPhuThuoc;
			
			if (thuNhapChiuThue <= 0) {
				System.out.println("thue thu nhap ca nhan la: 0");
				return;
			}
			
			int bac;
			int khoangTien;
			float phamTram;
			
			if (thuNhapChiuThue <= 5000000) {
				bac = 1;
				khoangTien = 0;
				phamTram = 0.05f;
			} else if (thuNhapChiuThue <= 10000000) {
				bac = 2;
				khoangTien = 5000000;
				phamTram = 0.10f;
			} else if (thuNhapChiuThue <= 18000000) {
				bac = 3;
				khoangTien = 10000000;
				phamTram = 0.15f;
			} else if (thuNhapChiuThue <= 32000000) {
				bac = 4;
				khoangTien = 18000000;
				phamTram = 0.20f;
			} else if (thuNhapChiuThue <= 52000000) {
				bac = 5;
				khoangTien = 32000000;
				phamTram = 0.25f;
			} else if (thuNhapChiuThue <= 80000000) {
				bac = 6;
				khoangTien = 52000000;
				phamTram = 0.30f;
			} else {
				bac = 7;
				khoangTien = 80000000;
				phamTram = 0.35f;
			}
			
			System.out.println("bac: " + bac);
			System.out.println("khoang tien: " + khoangTien);
			System.out.println("pham tram: " + phamTram + "\n");
			
			int thueBacCaoNhat = 0;
			int thueBac1 = 0;int thueBac2 = 0; int thueBac3 = 0; 
			int thueBac4 = 0;int thueBac5 = 0; int thueBac6 = 0; int thuBac7 = 0;
			
			for (int i = 1; i <= bac; i++) {
				switch (i) {
				case 1:
					if (i != bac) {
						thueBac1 = (int) (5000000*0.05);
					} else {
						thueBacCaoNhat = (int) ((thuNhapChiuThue - khoangTien)*phamTram);
						continue;
					}
					System.out.println("thue bac 1: " + thueBac1);
					break;
				case 2:
					if (i != bac) {
						thueBac2 = (int) (5000000*0.10);
					} else {
						thueBacCaoNhat = (int) ((thuNhapChiuThue - khoangTien)*phamTram);
						continue;
					}
					System.out.println("thue bac 2: " + thueBac2);
					break;
				case 3:
					if (i != bac) {
						thueBac3 = (int) (8000000*0.15);
					} else {
						thueBacCaoNhat = (int) ((thuNhapChiuThue - khoangTien)*phamTram);
						continue;
					}
					System.out.println("thue bac 3: " + thueBac3);
					break;
				case 4:
					if (i != bac) {
						thueBac4 = (int) (14000000*0.20);
					} else {
						thueBacCaoNhat = (int) ((thuNhapChiuThue - khoangTien)*phamTram);
						continue;
					}
					System.out.println("thue bac 4: " + thueBac4);
					break;
				case 5:
					if (i != bac) {
						thueBac5 = (int) (20000000*0.25);
					} else {
						thueBacCaoNhat = (int) ((thuNhapChiuThue - khoangTien)*phamTram);
						continue;
					}
					System.out.println("thue bac 5: " + thueBac5);
					break;
				case 6:
					if (i != bac) {
						thueBac6 = (int) (28000000*0.30);
					} else {
						thueBacCaoNhat = (int) ((thuNhapChiuThue - khoangTien)*phamTram);
						continue;
					}
					System.out.println("thue bac 6: " + thueBac6);
					break;
				case 7:
					thuBac7 = (int) ((thuNhapChiuThue - khoangTien)*phamTram);
					System.out.println("thue bac 7: " + thuBac7);
					break;	
				}
			}
			
			int thuePhaiTra = thueBac1 + thueBac2 + thueBac3 + thueBac4+ thueBac5 + thueBac6 + thuBac7 + thueBacCaoNhat;
			System.out.println(thuePhaiTra);
		}
}

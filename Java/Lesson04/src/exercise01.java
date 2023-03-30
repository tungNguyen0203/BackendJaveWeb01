import java.util.Arrays;
import java.util.List;

public class exercise01 {
	public static void main(String[] args) {
		question10();
	}

//	1. Khai báo 1 String a = "nguyen van a", đếm số lượng các chữ trong String
	public static void question01() {
		String a = "nguyen van a";
		System.out.println(a.length());
	}

//	2. Khai báo 1 String a = "nguyen van a", đếm số lượng các từ trong String
	public static void question02() {
		String a = "nguyen van a";
		List<String> wordList = Arrays.asList(a.split(" "));
		System.out.println(wordList);
	}

//	3. Khai báo 1 String a = "nguyen van a", chuyển các ký tự "van" sang ký tự "*"
//	Output: "nguyen * a"
	public static void question03() {
		String a = "nguyen van a";
		a = a.replace("van", "*");
		System.out.println(a);
	}

//	4. Khai báo 1 String a = 1 giá trị bất kì và viết hoa chữ cái đầu nếu chưa viết hoa
	public static void question04() {
		String a = "nguyen Van a ha ha";
		List<String> wordList = Arrays.asList(a.split(" "));

		String s = "";
		for (int i = 0; i < wordList.size(); i++) {
			s += kyTuDau(wordList.get(i)) + " ";
		}

		System.out.println(s);
	}

	public static String kyTuDau(String s) {
		String kyTuDau = s.substring(0, 1);
		String conLai = s.substring(1);

		s = kyTuDau.toUpperCase() + conLai;

		return s;
	}

//	5. Khai báo 1 String fullname = họ và tên của mình (có thể 2, 3, 4, 5 từ) và in ra tên, tên
//	đệm và họ	
	public static void question05() {
		String fullname = "nguyen van thi b be be ";
		List<String> wordList = Arrays.asList(fullname.split(" "));

		String ho = wordList.get(0);
		String tenDem = "";
		for (int i = 1; i < wordList.size() - 1; i++) {
			tenDem += wordList.get(i) + " ";
		}

		String ten = wordList.get(wordList.size() - 1);

		System.out.println("Ho: " + ho);
		System.out.println("Ten dem: " + tenDem);
		System.out.println("Ten: " + ten);

	}

//	6. Khai báo 1 String a = " ngUyen vAn A " và khai báo các method như sau:
//		a. Xóa space thừa ở đầu, cuối và giữa
//		Hướng dẫn: Method removeSpace(String s) và trả về String (sau khi truyền String
//		a vào thì output là "ngUyen vAn A"
//		b. Viết hoa chữ cái đầu mỗi từ
//		Hướng dẫn: Method normalizeName(String s) và trả về String (sau khi truyền
//		String a từ câu a) vào thì output là "Nguyen Van A")
//		c. Viết method mới để test 2 method a) và b)	
	public static void question06() {
		String a = " nguyen    Van    a ";

		a = removeSpace(a);
		a = normalizaName(a);

		System.out.println(a);
	}

	public static String removeSpace(String s) {
		s = s.trim();
		while (s.contains("  ")) {
			s = s.replace("  ", " ");
		}
		return s;
	}

	public static String normalizaName(String s) {
		List<String> wordList = Arrays.asList(s.split(" "));
		String string = "";
		for (int i = 0; i < wordList.size(); i++) {
			string += hoaKyTuDau(wordList.get(i)) + " ";
		}
		string = string.trim();
		return string;
	}

	public static String hoaKyTuDau(String s) {
		String kyTuDau = s.substring(0, 1);
		String phanConLai = s.substring(1);

		s = kyTuDau.toUpperCase() + phanConLai;

		return s;
	}

//	7. Khai báo 1 String a = "Hello World", in ra String đảo ngược "dlroW, olleH"
	public static void question07() {
		String a = "Hello World";
		a = daoNguocString(a);
		System.out.println(a);
	}

	public static String daoNguocString(String s) {
		String string = "";
		for (int i = s.length() - 1; i >= 0; i--) {
			string += s.charAt(i) + " ";
		}
		return string;
	}

//	8. Khai báo 1 String a = "nguyen van nam", in ra String đảo ngược theo từ "nam van nguyen"
	public static void question08() {
		String a = "nguyen van a";
		a = daoNguocTu(a);
		System.out.println(a);
	}

	public static String daoNguocTu(String a) {
		String string = "";
		List<String> wordList = Arrays.asList(a.split(" "));
		for (int i = wordList.size() - 1; i >= 0; i--) {
			string += wordList.get(i) + " ";
		}
		string = string.trim();
		return string;
	}

//	9. Viết method để kiểm tra 2 chuỗi có là đảo ngược của nhau hay không. Nếu có thì in ra
//	"yes", nếu không in ra "No"
//	VD: Ví dụ “word” và “drow” là 2 chuỗi đảo ngược nhau.
	public static void question09() {
		String a = "Hello World";
		String b = "dlroW olleH";
		String s = daoNguocString09(a);

		if (s.equals(b)) {
			System.out.println("yes");
		} else {
			System.out.println("no");
		}
	}

	public static String daoNguocString09(String s) {
		String string = "";
		for (int i = s.length() - 1; i >= 0; i--) {
			string += s.charAt(i);
		}
		return string;
	}

//	10. Hãy viết chương trình tính tổng các chữ số của một số nguyên bất kỳ.
//	Ví dụ: Số 8545604 có tổng các chữ số là: 8 + 5 + 4 + 5 + 6 + 0 + 4 = 32
	public static void question10() {
		int a = 8545604;
		int sum = sumInt(a);
		System.out.println(sum);
	}
	
	public static int sumInt(int a) {
		int sum = 0;
		while (a > 0) {
			sum += a % 10;
			a = a/10;
		}
		return sum;
	}
	
	
	
	
	
	
	
	
	
}

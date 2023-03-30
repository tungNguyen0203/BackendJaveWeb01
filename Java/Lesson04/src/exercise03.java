import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class exercise03 {
	public static void main(String[] args) {
		question06();
	}

//	1. In ngẫu nhiên ra 1 số nguyên
	public static void question01() {
		Random random = new Random();
		int x = random.nextInt();
		System.out.println(x);
	}

//	2. In ngẫu nhiên ra 1 số thực
	public static void question02() {
		Random random = new Random();
		double x = random.nextDouble();
		System.out.println(x);
	}

//	3. Khai báo 1 List tên (VD: "nguyen van a", "nguyen van b", "nguyen van c", ...) và in ra
//	random 1 tên
	public static void question03() {
		List<String> listStrings = new ArrayList<>();
		listStrings.add("nguyen van a");
		listStrings.add("nguyen van b");
		listStrings.add("nguyen van c");

		Random random = new Random();
		int indexString = random.nextInt(listStrings.size());
		System.out.println(listStrings.get(indexString));
	}

//	4. Lấy ngẫu nhiên 1 số có 3 chữ số
	public static void question04() {
		Random random = new Random();
		int x = random.nextInt(999 - 100) + 100;
		System.out.println(x);
	}

//	5. Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 24-07-1995 tới ngày 20-12-1995
	public static void question05() {
		Random random = new Random();
		LocalDate minDate = LocalDate.of(1995, 12, 18);
		LocalDate maxDate = LocalDate.of(1995, 12, 20);

		int minDay = (int) minDate.toEpochDay();
		int maxDay = (int) maxDate.toEpochDay();

//		cộng 1 ở đây là vì trong hàm nextInt(5) thì nó chỉ gen ra đc số 0 đến 4 và không lấy số 5
//		Vì vậy phải cộng 1 thì mới lấy cả 5
		int randomDay = random.nextInt(maxDay - minDay + 1) + minDay;

		LocalDate randomDate = LocalDate.ofEpochDay(randomDay);

		System.out.println(randomDate);
	}

//	6. Lấy ngẫu nhiên 1 ngày trong khoảng thời gian 1 năm trở lại đây
	public static void question06() {
		Random random = new Random();
		LocalDate presentDate = LocalDate.now();

		int presentDay = (int) presentDate.toEpochDay();
		int minDay = presentDay - 365;

		int randomDay = random.nextInt(presentDay - minDay + 1) + minDay;

		LocalDate randomDate = LocalDate.ofEpochDay(randomDay);

		System.out.println(randomDate);
	}
}

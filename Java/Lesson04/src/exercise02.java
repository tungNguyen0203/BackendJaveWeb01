import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class exercise02 {
	public static void main(String[] args) {
		questionC();
	}

//	1. Khai báo 1 variable LocalDateTime = now
//		a. In ra theo định dạng năm – tháng – ngày – giờ – phút – giây
//			VD: 2023-03-26-15-30-20
	public static void questionA() {
		LocalDateTime todayDate = LocalDateTime.now();
		String pattern = "yyyy-MM-dd HH:mm:ss";

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(pattern);
		String formattedDate = todayDate.format(dateTimeFormatter);

		System.out.println(formattedDate);
	}

//		b. In ra theo định dạng giờ – phút – giây - năm – tháng – ngày
//			VD: 15-30-20-2023-03-26
	
	public static void questionB() {
		LocalDateTime todayDate = LocalDateTime.now();
		String pattern = "HH:mm:ss yyyy-MM-dd";

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(pattern);
		String formattedDate = todayDate.format(dateTimeFormatter);

		System.out.println(formattedDate);
	}
	
//		c. In ra theo định dạng năm – tháng – ngày
//			VD: 2023-March-26
	public static void questionC() {
		LocalDateTime todayDate = LocalDateTime.now();
		String pattern = "yyyy-MMMM-dd";

		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(pattern);
		String formattedDate = todayDate.format(dateTimeFormatter);

		System.out.println(formattedDate);
	
	}
}

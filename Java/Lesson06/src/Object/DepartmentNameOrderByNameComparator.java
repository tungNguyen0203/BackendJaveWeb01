package Object;

import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

public class DepartmentNameOrderByNameComparator implements Comparator<Department> {
	public int compare(Department d1, Department d2) {
		String daoNguocStringD1 = daoNguocString(d1.name);
		String daoNguocStringD2 = daoNguocString(d2.name);

		return daoNguocStringD1.compareTo(daoNguocStringD2);
	}

	public String daoNguocString(String s) {
		List<String> wordList = Arrays.asList(s.split(" "));
		String reverseStr = "";
		for (int i = wordList.size() - 1; i >= 0; i--) {
			reverseStr += wordList.get(i);
		}
		return reverseStr;
	}
}

package day0623;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ForEachService {
	public String[] subjectArr() {
		String[] subject = { "Java SE", "C/C++", "PyThon", "PHP", "JavaScript" };

		return subject;
	}

	public List<String> subjectList() {
		List<String> subject = new ArrayList<>();

		subject.add("Java SE");
		subject.add("C/C++");
		subject.add("PyThon");
		subject.add("PHP");
		subject.add("JavaScript");

		return subject;
	}

	public List<UserDTO2> searchUser() {
		List<UserDTO2> list = new ArrayList<>();
		if (new Random().nextBoolean()) {
			list.add(new UserDTO2("테스트", "test@test.com", 25));
			list.add(new UserDTO2("테스트1", "test1@test.com", 35));
			list.add(new UserDTO2("테스트2", "test2@test.com", 45));
			list.add(new UserDTO2("테스트3", "test3@test.com", 52));
		}

		return list;
	}
}

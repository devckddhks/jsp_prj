package day0622;

public class CounterDTO {
	private int cnt;
	
	public CounterDTO() {
		System.out.println("ConterDTO 객체 생성");
		cnt = 0;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt += cnt;
	}
	
}

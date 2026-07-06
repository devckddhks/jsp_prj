package kr.co.sist.board;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class RangeDTO {
	private int startNum, endNum;
	private String fieldNum, field, keyword;

	private String[] fieldArr = { "title", "content", "id" };

	public void setFieldNum(String fieldNum) {
		this.fieldNum = fieldNum;
		
		if (fieldNum == null || "".equals(fieldNum)) {
			fieldNum = "0";
		}

		switch (fieldNum) {
		case "0":
		}

		field = fieldArr[Integer.parseInt(fieldNum)];

	}
	
}

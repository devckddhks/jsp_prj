package kr.co.sist.board;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private int num, cnt;
	private String id, title, content, ip;
	private Date inputDate;
}

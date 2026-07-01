package kr.co.sist.user.member;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class MemberDTO {
	private int smsReceiveYN, emailReceiveYN;
	private String id, password, name, email, phone, phone1, phone2, phone3, zipcode, address, address2;
	private String[] hobby;
	private String ip, profile;
	private Date inputDate;
}

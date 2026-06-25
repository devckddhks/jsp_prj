package kr.co.sist.user.member;

import java.sql.SQLException;

public class MemberService {

	private MemberDAO mDAO = MemberDAO.getInstance();

	/**
	 * 아이디 중복 확인
	 * 
	 * @param id
	 * @return true - 아이디가 존재, false - 아이디가 없는 경우
	 */
	public boolean searchDupId(String id) {
		boolean idFlag = false;

		try {
			idFlag = mDAO.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return idFlag;
	}

	public boolean addMember(MemberDTO mDTO) {
		boolean flag = false;
		// DAO 클래스를 사용하여 DB 추가 작업 수행.
		flag = true;

		return flag;
	}
}

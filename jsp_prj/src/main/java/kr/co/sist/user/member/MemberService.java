package kr.co.sist.user.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import kr.co.sist.chipher.DataEncryption;

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
		try {
			// 일방향 Hash : 비밀번호
			mDTO.setPassword(DataEncryption.messageDigest("SHA-1", mDTO.getPassword()));

			// 암호화 : 이름, 이메일, 전화번호
			String key = "a012345678912345";
			DataEncryption de = new DataEncryption(key);

			mDTO.setName(de.encrypt(mDTO.getName()));
			mDTO.setEmail(de.encrypt(mDTO.getEmail()));
			mDTO.setPhone(de.encrypt(mDTO.getPhone1() + "-" + mDTO.getPhone2() + "-" + mDTO.getPhone3()));

			mDAO.insertWebMember(mDTO);
			flag = true;

			if (mDTO.getHobby() != null) {
				mDAO.insertWebMemberHobby(mDTO);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}
}

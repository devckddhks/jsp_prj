package kr.co.sist.user.login;

import java.sql.SQLException;

import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.user.member.MemberDTO;

public class LoginService {

	public MemberDTO searchLogin(LoginDTO lDTO) {
		MemberDTO mDTO = null;

		LoginDAO lDAO = LoginDAO.getInstance();

		try {
			mDTO = lDAO.selectLogin(lDTO);

			if (mDTO != null) {
				DataDecryption dd = new DataDecryption("a012345678912345");

				try {
					mDTO.setName(dd.decrypt(mDTO.getName()));
					mDTO.setZipcode(mDTO.getZipcode());

				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return mDTO;
	}

}

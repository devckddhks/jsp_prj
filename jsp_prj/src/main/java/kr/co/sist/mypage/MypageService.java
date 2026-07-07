package kr.co.sist.mypage;

import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.json.simple.JSONObject;

import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.user.member.MemberDTO;

public class MypageService {

	@SuppressWarnings("unchecked")
	public String searchMypage(String id) {
		JSONObject jsonObj = new JSONObject();
		MemberDTO mDTO = null;

		MypageDAO mpDAO = MypageDAO.getInstance();

		try {
			mDTO = mpDAO.selectUserInfo(id);

			if (mDTO != null) {
				DataDecryption dd = new DataDecryption("a012345678912345");

				try {
					mDTO.setName(dd.decrypt(mDTO.getName()));
					mDTO.setEmail(dd.decrypt(mDTO.getEmail()));
					mDTO.setPhone(dd.decrypt(mDTO.getPhone()));

				} catch (Exception e) {
					e.printStackTrace();
				}

				jsonObj.put("name", mDTO.getName());
				jsonObj.put("email", mDTO.getEmail());
				jsonObj.put("phone", mDTO.getPhone());
				jsonObj.put("zipcode", mDTO.getZipcode());
				jsonObj.put("address", mDTO.getAddress());
				jsonObj.put("address2", mDTO.getAddress2());
				jsonObj.put("profile", mDTO.getProfile());
				jsonObj.put("ip", mDTO.getIp());

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd EEE a hh:mm:ss");
				jsonObj.put("inputDate", sdf.format(mDTO.getInputDate()));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return jsonObj.toJSONString();
	}

	public boolean modifyProfile(String id, String profileImg) {
		boolean flag = false;

		MypageDAO mDAO = MypageDAO.getInstance();

		try {
			flag = mDAO.updateUserProfile(id, profileImg) == 1;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

}

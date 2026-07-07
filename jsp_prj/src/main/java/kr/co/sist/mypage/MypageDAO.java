package kr.co.sist.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.GetConnection;
import kr.co.sist.user.member.MemberDTO;

public class MypageDAO {
	private static MypageDAO mpDAO;

	private MypageDAO() {
	}

	public static MypageDAO getInstance() {
		if (mpDAO == null) {
			mpDAO = new MypageDAO();
		}

		return mpDAO;
	}

	public MemberDTO selectUserInfo(String id) throws SQLException {
		MemberDTO mDTO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	select name, email, phone, zipcode, address, address2, profile, ip, inputdate	") //
					.append("	from web_member	") //
					.append("	where id = ?	");//

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mDTO = new MemberDTO();

				mDTO.setId(id);
				mDTO.setName(rs.getString("name"));
				mDTO.setEmail(rs.getString("email"));
				mDTO.setPhone(rs.getString("phone"));
				mDTO.setZipcode(rs.getString("zipcode"));
				mDTO.setAddress(rs.getString("address"));
				mDTO.setAddress2(rs.getString("address2"));
				mDTO.setProfile(rs.getString("profile"));
				mDTO.setIp(rs.getString("ip"));
				mDTO.setInputDate(rs.getDate("inputdate"));
			}

		} finally {
			gc.dbClose(rs, pstmt, con);
		}

		return mDTO;
	}

	public int updateUserProfile(String id, String profile) throws SQLException {
		int cnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	update	web_member	") //
					.append("	set		profile = ?	") //
					.append("	where 	id = ?	");//

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, profile);
			pstmt.setString(2, id);

			cnt = pstmt.executeUpdate();

		} finally {
			gc.dbClose(null, pstmt, con);
		}

		return cnt;
	}
}

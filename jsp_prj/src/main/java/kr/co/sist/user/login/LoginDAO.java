package kr.co.sist.user.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.GetConnection;
import kr.co.sist.user.member.MemberDTO;

public class LoginDAO {
	private static LoginDAO lDAO;

	private LoginDAO() {
	}

	public static LoginDAO getInstance() {
		if (lDAO == null) {
			lDAO = new LoginDAO();
		}

		return lDAO;
	}

	public MemberDTO selectLogin(LoginDTO lDTO) throws SQLException {
		MemberDTO mDTO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sb = new StringBuilder();
			sb //
					.append("	select name, zipcode	") //
					.append("	from web_member	") //
					.append("	where id = ? and password = ? and cesession = 'N'	");//

			pstmt = con.prepareStatement(sb.toString());

			pstmt.setString(1, lDTO.getId());
			pstmt.setString(2, lDTO.getPassword());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mDTO = new MemberDTO();

				mDTO.setId(lDTO.getId());
				mDTO.setName(rs.getString("name"));
				mDTO.setZipcode(rs.getString("zipcode"));
			}

		} finally {
			gc.dbClose(rs, pstmt, con);
		}

		return mDTO;
	}
}

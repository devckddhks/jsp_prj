package kr.co.sist.user.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.GetConnection;

public class MemberDAO {
	private static MemberDAO mDAO;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MemberDAO();
		}

		return mDAO;
	}

	public boolean selectId(String id) throws SQLException {
		boolean idFlag = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			// 커넥션 얻기
			con = gc.getConn("dbcp");

			// 쿼리문 수행 객체 얻기
			String selectId = "select 1 from web_member where id = ?";
			pstmt = con.prepareStatement(selectId);

			// 바인드 변수에 값 설정
			pstmt.setString(1, id);

			// 쿼리문 실행 후 결과 얻기
			rs = pstmt.executeQuery();

			idFlag = rs.next(); // 레코드가 존재하면 true / 존재하지 않으면 false 

		} finally {
			// 연결 끊기
			gc.dbClose(rs, pstmt, con);
		}

		return idFlag;
	}
}

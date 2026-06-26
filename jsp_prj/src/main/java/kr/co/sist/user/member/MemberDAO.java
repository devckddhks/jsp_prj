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
			System.out.println(idFlag);

		} finally {
			// 연결 끊기
			gc.dbClose(rs, pstmt, con);
		}

		return idFlag;
	}

	/**
	 * 회원의 정보
	 * 
	 * @param mDTO
	 * @throws SQLException
	 */
	public void insertWebMember(MemberDTO mDTO) throws SQLException {
		// 1. JNDI 사용객체 생성.
		// 2. DBCP에서 DataSource 얻기.
		// 3. DataSource에서 Connection 얻기.

		Connection con = null;
		PreparedStatement pstmt = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder insertMember = new StringBuilder();
			insertMember //
					.append("	insert into web_member	") //
					.append("	(ID, PASSWORD, NAME, EMAIL, PHONE, ZIPCODE, ADDRESS, ADDRESS2, IP, SMSRECEIVEYN, EMAILRECEIVEYN)	") //
					.append("	values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)	");

			pstmt = con.prepareStatement(insertMember.toString());

			// 5. 바인드변수에 값 설정
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPassword());
			pstmt.setString(3, mDTO.getName());
			pstmt.setString(4, mDTO.getEmail());
			pstmt.setString(5, (mDTO.getPhone()));
			pstmt.setString(6, mDTO.getZipcode());
			pstmt.setString(7, mDTO.getAddress());
			pstmt.setString(8, mDTO.getAddress2());
			pstmt.setString(9, mDTO.getIp());
			pstmt.setInt(10, mDTO.getSmsReceiveYN());
			pstmt.setInt(11, mDTO.getEmailReceiveYN());

			// 6. 쿼리문 실행 결과 얻기
			pstmt.executeQuery();

		} finally {
			// 7. 연결 끊기
			gc.dbClose(null, pstmt, con);
		}
	}

	/**
	 * 회원이 선택한 취미
	 * 
	 * @param mDTO
	 * @throws SQLException
	 */
	public void insertWebMemberHobby(MemberDTO mDTO) throws SQLException {
		// 1. JNDI 사용객체 생성.
		// 2. DBCP에서 DataSource 얻기.
		// 3. DataSource에서 Connection 얻기.

		Connection con = null;
		PreparedStatement pstmt = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder insertMember = new StringBuilder();
			insertMember //
					.append("	insert into web_member_hobby	") //
					.append("	(ID, HOBBY)	") //
					.append("	values (?, ?)	");

			pstmt = con.prepareStatement(insertMember.toString());

			String[] hobby = mDTO.getHobby();

			for (int i = 0; i < hobby.length; i++) {
				// 5. 바인드변수에 값 설정
				pstmt.setString(1, mDTO.getId());
				pstmt.setString(2, hobby[i]);

				// 6. 쿼리문 실행 결과 얻기
				pstmt.executeQuery();
			}

		} finally {
			// 7. 연결 끊기
			gc.dbClose(null, pstmt, con);
		}
	}
}

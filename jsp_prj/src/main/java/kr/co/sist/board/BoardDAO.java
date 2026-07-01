package kr.co.sist.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.GetConnection;

public class BoardDAO {
	private static BoardDAO bDAO;

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if (bDAO == null) {
			bDAO = new BoardDAO();
		}

		return bDAO;
	}

	public int selectTotalCount() throws SQLException {
		int totalCount = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	select count(*) cnt	") //
					.append("	from board	"); //

			pstmt = con.prepareStatement(sql.toString());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalCount = rs.getInt("cnt");
			}

		} finally {
			gc.dbClose(rs, pstmt, con);
		}

		return totalCount;
	}

	public List<BoardDTO> selectBoard(RangeDTO rDTO) throws SQLException {
		List<BoardDTO> boardList = new ArrayList<>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	select	num, id, title, input_date, cnt	") //
					.append("	from	(select NUM, ID, TITLE, INPUT_DATE, CNT, row_number() over( order by input_date desc) rnum	") //
					.append("			from board)	") //
					.append("	where 	rnum between ? and ?	"); //

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, rDTO.getStartNum());
			pstmt.setInt(2, rDTO.getEndNum());

			rs = pstmt.executeQuery();

			BoardDTO bDTO = null;

			while (rs.next()) {
				bDTO = new BoardDTO();

				bDTO.setNum(rs.getInt("num"));
				bDTO.setId(rs.getString("id"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setInputDate(rs.getDate("input_date"));
				bDTO.setCnt(rs.getInt("cnt"));

				boardList.add(bDTO);
			}

		} finally {
			gc.dbClose(rs, pstmt, con);
		}

		return boardList;
	}

	public BoardDTO selectBoardDetail(int num) throws SQLException {
		BoardDTO bDTO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	select	num, id, title, content, input_date, cnt, ip	") //
					.append("	from 	board	") //
					.append("	where 	num = ?	"); //

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				bDTO = new BoardDTO();

				bDTO.setNum(rs.getInt("num"));
				bDTO.setId(rs.getString("id"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setInputDate(rs.getDate("input_date"));
				bDTO.setCnt(rs.getInt("cnt"));
				bDTO.setIp(rs.getString("ip"));

				// content 추가
				Clob clob = rs.getClob("content");

				StringBuilder content = new StringBuilder();

				if (clob != null) { // 글의 내용이 존재
					BufferedReader br = new BufferedReader(clob.getCharacterStream());

					try {
						String temp = "";

						while ((temp = br.readLine()) != null) {
							content.append(temp).append("\n");
						}

						if (br != null) {
							br.close();
						}

					} catch (IOException e) {
						e.printStackTrace();
					}
				}

				bDTO.setContent(content.toString());
			}

		} finally {
			gc.dbClose(rs, pstmt, con);
		}

		return bDTO;
	}

	public void updateCnt(int num) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	update 	board		") //
					.append("	set		cnt = cnt + 1	") //
					.append("	where	num = ?	"); //

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, num);

			pstmt.executeUpdate();

		} finally {
			gc.dbClose(null, pstmt, con);
		}

	}

	public void insertBoard(BoardDTO bDTO) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	insert into board	(num, id, title, content, ip)	") //
					.append("	values				(seq_board.nextval, ?, ?, ?, ? )	"); //

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, bDTO.getId());
			pstmt.setString(2, bDTO.getTitle());
			pstmt.setString(3, bDTO.getContent());
			pstmt.setString(4, bDTO.getIp());

			pstmt.executeUpdate();

		} finally {
			gc.dbClose(null, pstmt, con);
		}

	}

	public int updateBoard(BoardDTO bDTO) throws SQLException {
		int cnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	update	board	") //
					.append("	set 	title = ?, content = ?, ip = ?	") //
					.append("	where	id = ? and num = ? 	"); //

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, bDTO.getTitle());
			pstmt.setString(2, bDTO.getContent());
			pstmt.setString(3, bDTO.getIp());
			pstmt.setString(4, bDTO.getId());
			pstmt.setInt(5, bDTO.getNum());

			cnt = pstmt.executeUpdate();

		} finally {
			gc.dbClose(null, pstmt, con);
		}

		return cnt;
	}

	public int deleteBoard(BoardDTO bDTO) throws SQLException {
		int cnt = 0;

		Connection con = null;
		PreparedStatement pstmt = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			StringBuilder sql = new StringBuilder();
			sql //
					.append("	delete from	board				") //
					.append("	where		id = ? and num = ? 	"); //

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, bDTO.getId());
			pstmt.setInt(2, bDTO.getNum());

			cnt = pstmt.executeUpdate();

		} finally {
			gc.dbClose(null, pstmt, con);
		}

		return cnt;
	}

}

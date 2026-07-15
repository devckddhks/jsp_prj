package xml0709;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.GetConnection;

public class DeptDAO {
	private static DeptDAO dDAO;

	private DeptDAO() {

	}

	public static DeptDAO getInstance() {
		if (dDAO == null) {
			dDAO = new DeptDAO();
		}

		return dDAO;
	}

	public List<DeptDTO> selectAllDept() throws SQLException {
		List<DeptDTO> list = new ArrayList<>();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		GetConnection gc = GetConnection.getInstance();

		try {
			con = gc.getConn("dbcp");

			String selectDept = "select deptno, dname, loc from dept";

			pstmt = con.prepareStatement(selectDept);

			rs = pstmt.executeQuery();

			DeptDTO dDTO = null;
			
			while (rs.next()) {
				dDTO = new DeptDTO(rs.getInt("deptno"), rs.getString("dname"), rs.getString("loc"));
				
				list.add(dDTO);
			}

		} finally {
			gc.dbClose(rs, pstmt, con);
		}

		return list;
	}
}

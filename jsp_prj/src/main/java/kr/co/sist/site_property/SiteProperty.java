package kr.co.sist.site_property;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.GetConnection;

public class SiteProperty {
	public static SitePropertyVO spVO;

	// static 영역 : 클래스가 사용되면 한 번만 자동호출되는 영역
	static {
		// JDBC : DBCP와 관련 없이 사이트의 공통정보를 로딩. => DBCP가 문제가 발생하더라도
		// site에 공통부분은 사용자에게 제공할 수 있다.

		// DBCP : DBCP에서 문제가 발생하면 사이트 자체를 제공할 수 없다.
		GetConnection gc = GetConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = gc.getConn("dbcp");

			String selectSiteProperty = "select protocol, server_name, server_port, context_root, upload_dir, api_key, site_info from site_property where type = '1'";

			pstmt = con.prepareStatement(selectSiteProperty);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				spVO = new SitePropertyVO(rs.getString("protocol"), rs.getString("server_name"),
						rs.getString("server_port"),
						(rs.getString("context_root") == null ? "" : rs.getString("context_root")),
						rs.getString("upload_dir"), rs.getString("api_key"), rs.getString("site_info"));
			}
			
			gc.dbClose(rs, pstmt, con);
			
		} catch (SQLException se) {
			se.printStackTrace();
		}
	}
}

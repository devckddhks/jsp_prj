package day0618;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GetConn {

	public Connection getCon() throws SQLException{
		Connection con = null;
		// 1. JNDI사용 객체를 생성한다.
		try {
			Context ctx = new InitialContext();
			
			// 2. Tomcat에 DBCP에서 DataSource를 얻는다.
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/dbcp");
			
			// 3. DataSource에서 Coonnection을 얻는다.
			con = ds.getConnection();
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		
		return con;
	}
	
}

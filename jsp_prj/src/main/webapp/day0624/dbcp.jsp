<%@page import="kr.co.sist.dao.GetConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:catch var="e">
<%
/* 	// 1. JNDI(이름으로 객체를 찾는 자바의 기술) 사용객체 생성.
	Context ctx = new InitialContext();

	// 2. 이름으로 DBCP에 DB와 연결하고 있는 객체(javax.sql.DataSource) 얻기
	DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/dbcp");
	
	// 3. Connection 얻기
	Connection con = ds.getConnection();
	pageContext.setAttribute("con", con);
	
	con.close(); */
	
	GetConnection getConn = GetConnection.getInstance();
	
	Connection con = getConn.getConn("dbcp");
	pageContext.setAttribute("con", con);
	
	getConn.dbClose(null, null, con);
%>
</c:catch>
<c:out value="${ con }" />
<c:if test="${ not empty e }">
	<c:out value="${ e }" />
</c:if>
</body>
</html>
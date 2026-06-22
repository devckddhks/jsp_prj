<%@ page language="java" pageEncoding="UTF-8"%>
<%
String sesName = (String) session.getAttribute("name");
if(sesName == null) {
	response.sendRedirect("http://localhost/jsp_prj/day0619/useSessionA.jsp");
	return;
}
%>
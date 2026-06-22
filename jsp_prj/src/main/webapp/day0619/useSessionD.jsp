<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<%
	// 세션의 값을 삭제하고
	session.removeAttribute("name");
	log("삭제 된 후 " + session.getAttribute("name"));
	// 브라우저에 할당된 무효화
	session.invalidate();
	// 무효화 후에는 브라우저에 할당된 세션이 존재하지 않기 때문에 값을 얻는 행동을 하면 error 발생.
	// 메인 화면으로 이동
	// response.sendRedirect("http://localhost/jsp_prj/day0619/useSessionA.jsp");
	
%>

<!-- <script type="text/javascript">
location.href = "http://localhost/jsp_prj/day0619/useSessionA.jsp";
</script> -->

<!doctype html>
<html>
<head>
<meta http-equiv="refresh" content="0;http://localhost/jsp_prj/day0619/useSessionA.jsp">
</head>
<body>
</body>
</html>
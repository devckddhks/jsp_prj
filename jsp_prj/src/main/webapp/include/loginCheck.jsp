<%@page import="kr.co.sist.user.member.MemberDTO"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/siteProperty.jsp"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberDTO mDTO = (MemberDTO) session.getAttribute("userInfo");
pageContext.setAttribute("mDTO", mDTO);
%>
<c:if test="${ empty mDTO }">
	<c:redirect url="${ CommonURL }/index.html" />
</c:if>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/siteProperty.jsp"%>
<%-- <%@ include file="../include/loginCheck.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = "test";
String sessionName = "테스트";

pageContext.setAttribute("userId", sessionId);
pageContext.setAttribute("userName", sessionName);
%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bDTO" class="kr.co.sist.board.BoardDTO" scope="page" />
<jsp:setProperty property="*" name="bDTO" />
<jsp:setProperty property="id" name="bDTO" value="${ userId }" />
<jsp:setProperty property="ip" name="bDTO" value="<%=request.getRemoteAddr()%>" />
<%
BoardService bs = new BoardService();

pageContext.setAttribute("result", bs.addBoard(bDTO));
%>
<script type="text/javascript">
<c:choose>
	<c:when test="${result}">
		alert("글을 작성했습니다.");
		location.href = "boardList.jsp";
	</c:when>
	<c:otherwise>
		alert("글 저장 중 문제가 발생했습니다. \n 잠시 후 다시 시도해주세요.");
		history.back();
	</c:otherwise>
</c:choose>
</script>
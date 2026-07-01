<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bDTO" class="kr.co.sist.board.BoardDTO" />
<jsp:setProperty property="*" name="bDTO" />
<jsp:setProperty property="id" name="bDTO" value="${ userInfo.id }" />
<%
BoardService bs = new BoardService();
pageContext.setAttribute("bDTO", bDTO);
pageContext.setAttribute("result", bs.removeBoard(bDTO));
%>
<script type="text/javascript">
<c:choose>
	<c:when test="${result}">
		alert("글을 삭제했습니다..");
		location.href = "boardList.jsp?currentPage=${param.currentPage}";
	</c:when>
	<c:otherwise>
		alert("글 삭제 중 문제가 발생했습니다. \n 잠시 후 다시 시도해주세요.");
		history.back();
	</c:otherwise>
</c:choose>
</script>
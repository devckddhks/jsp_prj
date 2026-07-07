<%@page import="java.net.URLEncoder"%>
<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="generator" content="Astro v5.13.2">
<title>Carousel Template · Bootstrap v5.3</title>
<meta name="theme-color" content="#712cf9">
<%-- <jsp:include page="../include/external_file.jsp"/> --%>
<%--<%@ include file="../include/external_file.jsp" %>--%>
<c:import url="${ CommonURL }/include/external_file.jsp" />
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem
	}
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: #0000001a;
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em #0000001a, inset 0 .125em .5em #00000026
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh
}

.bi {
	vertical-align: -.125em;
	fill: currentColor
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch
}

.btn-bd-primary {
	--bd-violet-bg: #712cf9;
	--bd-violet-rgb: 112.520718, 44.062154, 249.437846;
	--bs-btn-font-weight: 600;
	--bs-btn-color: var(--bs-white);
	--bs-btn-bg: var(--bd-violet-bg);
	--bs-btn-border-color: var(--bd-violet-bg);
	--bs-btn-hover-color: var(--bs-white);
	--bs-btn-hover-bg: #6528e0;
	--bs-btn-hover-border-color: #6528e0;
	--bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
	--bs-btn-active-color: var(--bs-btn-hover-color);
	--bs-btn-active-bg: #5a23c8;
	--bs-btn-active-border-color: #5a23c8
}

.bd-mode-toggle {
	z-index: 1500
}

.bd-mode-toggle .bi {
	width: 1em;
	height: 1em
}

.bd-mode-toggle .dropdown-menu .active .bi {
	display: block !important
}

.blue {
	color: blue;
}

.red {
	color: red;
}

a {
	color: #858585;
	text-decoration: none;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#keyword").keyup(function(evt) {
			if (evt.which == 13) {
				chkNull();
			}
		});

		$("#btnSearch").click(chkNull);

		// fieldNum에 값이 있다면 select의 옵션을 선택한 상태로 만들 수 있다.

		$("#fieldNum").val("${empty param.fieldNum ? '0' : param.fieldNum}");
	});

	function chkNull() {
		var keyword = $("#keyword").val();

		if (keyword.trim() == "") {
			alert("검색어를 입력해 주세요");
			return;
		}

		$("#searchForm").submit();
	}
</script>
</head>
<body>
	<svg xmlns="http://www.w3.org/2000/svg" class="d-none"> <symbol id="check2" viewBox="0 0 16 16"> <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"></path> </symbol> <symbol id="circle-half" viewBox="0 0 16 16"> <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"></path> </symbol> <symbol id="moon-stars-fill" viewBox="0 0 16 16"> <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"></path> <path
			d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"
		></path> </symbol> <symbol id="sun-fill" viewBox="0 0 16 16"> <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"></path> </symbol> </svg>
	<div class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
		<button class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center" id="bd-theme" type="button" aria-expanded="false" data-bs-toggle="dropdown" aria-label="Toggle theme (auto)">
			<svg class="bi my-1 theme-icon-active" aria-hidden="true">
				<use href="#circle-half"></use></svg>
			<span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
		</button>
		<ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="bd-theme-text">
			<li>
				<button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light" aria-pressed="false">
					<svg class="bi me-2 opacity-50" aria-hidden="true">
						<use href="#sun-fill"></use></svg>
					Light
					<svg class="bi ms-auto d-none" aria-hidden="true">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark" aria-pressed="false">
					<svg class="bi me-2 opacity-50" aria-hidden="true">
						<use href="#moon-stars-fill"></use></svg>
					Dark
					<svg class="bi ms-auto d-none" aria-hidden="true">
						<use href="#check2"></use></svg>
				</button>
			</li>
			<li>
				<button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto" aria-pressed="true">
					<svg class="bi me-2 opacity-50" aria-hidden="true">
						<use href="#circle-half"></use></svg>
					Auto
					<svg class="bi ms-auto d-none" aria-hidden="true">
						<use href="#check2"></use></svg>
				</button>
			</li>
		</ul>
	</div>
	<header data-bs-theme="dark">
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<%-- <jsp:include page="../fragments/nav_bar.jsp"/> --%>
			<c:import url="../fragments/nav_bar.jsp" />
		</nav>
	</header>
	<main>
		<div id="boardDiv" style="margin-top: 20px; padding: 10px;">
			<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page" />
			<jsp:setProperty property="*" name="rDTO" />
			<%
			BoardService bs = new BoardService();
			// 1. 총 레코드 수
			int totalCount = bs.searchTotalCount(rDTO);
			
			// 2. 한 화면에 보여질 게시글의 수
			int pageScale = bs.pageScale();
			
			// 3. 총 페이지 수
			int totalPage = bs.totalPage();
			
			// 4. 선택한 페이지의 시작 번호 구하기
			String tempPage = request.getParameter("currentPage");
			int currentPage = bs.currentPage(tempPage);

			int startNum = bs.startNum();
			
			
			// 5. 선택한 페이지의 끝 번호 구하기
			int endNum = bs.endNum();

			rDTO.setStartNum(startNum);
			rDTO.setEndNum(endNum);

			List<BoardDTO> listBoard = bs.searchBoard(rDTO);

			pageContext.setAttribute("totalCount", totalCount);
			pageContext.setAttribute("pageScale", pageScale);
			pageContext.setAttribute("totalPage", totalPage);
			pageContext.setAttribute("startNum", startNum);
			pageContext.setAttribute("endNum", endNum);
			pageContext.setAttribute("currentPage", currentPage);
			pageContext.setAttribute("listBoard", listBoard);
			%>
			<%-- 총 레코드의 수 : ${ totalCount }건<br> 
			한 화면에 보여질 게시글의 수 : ${ pageScale }건<br> 
			총 페이지 수 : ${ totalPage }장<br>
			현재 페이지 : ${ currentPage }<br>
			시작 숫자: ${ startNum }번<br>
			끝 숫자: ${ endNum }번<br> --%>

			<div id="divBoardHeader">
				<c:if test="${ not empty userInfo }">
					<a href="boardWriteForm.jsp" class="btn btn-outline-primary btn-sm">글작성</a>
				</c:if>
			</div>

			<div id="divBoardContent" style="height: 500px;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="width: 80px;">번호</th>
							<th style="width: 400px;">제목</th>
							<th style="width: 130px;">작성자</th>
							<th style="width: 140px;">작성일</th>
							<th style="width: 80px;">첨부파일</th>
							<th style="width: 80px;">조회수</th>
						</tr>
					</thead>
					<tbody>

						<c:if test="${ empty listBoard }">
							<tr>
								<td colspan="6" style="text-align: center;">게시글이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach var="bDTO" items="${ listBoard }" varStatus="i">
							<tr>
								<c:set var="detailQueryString" value="num=${ bDTO.num }&currentPage=${currentPage}" />

								<c:if test="${ not empty param.keyword }">
									<c:set var="detailQueryString" value="${ detailQueryString }&fieldNum=${ param.fieldNum }&keyword=${ param.keyword }" />
								</c:if>

								<td>
									<c:out value="${ totalCount - (currentPage - 1) * pageScale - i.index }" />
								</td>
								<td>
									<a href="boardDetail.jsp?${ detailQueryString }" style="color: black;"><c:out value="${ bDTO.title }" /></a>
								</td>
								<td>
									<c:out value="${ bDTO.id }" />
								</td>
								<td>
									<fmt:formatDate value='${ bDTO.inputDate }' pattern='yyyy-MM-dd kk:mm:ss' />
								</td>
								<td>
									<c:if test="${ not empty bDTO.upfile }">
										<a href="${ CommonURL }/board/download.jsp?file=${ bDTO.upfile }"><img alt="이미지" src="images/img.png" style="width: 20px; height: 20px; margin: 0px 25px;"></a>
									</c:if>
								</td>
								<td>
									<c:out value="${ bDTO.cnt }" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div id="divSearchForm" style="height: 80px; text-align: center;">
				<form action="boardList.jsp" id="searchForm" name="searchForm">

					<select name="fieldNum" id="fieldNum" style="height: 30px;">
						<option value="0">제목</option>
						<option value="1">내용</option>
						<option value="2">작성자</option>
					</select>

					<input type="text" name="keyword" id="keyword" value="${ param.keyword }"> <input type="text" style="display: none;"> <input type="button" value="검색" id="btnSearch" class="btn btn-success btn-sm">
				</form>
			</div>

			<div id="divPagenation">
				<%=BoardUtil.pagination(currentPage, totalPage, "boardList.jsp", rDTO.getFieldNum(), rDTO.getKeyword())%>
			</div>
			
			<div>
				<a href="${ CommonURL }/board/download.jsp?file=34824632.txt">txt</a>
				<a href="${ CommonURL }/board/download.jsp?file=exam0520.html">html</a>
				<a href="${ CommonURL }/board/download.jsp?file=20260707_JSP.pptx">ppt</a>
				<%
				String fileName = "토끼.png";
				String encode = URLEncoder.encode(fileName, "UTF-8");
				%>
				<a href="${ CommonURL }/board/download.jsp?file=<%=encode%>">img</a>
			</div>

		</div>
		<!-- /.container -->
		<!-- FOOTER -->
		<footer class="container">
			<%-- <jsp:include page="../fragments/footer.jsp"/> --%>
			<c:import url="${ CommonURL }/fragments/footer.jsp" />
		</footer>
	</main>
	<script src="${ CommonURL }/common/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" class="astro-vvvwv3sm"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<c:import url="${ CommonURL }/fragments/findZipcode.jsp" />
<script type="text/javascript">
	$(function() {
		$("#duplicateButton").click(function() {
			var id = $("#id").val();
			
			if(id == "") {
				alert("아이디는 필수 입력입니다.");
				return;
			}
			
			var openPage = "idDup.jsp?id="+id;
			window.open(openPage, "idDubWin", "width=487px, height=470px");
		});
		
		$("#postcodeButton").click(function() {
			findZipcode();
		});
	});
</script>
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
</style>
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
			<c:import url="${ CommonURL }/fragments/nav_bar.jsp" />
		</nav>
	</header>
	<main>
		<div class="container marketing">
			<main class="member-page"  style="margin-top: 50px;">
				<section class="member-shell">
					<h1 class="member-title">회원가입</h1>
					<div class="member-steps" aria-label="회원가입 단계">
						<div class="member-step">
							<span class="member-step-number">1</span>약관동의
						</div>
						<div class="member-step active">
							<span class="member-step-number">2</span>정보입력
						</div>
						<div class="member-step">
							<span class="member-step-number">3</span>가입완료
						</div>
					</div>

					<form id="joinForm" name="joinForm" method="post" action="${ CommonURL }/memberJoin/joinComplete.jsp" novalidate>
						<input type="hidden" name="smsReceiveYN" value="1"> <input type="hidden" name="emailReceiveYN" value="1"> <input type="hidden" id="codeChecked" value="N">

						<table class="member-table">
							<tbody>
								<tr>
									<th><label for="id">아이디 <span class="member-required">*</span></label></th>
									<td>
										<div class="member-inline">
											<input class="member-input" type="text" id="id" name="id" maxlength="20" autocomplete="username" placeholder="영문 또는 숫자 4~20자" value="test">
											<button class="member-button member-button-light member-button-small" type="button" id="duplicateButton">중복확인</button>
										</div>
									</td>
								</tr>
								<tr>
									<th><label for="password">비밀번호 <span class="member-required">*</span></label></th>
									<td>
										<input class="member-input" type="password" id="password" name="password" maxlength="20" autocomplete="new-password" value="test1234">
										<p class="member-help">영문, 숫자, 특수문자를 포함한 8~20자</p>
									</td>
								</tr>
								<tr>
									<th><label for="passwordConfirm">비밀번호 확인 <span class="member-required">*</span></label></th>
									<td>
										<input class="member-input" type="password" id="passwordConfirm" name="passwordConfirm" maxlength="20" autocomplete="new-password" value="test1234">
									</td>
								</tr>
								<tr>
									<th><label for="name">이름 <span class="member-required">*</span></label></th>
									<td>
										<input class="member-input" type="text" id="name" name="name" maxlength="30" autocomplete="name" value="홍길동">
									</td>
								</tr>
								<tr>
									<th><label for="email">이메일 <span class="member-required">*</span></label></th>
									<td>
										<input class="member-input" type="email" id="email" name="email" maxlength="100" autocomplete="email" placeholder="example@ballpick.com" value="test1234@test.com">
									</td>
								</tr>
								<tr>
									<th><label>취미<span class="member-required">*</span></label></th>
									<td>
										<input type="checkbox" name="hobby" value="낚시" checked="checked">낚시 <input type="checkbox" name="hobby" value="등산">등산 <input type="checkbox" name="hobby" value="음악감상">음악감상 <input type="checkbox" name="hobby" value="운동">운동
									</td>
								</tr>
								<tr>
									<th><span class="member-label">휴대폰 <span class="member-required">*</span></span></th>
									<td>
										<div class="member-phone">
											<select class="member-select" id="phone1" name="phone1" aria-label="휴대폰 앞자리">
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="019">019</option>
											</select>
											<input class="member-input" type="text" id="phone2" name="phone2" maxlength="4" inputmode="numeric" aria-label="휴대폰 중간자리" value="1234"> 
											<input class="member-input" type="text" id="phone3" name="phone3" maxlength="4" inputmode="numeric" aria-label="휴대폰 끝자리" value="5678">
										</div>
									</td>
								</tr>
								<tr>
									<th><span class="member-label">주소 <span class="member-required">*</span></span></th>
									<td>
										<div class="member-address">
											<div class="member-address-top">
												<input class="member-input" type="text" id="zipcode" name="zipcode" placeholder="우편번호" value="12345">
												<button class="member-button member-button-light member-button-small" type="button" id="postcodeButton">주소검색</button>
											</div>
											<input class="member-input" type="text" id="address" name="address" placeholder="기본주소" value="서울시 강남구"> 
											<input class="member-input" type="text" id="address2" name="address2" maxlength="100" placeholder="상세주소" value="테헤란로 123">
										</div>
									</td>
								</tr>
							</tbody>
						</table>

						<div id="clientError" class="member-error" hidden></div>
						<div class="member-actions">
							<a class="member-button member-button-light" href="${ CommonURL }/member/join-agree.do">이전</a>
							<button class="member-button" type="submit">가입하기</button>
						</div>
					</form>
				</section>
			</main>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" info="네비게이션 바"%>

<div class="container-fluid">
	<!-- <a class="navbar-brand" href="#">홈</a> -->
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav me-auto mb-2 mb-md-0">
			<li class="nav-item"><a class="nav-link active" aria-current="page" href="${ CommonURL }/index.html">메인</a></li>
			<li class="nav-item"><a class="nav-link" href="javascript:history.back()">이전으로</a></li>
			<li class="nav-item"><a class="nav-link disabled" aria-disabled="true">Disabled</a></li>
		</ul>
		<form class="d-flex" role="search">
			<a class="nav-link" aria-current="page" href="${ CommonURL }/login.loginFrm.jsp" style="color: #FFF;">로그인</a> &nbsp;&nbsp;
			<a class="nav-link" aria-current="page" href="${ CommonURL }/memberJoin/joinForm.jsp" style="color: #FFF;">회원가입</a> 
		</form>
	</div>
</div>
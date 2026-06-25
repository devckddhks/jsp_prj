<%@page import="day0624.ProductService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="day0624.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html data-bs-theme="auto">
<head>
<link rel="icon" href="http://sist.co.kr/img/favicon.ico" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.122.0">
<title>쌍용교육센터 프로젝트</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">

<script type="text/javascript">
   </script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">

</head>
<body>

	<header data-bs-theme="dark">
		<div class="collapse text-bg-dark" id="navbarHeader">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-md-7 py-4">
						<h4>쌍용교육센터</h4>
						<p class="text-body-secondary">쌍용교육센터의 수료생 프로젝트 입니다.</p>
					</div>
					<div class="col-sm-4 offset-md-1 py-4">
						<h4>Contact</h4>
						<ul class="list-unstyled">
							<li><a href="https://www.sist.co.kr/employment/gangnam/index.jsp" class="text-white">강남교육센터 과정</a></li>
							<li><a href="https://www.sist.co.kr/employment/gangbuk/index.jsp" class="text-white">강북교육센터 과정</a></li>
							<li><a href="//pf.kakao.com/_xnnWSu" class="text-white">카카오톡 상담</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container">
				<a href="index.jsp" class="navbar-brand d-flex align-items-center"> <!--  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>--> <strong>쌍용교육센터 프로젝트 시연영상

						<div class="counter">
							<span class="count"> <Strong>S</Strong>sangyong <b>I</b>nstitute of <b>S</b>ystem <b>T</b>echnology
							</span>
						</div>
				</strong>
				</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</div>
	</header>

	<main>
		<script type="text/javascript">
         document.addEventListener("DOMContentLoaded", function () {

             function animateHTMLText(element) {
                 const counter = element.querySelector('.count');

                 // 원본 HTML 저장
                 const originalHTML = counter.innerHTML;
                 counter.innerHTML = "";

                 let i = 0;
                 let output = "";

                 function typeWriter() {
                     if (i < originalHTML.length) {

                         // HTML 태그 처리
                         if (originalHTML[i] === "<") {
                             let tag = "";
                             while (originalHTML[i] !== ">" && i < originalHTML.length) {
                                 tag += originalHTML[i];
                                 i++;
                             }
                             tag += ">";
                             i++;
                             output += tag;
                         } else {
                             // 글자 하나씩 출력
                             output += originalHTML[i];
                             i++;
                         }

                         counter.innerHTML = output;
                         setTimeout(typeWriter, 25);
                     }
                 }

                 typeWriter();
             }

             // 화면 보일 때 실행
             const observer = new IntersectionObserver(entries => {
                 entries.forEach(entry => {
                     if (entry.isIntersecting) animateHTMLText(entry.target);
                 });
             }, { threshold: 0.5 });

             document.querySelectorAll('.counter').forEach(el => observer.observe(el));

         });
</script>

		<div class="row py-lg-1"></div>

		<div class="album py-5 bg-body-tertiary">
			<div class="container">

				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<%
					List<ProductDTO> list = new ArrayList<>();
					list = new ProductService().searchProduct();
					pageContext.setAttribute("prdList", list);
					%>
					<c:forEach var="prd" items="${ prdList }">
						<div class="col">
							<div class="card shadow-sm">
								<img src="images/${ prd.itemImg }" width="100%" height="100%" />
								<div class="card-body">
									<p class="card-text">
										<c:out value="${ prd.item }"/><br>
										<c:out value="${ prd.shortInfo }"/><br>
										가격 : 
										<span style="text-decoration: line-through;">
											<fmt:formatNumber value="${ prd.price }" pattern="#,###원"/>
										</span> 
											<fmt:formatNumber value="${ prd.price * 0.9 }" pattern="#,###원"/>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<a href="#void">
												<button type="button" class="btn btn-sm btn-secondary">구매하기</button>
											</a>
										</div>
										<small class="text-body-secondary"><fmt:formatDate value="${ prd.inputDate }" pattern="MM-dd-yyyy EEEE"/></small>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</main>

	<footer class="text-body-secondary py-5">
		<div class="container">
			<p class="float-end mb-1">
				<a href="#">Back to top</a>
			</p>
			<p class="mb-1">
				<strong style="font-size: 18px">강남교육센터</strong> 서울특별시 강남구 테헤란로 70길 12 H타워 9층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong>
			</p>
			<p class="mb-0">
				<strong style="font-size: 18px">강북교육센터</strong> 서울특별시 마포구 월드컵북로 21 풍성빌딩 2,3,4층 쌍용강북교육센터 <strong>Tel_02-336-8546~8</strong>
			</p>
		</div>
	</footer>

</body>
</html>

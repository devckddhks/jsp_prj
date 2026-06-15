<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="공통코드 사용"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<link rel="shortcut icon" href="http://192.168.10.80/jsp_prj/common/images/favicon.ico">

	<!-- Bootstrap CDN -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js"
		integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y"
		crossorigin="anonymous"></script>

	<style type="text/css">
		#wrap {
			width: 1000px;
			height: 900px;
			margin: 0px auto;
		}

		#header {
			height: 200px;
		}

		#container {
			min-height: 600px;
		}

		#footer {
			height: 100px;
		}
	</style>

	<!-- jQuery CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

	<script type="text/javascript">
		$(function () {
			
		}); // ready
	</script>
</head>

<body>
	<div id="wrap">
		<div id="header"></div>
		<div id="container">
		외부 JSP
		<div>
		<%@ include file="includeB.jsp" %>
		</div>
		<% /* String msg = "dsfsddf"; */ // 하나의 java source code로 생성되기 때문에 같은 이름 변수를 같은 지역에 선언한 것이 된다.%>
		
		외부 JSP에서는 내부 JSP의 변수를 사용할 수 있다. <%= msg %><br>
		외부 JSP
		</div>
		<div id="footer"></div>
	</div>
</body>

</html>
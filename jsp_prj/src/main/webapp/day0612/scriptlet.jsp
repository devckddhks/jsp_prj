<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="day0612.TestDTO"%>
<%@page import="java.util.List"%>
<%@page import="day0612.TestService"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info="scriptlet의 사용"%>

<%
// method 내 정의하는 Java 코드 작성. 변수 선언, 연산, 제어문, 객체 생성
String name = "홍길동";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=name + "님 안녕하세요??"%></title>

<link rel="shortcut icon"
	href="http://192.168.10.80/jsp_prj/common/images/favicon.ico">

<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js"
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

.age {
	font-weight: bold;
}

.age2 {
	color: red;
	font-weight: bold;
}
</style>

<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {

	}); // ready
</script>
</head>

<body>
	<div id="wrap">
		<div id="header"></div>
		<div id="container">
			<%
			// _jspService() 안 쪽에 코드가 생성된다.
			int age = 24; // 지역변수 => 초기화를 하지 않고 사용하면 error

			String css = "age";

			if (new Random().nextBoolean()) {
				css = "age2";
			}
			%>

			<div>
				나이는 <span class="<%=css%>"><%=age%></span>살 입니다.
			</div>

			<table class="table table-hover table-striped-columns">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>나이</th>
						<th>비고</th>
					</tr>
				</thead>
				
				<tbody>
					<%
					TestService ts = new TestService();
					List<TestDTO> list = ts.searchMember();

					TestDTO tDTO = null;
					for (int i = 0; i < list.size(); i++) {
						tDTO = list.get(i);
					%>
					<tr>
						<td><%=i + 1%></td>
						<td><%=tDTO.getName()%></td>
						<td><%=tDTO.getAge()%> <select>
								<%
								for (int j = 1; j < 101; j++) {
								%>
								<option<%=j == tDTO.getAge() ? " selected='selected'" : ""%>><%=j%></option>
								<%
								}
								%>
						</select></td>
						<td><input type="button" value="삭제"
							class="btn btn-warning btn-sm"></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<%
			int sum = 0;
			for (int i = 1; i < 101; i++) {
				sum += i;
			}
			%>
			<%= sum %>
			
			<!-- 올해를 기준으로 (2026) 이전 2년 이후 2년을 옵션으로 보여주는 select을 
			Calendar를 사용하여 만들어 보세요-->
			<br>
			<select>
				<%
				Calendar cal = Calendar.getInstance();
				int curYear = cal.get(Calendar.YEAR);
				for(int i = curYear + 2; i > curYear - 3; i-- ) { 
				%>
					<option<%= i == curYear? " selected='selected'" : "" %>><%= i %></option>
				<% } %>
			</select>
			<span>년</span>
			
			<select>
				<% for(int i = 1; i < 13; i++) {  %>
				<option<%= i - 1 == cal.get(Calendar.MONTH) ? " selected='selected'" : ""%>><%= i %></option>
				<% } %>
			</select>
			<span>월</span>
			
			<select>
				<% for(int i = 1; i < cal.getMaximum(Calendar.DAY_OF_MONTH) + 1; i++) {  %>
				<option<%= i == cal.get(Calendar.DAY_OF_MONTH) ? " selected='selected'" : "" %>><%= i %></option>
				<% } %>
			</select>
			<span>일</span>
			
			<!-- 0점 ~ 10점 까지 선택할 수 있는 라디오 버튼 11개 생성 -->
			<div style="margin-top: 15px; padding: 20px;" class="border border-primary-subtle">
			<h2>점수 선택</h2>
			<% for(int i = 0; i < 11; i++) { %>
				<input type="radio" value="<%= i %>" name="score" <%= i == 5 ? "checked='checked'" : "" %>> <%= i %>
			<% } %>
			</div>
			
			<!-- 아래 이미지가 강아지 또는 google.png, naver.png, daum.png가 보여지도록 코드를 JSP로 만들어 보세요. -->
			<%
			String src = "../common/images/";
			String[] imgs = "default_img2.png,google.png,naver.png,daum.png".split(",");
			
			src += imgs[new Random().nextInt(4)];
			%>
			<img src="<%= src %>">
			
			<%
			 // method 안에 method는 중첩 정의할 수 없다. : error
			 // public void test() {}
			%>
		</div>
		<div id="footer"></div>
	</div>
</body>

</html>
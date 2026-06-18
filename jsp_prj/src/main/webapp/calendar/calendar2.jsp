<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

a {
	text-decoration: none;
	color: #333;
}

a:hover {
	text-decoration: underline;
	color: #1E4183;
}

/* 달력 */
#calHeader {
	font-size: 20px;
	text-align: center;
	margin-bottom: 20px;
}

.calTitle {
	font-weight: bold;
	font-size: 30px;
}

#calTab, th, td {
	border: 1px solid #E5E5E5;
	margin: 0px auto;
}

th {
	text-align: center;
	color: #909090;
}

td {
	height: 100px;
	text-align: right;
	vertical-align: top;
}

.sunTitle {
	width: 120px;
	height: 30px;
	background: #E72203;
	color: #FFFFFF;
	font-weight: bold;
}

.satTitle {
	width: 120px;
	height: 30px;
	background: #5379E1;
	color: #FFFFFF;
	font-weight: bold;
}

.weekTitle {
	width: 120px;
	height: 30px;
}

.sunTextColor {
	color: #E72203;
	font-weight: bold;
}

.satTextColor {
	color: #5379E1;
	font-weight: bold;
}

.weekTextColor {
	color: #909090;
}

.toDayCss {
	border: 1px solid #ccbfe2;
	background-color: #ccbfe2;
}

.dayCss {
	border: 1px solid #E5E5E5;
}
</style>

<!-- jQuery CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {

	}); // ready
	
	function moveCal(month, year) {
		// 입력된 값을 hidden에 설정하고
		$("#month").val(month);
		$("#year").val(year);
		
		// form에 submit을 수행
		$("calFrm").submit();
	}
</script>
</head>

<body>
	<div id="wrap">
		<div id="header"></div>
		<div id="container">
			<div id="calWarp">
				<%
				Calendar cal = Calendar.getInstance();
				Calendar now = Calendar.getInstance();

				int nowYear = cal.get(Calendar.YEAR);
				int nowMonth = cal.get(Calendar.MONTH) + 1;
				int nowDay = cal.get(Calendar.DAY_OF_MONTH);
				
				StringBuilder toDay = new StringBuilder();
				toDay.append(nowYear).append(nowMonth);
				
				String month = request.getParameter("month");
				
				if(month != null) {
					cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
					nowMonth = cal.get(Calendar.MONTH) + 1;
				}
				
				String year = request.getParameter("year");
				
				if(year != null) {
					cal.set(Calendar.YEAR, Integer.parseInt(year));
					nowYear = Integer.parseInt(year);					
				}
				
				StringBuilder selectDay = new StringBuilder();
				
				selectDay.append(nowYear).append(nowMonth);
				
				// log(toDay.toString());
				// log(selectDay.toString());
				// log(selectDay.toString().equals(toDay.toString()) ? "true" : "false");
				
				// 오늘을 표현하기 위한 변수
				boolean toDayFlag = selectDay.toString().equals(toDay.toString());
				
				%>
				<form action="calendar2.jsp" method="post" id="calFrm">
					<input type="hidden" name="year" id="year">
					<input type="hidden" name="month" id="month">
				</form>
				<div id="calHeader">
					<a href="#void" onclick="moveCal(<%= (nowMonth - 1) == 0 ? 12 : nowMonth - 1 %>, <%= (nowMonth - 1) == 0 ? nowYear - 1 : nowYear %>)" title="이전 월">&lt;&lt;</a> 
					<a href="calendar2.jsp" title=""><span class="calTitle"><%=nowYear%>.<%=nowMonth%></span></a> <a
						href="#void" onclick="moveCal(<%= (nowMonth + 1) == 13 ? 1 : nowMonth + 1 %>, <%= (nowMonth + 1) == 13 ? nowYear + 1 : nowYear %>)" title="다음 월">&gt;&gt;</a>
				</div>

				<div id="calContainer">
					<table id="calTab">
						<thead>
							<tr>
								<th class="sunTitle">일</th>
								<th class="weekTitle">월</th>
								<th class="weekTitle">화</th>
								<th class="weekTitle">수</th>
								<th class="weekTitle">목</th>
								<th class="weekTitle">금</th>
								<th class="satTitle">토</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<%!// declaration : 선언 - JSP에서 method를 만들거나 instance 변수, static 변수를 선언할 때 사용.
								public static final int START_DAY = 1;%>
								<%
								String textCss = ""; // 요일별 글자색을 설정
								String tdCss = ""; // 오늘을 강조하기 위한 CSS
								
								for (int tempDay = 1;; tempDay++) { // 1일에서 부터 무한루프로 증가시킨다.
									// 증가하는 임시일자를 달력객체에 설정한다.
									cal.set(Calendar.DAY_OF_MONTH, tempDay);

									if (cal.get(Calendar.DAY_OF_MONTH) != tempDay) {
										int blankDays = 7 - cal.get(Calendar.DAY_OF_WEEK);
										
										for(int blankTd = 1; blankTd <= blankDays; blankTd++) {%>
											<td></td>
										<%	
										}
										
										break;
									}

									// 현재 월에 없는 날짜가 입력되면 자동으로 다음날 1일로 된다. (6월 기준 31일이 입력되면 7월 1일)
									switch (tempDay) {
									case START_DAY:
										int startDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
										for (int blankTd = 1; blankTd < startDayOfWeek; blankTd++) {
								%>
								<td></td>
								<%
										}
									}
									
									textCss = "weekTextColor";
									
									switch(cal.get(Calendar.DAY_OF_WEEK)) {
									case Calendar.SUNDAY : textCss = "sunTextColor"; break;
									case Calendar.SATURDAY : textCss = "satTextColor";
									}
									
									tdCss = "dayCss";
									
									if(toDayFlag && tempDay == nowDay) {
										tdCss = "toDayCss";
									}
								%>
								<!-- 증가하는 일을 브라우저에 출력 -->
								<td class="<%= tdCss %>"><span class="<%= textCss %>"><%=tempDay%></span></td>

								<%
									switch (cal.get(Calendar.DAY_OF_WEEK)) {
									case 7:
								%>
							</tr>
							<tr>
								<%
									}
								}

								%>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="footer"></div>
	</div>
</body>

</html>
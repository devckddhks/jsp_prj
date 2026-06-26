<%@page import="kr.co.sist.user.member.MemberService"%>
<%@page import="kr.co.sist.user.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/siteProperty.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 완료 | BallPick</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/kr.user.member/member.css">
</head>
<body>

<main class="member-page">
    <section class="member-shell">
        <h1 class="member-title">회원가입</h1>
        <div class="member-steps" aria-label="회원가입 단계">
            <div class="member-step"><span class="member-step-number">1</span>약관동의</div>
            <div class="member-step"><span class="member-step-number">2</span>정보입력</div>
            <div class="member-step active"><span class="member-step-number">3</span>가입완료</div>
        </div>

        <div class="member-result">
            <div class="member-result-icon">
            	<jsp:useBean id="mDTO" class="kr.co.sist.user.member.MemberDTO" />
            	<jsp:setProperty property="*" name="mDTO"/>
            	<jsp:setProperty property="ip" name="mDTO" value="<%= request.getRemoteAddr() %>"/>
				<%
				// post 방식일 때 한글 처리
				// web parameter 값 받기.
				MemberService ms = new MemberService();
				
				if (ms.searchDupId(mDTO.getId())) {
				%>
					아이디가 이미 사용 중 입니다. <a href="javascript:history.back();">이전페이지로</a>
				<%
					return;
				}
				
				boolean flag = ms.addMember(mDTO);
				System.out.println(mDTO);
				
				if(flag) { // 회원가입 성공
				%>
					<h2>${ param.name }님의 회원가입을 축하드립니다</h2>
					입력하신 정보는 아래와 같습니다.<br>
					<label>이메일</label> : ${ param.email }<br>
					<label>전화번호</label> : ${ param.phone1 }-${ param.phone2 }-${ param.phone3 }<br>
					<a href="${ CommonURL }/login/loginForm.jsp">로그인</a>
				<%	
				} else { // 회원가입 실패
				%>
					<h2>회원가입 실패</h2>
					${ param.name }님 회원 가입이 실패 하였습니다.<br>
				<%	
				}
				%>            
            </div>
        </div>

        <div class="member-actions">
            <a class="member-button member-button-light" href="${ CommonURL }/index.html">메인으로</a>
            <a class="member-button" href="${ CommonURL }/login/loginForm.jsp">로그인</a>
        </div>
    </section>
</main>

</body>
</html>

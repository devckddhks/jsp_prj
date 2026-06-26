<%@page import="kr.co.sist.chipher.DataDecryption"%>
<%@page import="kr.co.sist.user.member.MemberDTO"%>
<%@page import="kr.co.sist.user.login.LoginService"%>
<%@page import="kr.co.sist.chipher.DataEncryption"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="lDTO" class="kr.co.sist.user.login.LoginDTO" scope="page" />
<jsp:setProperty name="lDTO" property="*" />
<%
// 비번은 일방향 해시
lDTO.setPassword(DataEncryption.messageDigest("SHA-1", lDTO.getPassword()));

// 로그인 수행
LoginService ls = new LoginService();
MemberDTO mDTO = null;

mDTO = ls.searchLogin(lDTO);

if (mDTO != null) {
	// 세션에 정보를 추가
	session.setAttribute("userInfo", mDTO);

	//로그인 히스토리 남기고

	// 메인페이지로 이동
	response.sendRedirect(application.getAttribute("CommonURL") + "/index.html");
	// sendRedirect 아랫줄에 실행될 코드가 없다면 return을 생략해도 괜찮다.
} else {
	response.sendRedirect("loginForm.jsp?flag=N");
	// sendRedirect 아랫줄에 실행될 코드가 없다면 return을 생략해도 괜찮다.
}
%>
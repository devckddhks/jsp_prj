<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/siteProperty.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String uuid = UUID.randomUUID().toString(); %>
원본 : <%= uuid %> <br>
- 삭제 : <%= uuid.replaceAll("-", "") %> <br>
<hr>
<%
String name = "테스트";

// 한글이 제대로 전달되지 않는 상황이 발생할 수 있다.
String encode = URLEncoder.encode(name, "UTF-8");
%>

<%= name %>, <%= encode %>
<a href="testUUID.jsp?name=<%= encode %>">요청</a>
<hr>

받은 값 : <%= request.getParameter("name") %><br>
<%
String decode = URLDecoder.decode(encode, "UTF-8");
String decode2 = new String(encode.getBytes("8859_1"), "UTF-8");
%>
decode : <%= decode %><br>
decode2 : <%= decode2 %><br>
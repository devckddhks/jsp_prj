<%@page import="java.util.Random"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
String sesName = null;

if(new Random().nextBoolean()) {
	sesName = "홍길동";
}

session.setAttribute("sesName", sesName);
%>
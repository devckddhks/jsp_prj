<%@page import="kr.co.sist.mypage.MypageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = request.getParameter("id");

MypageService mps = new MypageService();
%>

<%= mps.searchMypage(id) %>
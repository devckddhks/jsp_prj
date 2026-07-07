<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.sist.mypage.ProfileImageService"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ProfileImageService pis = new ProfileImageService();
JSONObject jsonObj = null;

try {
	jsonObj = pis.uploadImg(request);
} catch(Exception e) {
	e.printStackTrace();
	
	jsonObj = new JSONObject();
	jsonObj.put("result", false);
}
%>
<%= jsonObj %>


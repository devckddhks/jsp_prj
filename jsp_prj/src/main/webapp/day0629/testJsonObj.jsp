<%@page import="day0629.CreateJSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
CreateJSONObject cjo = new CreateJSONObject();
pageContext.setAttribute("jsonObj", cjo.jsonObj());
%>
<c:out value="${ jsonObj }" escapeXml="false" />
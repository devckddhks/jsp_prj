<%@page import="day0622.CounterDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
CounterDTO cDTO = (CounterDTO) request.getAttribute("cDTO"); // id속성명이 이름 
CounterDTO cDTO2 = (CounterDTO) session.getAttribute("cDTO"); 
CounterDTO cDTO3 = (CounterDTO) application.getAttribute("cDTO"); 
%>

request : <%= cDTO %> <br>
session : <%= cDTO2 %> <br>
application : <%= cDTO3 %> <br>
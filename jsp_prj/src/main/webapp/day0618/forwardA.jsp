<%@page import="java.util.ArrayList"%>
<%@page import="day0612.TestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
// 디자인을 응답하지 않기 때문에 디자인에 관련된 코드를 정의할 필요가 없다.
// 업무 로직에 집중.
String name = "홍길동";
List<TestDTO> list = new ArrayList<>();
list.add(new TestDTO("홍길동", 20));
list.add(new TestDTO("김길동", 24));
list.add(new TestDTO("윤인성", 45));
list.add(new TestDTO("정동진", 39));

// 0. 업무처리한 결과를 view 페이지로 전달하기 위해서 request 내장 객체의 속성을 사용한다.
request.setAttribute("name", name);
request.setAttribute("memberList", list);

// 1. 이동할 페이지 설정
RequestDispatcher rd = request.getRequestDispatcher("forwardB.jsp");

// 2. 페이지 이동 (이 페이지를 요청할 때 생성된 HttpServletRequest와 HttpServletResponse가 이동하는 페이지로 전달된다.)
rd.forward(request, response);
%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="application/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ not empty param.url }">
	<%
	String url = request.getParameter("url");
	URL connURL = new URL("https://news-ex.jtbc.co.kr/v1/get/rss" + url);
	HttpURLConnection huc = (HttpURLConnection) connURL.openConnection();
	
	if (huc.getResponseCode() == 200) { // 응답 성공
		BufferedReader br = null;

		try {
			br = new BufferedReader(new InputStreamReader(huc.getInputStream()));

			String line = "";

			while ((line = br.readLine()) != null) {
				out.println(line);
			}

		} finally {
			if (br != null) {
				br.close();
			}

			if (huc != null) {
				huc.disconnect();
			}
		}

	}
	%>
</c:if>
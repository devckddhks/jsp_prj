<%@page import="kr.co.sist.site_property.SitePropertyVO"%>
<%@page import="kr.co.sist.site_property.SiteProperty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
StringBuilder flagURL = (StringBuilder) application.getAttribute("CommonURL");

if (flagURL == null) {
	SitePropertyVO spVO = SiteProperty.spVO;

	StringBuilder commonUrl = new StringBuilder();

	commonUrl.append(spVO.getProtocol()).append(spVO.getServerName()).append(spVO.getContextRoot());

	application.setAttribute("CommonURL", commonUrl);
	application.setAttribute("uploadDir", spVO.getUploadDir());
}
%>

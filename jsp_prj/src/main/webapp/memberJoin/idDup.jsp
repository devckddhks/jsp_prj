<%@page import="kr.co.sist.user.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include/siteProperty.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <link rel="shortcut icon" href="${ CommonURL }/common/images/favicon.ico">
        <c:import url="${ CommonURL }/include/external_file.jsp"/>

        <style type="text/css">
        	body {
        		padding: 0;
        	}
        
            #wrap {
                width: 470px;
                height: 370px;
                margin: 0px auto;
            }

            #idDivFrm {
                position: relative;
                width: 465px;
                height: 366px;
                background: #fff url("id_background.png") no-repeat;
            }

            #inputWrap {
                position: absolute;
                top: 190px;
                left: 60px;
            }

            #viewResult {
                position: absolute;
                top: 230px;
                left: 33px;
                width: 400px;
                text-align: center;
            }
        </style>
		
        <script type="text/javascript">
            $(function() {
				$("#btnCheckNull").click(function() {
					chkNull();
				});
				
				$("#id").keyup(function(evt) {
					if(evt.which == 13) {
						chkNull();
					}
				});
            });
            
            function chkNull() {
				var id = $("#id").val();
				
				if(id.replace(/ /g, "") == "") {
					alert("아이디를 입력해주세요!");
					$("#id").val("");
					return;
				}
				
				if(id != "") {
					$("#dupFrm").submit();
				}
            }
            
            function sendId(id) {
				opener.window.document.joinForm.id.value = id;
            	
				self.close();
            }
        </script>



    </head>

    <body>
        <div id="wrap">
            <div id="idDivFrm">
                <div id="inputWrap">
                    <form name="dupFrm" id="dupFrm" action="${ CommonURL }/memberJoin/idDup.jsp">
                        <label for="id">아이디</label><input type="text" name="id" id="id" value=${param.id}>
                        <input type="text" style="display: none;">
                        <input type="button" value="중복확인" class="btn btn-outline-secondary btn-sm" id="btnCheckNull" readonly="readonly">
                    </form>
                </div>
                
                <div id="viewResult">
				<%
				String id = request.getParameter("id");
				if (id != null && !"".equals(id)) {
					// 중복 확인 시작
					MemberService ms = new MemberService();
					boolean idFlag = ms.searchDupId(id);
					pageContext.setAttribute("idFlag", !idFlag);
				%>
					입력한 아이디인 <strong style="font-size: 20px"><c:out value="${ param.id }"/></strong>는<br>
					<c:choose>
						<c:when test="${ idFlag }">
							<span style="font-size: 20px; font-weight: bold; color: #2763ba;">사용가능</span>한 아이디 입니다.
							<a href="javaScript:sendId('${ param.id }')">사용</a>
						</c:when>
						<c:otherwise>
							<span style="font-size: 20px; font-weight: bold; color: #f5535b;">이미 사용 중</span>인 아이디 입니다.
						</c:otherwise>
					</c:choose>
				<%
				}
				%>
			</div>
            </div>
        </div>
    </body>

    </html>
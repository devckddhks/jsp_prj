<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="kr.co.sist.util.BoardUtil"%>
<%@page import="kr.co.sist.util.HangulUtil"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/siteProperty.jsp"%>
<%-- <%@ include file="../include/loginCheck.jsp" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String sessionId = "test";
String sessionName = "테스트";

pageContext.setAttribute("userId", sessionId);
pageContext.setAttribute("userName", sessionName);
%>
<%
if ("GET".equals(request.getMethod())) {
	return;
}
 //request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bDTO" class="kr.co.sist.board.BoardDTO" scope="page" />
<jsp:setProperty property="id" name="bDTO" value="${ userId }" />
<jsp:setProperty property="ip" name="bDTO" value="<%=request.getRemoteAddr()%>" />
<%
// request는 web parameter를 받을 수 없다.
File saveDir = new File("C:/Users/user/git/jsp_prj/jsp_prj/src/main/webapp/upload");
int maxSize = 1024 * 1024 * 10; // 업로드 파일의 크기
int uploadMaxSize = 1024 * 1024 * 50; // 업로드 파일의 크기

MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), uploadMaxSize, "UTF-8", new DefaultFileRenamePolicy());

String fileName = mr.getFilesystemName("upfile");
File uploadFile = new File(saveDir.getAbsoluteFile() + File.separator + fileName);

if (uploadFile.length() > maxSize) { // 파일 크기가 크다면 파일을 삭제한다.
	uploadFile.delete();
	out.println("파일은 최대 10Mbyte 까지만 업로드 가능합니다.");
} else {
	// 서버에서 실행되는 파일이 업로드 되지 않도록 처리
	if (mr.getContentType("upfile") != null && !mr.getContentType("upfile").contains("image")) {
		// 이상한 파일 : 해킹 => 서비스가 되지 않는 폴더로 이동.
		File hackDir = new File("C:/dev/hack");
		
		// uploadFile.renameTo(new File(hackDir.getAbsolutePath() + File.separator + uploadFile.getName()));
		// hackDir.getAbsolutePath() + File.separator + uploadFile.getName()
		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {
			// 악의적인 목적의 파일에 스트림을 연결한다.
			fis = new FileInputStream(uploadFile);
			
			// 악의적인 목적의 파일을 웹서비스가 되지 않는 디렉토리로 이동시킨다.
			fos = new FileOutputStream(hackDir.getAbsolutePath() + File.separator + uploadFile.getName());
			
			byte[] readData = new byte[512]; // 한 번에 읽어들일 데이터의 크기
			int readSize = 0;
			
			while((readSize = fis.read(readData)) != -1) { // 데이터를 EOF 까지 읽어들인다.
				fos.write(readData, 0, readSize);
			}
			
			fos.flush();
			
		} finally {
			if (fis != null) {
				fis.close();
			}
			
			if (fos != null) {
				fos.close();
			}
			
			// 파일을 이동 시켰으면 원본 파일을 삭제한다.
			uploadFile.delete();
		}
		
		
	}
	
	
	if (mr.getContentType("upfile") != null) {
		String[] imgExt = {"png", "jpg", "jpeg", "gif", "bmp"};
		
		boolean fileFlag = false;
		String compareExt = uploadFile.getName().substring(uploadFile.getName().lastIndexOf(".") + 1).toLowerCase();
		
		for (int i = 0; i < imgExt.length; i++) {
			
			if (compareExt.equals(imgExt[i])) {
				fileFlag = true;
				break;
			}
			
		}
		
		if (fileFlag) {
			File renameFile = new File(saveDir.getAbsoluteFile() + File.separator + BoardUtil.uuidFile(uploadFile));
			uploadFile.renameTo(renameFile);
			
			bDTO.setUpfile(renameFile.getName()); // 파일 명 변경
		}
		
	}

/*
java.util.URLDecoder를 사용
bDTO.setTitle(URLDecoder.decode(URLEncoder.encode(mr.getParameter("title"), "8859_1"), "UTF-8"));

java.lang.String을 사용
bDTO.setContent(new String(mr.getParameter("content").getBytes("8859_1"), "UTF-8")); 
*/

bDTO.setTitle(mr.getParameter("title"));
bDTO.setContent(mr.getParameter("content"));

BoardService bs = new BoardService();

pageContext.setAttribute("result", bs.addBoard(bDTO));
%>
<script type="text/javascript">
<c:choose>
	<c:when test="${result}">
		alert("글을 작성했습니다.");
		location.href = "boardList.jsp";
	</c:when>
	<c:otherwise>
		alert("글 저장 중 문제가 발생했습니다. \n 잠시 후 다시 시도해주세요.");
		history.back();
	</c:otherwise>
</c:choose>
</script>
<%
}
%>
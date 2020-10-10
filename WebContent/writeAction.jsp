<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%@ page import="file.FileDAO"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />


<!DOCTYPE html>
<html>
<head>
<meta http-equitv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP 웹 게시판</title>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}else {
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 칸이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			
			/* FILE UPLOAD
			String directory = application.getRealPath("/upload/");
			int maxSize = 1024*1024*100;
			String encoding = "UTF-8";
			
			MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

			String fileName = multipartRequest.getOriginalFileName("file");
			String fileRealName = multipartRequest.getFilesystemName("file");
			
			if(!fileName.endsWith(".hwp") && !fileName.endsWith(".pdf") && !fileName.endsWith(".jpg") && !fileName.endsWith(".png")){
				out.write("업로드 할 수 없는 파일입니다");
				File file = new File(directory + fileRealName);
				file.delete();
	
				
				
			}else{
				int bbsID = bbs.getBbsID();
				new FileDAO().upload(fileName, fileRealName, bbsID);
			}
			*/
			
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기 실패')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글쓰기 성공')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
			}
		}

	}
	%>
	
	
	


</body>
</html>
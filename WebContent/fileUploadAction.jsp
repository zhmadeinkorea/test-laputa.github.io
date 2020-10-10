<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equitv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 웹 게시판</title>
</head>
<body>
	<%
	
	String directory = application.getRealPath("/upload/");
	int maxSize = 1024*1024*100;
	String encoding = "UTF-8";
	
	MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
	
	Enumeration fileNames = multipartRequest.getFileNames();
	
	while(fileNames.hasMoreElements()){
		String parameter = (String)fileNames.nextElement();
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");

		if(fileName == null){
			continue;
		}
		if(!fileName.endsWith(".hwp") && !fileName.endsWith(".pdf") && !fileName.endsWith(".jpg") && !fileName.endsWith(".png")){
			out.write("업로드 할 수 없는 파일입니다");
			File file = new File(directory + fileRealName);
			file.delete();
			
		}else{
			new FileDAO().upload(fileName, fileRealName);
			out.write("파일명:" + fileName + "<br>");
			out.write("실제 파일명:" + fileRealName + "<br>");
		}
		
	}

		
	%>
	
	<a href="bbs2.jsp" style="font-size:20px; COLOR:#8B7CFC; ">FILE LIST</a>

</body>
</html>
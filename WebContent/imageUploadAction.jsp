<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="image.ImageDAO"%>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
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
	
	String directory = application.getRealPath("/daily/");
	int maxSize = 1024*1024*100;
	String encoding = "UTF-8";
	
	MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

	String imageName = multipartRequest.getOriginalFileName("file");
	String imageRealName = multipartRequest.getFilesystemName("file");
	
	if(!imageName.endsWith(".jpg") && !imageName.endsWith(".png")){
		out.write("업로드 할 수 없는 파일입니다");
		File file = new File(directory + imageRealName);
		file.delete();
		
	}else{
		
		new ImageDAO().upload(imageName, imageRealName);
		
		out.write("파일명:" + imageName + "<br>");
		out.write("실제 파일명:" + imageRealName + "<br>");
		out.write("업로드 되었습니다" + "<br>");
		
	}

		
	%>

	<a href="daily.jsp" style="font-size:20px; COLOR:#8B7CFC; ">DAILY</a>

</body>
</html>
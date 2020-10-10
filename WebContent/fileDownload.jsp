<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.io.File"%>



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
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	%>

	<jsp:include page="header.jsp"></jsp:include>

	<div id="article">
		<div id="menu">File</div>
		<div id="main_article">
		
		<%
		String directory = application.getRealPath("/upload/");
		String files[] = new File(directory).list();
		
		for (String file : files){
			out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" + java.net.URLEncoder.encode(file,"UTF-8") + "\">" +  file + "</a><br>");
			}
		
			 
		%>
		</div>
		</div>
		


			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="js/bootstrap.js"></script>
</body>
</html>
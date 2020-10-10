<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*, java.sql.*, java.io.*"%>



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
			<form action="fileUploadAction.jsp" method="post"
				enctype="multipart/form-data">
				파일:<input type="file" name="file1"><br>
				파일:<input type="file" name="file2"><br>
				파일:<input type="file" name="file3"><br> <input type="submit" value="upload">
			</form>
			<a href="fileDownload.jsp">File Download</a>

		</div>
	</div>
	</div>



	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
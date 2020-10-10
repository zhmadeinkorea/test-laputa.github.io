<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.io.File"%>
<%@ page import="image.ImageDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equitv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>JSP 웹 게시판</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	User user = new UserDAO().getUser(userID);
	String userName = null;
	if (session.getAttribute("userID") != null) {
		userName = (String) session.getAttribute("userName");
	}
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<div id="article">
		<div id="menu">Daily</div>
		<div id="main_article">


			<%
			String directory = application.getRealPath("/daily/");
			String Images[] = new File(directory).list();

			for (String file : Images) {
				out.write("<img src=\"" + request.getContextPath() + "/daily/" + java.net.URLEncoder.encode(file, "UTF-8")
				+ "\" width=\"300px;\">");
			}
			%>

			<br>
<!-- 
			<%
				if (userID!=null && userID.equals("zh")) {
			%> -->
			<form action="imageUploadAction.jsp" method="post"
				enctype="multipart/form-data">
				<input type="file" name="file"> <input type="submit"
					value="upload">
			</form>
			<!--
						<%
				}else{
				
				}
			%> -->

		</div>
	</div>

</body>

</html>
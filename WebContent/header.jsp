<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>

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
	%>

	<div id="grid">
		<div class="category">
			<a href="laputa.jsp"><img src="images/index02.png" width="150px"
				onmouseover="this.src='images/index03.png'"
				onmouseout="this.src='images/index02.png'"
				style="margin-bottom: 10px;"></a> <img src="images/ly2.png"
				style="margin-bottom: 10px;">
			<div></div>

			<img src="images/menu2.png" usemap="#mapnav">
			<map name="mapnav" id="mapnav">
				<area shape="rect" coords="0,0,146,53" href="daily.jsp">
				<area shape="rect" coords="0,57,146,106" href="bbs.jsp">
				<area shape="rect" coords="0,107,146,152" href="comment.jsp">
				<!--  <area shape="rect" coords="0,159,146,207" href="">
				<area shape="rect" coords="0,211,146,254" href="">-->
			</map>
			
			<%
				if (userID == null) {
			%>
			<a class="login_view" href="login.jsp">Login/</a>
			<a class="login_view"href="join.jsp">Join</a>
			<%
			} else{
			%>
			<a class="login_view" href="logoutAction.jsp">Logout?</a>
			<%
			}
			%>
			
			
		</div>
</body>
</html>
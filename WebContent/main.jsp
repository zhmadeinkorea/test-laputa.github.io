<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equitv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 웹 게시판</title>
</head>
<body style="margin-top: 150px; text-align: center;">
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

	<form>
		<a href="laputa.jsp"><img src="images/index02.png"
			onmouseover="this.src='images/index03.png'"
			onmouseout="this.src='images/index02.png'"></a>
	</form>

	<div>
		<img src="images/indexxx.png">
	</div>
<%

	if (userID==null){
%>
<div class="container">
	<div class="col-lg-4"></div>
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="loginAction.jsp">
				<div class="from-group">
					<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20" style="border:2px solid #8B7CFC;">
				</div>
				
				<div class="from-group">
					<input type="password" class="form-control" placeholder="PASSWORD" name="userPassword" maxlength="20" style="border:2px solid #8B7CFC;">
				</div>
				
				<input type="submit" class="btn btn-primary form-control" value="Login">
				
				</form>
		</div>
	</div>
<div class="col-lg-4"></div>
</div>
<%
	}else{
		%>
		<p style="color:#8B7CFC;"><%=user.getUserName()%>
		ㅎ2</p>
											
<%
	}
%>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
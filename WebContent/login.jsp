<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equitv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 웹 게시판</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

		<div id="article">
					<div id="menu">LOGIN</div>
			<div id="main_article">
<div class="container">
	<div class="col-lg-4"></div>
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="loginAction.jsp">
				<h3 style="text-align: center;">로그인 화면</h3>
				<div class="from-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				
				<div class="from-group">
					<input type="password" class="form-control" placeholder="패스워드" name="userPassword" maxlength="20">
				</div>
				
				<input type="submit" class="btn btn-primary form-control" value="Login">
				
				</form>
		</div>
	</div>
<div class="col-lg-4"></div>
</div>
</div>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>
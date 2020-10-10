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
					<div id="menu">JOIN</div>
			<div id="main_article">
<div class="container">
	<div class="col-lg-4"></div>
		<div class="col-lg-4">
		<div class="jumbotron" style="padding-top:20px;">
			<form method="post" action="joinAction.jsp">
				<h3 style="text-align: center;">회원가입 화면</h3>
				<div class="from-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				
				<div class="from-group">
					<input type="password" class="form-control" placeholder="패스워드" name="userPassword" maxlength="20">
				</div>
				
				<div class="from-group">
					<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
				</div>
				
				<div class="from-group" style="text-align:center;">
					<div class="btn-group" data-toggle="buttons">
						<label class="btn btn-primary active">
							<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
						</label>
						
						<label class="btn btn-primary active">
							<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
						</label>
					</div>
				</div>
				
				<div class="from-group">
					<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
				</div>
				
												
				<input type="submit" class="btn btn-primary form-control" value="회원가입">
				
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
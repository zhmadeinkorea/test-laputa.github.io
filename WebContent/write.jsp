<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
		<div id="menu">Write</div>
		<div id="main_article">
			<div class="container">

				<div class="row">
					<form method="post" action="writeAction.jsp">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2"
										style="background-color: #eeeeee; text-align: center;">게시판
										글쓰기 양식</th>
								</tr>
							</thead>
							<tbody>
								<tr>

									<td><input type="text" class="form-control"
										placeholder="글제목" name="bbsTitle" maxlength="50"></td>
								</tr>
								<tr>
									<td><textarea type="text" class="form-control"
											placeholder="글내용" name="bbsContent" maxlength="2048"
											style="height: 350px;"></textarea></td>
								</tr>
								<tr>
									<td>
									<input type="file" name="file"></td>
									
								</tr>
							</tbody>
						</table>

						<input type="submit" class="btn btn-primary pull-right"
							value="글쓰기">
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
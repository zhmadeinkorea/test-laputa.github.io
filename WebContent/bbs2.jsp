<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="reply.Reply"%>
<%@ page import="reply.ReplyDAO"%>
<%@ page import="file.FileDAO"%>
<%@ page import="java.io.File"%>


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

	int pageNumber = 1; //기본페이지
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

	}
	
	%>
<jsp:include page="header.jsp"></jsp:include>
		<div id="article">
			<div id="menu">Diary</div>
			<div id="main_article">
			
				<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expended="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="">FILE</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class><a href="bbs.jsp">1</a>
				<li class="active"><a href="bbs2.jsp">2</a>
			</ul>
		</div>
	</nav>
	
					<div class="row">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">TITLE</th>
								<th style="background-color: #eeeeee; text-align: center;">DOWNLOAD</th>
							</tr>
						</thead>
						<tbody>
						<tr>
			<%
		String directory = application.getRealPath("/upload/");
		String files[] = new File(directory).list();
		
		for (String file : files){
			
			%>
					<tr>
			<td> <%out.write(file);%></td>
			<td><%out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" + java.net.URLEncoder.encode(file,"UTF-8") + "\">" +  "download" + "</a><br>"); %></td>
				</tr>
			<%
			}
		
			 
		%>
		</tr>
						</tbody>
					</table>
				</div>
	
	
				<div class="row">
			<form action="fileUploadAction.jsp" method="post"
				enctype="multipart/form-data">
				파일:<input type="file" name="file1"><br>
				<input type="submit" value="upload">
			</form>
			<br>
				</div>
			</div>
		</div>
	</div>



	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
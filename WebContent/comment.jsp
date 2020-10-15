<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>

<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>


<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<%@ page import="java.util.ArrayList"%>


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
	
	User user = new UserDAO().getUser(userID);
	
	%>
	<jsp:include page="header.jsp"></jsp:include>



	<div id="article">
		<div id="menu">COMMENT</div>
		<div id="main_article">

			<form action="commentAction.jsp">
			<%
			if (userID!=null){
			%>
			<div><%=user.getUserName()%>/<%=userID %>
			</div>
			<%} %>
				<textarea placeholder="REPLY" style="width: 100%; height: 80%;"
					name="commentContent"></textarea>
				<input type="hidden" name="userID" value="<%=userID%>"> <br>
				<input type="submit" value="submit">
			</form>


					<div class="w3-boarder w-padding">
						<div class="w3-boarder we-padding">
						<div>
							<%
							CommentDAO commentDAO = new CommentDAO();
							ArrayList<Comment> list = commentDAO.getList();
							
							
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
							<td><%=list.get(i).getUserID()%></td>
							<td> / <%=list.get(i).getCommentDate().substring(0, 11) + list.get(i).getCommentDate().substring(11, 13) + "시"
		+ list.get(i).getCommentDate().substring(14, 16) + "분"%></td>
							<div style="border:2px solid #8B7CFC; margin:5px; padding:3px;">
								<td><%=list.get(i).getCommentContent()%></td>
							</div>

							</tr>

							<%
								}
							%>
					</div>
					</div>
					
					

			<!--Start of Tawk.to Script-->
			<script type="text/javascript">
				var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
				(function() {
					var s1 = document.createElement("script"), s0 = document
							.getElementsByTagName("script")[0];
					s1.async = true;
					s1.src = 'https://embed.tawk.to/5ca5f0566bba460528013c6b/default';
					s1.charset = 'UTF-8';
					s1.setAttribute('crossorigin', '*');
					s0.parentNode.insertBefore(s1, s0);
				})();
			</script>
			<!--End of Tawk.to Script-->
			<!--채팅창-->
		</div>
	</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
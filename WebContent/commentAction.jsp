<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="reply.ReplyDAO"%>
<%@ page import="java.io.PrintWriter"%>


<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>


<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="comment" class="comment.Comment" scope="page" />
<jsp:setProperty name="comment" property="commentID" />
<jsp:setProperty name="comment" property="commentContent" />


<!DOCTYPE html>
<html>
<head>
<meta http-equitv="Content-Type" content="text/html" charset="UTF-8">
<title>JSP 웹 게시판</title>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	} else {
		if (comment.getCommentContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용이 입력되지 않았습니다')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			CommentDAO commentDAO = new CommentDAO();

			int result = commentDAO.write(userID, comment.getCommentContent());

			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 등록 실패')");
		script.println("location.href='comment.jsp'");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글이 등록되었습니다')");
		script.println("location.href='comment.jsp'");
		script.println("</script>");
			}
		}

	}
	%>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="reply.ReplyDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="reply" class="reply.Reply" scope="page" />
<jsp:setProperty name="reply" property="bbsID" />
<jsp:setProperty name="reply" property="replyContent" />


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
	}else {
		if (reply.getReplyContent()==null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 칸이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			ReplyDAO replyDAO = new ReplyDAO();
				
			int result = replyDAO.write(reply.getBbsID(), userID, reply.getReplyContent());
			int bbsID = reply.getBbsID();
			
			
			if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 등록 실패')");
		script.println("history.back()");
		script.println("</script>");
			} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글이 등록되었습니다')");
		script.println("location.href='view.jsp?bbsID="+bbsID+"'");
		script.println("</script>");
			}
		}

	}
	%>


</body>
</html>
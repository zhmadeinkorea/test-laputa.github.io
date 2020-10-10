<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>

<%@ page import="reply.Reply"%>
<%@ page import="reply.ReplyDAO"%>
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

	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}

	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);

	int replyID = 0;
	if (request.getParameter("replyID") != null) {
		replyID = Integer.parseInt(request.getParameter("replyID"));
	}
	if (replyID == 0) {

	}
	Reply reply = new ReplyDAO().getReply(replyID);
	%>


	<jsp:include page="header.jsp"></jsp:include>
		<div id="article">
			<div id="menu"><%=bbs.getBbsTitle()%></div>
			<div id="main_article">
				<div class="container">

					<div class="row">
						<table class="table table-striped"
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="3"
										style="background-color: #eeeeee; text-align: center;">게시판
										글 보기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="width: 20%;">글제목</td>
									<td colspan="2"><%=bbs.getBbsTitle()%></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td colspan="2"><%=bbs.getUserID()%></td>
								</tr>
								<tr>
									<td>작성일자</td>
									<td><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
		+ bbs.getBbsDate().substring(14, 16) + "분"%></td>
								</tr>
								<tr>
									<td>내용</td>
									<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n",
		"<br>")%></td>
								</tr>

							</tbody>
						</table>
						<a href="bbs.jsp" class="btn btn-primary">목록</a>
						<%
							if (userID != null && userID.equals(bbs.getUserID())) {
						%>
						<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">수정</a>
						<a onclick="return confirm('정말로 삭제하시겠습니까?') "
							href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">삭제</a>
						<%
							}
						%>

						<div class="w3-boarder w-padding">REPLY
						<div class="w3-boarder we-padding">
						<div>
							<%
							ReplyDAO replyDAO = new ReplyDAO();
							ArrayList<Reply> list = replyDAO.getList();
							
							for (int i = 0; i < list.size(); i++) {
								if(list.get(i).getBbsID() == bbsID){
							%>
							<tr>
							<td><%=list.get(i).getUserID()%></td>
							<td> / <%=list.get(i).getReplyDate().substring(0, 11) + list.get(i).getReplyDate().substring(11, 13) + "시"
		+ list.get(i).getReplyDate().substring(14, 16) + "분"%></td>
							<div style="border:2px solid #8B7CFC; margin:5px; padding:3px;">
								<td><%=list.get(i).getReplyContent()%></td>
							</div>

							</tr>

							<%
								}
							}
							
							%>
					</div>
					</div>
						
							<form action="replyAction.jsp">
								<textarea placeholder="REPLY" style="width:100%; height:80%;" name="replyContent"></textarea>
								<input type="hidden" name="bbsID" value="<%=bbsID%>">
								<input type="hidden" name="userID" value="<%=userID%>">
								<br>
								<input type="submit" value="submit">
							</form>
						</div>


					</div>
				</div>


			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>
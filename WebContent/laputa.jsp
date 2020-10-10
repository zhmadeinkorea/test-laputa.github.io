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
<body onload="ratate()">
<jsp:include page="header.jsp"></jsp:include>

		<div id="article">
			<div id="menu">Laputa</div>

			<div id="main_article">
				<img src="images/zico1.jpg" id="slide"> <br>
				<div>
				공부하는 중인 jsp 페이지입니다.				
				</div>
				<p style="font-size: 15px;">
					▶INSTAGRAM : <a href="https://www.instagram.com/zhmadeinkorea/"
						target="_blank" style="font-size: 15px;">@지혜</a> <a
						href="https://www.instagram.com/zh1oveszm/" target="_blank"
						style="font-size: 15px;">@지미</a><br> ▶E-AIL :
					j_hye1996@naver.com
				</p>

				<input type="button" value="white"
					onclick="
              var target=document.querySelector('body');
              if(this.value === 'white'){
                target.style.color = 'white';
                this.value='black';
              }
              else{
                target.style.color = 'black';
                this.value='white';
              }
            ">
			</div>

		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		var img = new Array();
		img[0] = new Image();
		img[0].src = "images/zico1.jpg";
		img[1] = new Image();
		img[1].src = "images/zico2.jpg";
		img[2] = new Image();
		img[2].src = "images/zico3.jpg";
		var interval = 2000;
		var n = 0;
		var imgs = new Array("images/zico1.jpg", "images/zico2.jpg",
				"images/zico3.jpg");
		function rotate() {
			if (navigator.appName == "Netscape" && document.getElementById) {
				document.getElementById("slide").src = imgs[n];
			} else
				document.images.slide.src = imgs[n];
			(n == (imgs.length - 1)) ? n = 0 : n++;
			setTimeout("rotate()", interval);
		}
	</script>


</body>

</html>
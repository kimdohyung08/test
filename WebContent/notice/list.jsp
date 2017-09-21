<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
<style type="text/css">
html, body {
	height: 100%;
	background-image:
		url(https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/2qWN/image/6aLXer-5gPoggzLlTjZgZKqWKZI.jpg);
	background-repeat: no-repeat; 
 	background-position: 50% 50%; 
 	background-size: cover;  
  	background-attachment: fixed; 
}
#mask {
	position: absolute;
 	left: 0;
	top: 0;
	z-index: 9000;
	background-color: #000;
	display: none;
}

#boxes .window {
	position: absolute;
 	left: 0;
	top: 0;
	width: 440px;
	height: 200px;
	display: none;
	z-index: 9999;
	padding: 20px;
	border-radius: 15px;
	text-align: center;
}

#boxes #dialog {
	width: 950px;
	height: 500px;
	padding: 10px;
	background-color: #ffffff;
	font-family: 'Segoe UI Light', sans-serif;
	font-size: 15pt;
}
.a{
	width: 100%;
/* 	text-align: left; */
}
</style>
<script type="text/javascript">
	$(document).ready(function() { 
		var id = '#dialog';
		
		//Get the screen height and width
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();
		
		//Set heigth and width to mask to fill up the whole screen
		$('#mask').css({'width':maskWidth,'height':maskHeight});
		
		//transition effect
		$('#mask').fadeIn(500);
		$('#mask').fadeTo("slow",0.9); 
		
		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();
		
		//Set the popup window to center
		$(id).css('top',  winH/2-$(id).height()/2);
		$(id).css('left', winW/2-$(id).width()/2);
		
		//transition effect
		$(id).fadeIn(2000);  
		
		//if close button is clicked
		$('.window .close').click(function (e) {
		
		//Cancel the link behavior
		e.preventDefault();
		
		$('#mask').hide();
		$('.window').hide();
		});
		
		//if mask is clicked
		$('#mask').click(function () {
		$(this).hide();
		$('.window').hide();
		});
		});

	$(document).ready(function() {
		$("#mybtn").window.onLoad(function() {
			$("#myModal").model();
		});
	});
	
</script>
</head>
<body>
<%@include file="../menu/all.jsp" %>

	<div id="boxes">
		<div id="dialog" class="window">
		<div class="modal-header">
			＊공지사항＊
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
			
		<table class="a">
			<tr>
				<th style="text-align: center;">번호</th>
				<th style="text-align: center;">이름</th>
				<th style="text-align: center;">제목</th>
				<th style="text-align: center;">조회수</th>
				<th style="text-align: center;">등록날짜</th>
			</tr>
			<tr>
				<td>공지</td>
				<td>관리자</td>
				<td>
				<a href='./read.jsp'>회원가입 후 가입인사 남기기!</a>
				</td>
				<td>0</td>
				<td>2017-08-02</td>
			</tr>
			<tr>
				<td>공지</td>
				<td>관리자</td>
				<td>
				<a href='./read.jsp'>회원가입 후 가입인사 남기기!</a>
				</td>
				<td>0</td>
				<td>2017-08-02</td>
			</tr>
			<tr>
				<td>공지</td>
				<td>관리자</td>
				<td>
				<a href='./read.jsp'>회원가입 후 가입인사 남기기!</a>
				</td>
				<td>0</td>
				<td>2017-08-02</td>
			</tr>
			<tr>
				<td>공지</td>
				<td>관리자</td>
				<td>
				<a href='./read.jsp'>회원가입 후 가입인사 남기기!</a>
				</td>
				<td>0</td>
				<td>2017-08-02</td>
			</tr>
			<tr>
				<td>공지</td>
				<td>관리자</td>
				<td>
				<a href='./read.jsp'>회원가입 후 가입인사 남기기!</a>
				</td>
				<td>0</td>
				<td>2017-08-02</td>
			</tr>
		</table>

		<div class="modal-footer">
			페 이 징 처 리 할 곳 
		</div>
  		<div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../join/main.jsp'">검색?col,word쓸곳?</button>
        </div>
</div>

		<div id="mask"></div> <!-- 모달뒤 화면을 못건드리게 해줌 -->
	</div>
</body>
</html>
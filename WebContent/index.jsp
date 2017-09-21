<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("id"); // 세션에있는 id값을setAttribute에 넣어줬으니 get으로 꺼냄
String grade = (String)session.getAttribute("grade");

String str = "메인페이지 입니다.";
if(id != null){
	str = id +"님 안녕하세요 반갑습니다^^";
}
String title = "나의 여행 블로그";
if(id != null && grade.equals("A")) {
	title = "관리자 페이지 입니다.";
}

/*----쿠키설정 내용시작----------------------------*/
String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
String c_id_val = ""; // 실제 ID 값
 
// 브라우저로부터 서버에있는 쿠키값들을 다 get해옴
Cookie[] cookies = request.getCookies(); 
Cookie cookie=null; 
 
if (cookies != null){ 
 for (int i = 0; i < cookies.length; i++) { 
   cookie = cookies[i]; 
 
   if (cookie.getName().equals("c_id")){ 
     c_id = cookie.getValue();     // Y 
   }else if(cookie.getName().equals("c_id_val")){ 
     c_id_val = cookie.getValue(); // user1... 
   } 
 } 
} 

/*----쿠키설정 내용 끝----------------------------*/	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>

<style type="text/css">

html, body {
	height: 100%;
	background-image:
		url("http://blogfiles5.naver.net/20141120_230/pinkhead__1416454989356pCV5a_GIF/tumblr_ndvq8knFe11s0xjvpo1_500.gif");
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

div {
	position: relative;
}

#cm {
	position: absolute;
}

.hc {
	width: 210px;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
} /* 가로 중앙 정렬 */
.vc {
	height: 40px;
	top: 0;
	bottom: 0;
	margin-top: auto;
	margin-bottom: auto;
} /* 세로 중앙 정렬 */

#aa { 
 	margin-left: 23px; 
 }
 
.blog {
	font-size: 40px;
	color: white;
}
</style>

<script type="text/javascript">
	function bagreement() {
		var url = "./join/agreement.jsp";
		
		location.href = url;
	}
	
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지 입니다.</title>
</head>
<body>
<div id="boxes">
		<div id="dialog" class="window">
		<div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>
			<h1>Travel Blog에 오신걸 환영합니다 ^^*</h1>
			<hr>
			<h3>여행 블로그 이용 규칙사항</h3>
			<br>
			<p><strong>1.</strong> 저희블로그는 <b>"로그인이용시"</b> 이용 가능한 사이트입니다.</p>
			<p><strong>2.</strong> 가입하신 모든 회원분들은 <b>"비밀글"</b> 외에 모든걸 열람 하실수 있습니다.</p>
			<p><strong>3.</strong> 모든 회원들이 이용하는 자유로운 공간인 만큼 <b>욕설,패드립,19금단어</b> 등</p>
			<p> 불쾌하고 부적합한 언어는 관리자 권한으로 삭제될수 있음을 알려드립니다.</p>
			<p><strong>4.</strong> 편안하게 오셔서 여유롭게 즐기다 행복하게 돌아가시기 바랍니다^^</p>
		</div>
</div>

		<div id="mask"></div> <!-- 모달뒤 화면을 못건드리게 해줌 -->
<%-- <div id="cm" class="hc vc">

  <img src="./images/travel.png"><p class="blog">Travel blog</p>

  <div>
   <p>ID&nbsp;&nbsp;&nbsp;<input type="text" name="id" value="<%=c_id_val %>"></p>
	<%
	if(c_id.equals("Y")) {
	%>
		<label><input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장</label>
	<% 
   }else{
	%> 
		<label><input type='checkbox' name='c_id' value='Y' > ID 저장</label> 
	<% 
	} 
	%>
  </div>
  
   <div>
   <p>PW&nbsp;<input type="password" name="passwd"></p>
  </div>
  
  <div class="container">
 	<div class="btn-group" id="aa">
      <input type="submit" value="로그인"  class="btn btn-primary">
 	  <button type="button" class="btn btn-primary" onclick="location.href = 'join/agreement.jsp'">회원가입</button>
 	  
    </div>
  </div>
</div> --%>


<% if(id == null){ %>
<FORM  id="cm" class="hc vc" name='frm' method='POST' action='./join/loginProc.jsp'>
  <TABLE>
		<img src="./images/travel.png"><p class="blog">Travel blog</p>
    <TR>
      <TH>ID</TH>
      <TD>
      	<input type="text" name="id" size="20" value='<%=c_id_val %>'>
      </TD>
    </TR>
    <TR>
      <TH>PW</TH>
      <TD>
      	<input type="password" name="passwd">
      </TD>
    </TR>
    <tr>
	<%
	if (c_id.equals("Y")){  // id 저장 상태라면 
	 %>   
	<label><input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장</label> 
	<% 
	}else{
	%> 
	<label><input type='checkbox' name='c_id' value='Y'> ID 저장</label> 
	<% 
	} 
	%>
	</tr>
  
  </TABLE>
  <br>
  <DIV class='bottom' id="aa">
    <input type='submit' value='로그인' class="btn btn-primary">
    <input type='button' value='회원가입' class="btn btn-primary" onclick="bagreement()">
  </DIV>
</FORM>
<%
	}else if(id != null && !grade.equals("A")){ //일반회원 (관리자:"A") 
	str = id + "님 반갑습니더 어서오세요!!";
%>
	
<%
	} else {
	str = id + "관리자 페이지 입니다.";
%>
	
<%} %>

</body>
</html>
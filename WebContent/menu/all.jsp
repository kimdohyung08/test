<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
// 		$(document).ready(function () {
// 			$("#myBtn").click(function () {
// 				$("#myModal").modal();
// 			});
// 		});

	$(document).ready(function () {
		$("#myBtn").click(function () {
			$("#myModal").modal();
		});
	});
	$(document).ready(function () {
		$("#myBtn1").click(function () {
			$("#myModal1").modal();
		});
	});
	$(document).ready(function () {
		$("#myBtn2").click(function () {
			$("#myModal2").modal();
		});
	});
	$(document).ready(function () {
		$("#myBtn3").click(function () {
			$("#myModal3").modal();
		});
	});
	$(document).ready(function () {
		$("#myBtn4").click(function () {
			$("#myModal4").modal();
		});
	});
	$(document).ready(function () {
		$("#myBtn5").click(function () {
			$("#myModal5").modal();
		});
	});
	$(document).ready(function () {
		$("#myBtn6").click(function () {
			$("#myModal6").modal();
		});
	});
	$(document).ready(function () {
		$("#myBtn7").click(function () {
			$("#myModal7").modal();
		});
	});
</script>
</head>
<body>

<div class="w3-sidebar w3-bar-block w3-black w3-card-2" style="width:130px">
  <h5 class="w3-bar-item">Menu</h5>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Fade1')" id="myBtn">메인</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Fade')" id="myBtn1">가입인사</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Left')" id="myBtn2">공지사항</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Right')" id="myBtn3">사진</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Top')" id="myBtn4">자유토론</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Bottom')" id="myBtn5">Q&A</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Zoom')" id="myBtn6">블로그소개</button>
  <button class="w3-bar-item w3-button tablink" onclick="openLink(event, 'Fade2')" id="myBtn7">로그아웃</button>
</div>

<div style="margin-left:130px">

  <div id="Fade1" class="w3-container city w3-animate-opacity" style="display:none;">
<!--     <h2>메인</h2> -->
<!--     <p>일상에 지친 여러분!</p> -->
<!--     <p>저희 블로그를 통해 마음의 여유를 찾으셨으면 좋겠습니다~</p> -->
<!--     <p>눈과 귀를 잠시만 빌려주세요 ~★</p> -->
<!--   	<button onclick="location.href='../join/main.jsp'">목록</button> -->
  	  	    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
	      <h2>메인</h2>
	      <p>일상에 지친 여러분!</p>
	      <p>저희 블로그를 통해 마음의 여유를 찾으셨으면 좋겠습니다~</p>
	      <p>눈과 귀를 잠시만 빌려주세요 ~★</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../join/main.jsp'">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  	
  </div>

  <div id="Fade" class="w3-container city w3-animate-opacity" style="display:none;">
<!--     <h2>가입인사 게시판</h2> -->
<!--     <p>안녕하세요 ~ ★</p> -->
<!--     <p>저희 블로그에 가입하신걸 진심으로 축하드리고 환영합니당♥</p> -->
<!--     <p>가입 인사 남기시고 행복한 하루 되세요^^♣</p> -->
<!--   	<button onclick="location.href='../Greetings/list.jsp'">목록</button> -->
<!--   	<button onclick="location.href='../Greetings/createForm.jsp'">글쓰기</button> -->
  	    <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
	      <h2>가입인사 게시판</h2>
	      <p>안녕하세요 ~ ★</p>
	      <p>저희 블로그에 가입하신걸 진심으로 축하드리고 환영합니당♥</p>
	      <p>가입 인사 남기시고 행복한 하루 되세요^^♣</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../Greetings/list.jsp'">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  	
  </div>

  <div id="Left" class="w3-container city w3-animate-left" style="display:none;">
<!--     <h2>공지사항 게시판</h2> -->
<!--     <p>공지사항 입니다.</p>  -->
<!--     <p>신규회원님들은 공지사항을 꼭 ＊필독＊해주세요.!</p> -->
<!--     <p>공지사항 읽으시구 쾌적한 블로그 이용 바랍니다 ^^ ★</p> -->
<!--     <button onclick="location.href='../notice/list.jsp'">목록</button> -->
    <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
	      <h2>공지사항 게시판</h2>
	      <p>공지사항 입니다.</p> 
	      <p>신규회원님들은 공지사항을 꼭 ＊필독＊해주세요.!</p>
	      <p>공지사항 읽으시구 쾌적한 블로그 이용 바랍니다 ^^ ★</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../notice/list.jsp'">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  </div>



  <div id="Right" class="w3-container city w3-animate-right" style="display:none;">
<!--     <h2>이미지 게시판</h2> -->
<!--     <p>맛집.여행.추억.사랑</p> -->
<!--     <p>회원님들과 공유하고 함께 즐기세요~★</p> -->
<!--     <p>함께하면 행복은 배가됩니다 ^^♥</p> -->
<!--     <button onclick="location.href='../photo/list.jsp'">목록</button> -->
<!--     <button onclick="location.href='../photo/createForm.jsp'">글쓰기</button> -->
<div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
	      <h2>이미지 게시판</h2>
	      <p>맛집.여행.추억.사랑</p>
	      <p>회원님들과 공유하고 함께 즐기세요~★</p>
	      <p>함께하면 행복은 배가됩니다 ^^♥</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../photo/list.jsp'">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

  <div id="Top" class="w3-container city w3-animate-top" style="display:none;">
<!-- <h2>자유 게시판</h2> -->
<!--     <p>회원님들끼리 자유롭게 대화할수있는 공간입니다.</p> -->
<!--     <p>자유로운 주제지만 심한욕설.성적발언.패드립등은 관리자에 의해 일괄 삭제될수 있습니다.</p> -->
<!--     <button onclick="location.href='../freedom/list.jsp'">목록</button> -->
<!--     <button onclick="location.href='../freedom/createForm.jsp'">글쓰기</button> -->
    <div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
		  <h2>자유 게시판</h2> 
	      <p>회원님들끼리 자유롭게 대화할수있는 공간입니다.</p> 
	      <p>자유로운 주제지만 심한욕설.성적발언.패드립등은 관리자에 의해 일괄 삭제될수 있습니다.</p> 
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../freedom/list.jsp'">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

  <div id="Bottom" class="w3-container city w3-animate-bottom" style="display:none;">
<!--     <h2>Q & A 게시판</h2> -->
<!--     <p>궁굼한점이 있다면 물어보세요~</p>  -->
<!--     <p>작성된 모든 글은 비밀글이고 본인이 작성한 글 외에는 열람할수 없습니다.</p> -->
<!--     <button onclick="location.href='../qna/list.jsp'">목록</button> -->
<!--     <button onclick="location.href='../qna/createForm.jsp'">글쓰기</button> -->
 <div class="modal fade" id="myModal5" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
	     <h2>Q & A 게시판</h2>
	     <p>궁굼한점이 있다면 물어보세요~</p>
	     <p>작성된 모든 글은 비밀글이고 본인이 작성한 글 외에는 열람할수 없습니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../qna/list.jsp'">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

  <div id="Zoom" class="w3-container city w3-animate-zoom" style="display:none;">
<!--     <h2>Travel 블로그에 오신걸 환영합니다</h2> -->
<!--     <p>한줄로 우리 블로그를 소개하자면 !</p> -->
<!--     <p>바쁜 일상으로 지친 모든분들께 조금이나마 즐거움을 드리고 마음의 여유를 가질수있는 힐링공간입니다 ^^♥</p> -->
<!--     <button type="button" class="btn btn-info btn-lg" id="myBtn" onclick="blist()">목록</button> -->
      <div class="modal fade" id="myModal6" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
		  <h2>Travel 블로그에 오신걸 환영합니다</h2> 
		  <p>우리 블로그를  한줄로 소개하자면 !</p>
		  <p>바쁜 일상으로 지친 모든분들께 조금이나마 즐거움을 드리고</p>
		  <p>마음의 여유를 가질수있는 힐링공간입니다 ^^♥</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../introduce/list.jsp'">목록</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
  
<div id="Fade2" class="w3-container city w3-animate-opacity" style="display:none;">
<!--     <h2>로그아웃</h2> -->
<!--     <p>로그아웃 하시면 홈페이지를 이용하실수 없습니다.</p> -->
<!--     <p>만족할만한 즐거운 여행 하셨는지요~?</p> -->
<!--     <p>우리 다음에 또 만나요 ^^★</p> -->
<!--   	<button onclick="location.href='../join/logout.jsp'">로그아웃</button> -->

 <div class="modal fade" id="myModal7" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
	      <h2>로그아웃</h2>
	      <p>로그아웃 하시면 홈페이지를 이용하실수 없습니다.</p>
	      <p>만족할만한 즐거운 여행 하셨는지요~?</p>
	      <p>우리 다음에 또 만나요 ^^★</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='../join/logout.jsp'">로그아웃</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>
</div>
  
<script>
function openLink(evt, animName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(animName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}
</script>
  	
  	<iframe width="0" height="0"
		src="http://www.youtube.com/embed/XGSy3_Czz8k">
	</iframe>


</body>
</html>
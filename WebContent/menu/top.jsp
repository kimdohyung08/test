<%@page import="org.apache.catalina.mapper.MappingData"%>
<%@page import="com.sun.xml.internal.ws.api.databinding.MappingInfo"%>
<%@page import="com.sun.javafx.collections.MappingChange"%>
<%@ page contentType="text/html; charset=UTF-8" %> 
 
<%
	String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade"); 
	
	// 사용자가 요청한 uri가 담김
	String str = request.getRequestURI();
%>
 
 <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <style type="text/css">
ul#menu li{
display : inline;
}
ul#menu li a{
background-color: black;
color:white;
pading : 10px 20px;
text-decoration:none;
border-radius:4px 4px 0 0;
}
ul#menu li a:hover{
background-color: orange;
} 
.table{
width: 100%;
} 
.table,.td{
border-style: none;
}
</style> -->


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
<!-- 상단 메뉴 -->


</div>
<div style="background-color: #EEEEEE;">
<table class="table">
  <tr style="text-align: center;">
    <td class="td">
<%--     	<img src="<%=root %>/menu/images/main1.jpg" width="16%"> --%>
<%--     	<img src="<%=root %>/menu/images/main2.jpg" width="16%"> --%>
<%--     	<img src="<%=root %>/menu/images/main3.jpg" width="16%"> --%>
<%--     	<img src="<%=root %>/menu/images/main4.jpg" width="16%"> --%>
<%--     	<img src="<%=root %>/menu/images/main5.png" width="16%"> --%>
<%--     	<img src="<%=root %>/menu/images/main6.jpg" width="16%"> --%>

	<% if(str.equals("/my_homepage/join/agreement.jsp")){ %>
		<img src="../images/1.jpg" >
	<%}else if(str.equals("/my_homepage/join/createForm.jsp")){ %>
		<img src="../images/1.jpg" >
	<%}else if(str.equals("/my_homepage/join/createProc.jsp")){ %>
		<img src="../images/1.jpg" >
	<%}else if(str.equals("/my_homepage/join/loginProc.jsp")){%>
		<img src="../images/1.jpg" >
	<%}%>

<%-- 	<%}else if() %> --%>
<%-- 	<%}else if() %> --%>
<%-- 	<%}else if() %> --%>
<%-- 	<%}else if() %> --%>
<%-- 	<%}else if() %> --%>
<%-- 	<%}else if() %> --%>
<%-- 	<%}else if() %> --%>
<%-- 	<%}else if() %> --%>
<%-- 	<%}else if(request.getParameter("createForm.jsp") == ("*.createForm.jsp")){ %> --%>
<%-- 	<img src="<%=root%>/menu/images/1.jpg" > --%>
<%-- 	<%}else if(request.getParameter("agreement.jsp") == ("*.agreement.jsp")){ %> --%>
<%-- 	<img src="<%=root%>/menu/images/1.jpg" > --%>
<%-- 	<%}else if(request.getParameter("agreement.jsp") == ("*.agreement.jsp")){ %> --%>
<%-- 	<img src="<%=root%>/menu/images/1.jpg" > --%>
<%-- 	<%}else if(request.getParameter("agreement.jsp") == ("*.agreement.jsp")){ %> --%>
<%-- 	<img src="<%=root%>/menu/images/1.jpg" > --%>
<%-- 	<%} %> --%>
	</td>
  </tr>
        <tr>
        <td class="td">
            <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<%=root %>/index.jsp">메인</a>
    
    <ul class="nav navbar-nav">     
   <%if(id!=null){ %>
    <li><a href="<%=root %>/member/deleteForm.jsp">회원탈퇴</a></li>  
    <li><a href="<%=root %>/join/logout.jsp">로그아웃</a></li>  
   <%}%>
   
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">자유 게시판
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/bbs3/createForm.jsp">관리자</a></li>
       <li><a href="<%=root %>/bbs2/createForm.jsp">글쓰기</a></li>
       <li><a href="<%=root %>/bbs2/list.jsp">목록</a></li>
      </ul>
     </li>
     <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">메모
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/memov3/createForm.jsp">생성</a></li>
       <li><a href="<%=root %>/memov3/list.jsp">목록</a></li>
      </ul>
     </li>
     <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">팀
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
      
       <li><a href="<%=root %>/team/createForm.jsp">생성</a></li>
       <li><a href="<%=root %>/team/list.jsp">목록</a></li>
      </ul>
     </li>
     
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">이미지
        <span class="caret"></span></a>
        
      <ul class="dropdown-menu">
       <li><a href="<%=root %>/img/createForm.jsp">생성</a></li>
       <li><a href="<%=root %>/img/list.jsp">목록</a></li>
      </ul>
      
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">사진
        <span class="caret"></span></a>
      <ul class="dropdown-menu">
       <li><a href="<%=root %>/img/list.jsp">사진</a></li>
      </ul>
        
       <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Q & A
        <span class="caret"></span></a>
      <ul class="dropdown-menu">
       <li><a href="<%=root %>/img/list.jsp">Q & A</a></li>
      </ul>
        
     </li>
    </ul>
    </div>
    <ul class="nav navbar-nav navbar-right">
     <%if(id==null) {%>
      <li><a href="<%=root %>/join/agreement.jsp"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
      <li><a href="<%=root %>/join/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
     <%}else{ %>
      <li><a href="<%=root %>/join/read.jsp"><span class="glyphicon glyphicon-user"></span> 나의정보</a></li>
      <li><a href="<%=root %>/join/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
     <%}%>
     <%if(id != null && grade.equals("A")) { %> <!-- 로그인은 되어져있는데 그 아이디가 A일때만 -->
      <li><a href="<%=root %>/admin/list.jsp"><span class="glyphicon glyphicon-th"></span> 회원목록</a></li>
     <%} %>  
    </ul>
   </div>
   
</nav>
    </td>
  </tr>
  
 <%--  <tr>
    <td class="td">
    <ul id="menu">
    <!--      root를 사용해서 절대경로  -->
     <li><a href="<%=root %>/index.jsp">홈</a></li>
    <%if(id==null){ %>
     <li><a href="<%=root %>/member/agreement.jsp">회원가입</a></li>
     <li><a href="<%=root %>/member/loginForm.jsp">로그인</a></li>
    <%}else{ %>
     <li><a href="<%=root %>/member/read.jsp">나의정보</a></li>
     <li><a href="<%=root %>/member/updateForm.jsp">정보수정</a></li>
     <li><a href="<%=root %>/member/deleteForm.jsp">회원탈퇴</a></li>
     <li><a href="<%=root %>/member/logout.jsp">로그아웃</a></li>
    <%} %>

     <li><a href="<%=root %>/memov3/list.jsp">메모목록</a></li>
     <li><a href="<%=root %>/memov3/createForm.jsp">메모등록</a></li>
     <li><a href="<%=root %>/team/list.jsp">팀목록</a></li>
     <li><a href="<%=root %>/team/createForm.jsp">팀생성</a></li> 
     <li><a href="<%=root %>/address/list.jsp">주소목록</a></li>
     <li><a href="<%=root %>/address/createForm.jsp">주소생성</a></li>
     <li><a href="<%=root %>/bbs/list.jsp">게시판목록</a></li>
     <li><a href="<%=root %>/bbs/createForm.jsp">게시판등록</a></li>
     <li><a href="<%=root %>/exam/list.jsp">연습목록</a></li>
     <li><a href="<%=root %>/exam/createForm.jsp">연습등록</a></li>
     <li><a href="<%=root %>/member/list.jsp">회원목록</a></li>
    
    </ul>
    </td>
  </tr> --%>

</table>
</div>
<!-- 상단 메뉴 끝 -->

<!-- 내용 시작 -->
<div style="width: 100%; padding-top: 10px;">








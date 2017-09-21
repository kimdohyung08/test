<%@ page contentType="text/html; charset=UTF-8" %> 
<%
// 	session.removeAttribute("id"); // 하나의 id만 지우고싶을때/
	session.invalidate(); //세션에 저장되어있는 아이디를 전부다 지워버림
	
	response.sendRedirect("../index.jsp"); // 로그아웃 했을때 홈으로 가게끔 해줌
%> 



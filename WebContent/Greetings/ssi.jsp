
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- bbs패키지 안에 있는 클래스들을 임포트 -->
<%@ page import=" greetings.* "%>

<!-- java.util안에 있는 모든 것 들을 임포트 -->
<%@ page import=" java.util.* "%>

<!-- utility패키지 안에 있는 *(모든) 클래스를 import -->
<%@ page import=" utility.* " %>

<!-- 중복의 제거를 위해서 DAO를 미리 써줌 -->
<jsp:useBean id="dao" class="greetings.GreetingsDAO"></jsp:useBean>

<!-- 한글 깨짐현상을 막기 위한 코드 -->
<%
	request.setCharacterEncoding("utf-8");

	// 사용자가 요청한 경로(로컬호스트.포트번호)를 root에 담음
	String root = request.getContextPath();
%>

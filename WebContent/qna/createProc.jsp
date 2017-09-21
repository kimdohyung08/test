<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/qna/ssi.jsp"%>
<jsp:useBean id="dto" class="qna.QnaDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
// 	dto.setName(request.getParameter("name"));
// 	dto.setTitle(request.getParameter("title"));
// 	dto.setContent(request.getParameter("content"));
// 	dto.setPasswd(request.getParameter("passwd"));
	
	boolean flag = dao.crate(dto);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q n A 등록</title>
<script type="text/javascript">
	function bmain() {
		var url = "../join/main.jsp";
		
		location.href = url;
	}
	function blist() {
		var url = "./list.jsp";
		
		location.href = url;
	}
</script>
</head>
<body>
<div class=""> Q n A 등록결과</div>
<div class="">
	<%
		if(flag) {
			out.print("등록 성공");
		}else {
			out.print("등록 실패");
		}
	%>
</div>
<div class="">
	<%
		if(flag){
	%>
	<button type="button" onclick="bmain()">메인</button>
	<button type="button" onclick="blist()">목록</button>
	<%
		}else{
	%>
	<button type="button" onclick="history.back()">다시시도</button>
	<%
		}
	%>
</div>
</body>
</html>
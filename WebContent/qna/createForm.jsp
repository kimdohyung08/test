<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q & A</title>
<script type="text/javascript">
	function inputCheck(f) {
		if(f.name.value == "") {
			alert("이름을 입력해 주세요.");
			f.name.focus();
			return false;
		}
		if(f.title.value == "") {
			alert("제목을 입력해 주세요.");
			f.title.focus();
			return false;
		}
		if(f.content.value == "") {
			alert("내용을 입력해 주세요.");
			f.content.focus();
			return false;
		}
		if(f.passwd.value == "") {
			alert("패스워드를 입력해 주세요.");
			f.passwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
<form 
		method="POST" 
		name="frm" 
		action="./createProc.jsp" 	
		onsubmit="return inputCheck(this)">
  <div>Q & A등록</div>
  <table>
  	<tr>
  	  <th>이름</th>
  	  	<td>
  	  	  <input type="text" name="name" size="15">
  	  	</td>
  	</tr>
  	  	<tr>
  	  <th>제목</th>
  	  	<td>
  	  	  <input type="text" name="title" size="15">
  	  	</td>
  	</tr>
  	  	<tr>
  	  <th>내용</th>
  	  	<td>
  	  	  <textarea rows="10" cols="30" name="content" size="15"></textarea>
  	  	</td>
  	</tr>
  	  	<tr>
  	  <th>패스워드</th>
  	  	<td>
  	  	  <input type="password" name="passwd" size="15">
  	  	</td>
  	</tr>
  </table>
  <input type="submit" value="글쓰기">
  <button onclick="history.back()">취소</button>
</form>
</body>
</html>
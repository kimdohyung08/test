<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="createProc.jsp" method="post">
	<table>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="10" cols="40" name="content"></textarea>
			</td>
		</tr>
	</table>
<div>
	<button>등록</button>
	<button type="reset">다시입력</button>
</div>
</form>

</body>
</html>
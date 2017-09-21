<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#a {
	width: 100%;
	margin: 0 auto;
}
</style>
</head>
<body>
<form action="">
<table>
	<tr>
		<th id="a">ID:</th>
		<td>
			<input type="text" name="id" value="">
		</td>
	</tr>
	<tr>	
		<th id="a">PW:</th>
		<td>
			<input type="password" name="passwd">
		</td>	
	</tr>
</table>
</form>
<div class="container">
	<div class="btn-group">
		<button type="button" class="btn btn-primary">로그인</button>
		<button type="button" class="btn btn-primary">회원가입</button>
	</div>
</div>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/join/ssi.jsp"%>


<%
	// form에서 보낸 id값을 받아서 id에 담고
	String id = request.getParameter("id");
	// id를 duplicateId메소드에 매개변수로 보내고 쿼리문을통해 결과값을 리턴받아서 flag에 담는다
	boolean flag = dao.duplicateId(id);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style>
<script type="text/javascript">
	function use() { // 자식창
		opener.frm.id.value='<%=id%>';
		opener.frm.idc.value='y';
		window.close();
	}
</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">아이디 중복 확인</DIV>

  <div class="content"> 
<!-- 입력된 아이디를 보여줌 -->
  	ID : <%=id %> <br><br> <!-- 우리가입력한 id가 보임 ID : 우리가입력한id -->
  	<%
		if(flag) {
			out.print("이미 등록된 아이디 입니다.<br>");
		} else{
			out.print("사용 가능한 아이디 입니다.<br>");
			// else문에 들어왔을때 사용할수있는 아이디를 눌르면 그 아이디를 쓰려고 만듬
			out.print("<button type ='button' onclick='use()'>사용</button> "); 
			
		}
  	%>
  </div>
  
  <DIV class='bottom'>
    <input type="button" value='다시시도' onclick="location.href='id_form.jsp'">
    <input type='button' value='취소' onclick="window.close()">
  </DIV>
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 



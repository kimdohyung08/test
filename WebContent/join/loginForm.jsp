<%@ page contentType="text/html; charset=UTF-8" %> 
<%
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
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">로그인</DIV>
<FORM name='frm' method='POST' action='loginProc.jsp'>
  <TABLE>
    <TR>
      <TH>아이디</TH>
      <TD>
      	<input type="text" name="id" size="20" value='<%=c_id_val %>'>
      		<%
       		 if (c_id.equals("Y")){  // id 저장 상태라면 
            %>   
              <label><input type='checkbox' name='c_id' value='Y' checked='checked'> ID 저장</label> 
            <% }else{ %> 
              <label><input type='checkbox' name='c_id' value='Y' > ID 저장</label> 
       		<% 
            } 
      		%>
      </TD>
    </TR>
    <TR>
      <TH>비밀번호</TH>
      <TD>
      	<input type="password" name="passwd">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='로그인'>
    <input type='button' value='회원가입' onclick="location.href='agreement.jsp'">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 


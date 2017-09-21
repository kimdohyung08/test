<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/join/ssi.jsp"%>
<jsp:useBean id="dto" class="join.JoinDTO"></jsp:useBean>

<%
	// 리퀘스트에 저장되어있는걸 사용(Form에서 넘긴걸 reProc에서 끝나야 하지만 포워드 를 만나서 여기까지 올수있게됨)
	// UploadSave upload = (UploadSave)request.getAttribute("upload");
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	// createForm에서 입력한 데이터를 dto에 저장함
	dto.setId(upload.getParameter("id")); // 한글처리 하지 않음
	dto.setName(UploadSave.encode(upload.getParameter("name"))); // (UploadSave.encode)한글처리 함
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setPhone(upload.getParameter("phone"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setEmail(upload.getParameter("email"));
	dto.setJob(upload.getParameter("job"));
	
	FileItem fileItem = upload.getFileItem("fname");
	
	int size = (int)fileItem.getSize();
	String filename = "member.jpg";
	if(size > 0) {
		filename = UploadSave.saveFile(fileItem, upDir);
	}
	
	dto.setFname(filename);
	
	boolean flag = dao.create(dto);
	
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
<jsp:include page="/menu/top.jsp" flush="false"/>
<DIV class="title">회원가입 처리</DIV>
<img src="" width="">

<div class="content" >
	<%
		if(flag) {
			out.print("회원가입되었습니다.<br><br>");
			out.print("<img src ='../images/c.png' width='10%'>");
			
		}else {
			out.print("회원가입을 실패하셨습니다.");
		}
	%>
	
</div>
  
  <DIV class='bottom'>
  
<%	
	if(flag) { 
%>
    <input type="button" value='로그인' onclick="location.href='./loginForm.jsp'">
<%
  	}else {
%> 
    <input type="button" value='다시시도' onclick="history.back()">
<%
  	}
%>
    <input type='button' value='홈으로' onclick="location.href='../index.jsp'">
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush="false"/>
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 



<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/qna/ssi.jsp" %>
<%
	int qnano = Integer.parseInt(request.getParameter("qnano"));
	//조회수 증가 함수
	dao.upViewcnt(qnano);
	QnaDTO dto = dao.read(qnano);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
  <tr>
    <th>번호</th>
    <td>
    <%=dto.getQnano()%>
    </td>
  </tr>
  
  <tr>
    <th>이름</th>
    <td>
    <%=dto.getName()%>
    </td>
  </tr>
  
  <tr>
    <th>제목</th>
    <td>
    <%=dto.getTitle()%>
    </td>
  </tr>
  
  <tr>
    <th>내용</th>
    <td>
    <%=dto.getContent()%>
    </td>
  </tr>
  
  <tr>
    <th>조회수</th>
    <td>
    <%=dto.getViewcnt()%>
    </td>
  </tr>
  
  <tr>
    <th>등록날짜</th>
    <td>
    <%=dto.getWdate()%>
    </td>
  </tr>
</table>

</body>
</html>
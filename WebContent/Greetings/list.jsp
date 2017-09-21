<%@page import="utility.Utility"%>
<%@ include file="/Greetings/ssi.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) {
		word = "";
	}
	
	//---페이지관련
	int nowPage = 1; //현재 보고있는 페이지
	int recordPerPage = 5;//한페이지당 보여줄 레코드 갯수

	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	//DB에서 데이터를 가져올 순번
	int sno = ((nowPage-1)*recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
// 	int totalRecord = dao.total(map); 
	List<GreetingsDTO> list = dao.list(map);	// col과 word를 map으로 받아서 list메소드로 매개변수로 넘겨줌
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
/* html, body {
	height: 100%;
	background-image:
		url(http://2.bp.blogspot.com/-XYkWXdCM-e8/VOTjDx5YAFI/AAAAAAAAJJU/Ia4Jtb2Dvok/s1600/Maldives%2BBeach%2BIs%2BBeautiful%2BBy%2BDay%2C%2BBut%2BBecomes%2BAn%2B%E2%80%98Ocean%2BOf%2BStars%E2%80%99%2BBy%2BNight.jpg);
	background-repeat: no-repeat; 
 	background-position: 50% 50%; 
 	background-size: cover;  
  	background-attachment: fixed; 
} */
/* table { */
/*     border-collapse: collapse; */
/*     width: 100%; */
/* } */

/* th, td { */
/*     padding: 8px; */
/*     text-align: left; */
/*     border-bottom: 1px solid #ddd; */
/* } */

/* tr:hover{background-color:#f5f5f5} */
</style>
</head>
<body>
<%@include file="../menu/all.jsp" %>
<table width="100%" height="100%" border="0">
	<tr>
		<td style="padding-left: 400px; padding-right: 400px; padding-top: 30px;">
			<table width="600px" height="600px" border="1">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록날짜</th>
				</tr>
				<% 
					for(int i = 0; i < list.size(); i++) {
						GreetingsDTO dto = list.get(i);
				%>
				<tr>
					<td><%=dto.getGreetingsno() %></td>
					<td><%=dto.getTitle() %></td>
					<td><%=dto.getName() %></td>
					<td><%=dto.getViewcnt() %></td>
					<td><%=dto.getWdate() %></td>
				</tr>
				<%
					} // end for 
				%>
			</table>
		</td>
	</tr>
</table>

</body>
</html>
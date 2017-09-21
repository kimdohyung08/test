<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/qna/ssi.jsp" %>

<%
	String id = (String)request.getParameter("id");
	String passwd = (String)request.getParameter("passwd");
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
	map.put("id", id);
	map.put("passwd", passwd);
	
	
	int totalRecord = dao.total(map); 
	List<QnaDTO> list = dao.list(map);	// col과 word를 map으로 받아서 list메소드로 매개변수로 넘겨줌
	boolean flag = dao.loginheck(map);
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function read(qnano) {
		var url = "./read.jsp";
		url += "?qnano="+qnano;
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
	}
</script>

</head>
<body>


<form action="./list.jsp" method="post">
  <select>
	<option>선택해주세요</option>
	
	<option value="name"
	  <%
	    if(col.equals("name")){
	    	out.print("selected='selected'");
	    }
	  %>
	>이름</option>
	
		<option value="title"
	  <%
	    if(col.equals("title")){
	    	out.print("selected='selected'");
	    }
	  %>
	>제목</option>
	
		<option value="content"
	  <%
	    if(col.equals("content")){
	    	out.print("selected='selected'");
	    }
	  %>
	>내용</option>
	<option value="total">전체출력</option>
  </select>
  <input type="text" name="word" value="<%=word%>">
  <button>검색</button>
  <%if(flag){ %>
  <button type="button" onclick="location.href = './createForm.jsp'">글쓰기</button>
  <%}else{ %>
  <script type="text/javascript">
  alert("로그인 후 이용하실수 있습니다.");
  document.location.replace("../index.jsp");
  </script>
  <%} %>
  
</form>
  <table class="table table-striped">
  <tr>
  	<th>번호</th>
  	<th>이름</th>
  	<th>제목</th>
  	<th>조회수</th>
  	<th>등록날짜</th>
  	<th>grpno</th>
  	<th>indent</th>
  	<th>ansnum</th>
  </tr>
		<%
			if (list.size() == 0) {
		%>
			<tr>
				<td colspan="8">등록된 글이 없습니다.</td>
			</tr>
		<%
			}
				for (int i = 0; i < list.size(); i++) {
					QnaDTO dto = list.get(i);
		%>

			<tr>
				<td>
					<a><%=dto.getQnano()%></a>
				</td>
				<td>
					<a><%=dto.getName() %></a>
				</td>
			
				<td>
			<%
				for(int j = 0; j < dto.getIndent(); j++){
				out.print("&nbsp; &nbsp; &nbsp;");
				}
				if(dto.getIndent() > 0){
					out.print("<img src = '../images/re.jpg'>");
				}
			%> 
			
			<!-- 제목을 눌렀을때 프라이머리 키값을 read함수로 파라미터 값을 던짐 -->
			<%if(dto.getQnano() == 0){ %> 
			<a href="javascript:read('<%=dto.getQnano() %>')">
			<%
				if(dto.getTitle() != ""){
					out.print("비밀글 입니다.");
				}
			%>
			</a>
			<%} %>
				</td>
				<td>
			<%
				// Utility안에있는 메소드를 호출해서 dto안에있는 날짜정보를메소드를 호출하는데 거기에는 시-분-초까지 있으니깐 그거를 substring로 10글자만 짜른다)
				if(Utility.compareDay(dto.getWdate().substring(0,10))){ // conpareDay()메소드 호출
			%>
			</td>
			
			<img src="<%=root%>/images/new.gif">
			<%
				}
			%>
			<td><%=dto.getViewcnt()%></td>
			<td><%=dto.getWdate()%></td>
			<td><%=dto.getGrpno()%></td>
			<td><%=dto.getIndent()%></td>
			<td><%=dto.getAnsnum()%></td>
			</tr>
		
		<%
			} //end for
		%>
	</table>

	<DIV >
					<!-- DB에 총갯수, 현재보고있는 페이지, 현재 페이지에보여줄 레코드 갯수, col , word -->
		<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
	</DIV>
</table>
</body>
</html>
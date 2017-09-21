<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/join/ssi.jsp"%>
<jsp:useBean id="dto" class="join.JoinDTO"></jsp:useBean>
<<jsp:setProperty property="*" name="dto"/>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String grade = "";
	
	Map map = new HashMap();
	map.put("id" , id);
	map.put("passwd", passwd);

	boolean flag = dao.loginCheck(map);

	if(flag){ // flag가 true면 회원이니깐 
		grade = dao.getGrade(id);
		session.setAttribute("id", id); // 회원 id와 
		session.setAttribute("grade", grade); // 패스워드를 가져옴
		
		// ---------------------------------------------- 
	    // Cookie 저장, Checkbox는 선택하지 않으면 null 임 
	    // ---------------------------------------------- 
	    Cookie cookie = null; 
	       
	    String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
	       
	    if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
	      cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록 
	   
	      cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
	      cookie.setMaxAge(120);               // 2 분 유지 
	      response.addCookie(cookie);          // 쿠키 기록  
	         
	    }else{ 
	      cookie = new Cookie("c_id", "");     // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	         
	      cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
	      cookie.setMaxAge(0); 
	      response.addCookie(cookie); 
	    } 
	    // --------------------------------------------- 
	}
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 

html, body {
	height: 100%;
	background-image:
		url("http://blogfiles5.naver.net/20141120_230/pinkhead__1416454989356pCV5a_GIF/tumblr_ndvq8knFe11s0xjvpo1_500.gif");
	background-repeat: no-repeat; 
 	background-position: 50% 50%; 
 	background-size: cover;  
  	background-attachment: fixed; 
}
div {
	position: relative;
}

#cm {
	position: absolute;
}

.hc {
	width: 210px;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
} /* 가로 중앙 정렬 */
.vc {
	height: 40px;
	top: 0;
	bottom: 0;
	margin-top: auto;
	margin-bottom: auto;
} /* 세로 중앙 정렬 */

#aa { 
 	margin-left: 23px; 
 }
 
.blog {
	font-size: 40px;
	color: white;
}
#i {
	color: white;
}
</style> 
<script type="text/javascript">
	function main(id) {
		var url = "./main.jsp";
		url += "?id="+id;
		
		location.href = url;
	}
</script>
</head> 
<body>
<form action="" id="cm" class="hc vc">
<div>
	<%
		if(flag){
			if(id != null && !grade.equals("A")){
	%>
	<table>
	  <tr>
		<td width="5%">
		  <img src="./storage/<%=dto.getFname()%>">
		</td>  
	  </tr>
	  <tr>
	    <td>
		  <%=dto.getId() %>님 어서오세요.
	    </td>
	  </tr>
	</table>
	<% 
		}else{
	%>		
		<table>
	  <tr>
		<td width="">
		  <img src="">
		</td>  
	  </tr>
	  <tr>
	    <td>
		  관리자 <%=id %> 입니다.
	    </td>
	  </tr>
	</table>
	<%
		}
		}else{
	%>
		로그인 실패 <br> 아이디or패스워드를 확인하세요.
	<%
		} 
	%>
<!-- 			out.print("<h3 id=+"+"i"+"+>"+id+"님 어서오세요"+"<br>여행 블로그에 오신걸 환영합니다."); -->
<!-- 			}else{ -->
<!-- 			out.print(id+"관리자님 페이지 입니다."); -->
<!-- 			} -->
<!-- 		}else { -->
<!-- 			out.print("로그인 실패 <br> 아이디or패스워드를 확인하세요."); -->
<!-- 		} -->
	
</div> 

  <DIV class="bottom" id="aa" >
  <% if (flag) { %>
    <input type='button' value='메인' class="btn btn-primary" onclick="main('<%=dto.getId()%>')">
    <input type="button" value="로그아웃" class="btn btn-primary" onclick="location.href='./logout.jsp'">
  <% } else { %>
    <input type="button" value='다시시도' class="btn btn-primary" onclick="history.back()">
  <% } %>
  </DIV>
 </form>
 
</body>
</html> 



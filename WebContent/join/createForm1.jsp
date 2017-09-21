<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style type="text/css">
TABLE{
  margin: 0 auto;            /* �뀒�씠釉� 媛��슫�뜲 �젙�젹 */
  border-color: #AAAAAA;     /* �뀒�씠釉� �쇅怨쎌꽑 �깋源� */ 
  border-width: 1px;         /* �뀒�씠釉� �쇅怨쎌꽑 �몢猿� */ 
  border-style: solid;       /* �뀒�씠釉� �쇅怨쎌꽑 �뒪���씪 */
  border-collapse: collapse; /* 而щ읆�쓽 �쇅怨쎌꽑�쓣 �븯�굹濡� 寃고빀 */
 
}
 
TH{
  border-color: #AAAAAA;     /* �뀒�씠釉� �쇅怨쎌꽑 �깋源� */ 
  border-width: 1px;         /* �뀒�씠釉� �쇅怨쎌꽑 �몢猿� */ 
  border-style: solid;       /* �뀒�씠釉� �쇅怨쎌꽑 �뒪���씪 */
 
  color: #FFFFFF;            /* 湲��옄 �깋 */ 
  background-color: #668db4; /* 諛곌꼍 �깋 */
  padding: 5px;              /* �� �궡遺� 媛꾧꺽 */
}
 
 
td{
  border-color: #AAAAAA;     /* �뀒�씠釉� �쇅怨쎌꽑 �깋源� */ 
  border-width: 1px;         /* �뀒�씠釉� �쇅怨쎌꽑 �몢猿� */ 
  border-style: solid;       /* �뀒�씠釉� �쇅怨쎌꽑 �뒪���씪 */
 
  color: #000000;            /* 湲��옄 �깋 */ 
  background-color: #FFFFFF; /* 諛곌꼍 �깋 */
  padding: 5px;              /* �� �궡遺� 媛꾧꺽 */  
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
 
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;
 
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script> 
<script type="text/javascript">
	function inputCheck(f) {
		if(f.id.value == ""){
			alert("아이디를 입력해 주세요");
			f.id.focus();
			return false;
		}
		if(f.passwd.value == ""){
			alert("비밀번호를 입력해 주세요");
			f.passwd.focus();
			return false;
		}
		if(f.repasswd.value == ""){
			alert("비밀번호 확인을 입력해 주세요");
			f.repasswd.focus();
			return false;
		}
		if(f.passwd.value != f.repasswd.value){
			alert("비밀번호가 일치하지 않습니다.");
			f.repasswd.value = ""; // 기존에 값을 지우고 다시 입력할수 있게 해줌
			f.repasswd.focus();
			return false;
		}
		if(f.name.value == ""){
			alert("이름을 입력해 주세요");
			f.name.focus();
			return false;
		}
		if(f.email.value == ""){
			alert("Email을 입력해 주세요");
			f.email.focus();
			return false;
		}
		if(f.job.selectedIndex == 0){
			alert("직업을 선택해 주세요");
			f.job.focus();
			return false;
		}
		if(f.idc.value!='y'){
			alert("아이디를 중복체크해주세요");
			f.idBtn.focus();
			return false;
		}
		if(f.emailc.value!='y'){
			alert("이메일을 중복체크해주세요");
			f.emailBtn.focus();
			return false;
		}
		
	}
	function idCheck(id) {
		if(id == ""){
			alert("아이디를 입력하세요");
			// form을 찾아갈때 document를 씀
			document.frm.id.focus();
		}else {
			var url = "./id_proc.jsp";
			url += "?id="+id;
			// window객체에 open함수호출, 주소(id_proc)와 제목(아이디검색)과, 새창의크기 width,height=값 
			wr = window.open(url,"아이디 검색","width=500,height=500");
			// 현재 페이지를 중앙으로 이동 (x,y값 width값) , (height값) 
			wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
			
		}
	}
	
	function emailCheck(email) {
		if(email == "") {
			alert("email을 입력하세요");
			document.frm.email.focus();
		}else{
			var url = "./email_proc.jsp";
			url += "?email="+email;
			
			wr = window.open(url,"이메일 검색","width=500, height=500");
			wr.moveTo((window.screen.width-500)/2,(window.screen.height-500)/2);
		}
	}
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>

<div class="title">회원가입</div>
  <form name='frm' 
		method='POST' 
		action='./createProc.jsp'
		enctype="multipart/form-data"
		onsubmit="return inputCheck(this)">
		<input type="hidden" name="idc" value="n">
		<input type="hidden" name="emailc" value="n">
  <table>
	<tr>
	  <th>사진</th>
		<td>
		  <input type="file" name="fname">
		</td>
	  </tr>
	  <tr>
	    <th>사진종류</th>
	    <td style="color: red;">사진은 JPG, PNG, GIF 파일만 올려주세요.</td>
	  </tr>
	  <tr>
	    <th>*아이디</th>
	    <td>
	      <input type="text" name="id" size="15">
	  <!-- 아이디중복확인 버튼에다가 idCheck함수를 선언하고 거기에 form안에 input태그에 있는 id의 값을 value로 넘겨줌 -->
      	  <button name="idBtn" type="button" onclick="idCheck(document.frm.id.value)" >ID중복확인</button> 
        </TD>
	  </TR>
      <TR>
        <TH>*패스워드</TH>
        <TD>
      	  <input type="password" name="passwd" size="15" placeholder="필수">
        </TD>
      </TR>
      <TR>
        <TH>*패스워드 확인</TH> <!-- 컬럼도없고 필드도없기때문에 서브밋 되기 직전에 내가 쓴 패스워드랑 같은지를 확인만 시켜주는 작업임 -->
        <TD>
      	<input type="password" name="repasswd" size="15" placeholder="필수">
      </TD>
    </TR>
    <TR>
      <TH>*이름</TH>
      <TD>
      	<input type="text" name="name" size="15" placeholder="가입자 실명">
      </TD>
    </TR>
    <TR>
      <TH>전화번호</TH> 
      <TD>
      	<input type="text" name="phone" size="15">
      </TD>
    </TR>
    <TR>
      <TH>*이메일</TH>
      <TD>
      	<input type="text" name="email" size="25" placeholder="필수">
      	<button type="button" name="emailBtn"onclick="emailCheck(document.frm.email.value)">Email중복확인</button>
      </TD>
    </TR>
    <TR>
      <TH>우편번호</TH> 
      <TD>
      	<input type="text" name="zipcode" size="7" placeholder="우편번호" id="sample6_postcode">
      	<button type="button" onclick="sample6_execDaumPostcode()">검색</button>
      </TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD>
      	<input type="text" name="address1" size="40" placeholder="주소" id="sample6_address"><br>
      	<input type="text" name="address2" size="40" placeholder="상세주소" id="sample6_address2">
      </TD>
    </TR>
    <TR>
      <TH>*직업</TH> 
      <TD>
      	  <select name="job">
      		<option value="0" selected>선택하세요</option>
      		<option value="A01" >회사원</option>
      		<option value="A02">학생</option>
      		<option value="A03">일반자영업</option>
      		<option value="A04">공무원</option>
      		<option value="A05">의료인</option>
      		<option value="A06">법조인</option>
      		<option value="A07">종교/언론/예술인</option>
      		<option value="A08">기타</option>
   			<!-- DB에는 value값이 들어감 -->
      	  </select>
        </TD>
      </TR>
	</table>
	<DIV class='bottom'>
      <input type='submit' value='회원가입'>
      <input type='reset' value='다시입력'>
	</DIV>
  </form>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
package utility;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Hashtable;
import java.util.List;

public class Utility {
	
	public static String getCodeValue(String code){
		String value = null;
		
		// 키와 벨류를 사용하기 위함
		// 문자열 키와벨류를 저장할수 있는걸로 쓰면됨
		Hashtable codes = new Hashtable(); // 코드를 담을 해쉬테이블 객체 생성
		
		// put으로 codes에다가 담고
		codes.put("A01", "회사원");
		codes.put("A02", "전산관련직");
		codes.put("A03", "연구전문직");
		codes.put("A04", "학생");
		codes.put("A05", "일반자영업");
		codes.put("A06", "공무원");
		codes.put("A07", "의료인");
		codes.put("A08", "법조인");
		codes.put("A09", "종교/언론/예술인");
		codes.put("A10", "기타");
		
		value = (String)codes.get(code); // value변수에 형변환해서 넣음
		return value; // 메소드 호출한곳으로 리턴
	}
	
	/**
     * 오늘,어제,그제 날짜 가져오기
     * @return List- 날짜들 저장
     */
    public static List<String> getDay(){
    	// List에 넣을 제너릭 타입을 String으로 선언해서 객체 생성해줌
        List<String> list = new ArrayList<String>();
        
        // SimpleDateFormat객체를 만들면서 생성자 매개변수로 yyy-MM-dd를 넘겨줌
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        
        Calendar cal = Calendar.getInstance(); // Calendar.getInstance()호출해서 객체생성
        for(int j = 0; j < 3; j++){ // 3번돌림
            list.add(sd.format(cal.getTime())); // list에 저장할건데 sd객체에 있는 format메소드에서 Calendar객체에 있는 getTime()메소드를 호출해서 저장 현재getTime은 오늘날짜임
            cal.add(Calendar.DATE, -1); //cal객체에 오늘날짜에서 -1에서 넣어줌(어제) 그래서 for문을 3번 돌면서 list에 오늘,어제,그제 날짜를 넣을수있음
        }
        
        return list; //getDay()메소드를 호출한 곳으로 리턴
    }
    /**
     * 등록날짜와 오늘,어제,그제날짜와 비교
     * @param wdate - 등록날짜
     * @return - true:오늘,어제,그제중 등록날짜와 같음
     *           false:오늘,어제,그제 날짜가 등록날짜와 다 다름
     */
    public static boolean compareDay(String wdate){
        boolean flag = false;
        // list에다가 getDay()메소드를 집어넣음(list로 리턴된 값이 같이 들어감) 
        List<String> list = getDay(); // getDay()호출
       
        if(wdate.equals(list.get(0))	  // wdate와 list에있는 0번째 인덱스에있는 값이 같냐 아니면(||)
           || wdate.equals(list.get(1))   //  1번째 인덱스와 같냐? 아니면(||)
           || wdate.equals(list.get(2))){ //  2번째 인덱스라도 같으면 flag 에 true를 담음
            flag = true;        		  // 0,1,2번째 인덱스중에 wdate와 같은 값이 1개라도 같으면 flag는 true가됨
        }
          
        return flag; // compareDay()메소드를 호출한 곳으로 리턴
    }
// -------------------------------------------------------------------------------------------------------------------------
	/** 
	  * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
	  * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
	  *  
	  * @param totalRecord 전체 레코드수 
	  * @param nowPage     현재 페이지 
	  * @param recordPerPage 페이지당 레코드 수  
	  * @param col 검색 컬럼  
	  * @param word 검색어
	  * @return 페이징 생성 문자열
	  */ 
	
	 public static String paging3(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
	   // 블럭당 페이지 수, 한 블럭당 보여질 페이지 갯수(1~10, 11~20, 21~30 이런식으로 보여짐)
		 // 블럭: 1~10 페이지를 1번째블럭이라고 함 11~20은 2번째블럭
	   int pagePerBlock = 10; 
	   
	   // 우리가 DB에 가지고 있는 전체 페이지
	   // 전체 토탈에서 10개씩 나눴을때 가질수 있는 블럭갯수 
	   //(레코드가 6개있으면 1페이지에 5개를 보여주고 남은1개는 2페이지에서 보여줘야 하기때문에 ceil메소드를써서 소수점이 나왔을때도 무조건 올림을 해버림)
	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage)); // 전체 페이지  

	   // 페이지를 계산해서 블럭
	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹
	   
	   // 현재 보고있는 그룹 수(1~10이면 1블럭, 11~20이면 2블럭, 21~30이면 3블럭이됨)
	   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
	   
	   // 현재 보고있는 블럭에서 시작페이지, 1, 11, 21, 31이 startPage가 됨
	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작
	   
	   // 현재 보고있는 블럭에서 마지막 페이지, 10, 20, 30이 endPage가 됨
	   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
	    
	   StringBuffer str = new StringBuffer(); 
	    
	   str.append("<style type='text/css'>"); 
	   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
	   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
	   str.append("  #paging A:hover{text-decoration:none; background-color: #CCCCCC; color:black; font-size: 1em;}"); 
	   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
	   str.append("  .span_box_1{"); 
	   str.append("    text-align: center;");    
	   str.append("    font-size: 1em;"); 
	   str.append("    border: 1px;"); 
	   str.append("    border-style: solid;"); 
	   str.append("    border-color: #cccccc;"); 
	   str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
	   str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
	   str.append("  }"); 
	   str.append("  .span_box_2{"); 
	   str.append("    text-align: center;");    
	   str.append("    background-color: #668db4;"); 
	   str.append("    color: #FFFFFF;"); 
	   str.append("    font-size: 1em;"); 
	   str.append("    border: 1px;"); 
	   str.append("    border-style: solid;"); 
	   str.append("    border-color: #cccccc;"); 
	   str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
	   str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
	   str.append("  }"); 
	   str.append("</style>"); 
	   str.append("<DIV id='paging'>"); 
//	     str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
	 
	   // nowGrp(2블럭) (2블럭(11~20) -1) * 10; = 10이 나온다
	   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
	   if (nowGrp >= 2){ // 2블럭 >= 2
		   												  // 10페이지가 <a>이전</a>에 나옴 이전 링크를 눌렀을때 col과 word를 가지고 1~10페이지가보여짐
	     str.append("<span class='span_box_1'><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A></span>"); 
	   } 
	 
	   // 웹브라우저에 페이지를 뿌려주는 코드
	   for(int i=startPage; i<=endPage; i++){ // i = startPage;면 1페이지임 1페이지보다 <= endPage(10페이지);가 크거나 같으면 if문실행 
	     if (i > totalPage){ // i(1)가 > totalPage보다 크면 break;로 끝냄 
	       break;  
	     } 
	 
	     if (nowPage == i){ 
	    	 // 내가 보고있는 페이지니깐 링크를 걸지않고 색갈을 넣어줌
	       str.append("<span class='span_box_2'>"+i+"</span>"); 
	     }else{ 
	    	 // 보고있는 페이지 외에는 눌러서 가야하니깐 링크를 걸어줘야하고 그 링크는 색갈이 보고있는 페이지랑 달라야 하기때문에 class도 다르게 만듬
	       str.append("<span class='span_box_1'><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A></span>");   
	     } 
	   } 
	    // (2블럭 * 10) +1; = 21
	   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
	   if (nowGrp < totalGrp){ // 2블럭보다 < totalGrp가 크면 if문 실행
		   // 2블럭보다 크다는건 11~20보다 레코드가 많아서 21페이지 이상이 있다는얘기임 그래서 다음 글씨에 링크를 걸고 눌렀을때 col과 word를 가지고 21~레코드가있는 페이지까지 보여줌
	     str.append("<span class='span_box_1'><A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A></span>"); 
	   } 
	   str.append("</DIV>"); 
	    
	   return str.toString(); 
	 } 
	 
// -------------------------------------------------------------------------------------------------------------------------
	 
	/** 
	  * 숫자 형태의 페이징, 1 페이지부터 시작 
	  * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
	  *  
	  * @param totalRecord 전체 레코드수 
	  * @param nowPage     현재 페이지 
	  * @param recordPerPage 페이지당 출력할 레코드 수
	  * @param col 검색 컬럼  
	  * @param word 검색어
	  * @return 페이징 생성 문자열
	  */ 
	 public static String paging(int totalRecord, int nowPage, int recordPerPage, String col, String word){ 
	   int pagePerBlock = 10; // 블럭당 페이지 수 
	   int totalPage = (int)(Math.ceil((double)totalRecord/recordPerPage));// 전체 페이지  
	   int totalGrp = (int)(Math.ceil((double)totalPage/pagePerBlock));// 전체 그룹 
	   int nowGrp = (int)(Math.ceil((double)nowPage/pagePerBlock));    // 현재 그룹 
	   int startPage = ((nowGrp - 1) * pagePerBlock) + 1; // 특정 그룹의 페이지 목록 시작  
	   int endPage = (nowGrp * pagePerBlock);             // 특정 그룹의 페이지 목록 종료   
	    
	   StringBuffer str = new StringBuffer(); 
	    
	   str.append("<style type='text/css'>"); 
	   str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
	   str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
	   str.append("  #paging A:hover{text-decoration:underline; background-color: #ffffff; color:black; font-size: 1em;}"); 
	   str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
	   str.append("</style>"); 
	   str.append("<DIV id='paging'>"); 
//	   str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
	 
	   int _nowPage = (nowGrp-1) * pagePerBlock; // 10개 이전 페이지로 이동 
	   if (nowGrp >= 2){ 
	     str.append("[<A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>이전</A>]"); 
	   } 
	 
	   for(int i=startPage; i<=endPage; i++){ 
	     if (i > totalPage){ 
	       break; 
	     } 
	 
	     if (nowPage == i){ // 현재 페이지이면 강조 효과 
	       str.append("<span style='font-size: 1.2em; font-weight: bold;'>"+i+"</span> ");   
	     }else{ 
	       str.append("<A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+i+"'>"+i+"</A> "); 
	     } 
	      
	   } 
	    
	   _nowPage = (nowGrp * pagePerBlock)+1; // 10개 다음 페이지로 이동 
	   if (nowGrp < totalGrp){ 
	     str.append("[<A href='./list.jsp?col="+col+"&word="+word+"&nowPage="+_nowPage+"'>다음</A>]"); 
	   } 
	   str.append("</DIV>"); 
	    
	   return str.toString(); 
	 } 

// -------------------------------------------------------------------------------------------------------------------------
	// 필요할때 메소드 만들어서 쓸 java클래스 페이지
	
	public static String checkNull(String str){
		
		if(str == null) {
		// str이 널이면 str을 빈 문자열로 바꿔줌
			str = ""; // str = new String(); 해쉬코드가 str에 들어감
		}
		return str;
	}
}

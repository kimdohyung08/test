package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {

	// DB와 연결하기 위해 클래스를 만들고 그 안에 getConnection 객체를 만듦
	public static Connection getConnection() {
		// Connection객체를 리턴하기 위해 생성해줌
		Connection con = null;

		try {
			/* 
			인터페이스 드라이버를 구현하는 작업으로, Class클래스의 forName()메소드를 사용해서 드라이버를 로드한다
			forName()메소드는 문자열로 주어진 클래스나 인터페이스 이름을 객체로 리턴한다.
			Class.forName는 sql안에있는 커넥션을 임포트 해야만 쓸수 있음
			DriverManager(리턴형이 Connection)
			Constant클래스에 있는 드라이버 경로를 가져와서 메모리에 올림
			*/
			Class.forName(Constant.DRIVER);  
			
			/* 
			DriverManager에 등록된 각 드라이버들을 getConnection메소드를 사용해서 식별한다.
			이때 url 식별자와 동일한 것을 찾아서 매핑(mapping)한다. 찾지 못하면 no suitable error가 발생한다.
			동일안 url은 우리가 Constant클래스파일로 미리 정의해 놓았기때문에 동일하게 써주자
			Constant클래스에 있는 URL,USER,PASSWORD를 getConnection메소드를 통해 가져와서 con에 담는다
			*/ 
			con = DriverManager.getConnection(Constant.URL, Constant.USER, Constant.PASSWORD);
			// 접속 주소,로그인, 패스워드,

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return con; // getConnection() 메소드를 호출한곳으로 리턴 
	}

}

package join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class JoinDAO {
	
	// 리턴 타입: flag의 값(true,false)을 리턴하면되니깐 boolean타입
	// 매개변수 : insert니깐 dto에 저장해야함...컬럼들이 거기에 다 있음 
	public boolean create(JoinDTO dto){ 
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" INSERT INTO join1(id, passwd, name, phone, ");
		sql.append(" email, zipcode,address1,address2, job, ");
		sql.append(" mdate, fname, grade) ");
		sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ");
		sql.append(" sysdate, ?, 'H') ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
			pstmt.setString(10, dto.getFname());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}

	// 리턴타입 : id가 중복이냐(true),아니냐(false)를 리턴받아야 함으로 boolean타입
	// 매개변수 : id중복을 검증하는 쿼리문이기때문에 id만 가져오면된다.
	public boolean duplicateId(String id) {
		boolean flag = false; // boolean의 초기값이 false

		Connection con = DBOpen.getConnection(); // con객체를 생성하기위해
													// getConnection()사용
		PreparedStatement pstmt = null; // 쿼리문에 값을 ?로 사용하고 statement보다 속도도 빠름
		ResultSet rs = null; // select 쿼리 실행을 ResultSet형으로 리턴함

		// 문자열을 추가하거나 변경하려고 객체 생성
		StringBuffer sql = new StringBuffer();

		// sql객체에 append라는 메소드를 이용해서 계속해서 문자열을 추가해 나가야함
		sql.append(" SELECT COUNT(id) ");
		sql.append(" FROM join1 ");
		sql.append(" WHERE id = ? "); // 입력한 ? 값이 id와 같다면 count가 1이된다

		try {
			// sql에 담긴 문자열을 toString()을 이용해서 String 자료형으로 변경해서 pstmt변수에 담음
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id); // pstmt에 다가 1번 물음표에다가 값을 id값으로 채우고 pstmt에
									// set해줌
			// count는 0아니면1을 리턴하기때문에 if문 사용 안해도 됨
			rs = pstmt.executeQuery(); // pstmt에들어있는 값을 executeQuery()메소드를 통해
										// 실행해서 rs에 담음

			rs.next(); // 데이터가있으면 next함

			int cnt = rs.getInt(1); // rs에있는 데이터(count의 값 0 아니면 1)를 cnt에 담음
			if (cnt > 0) { // if문을통해 cnt가 0보다크면 flag에 true가 저장
				flag = true; // true일때가 중복된 아이디임
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag; // 리턴해줌
	}

	// 리턴타입 : email이 중복이냐(true),아니냐(false)를 리턴받아야 함으로 boolean타입
	// 매개변수 : email 중복을 검증하는 쿼리문이기때문에 email만 가져오면된다.
	public boolean duplicateEmail(String email) {

		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT COUNT(email) as cnt ");
		sql.append(" FROM join1 ");
		sql.append(" WHERE email = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			rs.next();

			int cnt = rs.getInt("cnt");

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}

	public boolean loginCheck(Map map){
		
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		String id = (String)map.get("id"); // id의 객체는 오브젝트 타입이기때문에 String 변수인 id에 담기위해서 (String)타입으로 형변환 해줘야 한다
		String passwd = (String)map.get("passwd");
		
		sql.append(" select count(id) as cnt ");
		sql.append(" From join1 ");
		sql.append(" where id = ? and passwd = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int cnt = rs.getInt("cnt");
					if(cnt > 0) {
						flag = true; // 회원이면 true임
					}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}

	public String getGrade(String id){
		String grade = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select grade "); // count는 없어도 0을 리턴해주지만 다른 컬럼들을 값이 없을 경우도 있기때문에(없으면 null) 데이터 오류가 남
		sql.append(" from join1 ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				grade = rs.getString("grade");
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		return grade;
		
	}

















}

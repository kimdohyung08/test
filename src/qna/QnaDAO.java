package qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class QnaDAO {
	
	public boolean loginheck(Map map){
		boolean flag = false;
		
		String id = (String)map.get("id");
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) as cnt ");
		sql.append(" from qna ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, id);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public void upViewcnt(int qnano){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" update qna ");
		sql.append(" set viewcnt = viewcnt + 1");
		sql.append(" where qnano = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, qnano);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				System.out.println("조회수 증가 성공");
			}else {
				System.out.println("조회수 증가 실패");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		
	}
	
	public QnaDTO read(int qnano){
		QnaDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select qnano, name, title, content, viewcnt, wdate ");
		sql.append(" from qna ");
		sql.append(" where qnano = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, qnano);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new QnaDTO();
				
				dto.setQnano(rs.getInt("qnano"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
	
	public int total(Map map) {
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int total = 0;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) from qna ");
		if(word.trim().length() > 0) {
			sql.append(" where " + col + " like '%'|| ? ||'%' ");
		}
		
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length() > 0) {
				pstmt.setString(1, word);
			}
			rs = pstmt.executeQuery();
			rs.next();
			
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		return total;
	}
	
	public List<QnaDTO> list(Map map){
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new  StringBuffer();
		
		List<QnaDTO> list = new ArrayList<QnaDTO>();
		
		// 쿼리문안에는 ; 없어야함
		sql.append(" SELECT qnano, name, title, viewcnt, wdate, grpno, indent, ansnum, r ");
		sql.append(" FROM(");
		sql.append("	SELECT qnano, name, title, viewcnt, wdate, grpno, indent, ansnum, rownum as r ");
		sql.append("	FROM ( ");
		sql.append("	  SELECT qnano, name, title, viewcnt, wdate, grpno, indent, ansnum ");
		sql.append("	  FROM qna  ");
		// 검색을 했을경우와 안했을 경우가 있다
		if(word.trim().length() > 0){
			sql.append("  where " + col + " like '%'|| ? ||'%'  "); // word라는 값으로 검색할건지 말건지를 정함
		}
		sql.append("	  ORDER BY grpno DESC, ansnum ASC ");
		sql.append("	) ");
		sql.append(" ) where r >= ? and r <= ? "); //ORDER BY의 디폴트값은 ASC라서 안써도됨
		
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length() > 0) {
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				
				dto.setQnano(rs.getInt("qnano"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				list.add(dto);
				}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return list;
	}
	
	public boolean crate(QnaDTO dto){
		boolean flag = false;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" insert into qna(qnano, name, title, content, passwd, wdate, grpno)  ");
		sql.append(" values((select nvl(max(qnano),0) +1 as qnano from qna), ");
		sql.append(" ?, ?, ?, ?, sysdate, ");
		sql.append(" (select nvl(max(grpno),0)+1 as grpno from qna)) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0){
				flag = true;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}

}

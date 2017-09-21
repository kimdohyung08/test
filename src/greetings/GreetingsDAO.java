package greetings;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class GreetingsDAO {
	
	public List<GreetingsDTO> list(Map map){
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		List<GreetingsDTO> list = new ArrayList<GreetingsDTO>();
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select greetings, name, title, viewcnt, wdate, grpno, indent, ansnum, r ");
		sql.append(" from( ");
		sql.append(" 	select greetings, name, title, viewcnt, wdate, grpno, indent, ansnum, rownum as r ");
		sql.append(" 	from( ");
		sql.append(" 		select greetings, name, title, viewcnt, wdate, grpno, indent, ansnum ");
		sql.append(" 		from greetings ");
		if(word.trim().length() > 0) {
			sql.append("  where " + col + " like '%' || ? || '%' ");
		}
		sql.append(" 	  order by grpno desc, ansnum asc ");
		sql.append(" 	) ");
		sql.append(" )where r >= ? and r <= ? ");
		
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length() > 0) {
				pstmt.setString(i++, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GreetingsDTO dto = new GreetingsDTO();
				dto.setGreetingsno(rs.getInt("greetingsno"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return list;
		
	}
	
	public boolean create(GreetingsDTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" insert into greetings(greetingsno, name, title, content, wdate, grpno) ");
		sql.append(" values((select nvl(max(greetingsno), 0) + 1 as greetingsno from greetings), ");
		sql.append(" ?, ?, ?, sysdate, ");
		sql.append(" (select nvl(max(grpno), 0) + 1 as grpno from greetings)) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}

}

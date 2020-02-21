package a_common;

import static a_common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import f_message.model.vo.Message;

public class SearchDAO {

	private Properties prop = new Properties();
	
	public int searchCount(Connection conn, String select, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String query = null;
		
		// getParameter로 값을 담은 변수가 DB 컬럼명과 같을 때
			// ex) DB에서의 USER_ID 와 jsp에서 option의 value값이 USER_ID. 
		query = prop.getProperty("searchCount");
		// SELECT * FROM 테이블병 WHERE ? LIKE ?
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, select );
			pstmt.setString(2, "%" + keyword + "%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		// getParameter로 값을 담은 변수명가 컬럼명이랑 다를 때
		
		if(select.equals("from")) {
			query = prop.getProperty("fromMsgCount");
			// SELECT COUNT(*) FROM MESSAGE WHERE MFROM LIKE ?
		} else if(select.equals("content")){
			query = prop.getProperty("contentMsgCount");
			// SELECT * FROM MESSAGE WHERE MCONTNET LIKE
		} else {
			query = prop.getProperty("titleMsgCount");
			// SELECT COUNT(*) FROM MESSAGE WHERE MTITLE LIKE ?
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Message> searchList(Connection conn, int currentPage, String select, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> list = null;
		
		int messages = 5;
		
		int startRow = (currentPage - 1) * messages + 1;   // 현재 페이지에서 나타나는 게시글 시작 번호
		int endRow = startRow + messages - 1; 			  // 현재 페이지에서 게시글 끝 번호
		
		String query = null;
		
		if(select.equals("from")) {
			query = prop.getProperty("fromMsgList");
		} else if(select.equals("content")){
			query = prop.getProperty("contentMsgList");
		} else {
			query = prop.getProperty("titleMsgList");
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Message>();
			
			while(rs.next()) {
				Message m = new Message(rs.getInt("MNO"),
										rs.getString("MTO"),
										rs.getString("MFROM"),
										rs.getString("MTITLE"),
										rs.getString("MCONTENT"),
										rs.getDate("MDATE"),
										rs.getInt("MVIEW"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}


}

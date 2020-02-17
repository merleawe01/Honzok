package f_message.model.dao;

import static a_common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import f_message.model.vo.Message;

public class MessageDAO {

	private Properties prop = new Properties();
	
	public MessageDAO() {
		String fileName = MessageDAO.class.getResource("/sql/f_message/message-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return result;
	}

	public ArrayList<Message> selectList(Connection conn, int currentPage, String loginUserNickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> list = null;
		
		int messages = 5;
		
		int startRow = (currentPage - 1) * messages + 1;   // 현재 페이지에서 나타나는 게시글 시작 번호
		int endRow = startRow + messages - 1; 			  // 현재 페이지에서 게시글 끝 번호
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3, loginUserNickName);
			
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
	
	public int welcomeMessage(Connection conn, String nickName) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("welcomMessage");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, nickName);
			pstmt.setString(2, "운영자");
			pstmt.setString(3, "가입하신걸 환영합니다!");
			pstmt.setString(4, "혼족옵서예에서 당신의 빛나는 싱글라이프를 즐겨주세요 *^^*");
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMessage(Connection conn, String[] mNoList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deleteMessage");
		
		try {
			for(int i=0; i<mNoList.length; i++) {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(mNoList[i]));
				
				result += pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}

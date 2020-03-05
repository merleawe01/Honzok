package f_message.model.dao;

import static a_common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;import b_member.model.vo.Member;
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
	
	public int getRListCount(Connection conn, String loginUserNickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("getRListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserNickName);
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

	public ArrayList<Message> selectRList(Connection conn, int currentPage, String loginUserNickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> list = null;
		
		int messages = 5;
		
		int startRow = (currentPage - 1) * messages + 1;   // 현재 페이지에서 나타나는 게시글 시작 번호
		int endRow = startRow + messages - 1; 			  // 현재 페이지에서 게시글 끝 번호
		String query = prop.getProperty("selectRList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserNickName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
		
		String query = prop.getProperty("welcomeMessage");
		
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

	public int updateCount(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Message selectMessage(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Message m = null;
		
		String query = prop.getProperty("selectMessage");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {

				m = new Message(rs.getInt("MNO"),
								rs.getString("MTO"),
								rs.getString("MFROM"),
								rs.getString("MTITLE"),
								rs.getString("MCONTENT"),
								rs.getDate("MDATE"),
								rs.getInt("MVIEW"));
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public int sendMessage(Connection conn, Message msg) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("sendMessage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, msg.getTo());
			pstmt.setString(2, msg.getFrom());
			pstmt.setString(3, msg.getmTitle());
			pstmt.setString(4, msg.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int getSendListCount(Connection conn, String loginUserNickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String query = prop.getProperty("getSendListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserNickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return result;
	}
	
	public ArrayList<Message> selectSendList(Connection conn, int currentPage, String loginUserNickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> list = null;
		
		int messages = 5;
		
		int startRow = (currentPage - 1) * messages + 1;   // 현재 페이지에서 나타나는 게시글 시작 번호
		int endRow = startRow + messages - 1; 			  // 현재 페이지에서 게시글 끝 번호
		
		String query = prop.getProperty("selectSendList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserNickName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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

	public int storeMessage(Connection conn, String[] mNoList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("storeMessage");
		
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

	public int getStoreListCount(Connection conn, String loginUserNickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String query = prop.getProperty("getStoreListCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserNickName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return result;
	}

	public ArrayList<Message> selectStoreList(Connection conn, int currentPage, String loginUserNickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> list = null;
		
		int messages = 5;
		
		int startRow = (currentPage - 1) * messages + 1;   // 현재 페이지에서 나타나는 게시글 시작 번호
		int endRow = startRow + messages - 1; 			  // 현재 페이지에서 게시글 끝 번호
		
		String query = prop.getProperty("selectStoreList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserNickName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
	
	public int offMessage(Connection conn, String[] mNoList) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("offMessage");
		
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

	public int searchMsgCount(Connection conn, String select, String keyword, String loginUserNickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String query = null;
		
		if(select.equals("from")) {
			query = prop.getProperty("fromMsgCount");
		} else if(select.equals("content")){
			query = prop.getProperty("contentMsgCount");
		} else if(select.equals("title")){
			query = prop.getProperty("titleMsgCount");
		}
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, loginUserNickName);
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

	public ArrayList<Message> searchMsgList(Connection conn, int currentPage, String select, String keyword, String loginUserNickName) {
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
			pstmt.setString(1, loginUserNickName);
			pstmt.setString(2, "%" + keyword + "%");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
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

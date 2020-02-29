package g_board.model.dao;

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

import g_board.model.vo.Reply;
import g_board.model.vo.Board;

public class BoardDAO {
	
	private Properties prop = new Properties();
	
	public BoardDAO() {
		String fileName = BoardDAO.class.getResource("/sql/g_board/board-query.properties").getPath();
		
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
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("GETLISTCOUNT");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}


	public ArrayList<Board> viewList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> List = null;
		int posts = 10;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("VIEWLIST");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			List = new ArrayList<Board>();
			System.out.println(startRow);
			System.out.println(endRow);
			while(rset.next()) {
				Board b = new Board(rset.getInt("post_No"),
								   rset.getString("post_Title"),
								   rset.getInt("view_Count"),
								   rset.getString("write_Date"));
				
				List.add(b);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		

		return List;
	}




	public int updateCount(Connection conn, int pn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UPDATECOUNT");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, pn);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Board selectBoard(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		
		String query = prop.getProperty("SELECTBOARD");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new Board(rs.getInt("post_no"),
								  rs.getInt("board_no"),
								  rs.getString("post_title"),
								  rs.getString("content"),
								  rs.getInt("view_count"),
								  rs.getString("write_date"),
								  rs.getDate("modify_date"),
								  rs.getString("delete_yn").charAt(0));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		
		return board;
	}
	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("INSERTBOARD");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, board.getPostTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			
			System.out.println("1 : " + board.getPostTitle());
			System.out.println("2 : " + board.getWriter());
			System.out.println("3 : " + board.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}
	
	public ArrayList<Reply> selectReplyList(Connection conn, int post_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Reply> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, post_no);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Reply>();
			
			while(rs.next()) {
				list.add(new Reply(rs.getInt("cno"), 
								   rs.getInt("post_no"),
								   rs.getString("nickname"), 
								   rs.getString("content"), 
								   rs.getDate("write_date"), 
								   rs.getString("delete_yn")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	public int insertReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getPost_no());
			pstmt.setString(2, r.getWriter());
			pstmt.setString(3, r.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteReply(Connection conn, Reply r) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, r.getCno());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	


	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("UPDATEBOARD");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getPostTitle());
			pstmt.setString(2, b.getContent());
			pstmt.setInt(3, b.getPostNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}



	public int deleteBoard(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("DELETEBOARD");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

}

package d_trade.model.dao;

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

import d_trade.model.vo.Image;
import d_trade.model.vo.Trade;

public class TradeDAO {
	
	private Properties prop = new Properties();
	
	public TradeDAO() {
		String fileName = TradeDAO.class.getResource("/sql/d_trade/trade-query.properties").getPath();
		
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
		
		String query = prop.getProperty("getListCount");
		
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

	public ArrayList<Trade> selectList(Connection conn, int currentPage) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Trade> list = null;
		int posts = 10;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Trade>();
			
			while(rset.next()) {
				Trade t = new Trade(rset.getInt("post_no"),
							 	    rset.getInt("board_no"),
							   	    rset.getString("post_title"),
								    rset.getString("content"),
								    rset.getInt("view_count"),
								    rset.getString("nickname"),
								    rset.getInt("point"),
								    rset.getInt("max_point"),
								    rset.getDate("dl_time"),
								    rset.getDate("write_date"),
								    rset.getDate("modify_date"),
								    rset.getString("delete_yn").charAt(0));
				
				list.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<Trade> viewTList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Trade> list = null;
		
		String query = prop.getProperty("viewTList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Trade>();
			
			while(rset.next()) {
				list.add(new Trade(rset.getInt("rnum"),
								   rset.getString("post_title"),
								   rset.getInt("point"),
								   rset.getInt("max_point"),
								   rset.getDate("dl_time"),
								   rset.getString("writer")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList viewIList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Image> list = null;
		
		String query = prop.getProperty("viewIList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Image>();
			
			while(rset.next()) {
				list.add(new Image(rset.getInt("post_no"),
								   rset.getString("change_name")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return list;
	}

	public int insertTrade1(Connection conn, Trade g) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTrade1");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, g.getPostTitle());
			pstmt.setString(2, g.getWriter());
			pstmt.setString(3, g.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertTrade2(Connection conn, Trade t) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTrade2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, t.getMinPoint());
			pstmt.setInt(2, t.getMaxPoint());
			pstmt.setInt(3, t.getPoint());
			pstmt.setString(4, t.getNickname());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int updateCount(Connection conn, int pn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
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

	public Trade selectBoard(Connection conn, int pn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Trade trade = null;
		
		String query = prop.getProperty("selectTrade");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pn);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				trade = new Trade(rs.getInt("post_no"),
								  rs.getInt("board_no"),
								  rs.getString("post_title"),
								  rs.getString("content"),
								  rs.getInt("view_count"),
								  rs.getString("nickname"),
								  rs.getInt("point"),
								  rs.getInt("max_point"),
								  rs.getDate("dl_time"),
								  rs.getDate("write_date"),
								  rs.getDate("modify_date"),
								  rs.getString("delete_yn").charAt(0));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return trade;
	}

}

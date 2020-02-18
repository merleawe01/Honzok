package e_market.model.dao;

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

import e_market.model.dao.MarketDAO;
import e_market.model.vo.Attachment;
import e_market.model.vo.Market;

public class MarketDAO {
	
	private Properties prop = new Properties();
	
	public MarketDAO() {
		String fileName = MarketDAO.class.getResource("/sql/e_market/market-query.properties").getPath();
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
			stmt=conn.createStatement();
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

	public ArrayList<Market> selectList(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Market> list = null;
		int posts = 10; // 한 페이지에 보여질 게시글 개수
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Market>();
			
			while(rset.next()) {
				Market m = new Market(rset.getInt("post_no"),
									  rset.getString("item_status"),
									  rset.getInt("item_price"),
									  rset.getString("use_date"),
									  rset.getString("etc"),
									  rset.getString("sell_yn"),
									  rset.getString("post_title"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Market> selectMList(Connection conn, int currentPage) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Market> list = null;
		
		String query = prop.getProperty("selectMList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Market>();
			
			while(rs.next()) {
				list.add(new Market(rs.getInt("post_no"),
									 rs.getString("item_status"),
									 rs.getInt("item_price"),
									 rs.getString("use_date"),
									 rs.getString("etc"),
									 rs.getString("sell_yn"),
									 rs.getString("post_title")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}

	public ArrayList<Attachment> selectFList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectFList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			list = new ArrayList<Attachment>();
			
			while(rs.next()) {
				list.add(new Attachment(rs.getInt("post_no"),
										rs.getString("change_name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return list;
	}
	
	public int insertCommonBoard(Connection conn, Market m) {
		PreparedStatement pstmt = null;
		
		int result = 0;

		String query = prop.getProperty("insertCommonBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getPostTitle());
			pstmt.setString(2, m.getWriter());
			pstmt.setString(3, m.getContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		
		
		return result;
	}
	public int insertMarketBoard(Connection conn, Market m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMarketBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getItemStatus());
			pstmt.setInt(2, m.getItemPrice());
			pstmt.setString(3, m.getUseDate());
			pstmt.setString(4, m.getEtc());
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Attachment a = fileList.get(i);
				
				pstmt= conn.prepareStatement(query);
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setString(3, a.getImgSrc());
				pstmt.setInt(4, a.getFileLevel());
				
				result += pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateCount(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Market selectBoard(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Market m = null;
		
		String query = prop.getProperty("selectBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Market(rset.getInt("post_no"),
							   rset.getString("post_title"),
							   rset.getDate("write_date"),
							   rset.getString("writer"),
							   rset.getInt("view_count"),
							   rset.getString("content"),
							   rset.getString("item_status"),
							   rset.getInt("item_price"),
							   rset.getString("use_date"),
							   rset.getString("etc"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	public ArrayList<Attachment> selectImage(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			rset = pstmt.executeQuery(); 
			list = new ArrayList<Attachment>();
			
			while(rset.next()) {
				Attachment at = new Attachment();
				at.setImgId(rset.getInt("img_id"));
				at.setOriginName(rset.getString("origin_name"));
				at.setChangeName(rset.getString("change_name"));
				at.setImgSrc(rset.getString("img_src"));
				at.setUploadDate(rset.getDate("upload_date"));
				
				list.add(at);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	
	
	
	
	
	
	
}

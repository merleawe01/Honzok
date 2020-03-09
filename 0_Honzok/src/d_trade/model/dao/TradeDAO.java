package d_trade.model.dao;

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
import java.util.Properties;

import d_trade.model.vo.Bid;
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


	public ArrayList<Trade> viewTList1(Connection conn, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Trade> list = null;
		int posts = 10;
		
		int startRow = (currentPage - 1) * posts + 1;
		int endRow = startRow + posts -1;
		
		String query = prop.getProperty("viewTList");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Trade>();
			
			while(rset.next()) {
				Trade t = new Trade(rset.getInt("post_no"),
								   rset.getInt("rnum"),
								   rset.getString("post_title"),
								   rset.getInt("max_point"),
								   rset.getInt("point"),
								   rset.getString("dl_time"),
								   rset.getString("NICKNAME"),
								   rset.getString("dl_yn").charAt(0));
				
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

	public ArrayList<Image> viewIList2(Connection conn) {
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
//			pstmt.setInt(3, t.getPoint());
			pstmt.setString(3, t.getNickname());
			
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
								  rs.getInt("min_point"),
								  rs.getInt("point"),
								  rs.getInt("max_point"),
								  rs.getString("dl_time"),
								  rs.getString("dl_yn").charAt(0),
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

	public int insertImage(Connection conn, ArrayList<Image> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertImage");
		
			
			try {
				for(int i = 0; i < fileList.size(); i++) {
					Image a = fileList.get(i);
					
					pstmt = conn.prepareStatement(query);
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

	public ArrayList<Image> selectImage(Connection conn, int pn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Image> list = null;
		
		String query = prop.getProperty("selectImage");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pn);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<Image>();
			
			while(rs.next()) {
				Image ig = new Image();
				ig.setImgId(rs.getInt("img_id"));
				ig.setOriginName(rs.getString("origin_name"));
				ig.setChangeName(rs.getString("change_name"));
				ig.setImgSrc(rs.getString("img_src"));
				ig.setUploadDate(rs.getDate("upload_date"));
				
				list.add(ig);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public Trade selectNick(Connection conn, int pn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Trade trade = null;
		String query = prop.getProperty("selectNick");
		
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, pn);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				trade = new Trade(rs.getString("nickname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return trade;
	}

	public int updateGBoard1(Connection conn, Trade g) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateGBoard1");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, g.getPostTitle());
			pstmt.setString(2, g.getContent());
			pstmt.setInt(3, g.getPostNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateGBoard2(Connection conn, Trade t) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateGBoard2");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, t.getMinPoint());
			pstmt.setInt(2, t.getMaxPoint());
			pstmt.setInt(3, t.getPostNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertNewImage(Connection conn, ArrayList<Image> newInsertFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNewImage");
		
			
		try {
			for(int i = 0; i < newInsertFile.size(); i++) {
				Image a = newInsertFile.get(i);
				
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, a.getPostNo());
				pstmt.setString(2, a.getOriginName());
				pstmt.setString(3, a.getChangeName());
				pstmt.setString(4, a.getImgSrc());
			//	pstmt.setInt(5, a.getFileLevel());
				
				result += pstmt.executeUpdate();
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateImage(Connection conn, ArrayList<Image> changeFile) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateImage");
		
		try {
			for(int i = 0; i < changeFile.size(); i++) {
				Image a = changeFile.get(i);
				
				pstmt=conn.prepareStatement(query);
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setInt(3, a.getImgId());
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteTrade(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteTrade");
		
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

	public int insertBid(Connection conn, Bid b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBid");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b.getPostNo());
			pstmt.setString(2, b.getUserId());
			pstmt.setString(3, b.getNickName());
			pstmt.setString(4, b.getPhone());
			pstmt.setString(5, b.getEmail());
			pstmt.setInt(6, b.getPostalCode());
			pstmt.setString(7, b.getbAddr());
			pstmt.setString(8, b.getlAddr());
			pstmt.setInt(9, b.getBpoint());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int updateBid(Connection conn, Bid b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBid");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, b.getBpoint());
			pstmt.setString(2, b.getNickName());
			pstmt.setInt(3, b.getPostNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePoint1(Connection conn, Trade td) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePoint");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, td.getMaxPoint());
			pstmt.setString(2, td.getUserId());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updatedlYn(Connection conn, Trade td) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatedlYn");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, td.getPostNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Trade selectWinner(Connection conn, int postNo, String title) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Trade sw = null;
		
		String query = prop.getProperty("selectWinner");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, postNo);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				sw = new Trade(rset.getString("user_id"),
							   rset.getInt("point"),
							   rset.getString("nickname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return sw;
	}

	public int updatePointWinner(Connection conn, Trade sw, int bPoint) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("pointWinner");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bPoint);
			pstmt.setString(2, sw.getUserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBidYN(Connection conn, int postNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBidYN");
		
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

	public int updatePoint2(Connection conn, Trade td) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePlusPoint");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, td.getMaxPoint());
			pstmt.setString(2, td.getWriter());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateSellPoint(Connection conn, String writer, int bPoint) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateSellPoint");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bPoint);
			pstmt.setString(2, writer);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}



}

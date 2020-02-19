package c_information.model.dao;

import static a_common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import c_information.model.vo.FoodBoard;
import c_information.model.vo.Image;
import c_information.model.vo.TravelBoard;

public class InformationDAO {

	private Properties prop = new Properties();
	
	public InformationDAO() {
		String fileName = InformationDAO.class.getResource("/sql/c_information/information-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertBoard(Connection conn, FoodBoard board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, 1);
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertFBoard(Connection conn, FoodBoard board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertFBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getLocal_name());
			pstmt.setString(2, board.getAddress());
			pstmt.setInt(3, board.getStar());
			String rc_food = (board.getRc_food() == null) ? "" : board.getRc_food();
			pstmt.setString(4, rc_food);
			pstmt.setDouble(5, board.getArea_x());
			pstmt.setDouble(6, board.getArea_y());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertCateBoard(Connection conn, FoodBoard board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCateBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			String[] cateArr = board.getCategory().split(", ");
			for(int i = 0; i < cateArr.length; i++) {
				pstmt.setString(1, cateArr[i]);
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertImage(Connection conn, ArrayList<Image> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertImage");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				Image a = fileList.get(i);

				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, a.getOrigin_name());
				pstmt.setString(2, a.getChange_name());
				pstmt.setString(3, a.getImg_src());
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

	public ArrayList<FoodBoard> listFBoard(Connection conn, String area, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<FoodBoard> list = null;
		
		String query = prop.getProperty("listFBoard");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, area);
			pstmt.setString(2, category);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<FoodBoard>();
			
			while(rset.next()) {
				FoodBoard b = new FoodBoard(rset.getInt("POST_NO"), rset.getString("POST_TITLE"), rset.getString("NICKNAME"), rset.getInt("RECO_COUNT"), rset.getString("ADDRESS"), rset.getInt("STAR"), rset.getDouble("area_x"), rset.getDouble("area_y"), rset.getString("change_name"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int updateCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public FoodBoard selectFBoard(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FoodBoard board = null;
		
		String query = prop.getProperty("selectFBoard");
		String query2 = prop.getProperty("selectCate");
		String category = "";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new FoodBoard(rs.getInt("POST_NO"), rs.getString("POST_TITLE"), rs.getString("NICKNAME"), rs.getString("CONTENT"), rs.getInt("VIEW_COUNT"), 
						rs.getInt("RECO_COUNT"), rs.getString("ADDRESS"), rs.getInt("STAR"), rs.getString("RC_FOOD"), rs.getDouble("AREA_X"), rs.getDouble("AREA_Y"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		try {
			pstmt = conn.prepareStatement(query2);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				category += rs.getString("CNO") + ", ";
			}
			category = category.substring(0, category.length()-2);
			board.setCategory(category);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return board;
	}

	public ArrayList<Image> selectImage(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Image> imgList = new ArrayList<Image>();
		
		String query = prop.getProperty("selectImage");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Image image = new Image(rs.getInt("img_id"), rs.getString("origin_name"), rs.getString("change_name"), rs.getInt("file_level")); 

				imgList.add(image);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return imgList;
	}

	public ArrayList<TravelBoard> listTBoard(Connection conn, String area) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<TravelBoard> list = null;
		
		String query = prop.getProperty("listTBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, area);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<TravelBoard>();
			
			while(rset.next()) {
				TravelBoard t = new TravelBoard(rset.getInt("POST_NO"), rset.getString("POST_TITLE"), rset.getString("NICKNAME"), rset.getInt("RECO_COUNT"), rset.getString("ADDRESS"), rset.getInt("STAR"), rset.getDouble("area_x"), rset.getDouble("area_y"), rset.getString("change_name"));
				
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

	public int insertBoard(Connection conn, TravelBoard board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, 2);
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int insertTBoard(Connection conn, TravelBoard board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTBoard");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getLocal_name());
			pstmt.setString(2, board.getAddress());
			pstmt.setInt(3, board.getStar());
			String caution = (board.getCaution() == null) ? "" : board.getCaution();
			pstmt.setString(4, caution);
			pstmt.setDouble(5, board.getArea_x());
			pstmt.setDouble(6, board.getArea_y());
			pstmt.setString(7, board.getBest_time());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public TravelBoard selectTBoard(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TravelBoard board = null;
		
		String query = prop.getProperty("selectTBoard");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new TravelBoard(rs.getInt("POST_NO"), rs.getString("POST_TITLE"), rs.getString("NICKNAME"), rs.getString("CONTENT"), rs.getInt("VIEW_COUNT"), 
						rs.getInt("RECO_COUNT"), rs.getString("ADDRESS"), rs.getInt("STAR"), rs.getString("CAUTION"), rs.getString("BEST_TIME"), rs.getDouble("AREA_X"), rs.getDouble("AREA_Y"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return board;
	}
	
	
	
}

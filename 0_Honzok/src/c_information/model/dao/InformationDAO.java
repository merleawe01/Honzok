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
			pstmt.setString(4, board.getRc_food());
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

	
	
	
	
	
	
}

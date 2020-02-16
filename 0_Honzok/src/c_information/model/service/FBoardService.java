package c_information.model.service;

import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.rollback;
import static a_common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import c_information.model.dao.InformationDAO;
import c_information.model.vo.FoodBoard;
import c_information.model.vo.Image;

public class FBoardService {

	public int insertFBoard(FoodBoard board, ArrayList<Image> fileList) {
		Connection conn = getConnection();
		
		InformationDAO dao = new InformationDAO();
		
		int result1 = dao.insertBoard(conn, board);
		int result2 = dao.insertFBoard(conn, board);
		int result3 = dao.insertCateBoard(conn, board);
		int result4 = dao.insertImage(conn, fileList);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public ArrayList<FoodBoard> listFBoard(String area, String[] cateArr) {
		Connection conn = getConnection();
		
		InformationDAO dao = new InformationDAO();
		
		ArrayList<FoodBoard> FList = new ArrayList<FoodBoard>();
		
		for(int i = 0; i < cateArr.length; i++) {
			ArrayList<FoodBoard> result = dao.listFBoard(conn, area, cateArr[i]);
			
			for(FoodBoard fb : result) {
				for(FoodBoard fbb : FList) {
					if(fbb.getNo() != fb.getNo()) {
						FList.add(fb);
					}
				}
			}
		}
		
		close(conn);
		
		return FList;
	}

}

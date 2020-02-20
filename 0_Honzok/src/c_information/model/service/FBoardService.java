package c_information.model.service;

import static a_common.JDBCTemplate.close;
import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.rollback;

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
				boolean check = false;
				
				for(FoodBoard fbb : FList) {
					if(fbb.getNo() == fb.getNo()) {
						check = true;
						break;
					}
				}
				
				if(check == false) {
					FList.add(fb);
				}
			}
		}
		
		close(conn);
		
		return FList;
	}

	public FoodBoard selectBoard(int no) {
		Connection conn = getConnection();
		InformationDAO dao = new InformationDAO();
		
		int result = dao.updateCount(conn, no);
		FoodBoard board = null;
		if(result > 0) {
			board = dao.selectFBoard(conn, no);
			if(board != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		
		return board;
	}

	public ArrayList<Image> selectImage(int no) {
		Connection conn = getConnection();
		InformationDAO dao = new InformationDAO();
		
		ArrayList<Image> imgList = null;
		
		imgList = dao.selectImage(conn, no);
		if(imgList != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return imgList;
	}

	public int updateFBoard(FoodBoard board, ArrayList<Image> fileList, String imgInfo) {
		Connection conn = getConnection();
		
		InformationDAO dao = new InformationDAO();
		
		int result1 = dao.updateBoard(conn, board);
		int result2 = dao.updateFBoard(conn, board);
		int result3 = dao.deleteCateBoard(conn, board);
		int result4 = dao.insertCateBoard(conn, board);
		int result5 = dao.updateImage(conn, fileList, imgInfo, board.getNo());
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

}

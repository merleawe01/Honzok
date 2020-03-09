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
import c_information.model.vo.TravelBoard;

public class TBoardService {

	public ArrayList<TravelBoard> listTBoard(String area) {
		Connection conn = getConnection();
		
		InformationDAO dao = new InformationDAO();
		
		ArrayList<TravelBoard> TList = new ArrayList<TravelBoard>();
		
		ArrayList<TravelBoard> result = dao.listTBoard(conn, area);
		
		for(TravelBoard tb : result) {
			TList.add(tb);
		}
		
		close(conn);
		
		return TList;
	}

	public int insertTBoard(TravelBoard board, ArrayList<Image> fileList) {
		Connection conn = getConnection();
		
		InformationDAO dao = new InformationDAO();
		
		int result1 = dao.insertBoard(conn, board);
		int result2 = dao.insertTBoard(conn, board);
		int result3 = dao.insertImage(conn, fileList);
		int result4 = dao.addPoint(conn, board.getWriter());
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public TravelBoard selectBoard(int no) {
		Connection conn = getConnection();
		InformationDAO dao = new InformationDAO();
		
		int result = dao.updateCount(conn, no);
		TravelBoard board = null;
		if(result > 0) {
			board = dao.selectTBoard(conn, no);
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

	public int updateFBoard(TravelBoard board, ArrayList<Image> fileList, String imgInfo) {
		Connection conn = getConnection();
		
		InformationDAO dao = new InformationDAO();
		
		int result1 = dao.updateBoard(conn, board);
		int result2 = dao.updateTBoard(conn, board);
		int result3 = dao.updateImage(conn, fileList, imgInfo, board.getNo());
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int deleteTBoard(int no, String writer) {
		Connection conn = getConnection();
		InformationDAO dao = new InformationDAO();
		
		int result1 = dao.deleteBoard(conn, no);
		int result2 = dao.deletePoint(conn, writer);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

}

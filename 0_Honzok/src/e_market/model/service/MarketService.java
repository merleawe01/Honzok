package e_market.model.service;

import static a_common.JDBCTemplate.close;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.rollback;


import java.sql.Connection;
import java.util.ArrayList;

import org.apache.tomcat.jni.File;

import e_market.model.dao.MarketDAO;
import e_market.model.vo.Attachment;
import e_market.model.vo.Market;

public class MarketService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = new MarketDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Market> selectMList(int currentPage) {
		Connection conn = getConnection();
		ArrayList<Market> list = new MarketDAO().selectMList(conn, currentPage);
		
		close(conn);
				
		return list;
	}

	public ArrayList<Attachment> selectFList() {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new MarketDAO().selectFList(conn);
		
		close(conn);
		
		
		return list;
	}

	public int insertMarket(Market m, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		MarketDAO dao = new MarketDAO();
		
		int result1 = dao.insertCommonBoard(conn, m);
		int result2 = dao.insertMarketBoard(conn, m);
		int result3 = dao.insertAttachment(conn, fileList);
		
		
		if(result1 > 0 && result2 > 0 && result3 > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public Market selectBoard(int postNo) {
		Connection conn = getConnection();
		MarketDAO dao = new MarketDAO();
		
		int result = dao.updateCount(conn, postNo);
		Market m = null;
		if(result > 0) {
			m = dao.selectBoard(conn, postNo);
				if(m != null) {
					commit(conn);
				} else {
					rollback(conn);
				}
		} else {
			rollback(conn);
		}
		
	
		return m;
	}

	public ArrayList<Attachment> selectImage(int postNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new MarketDAO().selectImage(conn, postNo);
		
		return list;
	}

	public int updateThumbnail(Market m) {
		Connection conn = getConnection();
		
		MarketDAO dao = new MarketDAO();
		
		int result1 = dao.updateMarket(conn, m); 
		int result2 = dao.updateCommonBoard(conn, m);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updateThumbnail(Market m, ArrayList<Attachment> file) {
		Connection conn = getConnection();
		
		MarketDAO dao = new MarketDAO();
		
		int result1 = dao.updateMarket(conn, m);
		int result2 = 0;
		if(file.get(0).getImgId() == 0){
//			result2 = dao.insertNewAttachment(conn, file);
		} else {
//			result2 = dao.updateAttachment(conn, file);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updateThumbnail(Market m, ArrayList<Attachment> changeFile, ArrayList<Attachment> newInsertFile) {
		Connection conn = getConnection();
		
		MarketDAO dao = new MarketDAO();
		
		int result1 = dao.updateMarket(conn, m);
//		int result2 = dao.updateImage(conn, changeFile);
//		int result3 = dao.insertNewImage(conn, newInsertFile);
//		
//		if(result1 > 0 && result2 > 0 && result3 > 0) {
//			commit(conn);
//		} else {
//			rollback(conn);
//		}
//		
		return result1;
	}


}

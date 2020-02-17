package e_market.model.service;

import static a_common.JDBCTemplate.close;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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

	public int insertMarket(Market m, ArrayList<Attachment> fileList, String writer) {
		Connection conn = getConnection();
		
		MarketDAO dao = new MarketDAO();
		
		int result1 = dao.insertMarketBoard(conn, m);
		int result2 = dao.insertAttachment(conn, fileList);
		int result3 = dao.insertCommonBoard(conn, m, writer);
		
		if(result1 > 0 && result2 > 0 && result3 > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}


}

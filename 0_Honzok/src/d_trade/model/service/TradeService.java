package d_trade.model.service;

import static a_common.JDBCTemplate.close;
import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import d_trade.model.dao.TradeDAO;
import d_trade.model.vo.Trade;

public class TradeService {

	public int getListCount() {
		
		Connection conn = getConnection();

		int result = new TradeDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Trade> selectList(int currentPage) {
		Connection conn = getConnection();
		
		ArrayList<Trade> list = new TradeDAO().selectList(conn, currentPage);
		
		close(conn);
		return list;
	}

	public ArrayList viewList(int i) {
		Connection conn = getConnection();
		
		ArrayList list = null;
		
		TradeDAO tDAO = new TradeDAO();
		
		if(i == 1) {
			list = tDAO.viewTList(conn);
		}else {
			list = tDAO.viewIList(conn);
		}
		
		return list;
	}

	public int insertTrade(Trade g, Trade t) {
		Connection conn = getConnection();
		
		TradeDAO dao = new TradeDAO();
		
		int result1 = dao.insertTrade1(conn, g);
		int result2 = dao.insertTrade2(conn, t);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		return result1;
	}

	public Trade selectTrade(int pn) {
		Connection conn = getConnection();
		TradeDAO dao = new TradeDAO();
		
		int result = dao.updateCount(conn, pn);
		
		Trade trade = null;
		if(result > 0) {
			trade = dao.selectBoard(conn, pn);
			if(trade != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		
		return trade;
	}

}

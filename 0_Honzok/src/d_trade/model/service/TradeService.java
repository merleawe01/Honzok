package d_trade.model.service;

import static a_common.JDBCTemplate.close;
import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import org.apache.tomcat.jni.File;

import d_trade.model.dao.TradeDAO;
import d_trade.model.vo.Bid;
import d_trade.model.vo.Image;
import d_trade.model.vo.Trade;

public class TradeService {

	public int getListCount() {
		
		Connection conn = getConnection();

		int result = new TradeDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Trade> viewList1(int currentPage) {
		Connection conn = getConnection();
		
		ArrayList<Trade> list = null;
		
		TradeDAO tDAO = new TradeDAO();
		
	
		list = tDAO.viewTList1(conn, currentPage);

		
		return list;
	}
	
	public ArrayList<Image> viewList2() {
		Connection conn = getConnection();
		
		ArrayList<Image> list = null;
		
		TradeDAO tDAO = new TradeDAO();
		
		list = tDAO.viewIList2(conn);
		
		
		return list;
	}

	public int insertTrade(Trade g, Trade t, ArrayList<Image> fileList) {
		Connection conn = getConnection();
		
		TradeDAO dao = new TradeDAO();
		
		
		int result1 = dao.insertTrade1(conn, g);
		int result2 = dao.insertTrade2(conn, t);
		int result3 = dao.insertImage(conn, fileList);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
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

	public ArrayList<Image> selectImage(int pn) {
		Connection conn =getConnection();
		ArrayList<Image> list = new TradeDAO().selectImage(conn, pn);
		
		return list;
	}

	public Trade selectNick(int pn) {
		Connection conn = getConnection();
		TradeDAO dao = new TradeDAO();
		
		Trade trade = dao.selectNick(conn, pn);
		return trade;
	}

	public int updateThumbnail(Trade g, Trade t) {
		Connection conn = getConnection();
		
		TradeDAO dao = new TradeDAO();
		
		int result1 = dao.updateGBoard1(conn, g);
		int result2 = dao.updateGBoard2(conn, t);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updateThumbnail(Trade g, Trade t, ArrayList<Image> file) {
		Connection conn = getConnection();
		
		TradeDAO dao = new TradeDAO();
		
		int result1 = dao.updateGBoard1(conn, g);
		int result2 = dao.updateGBoard2(conn, t);
		int result3 = 0;
		
		if(file.get(0).getImgId() == 0) {
			result3 = dao.insertNewImage(conn, file);
		} else {
			result3 = dao.updateImage(conn, file);
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updateThumbnail(Trade g, Trade t, ArrayList<Image> changeFile, ArrayList<Image> newInsertFile) {
		Connection conn = getConnection();
		
		TradeDAO dao = new TradeDAO();
		
		int result1 = dao.updateGBoard1(conn, g);
		int result2 = dao.updateGBoard2(conn, t);
		int result3 = dao.updateImage(conn, changeFile);
		int result4 = dao.insertNewImage(conn, newInsertFile);
		
		if(result1 > 0 && result2 >0 && result3>0 && result4>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1;
	}

	public int delectTrade(int postNo) {
		Connection conn = getConnection();
		TradeDAO dao = new TradeDAO();
		
		int result = dao.deleteTrade(conn, postNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int insertBid(Bid b) {
		Connection conn = getConnection();
		TradeDAO dao = new TradeDAO();
		
		int result1 = dao.insertBid(conn, b);
		int result2 = 0;
		
		if(result1 > 0) {
			result2 = dao.updateBid(conn, b);
			if(result2 > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		return result2;
	}

	public int udatePoint(Trade td) {
		Connection conn = getConnection();
		TradeDAO dao = new TradeDAO();
		
		int result1 = dao.updatePoint1(conn, td);
		int result2 = dao.updatePoint2(conn, td);
		int result3 = dao.updatedlYn(conn, td);
		
		
		if(result1>0) {
			if(result2>0) {
				if(result3>0) {
					commit(conn);
				}else {
					rollback(conn);
				}
			}else {
				rollback(conn);
			}
		}else {
			rollback(conn);
		}
		return result3;
	}

	public int selectWinner(int postNo, int bPoint) {
		Connection conn = getConnection();
		TradeDAO dao = new TradeDAO();
		
		Trade sw = dao.selectWinner(conn, postNo);
		int result1 = 0;
		int result2 = 0;
		
		
		if(sw != null) {
			result1 = dao.updatePointWinner(conn, sw, bPoint);
			if(result1>0) {
				result2 = dao.updateBidYN(conn,postNo);
				if(result2 > 0) {
					commit(conn);
				}else {
					rollback(conn);
				}
			} else {
				rollback(conn);
			}
		}else {
			result2 = dao.updateBidYN(conn,postNo);
			if(result2>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		return result2;
	}

	

}

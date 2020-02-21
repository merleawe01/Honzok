package a_common;

import static a_common.JDBCTemplate.close;
import static a_common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import f_message.model.dao.MessageDAO;
import f_message.model.vo.Message;

public class SearchService {

	public int searchCount(String select, String keyword) {
		Connection conn = getConnection();
		int result = new SearchDAO().searchCount(conn, select, keyword);
		close(conn);
		return result;
	}
	
	public ArrayList<Message> searchList(int currentPage, String select, String keyword) {
		Connection conn = getConnection();
		ArrayList<Message> mlist = new SearchDAO().searchList(conn, currentPage, select, keyword);
		close(conn);
		return mlist;
	}

}

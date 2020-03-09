package f_message.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import f_message.model.dao.MessageDAO;
import f_message.model.vo.Message;

import static a_common.JDBCTemplate.*;

public class MessageService {

	public int getRListCount(String loginUserNickName) {
		Connection conn = getConnection();
		int result = new MessageDAO().getRListCount(conn, loginUserNickName);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Message> selectRList(int currentPage, String loginUserNickName) {
		Connection conn = getConnection();
		ArrayList<Message> list = new MessageDAO().selectRList(conn, currentPage, loginUserNickName);
		close(conn);
		
		return list;
	}
	
	public void welcomeMessage(String nickName) {
		Connection conn = getConnection();
		int result = new MessageDAO().welcomeMessage(conn, nickName);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
	}

	public int deleteMessage(String[] mNoList) {
		Connection conn = getConnection();
		int result = new MessageDAO().deleteMessage(conn, mNoList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public Message selectMessage(int mNo) {
		Connection conn = getConnection();
		MessageDAO dao = new MessageDAO();
		int result = dao.updateCount(conn, mNo);
		
		Message m = null;
		if(result > 0) {
			m = dao.selectMessage(conn, mNo);
			
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

	public int sendMessage(Message msg) {
		Connection conn = getConnection();
		int result = new MessageDAO().sendMessage(conn, msg);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int storeMessage(String[] mNoList) {
		Connection conn = getConnection();
		int result = new MessageDAO().storeMessage(conn, mNoList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int getSendListCount(String loginUserNickName) {
		Connection conn = getConnection();
		int result = new MessageDAO().getSendListCount(conn, loginUserNickName);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Message> selectSendList(int currentPage, String loginUserNickName) {
		Connection conn = getConnection();
		ArrayList<Message> mList = new MessageDAO().selectSendList(conn, currentPage, loginUserNickName);
		close(conn);
		
		return mList;
	}

	public int getStoreListCount(String loginUserNickName) {
		Connection conn = getConnection();
		int result = new MessageDAO().getStoreListCount(conn, loginUserNickName);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Message> selectStoreList(int currentPage, String loginUserNickName) {
		Connection conn = getConnection();
		ArrayList<Message> mList = new MessageDAO().selectStoreList(conn, currentPage, loginUserNickName);
		close(conn);
		
		return mList;
	}

	public int offMessage(String[] mNoList) {
		Connection conn = getConnection();
		int result = new MessageDAO().offMessage(conn, mNoList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	///////////////////////////////////////////
	
	// 검색 영역
	public int searchMsgCount(String select, String keyword, String loginUserNickName) {
		Connection conn = getConnection();
		int result = new MessageDAO().searchMsgCount(conn, select, keyword, loginUserNickName);
		close(conn);
		return result;
	}
	
	public ArrayList<Message> searchMsgList(int currentPage, String select, String keyword, String loginUserNickName) {
		Connection conn = getConnection();
		ArrayList<Message> mlist = new MessageDAO().searchMsgList(conn, currentPage, select, keyword, loginUserNickName);
		close(conn);
		return mlist;
	}

	public int searchMsgCount2(String select, String keyword, String loginUserNickName) {
		Connection conn = getConnection();
		int result = new MessageDAO().searchMsgCount2(conn, select, keyword, loginUserNickName);
		close(conn);
		return result;
	}

	public ArrayList<Message> searchMsgList2(int currentPage, String select, String keyword, String loginUserNickName) {
		Connection conn = getConnection();
		ArrayList<Message> mlist = new MessageDAO().searchMsgList2(conn, currentPage, select, keyword, loginUserNickName);
		close(conn);
		return mlist;
	}


}

package f_message.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import f_message.model.dao.MessageDAO;
import f_message.model.vo.Message;

import static a_common.JDBCTemplate.*;

public class MessageService {

	public int getListCount() {
		Connection conn = getConnection();
		int result = new MessageDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Message> selectList(int currentPage, String loginUserNickName) {
		Connection conn = getConnection();
		ArrayList<Message> list = new MessageDAO().selectList(conn, currentPage, loginUserNickName);
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

}

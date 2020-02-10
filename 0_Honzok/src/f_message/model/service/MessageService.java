package f_message.model.service;

import java.sql.Connection;

import f_message.model.dao.MessageDAO;

import static a_common.JDBCTemplate.*;

public class MessageService {

	public int getListCount() {
		Connection conn = getConnection();
		int result = new MessageDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}

}

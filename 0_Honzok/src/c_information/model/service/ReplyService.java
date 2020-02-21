package c_information.model.service;

import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import c_information.model.dao.InformationDAO;
import c_information.model.vo.Reply;

public class ReplyService {

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		InformationDAO dao = new InformationDAO();
		
		int result = dao.insertReply(conn, r);
		
		ArrayList<Reply> list = null;
		if(result > 0) {
			commit(conn);
			list = dao.selectReplyList(conn, r.getPost_no());
		} else {
			rollback(conn);
		}
		return list;
	}

	public ArrayList<Reply> selectReplyList(int no) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new InformationDAO().selectReplyList(conn, no);
		
		return list;
	}

	public ArrayList<Reply> deleteReply(Reply r) {
		Connection conn = getConnection();
		InformationDAO dao = new InformationDAO();
		
		int result = dao.deleteReply(conn, r);
		
		ArrayList<Reply> list = null;
		if(result > 0) {
			commit(conn);
			list = dao.selectReplyList(conn, r.getPost_no());
		} else {
			rollback(conn);
		}
		return list;
	}
	
}

package g_board.model.service;

import static a_common.JDBCTemplate.close;
import static a_common.JDBCTemplate.commit;
import static a_common.JDBCTemplate.getConnection;
import static a_common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import g_board.model.dao.BoardDAO;
import g_board.model.vo.Board;
import g_board.model.vo.Reply;

public class BoardService {

	public int getListCount() {
		
		Connection conn = getConnection();

		int result = new BoardDAO().getListCount(conn);
		close(conn);
		return result;
	}

	public ArrayList<Board> viewList(int currentPage) {
		Connection conn = getConnection();
		
		ArrayList<Board> List = null;
		
		BoardDAO dDAO = new BoardDAO();
		
	
		List = dDAO.viewList(conn, currentPage);

		
		return List;
	}
	public int insertBoard(Board board) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();
		
		int result1 = dao.insertBoard(conn, board);
		int result2 = dao.addPoint(conn, board.getWriter());
	
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1;
	}

	public int updateBoard(Board board) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();
		
		int result = dao.updateBoard(conn, board);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
		
		
		
	

	public Board selectBoard(int postNo) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();
		
		int result = dao.updateCount(conn, postNo);
		
		Board board = null;
		if(result > 0) {
			board = dao.selectBoard(conn, postNo);
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

	public ArrayList<Reply> insertReply(Reply r) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();
		
		int result = dao.insertReply(conn, r);
		int result2 = dao.addPoint2(conn, r.getWriter());
		
		ArrayList<Reply> list = null;
		if(result > 0) {
			commit(conn);
			list = dao.selectReplyList(conn, r.getPost_no());
		} else {
			rollback(conn);
		}
		return list;
	}

	public ArrayList<Reply> selectReplyList(int postNo) {
		Connection conn = getConnection();
		ArrayList<Reply> list = new BoardDAO().selectReplyList(conn, postNo);
		
		return list;
	}

	public ArrayList<Reply> deleteReply(Reply r) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();
		
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
	



	public int delectBoard(int postNo) {
		Connection conn = getConnection();
		BoardDAO dao = new BoardDAO();
		
		int result = dao.deleteBoard(conn, postNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	

}

package g_board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g_board.model.vo.Reply;
import g_board.model.service.BoardService;
import g_board.model.vo.Board;

/**
 * Servlet implementation class detailview_servlet
 */
@WebServlet("/detail.bo")
public class DetailviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		Board board = new BoardService().selectBoard(postNo);
		ArrayList<Reply> replyList = new BoardService().selectReplyList(postNo);
		 
		String page =null;
		if(board != null ) {
			request.setAttribute("board", board);
			request.setAttribute("replyList", replyList);
			page = "views/g_board/boardDetailview.jsp";
		}else {
			request.setAttribute("msg", "게시글 상세보기에 실패하였습니다."	);
			page = "views/a_common/errorPage.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

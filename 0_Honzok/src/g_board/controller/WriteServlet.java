package g_board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.vo.Member;
import g_board.model.service.BoardService;
import g_board.model.vo.Board;

/**
 * Servlet implementation class write_servlet
 */
@WebServlet("/insert.bo")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
			String postTitle = request.getParameter("postTitle");
			String content = request.getParameter("content");
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			Board board = new Board();
			board.setPostTitle(postTitle);
			board.setContent(content);
			board.setWriter(writer);
			int result = new BoardService().insertBoard(board);
			
			if(result > 0) {
				response.sendRedirect("list.bo");
			} else {
				RequestDispatcher view = request.getRequestDispatcher("views/a_common/errorPage.jsp");
				request.setAttribute("msg", "게시판 등록에 실패하였습니다.");
				view.forward(request, response);
			
			}
		
		}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

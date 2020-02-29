package g_board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import g_board.model.service.BoardService;
import g_board.model.vo.Board;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update.bo")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");


		int postNo = Integer.parseInt(request.getParameter("postNo"));

		String postTitle = request.getParameter("post_Title");
		String content = request.getParameter("content");	
		String writeDate = request.getParameter("writeDate");
		
		

		Board b = new Board();
		b.setPostNo(postNo);
		b.setPostTitle(postTitle);
		b.setWriteDate(writeDate);
		b.setContent(content);

		int result = new BoardService().updateBoard(b);

		String page = null;
		if(result > 0) {
			page = "/detail.bo?postNo=" + postNo;
		} else {
			page = "views/a_common/errorPage.jsp";
			request.setAttribute("msg", "업데이트에 실패하였습니다.");
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

package c_information.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.vo.Member;
import c_information.model.service.FBoardService;
import c_information.model.vo.FoodBoard;


/**
 * Servlet implementation class FoodInsert
 */
@WebServlet("/insert.food")
public class FoodInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		int star = Integer.parseInt(request.getParameter("star"));
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		String rc_food = request.getParameter("rc_food");
		double area_x = Double.parseDouble(request.getParameter("area_x"));
		double area_y = Double.parseDouble(request.getParameter("area_y"));
		String address = request.getParameter("address");
		String local_name = request.getParameter("local_name");
		
		String writer = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
		
		FoodBoard board = new FoodBoard(title, writer, content, category, local_name, address, star, rc_food, area_x, area_y);
		
		int result = new FBoardService().insertFBoard(board);
		
		
		
		/*String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		Board board = new Board();
		board.setbTitle(title);
		board.setbContent(content);
		board.setbWriter(userId);
		
		int result = new BoardService().insertBoard(board, category);
		
		if(result > 0) {
			response.sendRedirect("list.bo");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			request.setAttribute("msg", "게시판 등록에 실패하였습니다.");
			view.forward(request, response);
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

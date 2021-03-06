package c_information.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.vo.Member;
import c_information.model.service.FBoardService;
import c_information.model.vo.FoodBoard;

/**
 * Servlet implementation class FoodDelete
 */
@WebServlet("/delete.food")
public class FoodDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Member user = ((Member)request.getSession().getAttribute("loginUser"));
		
		int no = Integer.parseInt(request.getParameter("no"));
		String writer = request.getParameter("writer");
		
		int result = new FBoardService().deleteFBoard(no, writer);
		
		if(result > 0) {
			if(!user.getUserId().equals("admin")) {
				user.setPoint(user.getPoint()-300);
			} 
			response.sendRedirect("list.food");
		} else {
			request.setAttribute("msg", "게시글 삭제에 실패하였습니다.");
			request.getRequestDispatcher("views/a_common/errorPage.jsp").forward(request, response);
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

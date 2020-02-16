package c_information.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import c_information.model.service.FBoardService;
import c_information.model.vo.FoodBoard;

/**
 * Servlet implementation class FoodList
 */
@WebServlet("/list.food")
public class FoodList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String area = (request.getParameter("area") == null) ? "서울" : request.getParameter("area");
		String category = (request.getParameter("category") == null) ? "한식, 분식, 일식, 중식, 양식, 야식, 술집, 패스트푸드" : request.getParameter("category");
		String[] cateArr = category.split(", ");
		
		ArrayList<FoodBoard> list = new FBoardService().listFBoard(area, cateArr);
		
		String page = "views/c_information/foodList.jsp";
		request.setAttribute("area", area);
		request.setAttribute("cateArr", cateArr);
		request.setAttribute("list", list);
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

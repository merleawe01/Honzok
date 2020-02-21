package d_trade.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import d_trade.model.service.TradeService;
import d_trade.model.vo.Image;
import d_trade.model.vo.PageInfo;
import d_trade.model.vo.Trade;

/**
 * Servlet implementation class list_servlet
 */
@WebServlet("/list.gy")
public class list_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public list_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		TradeService service = new TradeService();
		
		ArrayList<Trade> tList = service.viewList(1);
		ArrayList<Image> iList = service.viewList(2);
		
		
		int listCount = service.getListCount();
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 5;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		
		ArrayList<Trade> list = service.selectList(currentPage);
		
		
		String page = null;
		if(tList != null && iList !=null && list != null) {
			request.setAttribute("tList", tList);
			request.setAttribute("iList", iList);
			page = "views/d_trade/gyul_board.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			request.setAttribute("msg", "조회에 실패하였습니다.");
			page = "views/a_common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
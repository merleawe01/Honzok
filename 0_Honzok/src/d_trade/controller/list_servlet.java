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
		TradeService service = new TradeService();
		
		ArrayList<Trade> tList = service.viewList(1);
		ArrayList<Image> iList = service.viewList(2);
		
		String page = null;
		if(tList != null && iList !=null) {
			request.setAttribute("tList", tList);
			request.setAttribute("iList", iList);
			page = "views/d_trade/gyul_board.jsp";
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

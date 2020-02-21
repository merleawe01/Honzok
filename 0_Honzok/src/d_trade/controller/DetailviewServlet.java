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
 * Servlet implementation class detailview_servlet
 */
@WebServlet("/detail.gy")
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
		int pn = Integer.parseInt(request.getParameter("postNo"));
		
		TradeService service = new TradeService();
		
		Trade trade = service.selectTrade(pn);
		ArrayList<Image> fileList = service.selectImage(pn);
		
		String page =null;
		if(trade != null && fileList != null) {
			request.setAttribute("trade", trade);
			request.setAttribute("fileList", fileList);
			page = "views/d_trade/gyulDetailview.jsp";
		}else {
			request.setAttribute("msg", "게시글 상세보기에 실패하였습니다."	);
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

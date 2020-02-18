package e_market.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import e_market.model.vo.Attachment;
import e_market.model.service.MarketService;
import e_market.model.vo.Market;

/**
 * Servlet implementation class MarketDetailServlet
 */
@WebServlet("/detail.m")
public class MarketDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("postno"));
		
		MarketService service = new MarketService();
		
		Market market = service.selectBoard(postNo);
		ArrayList<Attachment> fileList = service.selectImage(postNo);
		
		String page = null;
		if(market != null && fileList != null) {
			request.setAttribute("market", market);
			request.setAttribute("fileList", fileList);
			page = "views/e_market/marketDetail.jsp";
		} else {
			request.setAttribute("msg", "사진 게시판 상세보기에 실패하였습니다.");
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

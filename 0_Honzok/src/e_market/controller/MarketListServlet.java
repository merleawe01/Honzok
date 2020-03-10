package e_market.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import a_common.PageInfo;
import e_market.model.service.MarketService;
import e_market.model.vo.Attachment;
import e_market.model.vo.Market;

/**
 * Servlet implementation class MarketListServlet
 */
@WebServlet("/list.m")
public class MarketListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MarketService service = new MarketService(); 
		
		int listCount = service.getListCount(); // 게시판 리스트 개수 전체 게시글 개수
		
		int currentPage; // 현제 페이지 표시
		int limit;		 // 한 페이지에 표시될 페이징 수
		int maxPage;	 // 전체 페이지 중 가장 마지막 페이지
		int startPage;   // 페이징 된 페이지 중 시작 페이지
		int endPage; 	 // 페이징 된 페이지 중 마지막 페이지
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 5;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Market> mList = service.selectMList(currentPage); // 보드에 관련된
		ArrayList<Attachment> fList = service.selectFList(); // 사진에 관련된
		
		String page = null;
		if(mList != null && fList != null) {
			request.setAttribute("mList", mList);
			request.setAttribute("fList", fList);
			request.setAttribute("pi", pi); 
			page = "views/e_market/marketList.jsp";
		} else {
			page = "views/a_common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
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

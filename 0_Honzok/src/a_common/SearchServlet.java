package a_common;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import f_message.model.service.MessageService;
import f_message.model.vo.Message;
import f_message.model.vo.PageInfo;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search.word")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String select = request.getParameter("searchSelect");
		String keyword = request.getParameter("word");
		
		SearchService service = new SearchService();
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		// 요청이 들어오면 currentPage --> 페이지 전환 시 전달 받은 페이지로 currentPage 적용	
		
		
		int listCount = service.searchCount(select, keyword);
		ArrayList<Message> mList =service.searchList(currentPage, select, keyword);
		
		
		limit = 5;
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// vo에 PageInfo class 만들어주기
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);	
		
		String page = null;
		
		if(mList != null) {
			page = "views/f_message/SearchListView.jsp";
			request.setAttribute("list", mList);
			request.setAttribute("pi", pi);
		} else {
			page = "views/a_common/error.jsp";
			request.setAttribute("msg", "쪽지함을 볼 수 없습니다.");
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

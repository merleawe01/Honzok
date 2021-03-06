package f_message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import a_common.PageInfo;
import b_member.model.vo.Member;
import f_message.model.service.MessageService;
import f_message.model.vo.Message;

/**
 * Servlet implementation class SendSearchServlet
 */
@WebServlet("/search.se")
public class SendSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String loginUserNickName = ((Member)session.getAttribute("loginUser")).getNickName();

		
		String select = request.getParameter("searchSelect");
		System.out.println(select);
		String keyword = request.getParameter("word");
		
		MessageService service = new MessageService();
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = service.searchMsgCount2(select, keyword, loginUserNickName);
		ArrayList<Message> mList =service.searchMsgList2(currentPage, select, keyword, loginUserNickName);
		
		limit = 5;
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);	
		
		String page = null;
		
		if(mList != null) {
			page = "views/f_message/SearchSendListView.jsp";
			request.setAttribute("list", mList);
			request.setAttribute("pi", pi);
			request.setAttribute("loginUser", loginUserNickName);
			request.setAttribute("select", select);
			request.setAttribute("keyword", keyword);
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
		doGet(request, response);
	}

}

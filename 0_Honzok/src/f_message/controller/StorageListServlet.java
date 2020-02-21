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

import b_member.model.vo.Member;
import f_message.model.service.MessageService;
import f_message.model.vo.Message;
import f_message.model.vo.PageInfo;

/**
 * Servlet implementation class StorageListServlet
 */
@WebServlet("/list.box")
public class StorageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StorageListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String loginUserNickName = ((Member)session.getAttribute("loginUser")).getNickName();
		MessageService service = new MessageService();
		
		int listCount = service.getStoreListCount(loginUserNickName);
		
		//현재 페이지 표시
		int currentPage;
		int limit; // 한 페이지에 표시될 페이징 수
		int maxPage; // 전체 페이지 중 가장 마지막 페이지
		int startPage; // 페이징 된 페이지 중 시작 페이지
		int endPage; // 페이징 된 페이지 중 마지막 페이지
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		// 요청이 들어오면 currentPage --> 페이지 전환 시 전달 받은 페이지로 currentPage 적용
		
		limit = 5;
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = (((int)((double)currentPage/limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// vo에 PageInfo class 만들어주기
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		// vo에 Message class 만들어 준 뒤에 service에 selectLsit 메소드 만들어주기
		ArrayList<Message> mlist = service.selectStoreList(currentPage, loginUserNickName);
				
		String page = null;
		
		if(mlist != null) {
			page = "views/f_message/storeMessageView.jsp";
			request.setAttribute("list", mlist);
			request.setAttribute("pi", pi);
		} else {
			page = "views/a_common/error.jsp";
			request.setAttribute("msg", "쪽지 보관함을 볼 수 없습니다.");
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

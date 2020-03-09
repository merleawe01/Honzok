package d_trade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.vo.Member;
import d_trade.model.service.TradeService;
import d_trade.model.vo.Trade;

/**
 * Servlet implementation class UpdatePointServlet
 */
@WebServlet("/update.point")
public class UpdatePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo = Integer.parseInt(request.getParameter("pno"));
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String nickName = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
		int maxPoint = Integer.parseInt(request.getParameter("point"));
		int point = ((Member)request.getSession().getAttribute("loginUser")).getPoint();
		String writerId = request.getParameter("writer");
		String postTitle = request.getParameter("postTitle");
		
		
		Trade td = new Trade();
		td.setPostNo(postNo);
		td.setUserId(userId);
		td.setMaxPoint(maxPoint);
		td.setPoint(point);
		td.setWriter(writerId);
		td.setNickname(nickName);
		td.setPostTitle(postTitle);
		
		int result = new TradeService().udatePoint(td);
		
		String page =null;
		if(result>0) {
			page = "detail.gy?postNo="+td.getPostNo();
		}else {
			request.setAttribute("msg", "포인트결제에 실패하였습니다."	);
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

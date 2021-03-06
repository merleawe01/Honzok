package d_trade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.vo.Member;
import d_trade.model.service.TradeService;

/**
 * Servlet implementation class AuctionUpdatePointServlet
 */
@WebServlet("/ac.point")
public class AuctionUpdatePointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuctionUpdatePointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member user = ((Member)request.getSession().getAttribute("loginUser"));
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		int bPoint = Integer.parseInt(request.getParameter("point"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("titel");
		
		TradeService service = new TradeService();
		int result = service.selectWinner(postNo,bPoint,writer,title);
		
		String page = "";
		
		if(result>0) {
			user.setPoint(user.getPoint() - bPoint);
			page = "detail.gy?postNo="+postNo;
		}else {
			request.setAttribute("msg", "입찰과정에 오류가 발생하였습니다."	);
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

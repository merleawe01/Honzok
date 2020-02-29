package d_trade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.vo.Member;
import d_trade.model.service.TradeService;
import d_trade.model.vo.Bid;

/**
 * Servlet implementation class BidServlet
 */
@WebServlet("/bid.gy")
public class BidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BidServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int pno = Integer.parseInt(request.getParameter("pno").trim());
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String nickName = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
		String phone = request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		int postalCode = Integer.parseInt(request.getParameter("postalCode"));
		String bAddr = request.getParameter("bAddr");
		String lAddr = request.getParameter("lAddr");
		int bpoint = Integer.parseInt(request.getParameter("point"));
		int point = ((Member)request.getSession().getAttribute("loginUser")).getPoint();
		
		Bid b = new Bid();
		b.setPostNo(pno);
		b.setUserId(userId);
		b.setNickName(nickName);
		b.setPhone(phone);
		b.setEmail(email);
		b.setPostalCode(postalCode);
		b.setbAddr(bAddr);
		b.setlAddr(lAddr);
		b.setBpoint(bpoint);
		
		TradeService service = new TradeService();
		int result = service.insertBid(b);
		
		String page = "";
		if(result > 0) {
			page = "detail.gy?postNo="+b.getPostNo();
		}else {
			page = "views/a_common/errorPage.jsp";
			request.setAttribute("msg", "입찰신청에 실패했습니다");
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

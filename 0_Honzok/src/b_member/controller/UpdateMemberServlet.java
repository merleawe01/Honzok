package b_member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.service.MemberService;
import b_member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("joinUserId");
		String userName = request.getParameter("userName");
		String nickName = request.getParameter("nickName");
		int postalCode = Integer.parseInt(request.getParameter("postalCode"));
		String bAddr = request.getParameter("bAddr");
		String lAddr = request.getParameter("lAddr");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int point = Integer.parseInt(request.getParameter("point"));
		
		
		
		Member member = new Member(userId,null, userName, nickName, postalCode, bAddr, lAddr, phone, email, point);
		int result = new MemberService().updateMember(member);
		
		String page = null;
		if(result >0) {
			page="/myPage.me";
			request.setAttribute("msg", "회원수정에 성공");
		}else {
			page = "views/a_common/errorPage.jsp";
			request.setAttribute("msg", "회원수정에 실패");
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

package b_member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/insert.me")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("joinUserId");
		String userPwd = request.getParameter("joinUserPwd");
		String userName = request.getParameter("userName");
		String nickName = request.getParameter("nickName");
		int postalCode = Integer.parseInt(request.getParameter("postalCode"));
		String bAddr = request.getParameter("bAddr");
		String lAddr = request.getParameter("lAddr");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
	
		
		
		Member member = new Member(userId, userPwd, userName, nickName, postalCode, bAddr, lAddr, phone, email);
		int result = new b_member.model.service.MemberService().insertMember(member);
		
		String page = "";
		if(result > 0) {
			page = "index.jsp";
			request.setAttribute("msg", "회원가입에 성공하였습니다.");
		} else {
			page = "views/a_common/errorPage.jsp";
			request.setAttribute("msg", "회원가입에 실패하였습니다.");
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

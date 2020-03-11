package b_member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import b_member.model.vo.Member;
import b_member.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member member = new Member(userId, userPwd);
		
		String page = request.getParameter("page") == "" ? "index.jsp" : request.getParameter("page");
		
		Member loginUser = new MemberService().loginMember(member);
		
		response.setContentType("text/html; charset=UTF-8");
		
		if(loginUser != null) { 
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(1800); // 10분(60 * 10) 기본은 30분 시간 지정 방법 
			session.setAttribute("loginUser", loginUser);
			
			response.sendRedirect(page);
		
		} else { // 로그인 실패 시 
			request.setAttribute("msg", "회원 정보가 없습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/b_member/login.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

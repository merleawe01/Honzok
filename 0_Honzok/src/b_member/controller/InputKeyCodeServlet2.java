package b_member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.service.MemberService;
import b_member.model.vo.Member;

/**
 * Servlet implementation class InputKeyCodeServlet
 */
@WebServlet("/input.kc2")
public class InputKeyCodeServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputKeyCodeServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("name");
		String email = request.getParameter("email");
		String keyCode = request.getParameter("keyCode");
		String userId = request.getParameter("userId");
		
		Member m = new MemberService().getMember(userName, email);
		int result = new MemberService().confirmKeyCode(userName, email, keyCode);
		
		String page = null;
		if(result > 0) {
				page = "views/b_member/find_Pwd3.jsp";
			request.setAttribute("msg", "본인인증이 완료되었습니다.");
			request.setAttribute("member", m);
		} else {
			page = "views/b_member/inputKeyCode.jsp";
			request.setAttribute("msg", "인증에 실패했습니다.");
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

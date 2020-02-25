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
 * Servlet implementation class NewPwdUpdateServlet
 */
@WebServlet("/updatePwd.new")
public class NewPwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String newPwd = request.getParameter("pwd1").trim();
		String userId = request.getParameter("id");
		
		System.out.println(userId);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", userId);
		map.put("new", newPwd);
		
		int result = new MemberService().updatePwdNew(map);
		
		String page = null;
		if(result > 0) {
			page = "views/b_member/login.jsp";
			request.setAttribute("msg", "비밀번호를 변경하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher(page);
        	view.forward(request, response);
		} else {
			request.setAttribute("msg", "비밀번호 수정에 실패하였습니다.");
			request.getRequestDispatcher("views/a_common/errorPage.jsp").forward(request, response);
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

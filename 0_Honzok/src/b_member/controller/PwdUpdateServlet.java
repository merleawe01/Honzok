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
 * Servlet implementation class PwdUpdateServlet
 */
@WebServlet("/updatePwd.me")
public class PwdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", userId);
		map.put("old", userPwd);
		map.put("new", newPwd);
		
		int result = new MemberService().updatePwd(map);
		
		String page = null;
		if(result > 0) {
			page="/myPage.me";
			request.setAttribute("msg", "비밀번호 수정에 성공하였습니다");
		}else {
			page = "views/a_common/errorPage.jsp";
			request.setAttribute("msg", "비밀번호 수정에 실패하였습니다");
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

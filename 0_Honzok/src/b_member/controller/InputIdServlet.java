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
 * Servlet implementation class InputIdServlet
 */
@WebServlet("/input.id")
public class InputIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InputIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		Member m = new MemberService().selectMember(id);
		
		String page = null;
		if(m != null) {
			page = "views/b_member/find_Pwd2.jsp";
			request.setAttribute("m", m);
			request.setAttribute("id", id);
		} else {
			page = "views/b_member/find_Pwd1.jsp";
			request.setAttribute("msg", "해당 회원이 존재하지 않습니다.");
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

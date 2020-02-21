package f_message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import b_member.model.vo.Member;
import f_message.model.service.MessageService;
import f_message.model.vo.Message;

/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/send.msg")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String title = request.getParameter("mtitle");
		String to = request.getParameter("mto");
		String from = ((Member)session.getAttribute("loginUser")).getNickName();
		String content = request.getParameter("mcontent");
				
		Message msg = new Message(to, from, title, content);
		int result = new MessageService().sendMessage(msg);
		
		if(result > 0) {
			response.sendRedirect("list.re");
		} else {
			request.setAttribute("msg", "쪽지를 보낼 수 없습니다.");
			RequestDispatcher view = request.getRequestDispatcher("views/a_common/errorPage.jsp");
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

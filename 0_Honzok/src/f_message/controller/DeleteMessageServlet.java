package f_message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import b_member.model.vo.Member;
import f_message.model.service.MessageService;
import f_message.model.vo.Message;
import f_message.model.vo.PageInfo;

/**
 * Servlet implementation class DeleteMessageServlet
 */
@WebServlet("/delete.re")
public class DeleteMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageService service = new MessageService();
		
		String mNo = request.getParameter("mNo");//1, 2, 3
		String[] mNoList = mNo.split(",");
		
		int result = service.deleteMessage(mNoList);
		
		String page = null;
		
		if(result > 0) {
			page = "/list.re";
			request.setAttribute("msg", "선택한 쪽지를 삭제했습니다.");
			
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "쪽지 삭제에 실패했습니다.");
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

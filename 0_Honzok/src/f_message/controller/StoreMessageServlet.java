package f_message.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import f_message.model.service.MessageService;

/**
 * Servlet implementation class StoreMessageServlet
 */
@WebServlet("/store.msg")
public class StoreMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mNo = request.getParameter("mNo");
		String[] mNoList = mNo.split(",");
		
		int result = new MessageService().storeMessage(mNoList);
		
		String page = null;
		if(result > 0) {
			request.setAttribute("msg", "선택한 쪽지가 성공적으로 보관되었습니다.");
			page = "list.box";
		} else {
			page = "views/a_common/errorPage.jsp";
			request.setAttribute("msg", "쪽지 보관에 실패했습니다.");
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

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
		String mNo = request.getParameter("mNo");//1, 2, 3
		System.out.println(mNo);
		String[] mNoList = mNo.split("");
		
		for(int i=0; i<mNoList.length; i++) {
			System.out.println(mNoList[i]);
		}
		
		int result = new MessageService().deleteMessage(mNoList);
		
		String page = null;
		
		if(result>0) {
			page = "/list.re";
			request.setAttribute("msg", "쪽지를 삭제했습니다.");
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

package c_information.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import c_information.model.service.ReplyService;
import c_information.model.vo.Reply;

/**
 * Servlet implementation class ReplyUpdate
 */
@WebServlet("/update.reply")
public class ReplyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		String content = request.getParameter("content");
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		Reply r = new Reply();
		r.setCno(cno);
		r.setContent(content);
		r.setPost_no(bid);
		
		ArrayList<Reply> list = new ReplyService().updateReply(r);
		
		response.setContentType("application/json; charset=UTF-8");
//		new Gson().toJson(list, response.getWriter());
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

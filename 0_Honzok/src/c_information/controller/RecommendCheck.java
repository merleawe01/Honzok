package c_information.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import c_information.model.service.RecommendService;

/**
 * Servlet implementation class RecommendCheck
 */
@WebServlet("/check.recommend")
public class RecommendCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String recCheck = request.getParameter("recCheck");
		String writer = request.getParameter("writer");
		int bid = Integer.parseInt(request.getParameter("bid"));
		
		String[] strArr = new String[2];
		
		if(recCheck.equals("Y")) {
			// 받아올 데이터는 YN 이랑 현재 추천수
			int check = new RecommendService().cancleRec(bid, writer);
			strArr[0] = "N";
			strArr[1] = Integer.toString(check);
		} else {
			int check = new RecommendService().okRec(bid, writer);
			strArr[0] = "Y";
			strArr[1] = Integer.toString(check);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(strArr, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

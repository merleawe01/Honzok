package c_information.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import c_information.model.service.FBoardService;
import c_information.model.service.TBoardService;
import c_information.model.vo.Image;
import c_information.model.vo.TravelBoard;

/**
 * Servlet implementation class TravelDetail
 */
@WebServlet("/detail.travel")
public class TravelDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		TravelBoard board = new TBoardService().selectBoard(no);
		ArrayList<Image> imgList = new TBoardService().selectImage(no);
		
//		ArrayList<Reply> list = new BoardService().selectReplyList(bId);
		
		String page = null;
		if(board != null) {
			page = "views/c_information/travelDetail.jsp";
			request.setAttribute("board", board);
			request.setAttribute("imgList", imgList);
//			request.setAttribute("list", list);
		} else {
			page = "views/a_common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기에 실패하였습니다.");
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

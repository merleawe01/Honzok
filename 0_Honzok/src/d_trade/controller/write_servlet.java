package d_trade.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import b_member.model.vo.Member;
import d_trade.model.service.TradeService;
import d_trade.model.vo.Trade;

/**
 * Servlet implementation class write_servlet
 */
@WebServlet("/insert.gy")
public class write_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public write_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			
			
			String gtitle = request.getParameter("gtitle");
			String gwriter = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
			String gcontent = request.getParameter("gcontent");
			
			Trade g = new Trade();
			g.setPostTitle(gtitle);
			g.setWriter(gwriter);
			g.setContent(gcontent);
			
			int start = Integer.parseInt(request.getParameter("gstart"));
			int buy = Integer.parseInt(request.getParameter("gbuy"));
			int current = Integer.parseInt(request.getParameter(null)); /* 현재 입찰가격 귤  코드로 바꿔야 함*/
			String bwriter = request.getParameter(null); /* 당첨자 코드 바꿔야 함 */
			
			
			Trade t = new Trade();
			t.setMinPoint(start);
			t.setMaxPoint(buy);
			t.setPoint(current);
			t.setNickname(bwriter);
			
			int result = new TradeService().insertTrade(g,t);
			
			if(result > 0) {
				response.sendRedirect("list.gy");
			} else {
				
				
				
				
				
				request.setAttribute("msg", "게시글 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/a_common/errorPage,jsp");
			}
			
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

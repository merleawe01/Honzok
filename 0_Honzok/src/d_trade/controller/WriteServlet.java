package d_trade.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import a_common.MyFileRenamePolicy;
import b_member.model.vo.Member;
import d_trade.model.service.TradeService;
import d_trade.model.vo.Image;
import d_trade.model.vo.Trade;

/**
 * Servlet implementation class write_servlet
 */
@WebServlet("/insert.gy")
public class WriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteServlet() {
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
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "thumbnail_uploadFiles/";
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multipartRequest.getFilesystemName(name) != null	) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}
			
			
			String gtitle = multipartRequest.getParameter("gtitle");
			String gwriter = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			String gcontent = multipartRequest.getParameter("gcontent");
			
			Trade g = new Trade();
			g.setPostTitle(gtitle);
			g.setWriter(gwriter);
			g.setContent(gcontent);
			
			int start = Integer.parseInt(multipartRequest.getParameter("gstart"));
			int buy = Integer.parseInt(multipartRequest.getParameter("gbuy"));
			int current = Integer.parseInt(multipartRequest.getParameter("gstart")); /* 현재 입찰가격 귤  코드로 바꿔야 함*/
			String bwriter = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
			
			
			Trade t = new Trade();
			t.setMinPoint(start);
			t.setMaxPoint(buy);
			t.setPoint(current);
			t.setNickname(bwriter);
			
			ArrayList<Image> fileList = new ArrayList<Image>();
			for(int i = originFiles.size() -1; i >=0; i--) {
				Image ig = new Image();
				ig.setImgSrc(savePath);
				ig.setOriginName(originFiles.get(i));
				ig.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					ig.setFileLevel(0);
				}else {
					ig.setFileLevel(1);
				}
				
				fileList.add(ig);
			}
			
			int result = new TradeService().insertTrade(g,t, fileList);
			
			if(result > 0) {
				response.sendRedirect("list.gy");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
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

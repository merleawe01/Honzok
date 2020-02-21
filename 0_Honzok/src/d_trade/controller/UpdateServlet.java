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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update.gy")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
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
			
			int pno = Integer.parseInt(multipartRequest.getParameter("post_no").trim());
			String title = multipartRequest.getParameter("title");
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			String content = multipartRequest.getParameter("gcontent");
			
			Trade g = new Trade();
			g.setPostNo(pno);
			g.setPostTitle(title);
			g.setWriter(writer);
			g.setContent(content);
			
			int start = Integer.parseInt(multipartRequest.getParameter("gstart"));
			int buy = Integer.parseInt(multipartRequest.getParameter("gbuy"));
			int current = Integer.parseInt(multipartRequest.getParameter("gstart")); /* 현재 입찰가격 귤  코드로 바꿔야 함*/
			String bwriter = ((Member)request.getSession().getAttribute("loginUser")).getNickName();
			
			
			Trade t = new Trade();
			t.setPostNo(pno);
			t.setMinPoint(start);
			t.setMaxPoint(buy);
			t.setPoint(current);
			t.setNickname(bwriter);
			
			ArrayList<Image> fileList = new ArrayList<Image>();
			for(int i = originFiles.size() -1; i >=0; i--) {
				Image ig = new Image();
				ig.setPostNo(pno);
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
			
			ArrayList<String> detailImgId = new ArrayList<String>();
			for(int i = 0; i < 2; i++) {
				detailImgId.add(multipartRequest.getParameter("detailImgId" + i));
			}
			
			ArrayList<String> changeImg = new ArrayList<String>();
			changeImg.add(multipartRequest.getParameter("cTitle"));
			changeImg.add(multipartRequest.getParameter("cContent1"));
			
			ArrayList<Image> changeFile = new ArrayList<Image>();
			ArrayList<Image> newInsertFile = new ArrayList<Image>();
			
			for(int h = 0; h < fileList.size();) {
				for(int i = 0; i < 2; i++) {
					if(!detailImgId.get(i).equals("") && changeImg.get(i).equals("data")) {
						fileList.get(h).setImgId(Integer.parseInt(detailImgId.get(i)));
						changeFile.add(fileList.get(h));
						h++;
					} else if(detailImgId.get(i).equals("") && changeImg.get(i).equals("data")) {
						newInsertFile.add(fileList.get(h));
						h++;
					}
				}
			}
			
			System.out.println(newInsertFile);
			
	
			int result = 0;
			
			if(changeFile.isEmpty() && newInsertFile.isEmpty()) {
				result = new TradeService().updateThumbnail(g, t);
			} else if(!changeFile.isEmpty() && newInsertFile.isEmpty()) {
				result = new TradeService().updateThumbnail(g, t, changeFile);
			} else if(changeFile.isEmpty() && !newInsertFile.isEmpty()) {
				result = new TradeService().updateThumbnail(g, t, newInsertFile);
			} else {
				result = new TradeService().updateThumbnail(g, t, changeFile, newInsertFile);
			}
			
			
			String page = "";
			if(result >0) {
				page = "detail.gy?postNo=" + g.getPostNo();
			}else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();					
				}
				
				page = "views/a_common/errorPage.jsp";
				request.setAttribute("msg", "업데이트에 실패하였습니다.");
			}
			request.getRequestDispatcher(page).forward(request, response);
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

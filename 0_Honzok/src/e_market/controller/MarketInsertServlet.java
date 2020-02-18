package e_market.controller;

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


import e_market.model.vo.Attachment;
import e_market.model.vo.Market;
import a_common.MyFileRenamePolicy;
import e_market.model.service.MarketService;
import b_member.model.vo.Member;

/**
 * Servlet implementation class MarketInsertServlet
 */
@WebServlet("/insert.m")
public class MarketInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketInsertServlet() {
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
			
			MultipartRequest multipartRequest 
			= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}
			
			String postTitle =multipartRequest.getParameter("postTitle");
			String content = multipartRequest.getParameter("incontent");
			String itemStatus = multipartRequest.getParameter("status");
			int itemPrice = Integer.parseInt(multipartRequest.getParameter("price"));
			String useDate =multipartRequest.getParameter("useDate");
			String etc = multipartRequest.getParameter("etc");
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			Market m = new Market(postTitle,content, itemStatus, itemPrice,useDate, etc, writer);
			/*m.setPostTitle(postTitle);
			m.setContent(content);
			m.setItemStatus(itemStatus);
			m.setItemPrice(itemPrice);
			m.setUseDate(useDate);
			m.setEtc(etc);
			m.setWriter(writer);*/
			
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i = originFiles.size() -1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setImgSrc(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					at.setFileLevel(0);
				} else {
					at.setFileLevel(1);
				}
				
				fileList.add(at);
			}
			
			int result = new MarketService().insertMarket(m, fileList);
			
			if(result > 0) {
				response.sendRedirect("list.m");
			} else {
				for(int i = 0; i < saveFiles.size(); i++) {
					File failedFile = new File(savePath + saveFiles.get(i));
					failedFile.delete();
				}
				
				request.setAttribute("msg", "사진 게시판 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/a_common/errorPage.jsp").forward(request, response);
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

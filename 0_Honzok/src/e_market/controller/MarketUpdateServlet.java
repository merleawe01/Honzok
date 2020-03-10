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

import a_common.MyFileRenamePolicy;
import b_member.model.vo.Member;
import e_market.model.service.MarketService;
import e_market.model.vo.Attachment;
import e_market.model.vo.Market;

/**
 * Servlet implementation class MarketUpdateServlet
 */
@WebServlet("/update.m")
public class MarketUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MarketUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			
			int postNo = Integer.parseInt(multipartRequest.getParameter("postNo"));
			String postTitle =multipartRequest.getParameter("postTitle");
			String content = multipartRequest.getParameter("incontent");
			String itemStatus = multipartRequest.getParameter("status");
			int itemPrice = Integer.parseInt(multipartRequest.getParameter("price"));
			String useDate =multipartRequest.getParameter("useDate");
			String etc = multipartRequest.getParameter("etc");
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			Market m = new Market(postNo, postTitle, content, itemStatus, itemPrice, useDate, etc, writer);
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i = originFiles.size() -1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setPostNo(postNo);
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
			
			ArrayList<String> detailImgId = new ArrayList<String>();
			for(int i = 0; i < 2; i++) {
				detailImgId.add(multipartRequest.getParameter("detailImgId" + i));
			}
			
			ArrayList<String> changeImg = new ArrayList<String>();
			changeImg.add(multipartRequest.getParameter("cTitle"));
			changeImg.add(multipartRequest.getParameter("cContent1" ));
			

			
			ArrayList<Attachment> changeFile = new ArrayList<Attachment>();
			ArrayList<Attachment> newInsertFile = new ArrayList<Attachment>();
			
			for(int h = 0; h < fileList.size();) {
				for(int i = 0; i < 2; i++) {
					if(!detailImgId.get(i).equals("") && changeImg.get(i).equals("data")) { // 바꾼 파일
						fileList.get(h).setImgId(Integer.parseInt(detailImgId.get(i)));
						changeFile.add(fileList.get(h));
						h++;
					} else if(detailImgId.get(i).equals("") && changeImg.get(i).equals("data")) { // 새로 넣은 파일
						newInsertFile.add(fileList.get(h));
						h++;
					}
				}
			}
			
			
			
			int result = 0;
			
			if(changeFile.isEmpty() && newInsertFile.isEmpty()) {
				result = new MarketService().updateThumbnail(m);
			} else if(!changeFile.isEmpty() && newInsertFile.isEmpty()) {
				result = new MarketService().updateThumbnail(m, changeFile);
			} else if(changeFile.isEmpty() && !newInsertFile.isEmpty()) {
				result = new MarketService().updateThumbnail(m, newInsertFile);
			} else {
				result = new MarketService().updateThumbnail(m, changeFile, newInsertFile);
			}
			
			String page = "";
			if(result > 0) {
				page = "detail.m?postNo=" + m.getPostNo();
			} else {
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

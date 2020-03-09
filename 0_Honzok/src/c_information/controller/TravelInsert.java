package c_information.controller;

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
import c_information.model.service.TBoardService;
import c_information.model.vo.Image;
import c_information.model.vo.TravelBoard;

/**
 * Servlet implementation class TravelInsert
 */
@WebServlet("/insert.travel")
public class TravelInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) { // enctype이 multipart/form-data로 전송되었는지 확인
			int maxSize = 1024 * 1024 * 10; // 10Mbyte : 전송파일 용량 제한
			String root = request.getSession().getServletContext().getRealPath("/"); // 웹 서버 컨테이너 경로 추출
			String savePath = root + "images/travel_board/";
			
			MultipartRequest multipartRequest 
				= new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();		// 바뀐 파일의 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>();	// 원본 파일의 이름을 저장할 ArrayList
			
			Enumeration<String> files = multipartRequest.getFileNames();
			// 폼에서 전송된 파일들의 이름 반환
			while(files.hasMoreElements()) {
				String name = files.nextElement(); // 전송 순서의 역순으로 파일을 가져옴
				
				if(multipartRequest.getFilesystemName(name) != null) {
					// getFilesystemName(name) : MyFileRenamePolicy의 rename메소드에서 작성한 대로 rename된 파일명
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));
				}
			}

			String title = multipartRequest.getParameter("title");
			int star = Integer.parseInt(multipartRequest.getParameter("star"));
			String content = multipartRequest.getParameter("content");
			String best_time = multipartRequest.getParameter("best_time");
			String caution = multipartRequest.getParameter("caution");
			double area_x = Double.parseDouble(multipartRequest.getParameter("area_x"));
			double area_y = Double.parseDouble(multipartRequest.getParameter("area_y"));
			String address = multipartRequest.getParameter("address");
			String local_name = multipartRequest.getParameter("local_name");
			
			String writer = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
			TravelBoard board = new TravelBoard(title, writer, content, best_time, caution, local_name, address, star, area_x, area_y);
			
			ArrayList<Image> fileList = new ArrayList<Image>();
			
			for(int i = 0; i < originFiles.size(); i++) {
				Image img = new Image(originFiles.get(i), saveFiles.get(i), savePath);
				
				img.setFileLevel(originFiles.size() - i - 1);
				
				fileList.add(img);
			}
			
			int result = new TBoardService().insertTBoard(board, fileList);
			
			if(result > 0) {
				response.sendRedirect("list.travel");
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

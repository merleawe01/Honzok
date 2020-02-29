package b_member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import b_member.model.service.MemberService;
import b_member.model.vo.Member;

/**
 * Servlet implementation class findIdServlet
 */
@WebServlet("/issue.kc")
public class IssueKeyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IssueKeyCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("name").trim(); 
		String email = request.getParameter("email").trim(); 
		
		Member m = new MemberService().getMember(userName, email);
		
		String page = null;
		if(m == null || !m.getEmail().equals(email))
	        {
				page = "views/b_member/find_Id.jsp";
	            request.setAttribute("msg", "아이디나 이메일 정보가 맞지 않습니다");
	            
	    		RequestDispatcher view = request.getRequestDispatcher(page);
	        	view.forward(request, response);
	            
	    } else {
	    	
	    	// 난수 생성
	    	StringBuffer temp =new StringBuffer();
	        Random ran = new Random();
	        for(int i = 0; i < 8; i++)
	        {
	            int rIndex = ran.nextInt(3);
	            switch (rIndex) {
	            case 0:
	                // a-z
	                temp.append((char) ((int) (ran.nextInt(26)) + 97));
	                break;
	            case 1:
	                // A-Z
	                temp.append((char) ((int) (ran.nextInt(26)) + 65));
	                break;
	            case 2:
	                // 0-9
	                temp.append((ran.nextInt(10)));
	                break;
	            }
	        }
			
	        String keyCode = temp.toString();
	        
	        int keyResult = MemberService.UpdateKeyCode(userName, email, keyCode);
	        
	        if(keyResult > 0) {
	        	// 1. 전달받은 값 인코딩

				final String sender = "yocon_o3o@naver.com"; // 보내는 사람 ID (Ex: @naver.com 까지..)
				final String password = "qkwndu12"; // 보내는 사람 Password

				String receiver = email; // 받는 사용자 (Ex: @naver.com 까지..)
				String title = "인증 번호 메일입니다 :)";

				String contents = "당신의 빛나는 Single Life를 위한 커뮤니티 사이트 혼족옵서예 입니다.\n"
						+ "인증번호는 " + keyCode + "입니다.";
				String host = "smtp.naver.com"; // 사용하는 메일

				System.out.println("---------recv Data Check--------");
				System.out.println("recvID : " + receiver);
				System.out.println("title : " + title);
				System.out.println("content : " + contents);
				System.out.println("--------------------------");

				// Get the session object
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.auth", "true");

				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(sender, password);
					}
				});

				// Compose the message
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(sender));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));

					// sender Email Address
					//message.setFrom("테스트메일 : <" + sender + ">");
					message.setFrom(sender);

					// Subject
					message.setSubject("[혼족옵서예] " + title);

					// Text
					message.setText(contents, "UTF-8", "html");

					// send the message
					Transport.send(message);
					System.out.println("전송 완료!!!!");
					
					request.setAttribute("msg", "인증번호가 발송되었습니다. 이메일을 확인해주세요 :D");
					request.setAttribute("member", m);
					page = "views/b_member/inputKeyCode.jsp";
				} catch (MessagingException e) {
					System.out.println("전송 실패!! ㅠㅠ");
					e.printStackTrace();
				}
	        	
	        } else {
	        	page = "views/b_member/find_Id.jsp";
	            request.setAttribute("msg", "인증번호 발송 중에 오류가 발생했습니다.");
	            request.setAttribute("msg", "다시 한 번 시도해주세요.");
	            
	        }
    		RequestDispatcher view = request.getRequestDispatcher(page);
        	view.forward(request, response);	
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

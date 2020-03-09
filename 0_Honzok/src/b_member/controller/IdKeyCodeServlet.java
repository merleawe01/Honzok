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
@WebServlet("/issue.idkc")
public class IdKeyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdKeyCodeServlet() {
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
		if(m == null || !m.getEmail().equals(email) || !m.getUserName().equals(userName))
	        {
				page = "views/b_member/find_Id.jsp";
	            request.setAttribute("msg", "이름 또는 이메일 정보가 맞지 않습니다");
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
	        	String root = request.getSession().getServletContext().getRealPath("/");
	        	System.out.println(root);

				final String sender = "yocon_o3o@naver.com"; 
				final String password = "";

				String receiver = email;
				String title = "인증 번호 메일입니다 :)";
				String contents = 
						"<head><link href=\"https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap\" rel=\"stylesheet\"></head>" +
						"<body>\r\n" + 
						"	<table style=\"width:80%; margin:auto; background-color:#fff9f0\">\r\n" + 
						"		<tr style=\"margin:10px auto;\">\r\n" + 
						"			<th style=\"border-bottom: 1px solid lightgray; padding-bottom:20px;\"><img alt=\"혼족옵서예\" src=\"<%= request.getContextPath() %>/images/Logo.png\"></th>\r\n" + 
						"		</tr>\r\n" + 
						"		<tr>\r\n" + 
						"			<td style=\"font-size:25px; font-weight:bold; padding:10px; padding-top:20px;\">인증번호 <br>"
						+ "			<label style=\" font-size:30px; color:#f18332\">" + keyCode + "</label></td>\r\n" + 
						"		</tr>\r\n" + 
						"		<tr>\r\n" + 
						"			<td style=\"padding:10px; font-size:15px\">" + userName + "님, 안녕하세요!<br>\r\n" + 
						"				당신의 빛나는 Single Life를 위한 커뮤니티 사이트 혼족옵서예 입니다<br>\r\n" + 
						"				혼족옵서예 계정 본인 확인 메일입니다. 인증번호를 입력하고, 본인 인증을 완료하여 주세요.</td>\r\n" + 
						"		</tr>\r\n" + 
						"		<tr>\r\n" + 
						"			<td style=\"font-size:10px;padding:10px; margin-top:20px\">본 메일은 관계 법령상 광고성 메일 수신 동의 여부와 무관하게 보내드리는 이메일입니다.<br>\r\n" + 
						"				다른 문의 사항이 있으시면 혼족옵서예로 방문하여 문의해주십시오.</td>\r\n" + 
						"		</tr>\r\n" + 
						"	</table>\r\n" + 
						"</body>";
				String host = "smtp.naver.com";

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

					message.setFrom(sender);

					// Subject
					message.setSubject("[혼족옵서예] " + title);

					// Text
					message.setText(contents, "UTF-8", "html");

					// send the message
					Transport.send(message);
					System.out.println("전송 완료!!!!");
					
					page = "views/b_member/inputKeyCode.jsp";
					request.setAttribute("msg", "인증번호가 발송되었습니다. 이메일을 확인해주세요 :D");
					request.setAttribute("member", m);

				} catch (MessagingException e) {
					System.out.println("전송 실패!! ㅠㅠ");
					e.printStackTrace();
				}
	        	
	        } else {
	        	page = "views/b_member/find_Id.jsp";
	            request.setAttribute("msg", "인증번호 발송 중에 오류가 발생했습니다.");
	            request.setAttribute("msg", "다시 한 번 시도해주세요.");
	            
	        }

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

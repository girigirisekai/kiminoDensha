package ikuzo.kimi.densha.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMail {

	   private String user; // 받을 사람
	   private String title; //제목
	   private String message;//내용

	   public SendMail(String user,String title,String message) {
	      this.user = user; 
	      this.title = title; // 안쓰고
	      this.message = message; // 안쓰고
	      
	      Properties p = System.getProperties();
	      p.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
	      p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
	      p.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
	      p.put("mail.smtp.port", "587"); // gmail 포트

	      Authenticator auth = new MyAuthentication();

	      // session 생성 및 MimeMessage생성
	      Session session = Session.getDefaultInstance(p, auth);
	      MimeMessage msg = new MimeMessage(session);
	      	
	      try {
	         // 편지보낸시간
	         msg.setSentDate(new Date());
	         
	         InternetAddress from = new InternetAddress();

	         from = new InternetAddress("KiminoDensha<jintest1012@gmailcom>");

	         // 이메일 발신자
	         msg.setFrom(from);
	         
	         // 이메일 수신자
	         InternetAddress to = new InternetAddress(user);
	         msg.setRecipient(Message.RecipientType.TO, to);

	         // 이메일 제목
	         msg.setSubject(title, "UTF-8");

	         // 이메일 내용
	         msg.setText(message, "UTF-8");

	         // 이메일 헤더
	         msg.setHeader("content-Type", "text/html");

	         // 메일보내기
	         Transport.send(msg);

	      } catch (AddressException addr_e) {
	      } catch (MessagingException msg_e) {
	      }
	   }



	   class MyAuthentication extends Authenticator {

	      PasswordAuthentication pa;

	      public MyAuthentication() {

	         String id = "denshanuri"; // 구글 ID
	         String pw = "z1a1q1@@"; // 구글 비밀번호 // 

	         // ID와 비밀번호를 입력한다.
	         pa = new PasswordAuthentication(id, pw);

	      }

	      // 시스템에서 사용하는 인증정보
	      public PasswordAuthentication getPasswordAuthentication() {
	         return pa;
	      }
	   }
	   
	   public int test(String user){
	      int accreditation = (int) (Math.random() * 1000000);
	      String title = "[KiminoDensha] 인증 번호";
	      String message = "인증번호 : " + accreditation;
	      new SendMail(user, title, message);
	      return accreditation;
	   }
	}



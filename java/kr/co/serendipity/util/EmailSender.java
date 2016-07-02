package kr.co.serendipity.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import kr.co.serendipity.model.dto.EmailDTO;
import kr.co.serendipity.model.dto.MemberDTO;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	public static String temporaryPassword() {
		StringBuffer buffer = new StringBuffer();
		Random random = new Random();
				
		String chars[] = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9".split(",");
				
		for (int i = 0; i < 8; i++) {
		buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}
	
	public int sendConfirmEmail(EmailDTO emaildto) throws Exception{
		MimeMessage messagedto = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(messagedto, true, "UTF-8");
		
		Random random = new Random(System.currentTimeMillis());
		int confirmation = 0;
		
		while(true){
			confirmation = (random.nextInt(10000));
			if(confirmation <10000 && confirmation>1000){break;}
		}
		
		messageHelper.setFrom("betakosta1@gmail.com"); // 보내는 메일주소는 수정하자 dispatcher-servlet이랑 맞춰주자.		
		messageHelper.setTo(emaildto.getReceiver()); 
		messageHelper.setSubject("Serendipity : 요청하신 인증번호입니다.");
		messageHelper.setText("요청하신 인증번호는 " + confirmation + "입니다.");

		mailSender.send(messagedto);
		
		return confirmation;
	}
	
	public void sendFindIDEmail(MemberDTO memberdto) throws MessagingException {
		System.out.println("aaaaaaaaaaaaaa");
		MimeMessage messagedto = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(messagedto, true, "UTF-8");
		
		messageHelper.setFrom("betakosta1@gmail.com"); // 보내는 메일주소는 수정하자 dispatcher-servlet이랑 맞춰주자.		
		messageHelper.setTo(memberdto.getEmail()); 
		messageHelper.setSubject("Serendipity : 회원님의 아이디찾기 결과입니다.");
		messageHelper.setText("회원님의 가입된 아이디는 " + memberdto.getId() + "입니다.");
		
		mailSender.send(messagedto);
	}
	
	public String sendFindPWEmail(MemberDTO memberdto) throws MessagingException {
		MimeMessage messagedto = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(messagedto, true, "UTF-8");
		String temppw = temporaryPassword();
		messageHelper.setFrom("betakosta1@gmail.com"); // 보내는 메일주소는 수정하자 dispatcher-servlet이랑 맞춰주자.		
		messageHelper.setTo(memberdto.getEmail()); 
		messageHelper.setSubject("Serendipity : 회원님의 임시 비밀번호입니다.");
		messageHelper.setText("회원님의 임시 비밀번호는 " + temppw + "입니다.<br>로그인 후 꼭 비밀번호를 변경하세요!");
		mailSender.send(messagedto);
		
		return temppw;
	}
}

package kr.co.serendipity.util;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import kr.co.serendipity.model.EmailDTO;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendEmail(EmailDTO emaildto) throws Exception{
		MimeMessage messagedto = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(messagedto, true, "UTF-8");

		messageHelper.setFrom("betakosta1@gmail.com"); // 보내는 메일주소는 수정하자 dispatcher-servlet이랑 맞춰주자.		
		messageHelper.setTo(emaildto.getReciever()); 
		messageHelper.setSubject(emaildto.getSubject());
		messageHelper.setText(emaildto.getContent());

		mailSender.send(messagedto);
	}
}

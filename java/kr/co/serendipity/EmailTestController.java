package kr.co.serendipity;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.serendipity.model.EmailDTO;
import kr.co.serendipity.util.EmailSender;

/*
 * Email테스트용이니까 신경 ㄴㄴ해
 * 
 */
@Service
@Controller
public class EmailTestController {
	
	@Autowired
	EmailSender emailsender;
	
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping("email_test.htm")
	public void sendEmail(EmailDTO emaildto) throws Exception {
		System.out.println("Email보내기");
		emailsender.sendEmail(emaildto);
	}
}

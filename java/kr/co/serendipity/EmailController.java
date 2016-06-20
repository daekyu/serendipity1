package kr.co.serendipity;

import java.io.PrintWriter;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.serendipity.model.EmailDTO;
import kr.co.serendipity.util.EmailSender;

/*
 * Email테스트용이니까 신경 ㄴㄴ해
 * 
 */
@Service
@Controller
@RequestMapping("/email/")
public class EmailController {
	
	@Autowired
	private EmailSender emailsender;
	
	/*@RequestMapping("email_test.htm")
	public String sendEmail(EmailDTO emaildto, PrintWriter out) throws Exception {
		System.out.println("Email보내기");
		emailsender.sendEmail(emaildto);
		out.print("<script>");
		out.print("alert('aaaaa');");
		out.print("</script>");
		return "redirect:/email_test.jsp";
	}*/
	
	@RequestMapping("confirm_email.htm")
	public @ResponseBody int sendConfirmEmail(EmailDTO emaildto) throws Exception {
		return emailsender.sendConfirmEmail(emaildto);
	}
}

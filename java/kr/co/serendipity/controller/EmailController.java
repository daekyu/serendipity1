package kr.co.serendipity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.serendipity.model.dto.EmailDTO;
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
	
	@RequestMapping("confirm_email.htm")
	public @ResponseBody int sendConfirmEmail(EmailDTO emaildto) throws Exception {
		return emailsender.sendConfirmEmail(emaildto);
	}
}

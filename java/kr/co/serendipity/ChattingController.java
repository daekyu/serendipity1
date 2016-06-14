package kr.co.serendipity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chatting/")
public class ChattingController {
	
	@RequestMapping("chatting.htm")
	public String chatting() {
		return "chatting/chatting";
	}
}

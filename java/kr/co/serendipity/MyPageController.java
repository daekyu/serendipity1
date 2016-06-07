/*
 * @Class : MyPageController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 마이페이지를 구성하는 컨트롤러
 */

package kr.co.serendipity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {
	
	@RequestMapping("my_page.htm")
	public String myPage() {
		return "/mypage/my_page";
	}
	
	@RequestMapping("my_page_modifyform.htm")
	public String modifyAccount() {
		return "/mypage/my_page_modifyform";
	}
	
	@RequestMapping("my_page_accept_history.htm")
	public String acceptHistory() {
		return "/mypage/my_page_accept_history";
	}
	
	@RequestMapping("my_page_send_history.htm")
	public String sendHistory() {
		return "/mypage/my_page_send_history";
	}
	
	@RequestMapping("my_page_notification.htm")
	public String showNotification() {
		return "/mypage/my_page_notification";
	}
	
	@RequestMapping("my_page_withdraw.htm")
	public String withdraw() {
		return "/mypage/my_page_withdraw";
	}
}

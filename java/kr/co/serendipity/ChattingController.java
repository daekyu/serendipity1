package kr.co.serendipity;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.serendipity.util.IncludedInfo;

@Controller
@RequestMapping("/chatting/")
public class ChattingController {
	
	/**
	 * 웹소켓 메신저 접속화면으로 이동한다.
	 * @param session 사용자세션
	 * @param model 모델
	 * @return view name
	 */
	@IncludedInfo(name="웹소켓 메신저", order = 3200, gid = 100)
	@RequestMapping(value="chatting.htm")
	public String websocketMessengerView(HttpSession session, ModelMap model) {
		model.addAttribute("user_num", session.getAttribute("user_num"));
		return "chatting/EgovMessenger";
	}

	/**
	 * 웹 소켓 메신저 메인화면(대화상대 리스트화면)으로 이동한다.
	 * @param session 사용자세션
	 * @param model 모델
	 * @return view name
	 */
	@RequestMapping(value="enterChatting.htm")
	public String websocketMessengerMain(HttpSession session, ModelMap model) {
		model.addAttribute("loginVO", session.getAttribute("loginVO"));
		return "chatting/EgovMessengerMain";
	}

	/**
	 * 대화창을 새로 띄운다.
	 * @param roomId 대화창 아이디
	 * @param username 대화상대 이름
	 * @param session 사용자세션
	 * @param model 모델
	 * @return view name
	 */
	@RequestMapping(value="chattingPopup.htm")
	public String websocketMessengePopup(@RequestParam(value="roomId") String roomId,
										 @RequestParam(value="id") String id,
										 HttpSession session, ModelMap model) {
		model.addAttribute("id", session.getAttribute("id"));
		model.addAttribute("roomId", roomId);
		model.addAttribute("id", id);
		return "chatting/chatPopupBubble";
	}
}

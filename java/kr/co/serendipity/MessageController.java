/*
 * @Class : MessageController
 * @Date : 16.06.13
 * @Author : 媛뺣�洹�
 * @Desc : 履쎌� 湲곕뒫�쓣 泥섎━�븯�뒗 而⑦듃濡ㅻ윭
 */

package kr.co.serendipity;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.MessageDTO;
import kr.co.serendipity.model.RCV_MessageDTO;
import kr.co.serendipity.service.MessageService;

@Controller
@RequestMapping("/message/")
public class MessageController {
	
	@Autowired
	private MessageService messageservice;
	
	@RequestMapping("message.htm")
	public ModelAndView message(MemberDTO memberdto) {
		ModelAndView mav = new ModelAndView("/message/message");
		mav.addObject("message_list", messageservice.getSendMsgList(memberdto));
		mav.addObject("rcv_message_list", messageservice.getReceiveMsgList(memberdto));
		return mav;
	}
	
	@RequestMapping("getMemberList.htm")
	public @ResponseBody List<MemberDTO> getMemberList(MemberDTO memberdto) {
		return messageservice.getMemberList(memberdto);
	}
	
	@RequestMapping("getReceiverNum.htm")
	public @ResponseBody MemberDTO getReceiverNum(MemberDTO memberdto) {
		return messageservice.getReceiverNum(memberdto);
	}
	
	@RequestMapping("sendMessage.htm")
	public String sendMessage(MessageDTO messagedto, HttpSession session) {
		messageservice.sendMessage(messagedto);
		return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
	}
	
	@RequestMapping("deleteSendMessage.htm")
	public String deleteSendMessage(MessageDTO messagedto, HttpSession session) {
		messageservice.deleteSendMessage(messagedto);
		return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
	}
	
	@RequestMapping("deleteReceiveMessage.htm")
	public String deleteReceiveMessage(MessageDTO messagedto, HttpSession session) {
		messageservice.deleteReceiveMessage(messagedto);
		return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
	}//
	
	@RequestMapping("msgNotificationCheck.htm")
	public @ResponseBody List<HashMap<String, Object>> msgNotificationCheck(RCV_MessageDTO rcv_messagedto) {
		return messageservice.msgNotificationCheck(rcv_messagedto);
	}
	
	@RequestMapping("changeMsgNotificationState.htm")
	public void changeNotificationStates(RCV_MessageDTO rcv_messagedto) {
		messageservice.changeNotificationState(rcv_messagedto);
	}
}

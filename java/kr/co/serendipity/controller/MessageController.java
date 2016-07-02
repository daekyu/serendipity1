/*
 * @Class : MessageController
 * @Date : 16.06.13
 * @Author : 媛뺣�洹�
 * @Desc : 履쎌� 湲곕뒫�쓣 泥섎━�븯�뒗 而⑦듃濡ㅻ윭
 */

package kr.co.serendipity.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.dto.MemberDTO;
import kr.co.serendipity.model.dto.MessageDTO;
import kr.co.serendipity.model.dto.RCV_MessageDTO;
import kr.co.serendipity.service.MessageService;

@Controller
@RequestMapping("/message/")
public class MessageController {
	
	@Autowired
	private MessageService messageservice;
	
	@RequestMapping("message.htm")
	public ModelAndView message(MemberDTO memberdto,HttpSession session) {
		if(session.getAttribute("id") == null){
			ModelAndView mav = new ModelAndView("/member/join_login");
			return mav;
		}else{
			ModelAndView mav = new ModelAndView("/message/message");
			mav.addObject("message_list", messageservice.getSendMsgList(memberdto));
			mav.addObject("rcv_message_list", messageservice.getReceiveMsgList(memberdto));
			return mav;
		}
		
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
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			messageservice.sendMessage(messagedto);
			return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
		}
	}
	
	@RequestMapping("deleteSendMessage.htm")
	public String deleteSendMessage(MessageDTO messagedto, HttpSession session) {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			messageservice.deleteSendMessage(messagedto);
			return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
		}
	}
	
	@RequestMapping("deleteReceiveMessage.htm")
	public String deleteReceiveMessage(MessageDTO messagedto, HttpSession session) {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			messageservice.deleteReceiveMessage(messagedto);
			return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
		}
		
	}
	
	@RequestMapping("msgNotificationCheck.htm")
	public @ResponseBody List<HashMap<String, Object>> msgNotificationCheck(RCV_MessageDTO rcv_messagedto) {
		return messageservice.msgNotificationCheck(rcv_messagedto);
	}
	
	@RequestMapping("changeMsgNotificationState.htm")
	public void changeNotificationStates(RCV_MessageDTO rcv_messagedto, HttpSession session) {
		messageservice.changeNotificationState(rcv_messagedto);
	}
	
	@RequestMapping("getRcvMessageDetail.htm")
	public @ResponseBody RCV_MessageDTO getRcvMessageDetail(RCV_MessageDTO rcv_messagedto) {
		return messageservice.getRcvMessageDetail(rcv_messagedto);
	}
	
	@RequestMapping("getSendMessageDetail.htm")
	public @ResponseBody MessageDTO getSendMessageDetail(MessageDTO messagedto) {
		return messageservice.getSendMessageDetail(messagedto);
	}
	
	@RequestMapping("sendMessageFromBoard.htm")
	public @ResponseBody int sendMessageFromBoard(MessageDTO messagedto) {
		return messageservice.sendMessageFromBoard(messagedto);
	}
}

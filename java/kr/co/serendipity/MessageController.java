/*
 * @Class : MessageController
 * @Date : 16.06.13
 * @Author : 媛뺣�洹�
 * @Desc : 履쎌� 湲곕뒫�쓣 泥섎━�븯�뒗 而⑦듃濡ㅻ윭
 */

package kr.co.serendipity;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.MessageDAO;
import kr.co.serendipity.model.MessageDTO;
import kr.co.serendipity.model.RCV_MessageDTO;

@Controller
@RequestMapping("/message/")
public class MessageController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("message.htm")
	public ModelAndView message(MemberDTO memberdto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		ModelAndView mav = new ModelAndView("/message/message");
		mav.addObject("messagelist", dao.getSendMsgList(memberdto));
		mav.addObject("rcv_messagelist", dao.getReceiveMsgList(memberdto));

		return mav;
	}
	
	@RequestMapping("getMemberList.htm")
	public @ResponseBody List<MemberDTO> getMemberList(MemberDTO memberdto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.getMemberList(memberdto);
	}
	
	@RequestMapping("getReceiverNum.htm")
	public @ResponseBody MemberDTO getReceiverNum(MemberDTO memberdto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.getReceiverNum(memberdto);
	}
	
	@RequestMapping("sendMessage.htm")
	public String sendMessage(MessageDTO messagedto, HttpSession session) {
		
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.sendMessage_1(messagedto);
		dao.sendMessage_2(messagedto);
		return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
	}
	
	@RequestMapping("deleteSendMessage.htm")
	public String deleteSendMessage(MessageDTO messagedto, HttpSession session) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.deleteSendMessage(messagedto);
		return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
	}
	
	@RequestMapping("deleteReceiveMessage.htm")
	public String deleteReceiveMessage(MessageDTO messagedto, HttpSession session) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.deleteReceiverMessage(messagedto);
		return "redirect:/message/message.htm?user_num=" + session.getAttribute("user_num");
	}
	
	@RequestMapping("msgNotificationCheck.htm")
	public @ResponseBody List<RCV_MessageDTO> msgNotificationCheck(RCV_MessageDTO rcv_messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		
		return dao.msgNotificationCheck(rcv_messagedto);
	}
	
	@RequestMapping("changeMsgNotificationState.htm")
	public void changeNotificationStates(RCV_MessageDTO rcv_messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.changeNotificationState(rcv_messagedto);
	}
}

package kr.co.serendipity.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.MessageDAO;
import kr.co.serendipity.model.MessageDTO;
import kr.co.serendipity.model.RCV_MessageDTO;

@Service
public class MessageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<Map<String, Object>> getSendMsgList(MemberDTO memberdto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.getSendMsgList(memberdto);
	}
	
	public List<Map<String, Object>> getReceiveMsgList(MemberDTO memberdto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.getReceiveMsgList(memberdto);
	}
	
	public List<MemberDTO> getMemberList(MemberDTO memberdto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.getMemberList(memberdto);
	}
	
	public MemberDTO getReceiverNum(MemberDTO memberdto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.getReceiverNum(memberdto);
	}
	
	public void sendMessage(MessageDTO messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.sendMessage_1(messagedto);
		dao.sendMessage_2(messagedto);
	}
	
	public void deleteSendMessage(MessageDTO messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.deleteSendMessage(messagedto);
	}
	
	public void deleteReceiveMessage(MessageDTO messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.deleteReceiverMessage(messagedto);
	}
	
	public List<HashMap<String, Object>> msgNotificationCheck(RCV_MessageDTO rcv_messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.msgNotificationCheck(rcv_messagedto);
	}
	
	public void changeNotificationState(RCV_MessageDTO rcv_messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.changeNotificationState(rcv_messagedto);
	}
	
	public RCV_MessageDTO getRcvMessageDetail(RCV_MessageDTO rcv_messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.getRcvMessageDetail(rcv_messagedto);
	}
	
	public MessageDTO getSendMessageDetail(MessageDTO messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		return dao.getSendMessageDetail(messagedto);
	}
	
	public int sendMessageFromBoard(MessageDTO messagedto) {
		MessageDAO dao = sqlsession.getMapper(MessageDAO.class);
		dao.sendMessage_1(messagedto);
		dao.sendMessage_2(messagedto);
		return 1;
	}
}

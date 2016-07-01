/*
 * @Class : MessageDAO
 * @Date : 16.06.13
 * @Author : 강대규
 * @Desc : 쪽지의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.serendipity.model.dto.MemberDTO;
import kr.co.serendipity.model.dto.MessageDTO;
import kr.co.serendipity.model.dto.RCV_MessageDTO;

public interface MessageDAO {
	// 보낸 쪽지함 목록을 가져옴
	public List<Map<String, Object>> getSendMsgList(MemberDTO memberdto); 
	
	//받은 쪽지함 목록을 가져옴
	public List<Map<String, Object>> getReceiveMsgList(MemberDTO memberdto); 
	
	// 쪽지보내기에서 아이디 검색할 때 목록 가져오는 그거
	public List<MemberDTO> getMemberList(MemberDTO memberdto); 
	
	// 쪽지보낼 때 받는사람 user_num을 가져오기 위한 메소드
	public MemberDTO getReceiverNum(MemberDTO memberdto); 
	
	// 쪽지보내기 메소드(받은 쪽지함에 넣기)
	public void sendMessage_1(MessageDTO messagedto); 
	
	// 쪽지보내기 메소드(보낸 쪽지함에 넣기)
	public void sendMessage_2(MessageDTO messagedto); 
	
	// 보낸쪽지함에서 삭제하기
	public void deleteSendMessage(MessageDTO messagedto); 
	
	// 받은쪽지함에서 삭제하기
	public void deleteReceiverMessage(MessageDTO messagedto); 
	
	// 알림체크하기
	public List<HashMap<String, Object>> msgNotificationCheck(RCV_MessageDTO rcv_messagedto);
	
	// 알리고난 뒤 알림상태 바꾸기
	public void changeNotificationState(RCV_MessageDTO rcv_messagedto);
	
	// 받은쪽지함 상세보기
	public RCV_MessageDTO getRcvMessageDetail(RCV_MessageDTO rcv_messagedto);
	
	// 보낸쪽지함 상세보기
	public MessageDTO getSendMessageDetail(MessageDTO messagedto);
	
	// 게시판에서 쪽지보내기(여행자)
	public int sendMessageFromBoard_1(MessageDTO messagedto);
	
	// 게시판에서 쪽지보내기(가이드)
	public int sendMessageFromBoard_2(MessageDTO messagedto);
}

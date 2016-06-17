/*
 * @Class : MessageDAO
 * @Date : 16.06.13
 * @Author : 강대규
 * @Desc : 쪽지의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MessageDAO {
	public List<Map<String, Object>> getSendMsgList(MemberDTO memberdto); // 보낸 쪽지함 목록을 가져옴
	public List<Map<String, Object>> getReceiveMsgList(MemberDTO memberdto); //받은 쪽지함 목록을 가져옴
	public List<MemberDTO> getMemberList(MemberDTO memberdto); // 쪽지보내기에서 아이디 검색할 때 목록 가져오는 그거
	public MemberDTO getReceiverNum(MemberDTO memberdto); // 쪽지보낼 때 받는사람 user_num을 가져오기 위한 메소드
	public void sendMessage_1(MessageDTO messagedto); // 쪽지보내기 메소드(받은 쪽지함에 넣기)
	public void sendMessage_2(MessageDTO messagedto); // 쪽지보내기 메소드(보낸 쪽지함에 넣기)
	public void deleteSendMessage(MessageDTO messagedto); // 보낸쪽지함에서 삭제하기
	public void deleteReceiverMessage(MessageDTO messagedto); // 받은쪽지함에서 삭제하기
	public List<HashMap<String, Object>> msgNotificationCheck(RCV_MessageDTO rcv_messagedto); // 알림체크하기
	public void changeNotificationState(RCV_MessageDTO rcv_messagedto);
}

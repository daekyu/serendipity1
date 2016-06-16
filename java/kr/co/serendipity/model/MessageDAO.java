/*
 * @Class : MessageDAO
 * @Date : 16.06.13
 * @Author : 媛뺣�洹�
 * @Desc : 履쎌��쓽 CRUD�옉�뾽�쓣 �떞�떦�븯�뒗 DAO �씤�꽣�럹�씠�뒪
 */

package kr.co.serendipity.model;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MessageDAO {
	public List<Map<String, Object>> getSendMsgList(MemberDTO memberdto); // 蹂대궦 履쎌��븿 紐⑸줉�쓣 媛��졇�샂
	public List<Map<String, Object>> getReceiveMsgList(MemberDTO memberdto); //諛쏆� 履쎌��븿 紐⑸줉�쓣 媛��졇�샂
	public List<MemberDTO> getMemberList(MemberDTO memberdto); // 履쎌�蹂대궡湲곗뿉�꽌 �븘�씠�뵒 寃��깋�븷 �븣 紐⑸줉 媛��졇�삤�뒗 洹멸굅
	public MemberDTO getReceiverNum(MemberDTO memberdto); // 履쎌�蹂대궪 �븣 諛쏅뒗�궗�엺 user_num�쓣 媛��졇�삤湲� �쐞�븳 硫붿냼�뱶
	public void sendMessage_1(MessageDTO messagedto); // 履쎌�蹂대궡湲� 硫붿냼�뱶(諛쏆� 履쎌��븿�뿉 �꽔湲�)
	public void sendMessage_2(MessageDTO messagedto); // 履쎌�蹂대궡湲� 硫붿냼�뱶(蹂대궦 履쎌��븿�뿉 �꽔湲�)
	public void deleteSendMessage(MessageDTO messagedto); // 蹂대궦履쎌��븿�뿉�꽌 �궘�젣�븯湲�
	public void deleteReceiverMessage(MessageDTO messagedto); // 諛쏆�履쎌��븿�뿉�꽌 �궘�젣�븯湲�
	public List<HashMap<String, Object>> msgNotificationCheck(RCV_MessageDTO rcv_messagedto); // �븣由� 泥댄겕�븯湲�
	public void changeNotificationState(RCV_MessageDTO rcv_messagedto);
}

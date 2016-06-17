package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/*
 * @Class : ReplyDAO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 댓글 DAO
 */

public interface ReplyDAO {
	
	// 해당게시글의 댓글 보기
	public List<HashMap<String, Object>> replyList(int review_num) throws ClassNotFoundException, SQLException;

	// 댓글쓰기
	public void replyWrite(ReplyDTO dto) throws ClassNotFoundException, SQLException;

	// 댓글삭제
	public void replyDelete(ReplyDTO dto) throws ClassNotFoundException, SQLException;
	
	public List<HashMap<String, Object>> replyNotificationCheck(int user_num) throws ClassNotFoundException, SQLException;
	
	public int changeReplyNotificationState(ReplyDTO replydto) throws ClassNotFoundException, SQLException;
	
	//댓글 갯수 출력
	public int replyCount(int review_num) throws ClassNotFoundException, SQLException;
	
	//댓글 쓰면 댓글 갯수 1증가
	public void replyPlus(int review_num) throws ClassNotFoundException, SQLException;
	
	//댓글 삭제하면 댓글 갯수 1감소
	public void replyMinus(int review_num) throws ClassNotFoundException, SQLException;
}

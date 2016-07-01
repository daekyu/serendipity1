package kr.co.serendipity.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.co.serendipity.model.dto.MemberDTO;
import kr.co.serendipity.model.dto.ReplyDTO;
import kr.co.serendipity.model.dto.ReviewDTO;

/*
 * @Class : ReplyDAO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 댓글 DAO
 */

public interface ReplyDAO {
	
	// 해당게시글의 댓글 보기
	public List<HashMap<String, Object>> replyList(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;

	// 댓글쓰기
	public void replyWrite(ReplyDTO replydto) throws ClassNotFoundException, SQLException;

	// 댓글삭제
	public void replyDelete(ReplyDTO replydto) throws ClassNotFoundException, SQLException;
	
	// 댓글 알림
	public List<HashMap<String, Object>> replyNotificationCheck(MemberDTO memberdto) throws ClassNotFoundException, SQLException;
	
	// 댓글 알림 상태 변경
	public int changeReplyNotificationState(ReplyDTO replydto) throws ClassNotFoundException, SQLException;
	
	//댓글 갯수 출력
	public int replyCount(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;
	
	//댓글 쓰면 댓글 갯수 1증가
	public void replyPlus(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;
	
	//댓글 삭제하면 댓글 갯수 1감소
	public void replyMinus(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;
}

package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.List;

/*
 * @Class : ReplyDAO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 댓글 DAO
 */

public interface ReplyDAO {
	
	// 해당게시글의 댓글 보기
	public List<ReplyDTO> replyList() throws ClassNotFoundException, SQLException;

	// 댓글쓰기
	public void replyWrite(ReplyDTO dto) throws ClassNotFoundException, SQLException;

	// 댓글삭제
	public void replyDelete(ReplyDTO dto) throws ClassNotFoundException, SQLException;
}

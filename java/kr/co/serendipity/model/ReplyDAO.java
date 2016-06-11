package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.List;

public interface ReplyDAO {
	
	// 해당게시글의 댓글 보기
	public List<ReplyDTO> replyList() throws ClassNotFoundException, SQLException;

	// 댓글쓰기
	public void replyWrite(ReplyDTO dto) throws ClassNotFoundException, SQLException;

	// 댓글수정
	public void replyUpdate(ReplyDTO dto) throws ClassNotFoundException, SQLException;

	// 댓글삭제
	public void replyDelete(int reply_num) throws ClassNotFoundException, SQLException;
}

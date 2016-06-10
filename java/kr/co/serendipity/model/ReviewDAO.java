package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.List;

public interface ReviewDAO {
	
	//여행후기 쓰기
	public void reviewWrite(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//여행후기 작성시 지역 받아오기
	List<LocalDTO> localList();
	
	//여행후기 게시판 목록
	public List<ReviewDTO> reviewList() throws ClassNotFoundException, SQLException;
	
	//게시글 상세보기
	public ReviewDTO reviewDetail() throws ClassNotFoundException, SQLException;
	
	//게시글 수정
	public void reviewUpdate(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//게시글 삭제
	public void reviewDelete(int review_num) throws ClassNotFoundException, SQLException;

}

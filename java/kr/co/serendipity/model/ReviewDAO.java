package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/*
 * @Class : ReviewDAO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 DAO
 */

public interface ReviewDAO {
	
	//여행후기 작성
	public void reviewWrite(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//지역리스트
	List<LocalDTO> localList();
	
	//여행후기 목록
	public List<HashMap<String, Object>> reviewList() throws ClassNotFoundException, SQLException;
	
	//여행후기 상세보기
	public HashMap<String, Object> reviewDetail(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//여행후기 페이징할 때
	public int getReviewListCount() throws ClassNotFoundException, SQLException;
	
	//여행후기 수정
	public void reviewUpdate(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//여행후기 삭제
	public void reviewDelete(int review_num) throws ClassNotFoundException, SQLException;

	//여행후기 게시판 사진 검색
	public ReviewDTO selectPicture(int review_num) throws ClassNotFoundException, SQLException;
	
	//여행후기 게시판 지역별로 필터링
	public List<HashMap<String, Object>> filteringReviewList(String local_code) throws ClassNotFoundException, SQLException;
	
	//여행후기 게시판 리스트 정렬
	public List<HashMap<String, Object>> orderReviewList(String order) throws ClassNotFoundException, SQLException;
}

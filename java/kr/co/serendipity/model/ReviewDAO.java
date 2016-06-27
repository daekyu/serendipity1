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
	public List<HashMap<String, Object>> reviewList(int page, String basicorder) throws ClassNotFoundException, SQLException;
	
	//여행후기 상세보기
	public HashMap<String, Object> reviewDetail(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//여행후기 페이징할 때
	public int getReviewListCount() throws ClassNotFoundException, SQLException;
	
	//여행후기 수정
	public void reviewUpdate(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//여행후기 사진1수정
	public void reviewPic1Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;
	
	//여행후기 사진2수정
	public void reviewPic2Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;
	
	//여행후기 사진3수정
	public void reviewPic3Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;
	
	//여행후기 사진4수정
	public void reviewPic4Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;
	
	//여행후기 사진5수정
	public void reviewPic5Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException;
	
	//여행후기 삭제
	public void reviewDelete(ReviewDTO dto) throws ClassNotFoundException, SQLException;

	//여행후기 게시판 사진 검색
	public ReviewDTO selectPicture(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//여행후기 게시판 지역별로 필터링
	public List<HashMap<String, Object>> filteringReviewList(String local_code) throws ClassNotFoundException, SQLException;
	
	//해당 지역 리턴
	public String getLocalName(String local_code) throws ClassNotFoundException, SQLException;
	
	//index 페이지 인기여행기 상위 3개 보여주기
	public List<ReviewDTO> getIndexReview() throws ClassNotFoundException, SQLException;
	
}

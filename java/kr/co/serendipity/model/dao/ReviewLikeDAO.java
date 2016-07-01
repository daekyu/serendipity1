package kr.co.serendipity.model.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.serendipity.model.dto.ReviewDTO;
import kr.co.serendipity.model.dto.ReviewLikeDTO;

/*
 * @Class : ReviewLikeDAO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 좋아요 DAO
 */

public interface ReviewLikeDAO {
	
	// 해당게시글의 좋아요수
	public int reviewLikeCount(ReviewDTO reviewdto);

	// 좋아요 누르기
	public void likeInsert(ReviewLikeDTO reviewlikedto);
	
	//좋아요 누르면 1증가
	public void likeInsertPlus(ReviewDTO reviewdto);

	// 좋아요 취소
	public void likeDelete(ReviewLikeDTO reviewlikedto);
	
	//좋아요 취소하면 1감소
	public void likeDeleteMinus(ReviewDTO reviewdto);

	// 해당게시글을 해당 사람이 좋아요를 눌렀었나?
	public int isLike(ReviewLikeDTO dto);
	
	// 좋아요를 새로 눌렀을때 알림이 가도록
	public List<HashMap<String, Object>> likeNotificationCheck(ReviewDTO reviewdto);
	
	// 좋아요 알림상태 변경
	public void changeLikeState(ReviewDTO reviewdto);
}

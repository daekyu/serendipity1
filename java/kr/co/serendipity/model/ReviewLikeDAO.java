package kr.co.serendipity.model;

/*
 * @Class : ReviewLikeDAO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 좋아요 DAO
 */

public interface ReviewLikeDAO {
	
	// 해당게시글의 댓글수
	public int reviewLikeCount(int review_num);

	// 좋아요 누르기
	public void likeInsert(ReviewLikeDTO dto);
	
	//좋아요 누르면 1증가
	public void likeInsertPlus(int review_num);

	// 좋아요 취소
	public void likeDelete(ReviewLikeDTO dto);
	
	//좋아요 취소하면 1감소
	public void likeDeleteMinus(int review_num);

	// 해당게시글을 해당 사람이 좋아요를 눌렀었나?
	public int isLike(ReviewLikeDTO dto);
}

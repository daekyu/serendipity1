package kr.co.serendipity.model;

public interface ReviewLikeDAO {
	
	// 해당게시글의 댓글수
	public int reviewLikeCount(int review_num);

	// 좋아요 누르기
	public void likeInsert(ReviewLikeDTO like);

	// 좋아요 취소
	public void likeDelete(int like_num);

	// 해당게시글을 해당 사람이 좋아요를 눌렀었나?
	public int isLike(ReviewLikeDTO like);
}

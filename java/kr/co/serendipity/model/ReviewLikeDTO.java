package kr.co.serendipity.model;

/*
 * @Class : ReviewDTO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 좋아요 DTO
 */

public class ReviewLikeDTO {
	private int like_num;
	private int review_num;
	private int user_num;
	
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	
}

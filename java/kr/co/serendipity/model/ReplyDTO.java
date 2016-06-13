package kr.co.serendipity.model;

import java.sql.Date;

/*
 * @Class : ReplyDTO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 댓글 DTO
 */

public class ReplyDTO {
	private int reply_num;
	private int user_num;
	private int review_num;
	private String reply_content;
	private Date reply_date;
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	
}

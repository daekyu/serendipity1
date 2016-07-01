package kr.co.serendipity.model.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

/*
 * @Class : ReviewDTO
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 DTO
 */

public class ReviewDTO {
	private int review_num;
	private int user_num;
	private String review_title;
	private String review_content;
	private String review_content1;
	private String review_content2;
	private String review_content3;
	private String review_content4;
	private String review_content5;
	private String review_picture1;
	private String review_picture2;
	private String review_picture3;
	private String review_picture4;
	private String review_picture5;
	private int like_count;
	private Date review_date;
	private String local_code;
	
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
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_content1() {
		return review_content1;
	}
	public void setReview_content1(String review_content1) {
		this.review_content1 = review_content1;
	}
	public String getReview_content2() {
		return review_content2;
	}
	public void setReview_content2(String review_content2) {
		this.review_content2 = review_content2;
	}
	public String getReview_content3() {
		return review_content3;
	}
	public void setReview_content3(String review_content3) {
		this.review_content3 = review_content3;
	}
	public String getReview_content4() {
		return review_content4;
	}
	public void setReview_content4(String review_content4) {
		this.review_content4 = review_content4;
	}
	public String getReview_content5() {
		return review_content5;
	}
	public void setReview_content5(String review_content5) {
		this.review_content5 = review_content5;
	}
	public String getReview_picture1() {
		return review_picture1;
	}
	public void setReview_picture1(String review_picture1) {
		this.review_picture1 = review_picture1;
	}
	public String getReview_picture2() {
		return review_picture2;
	}
	public void setReview_picture2(String review_picture2) {
		this.review_picture2 = review_picture2;
	}
	public String getReview_picture3() {
		return review_picture3;
	}
	public void setReview_picture3(String review_picture3) {
		this.review_picture3 = review_picture3;
	}
	public String getReview_picture4() {
		return review_picture4;
	}
	public void setReview_picture4(String review_picture4) {
		this.review_picture4 = review_picture4;
	}
	public String getReview_picture5() {
		return review_picture5;
	}
	public void setReview_picture5(String review_picture5) {
		this.review_picture5 = review_picture5;
	}
	
	// 멀티 파일 업로드///////////////////////////////
	private List<CommonsMultipartFile> files;
	public List<CommonsMultipartFile> getFiles() {
		return files;
	}
	public void setFiles(List<CommonsMultipartFile> files) {
		this.files = files;
	}
	////////////////////////////////////////////////
	
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getLocal_code() {
		return local_code;
	}
	public void setLocal_code(String local_code) {
		this.local_code = local_code;
	}
	
}

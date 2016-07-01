package kr.co.serendipity.model.dto;

/*
 * @Class : BoardController
 * @Date : 16.06.08
 * @Author : 김민규
 * @Desc : 여행자가 가이드 구하는 게시판 글 DTO
 */


public class BoardDTO {
	private int board_num;
	private int user_num;
	private String board_title;
	private String board_content;
	private String board_picture1;
	private String board_picture2;
	private String board_picture3;
	private String board_picture4;
	private String board_picture5;
	private int board_capacity;
	private String board_date;
	private String board_latitude;
	private String board_longitude;
	private String local_code;
	private String country_code;
	private int category_num;
	private String price;
	private String meeting_place;
	private String meeting_address;
	
	
	public String getCountry_code() {
		return country_code;
	}
	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_picture1() {
		return board_picture1;
	}
	public void setBoard_picture1(String board_picture1) {
		this.board_picture1 = board_picture1;
	}
	public String getBoard_picture2() {
		return board_picture2;
	}
	public void setBoard_picture2(String board_picture2) {
		this.board_picture2 = board_picture2;
	}
	public String getBoard_picture3() {
		return board_picture3;
	}
	public void setBoard_picture3(String board_picture3) {
		this.board_picture3 = board_picture3;
	}
	public String getBoard_picture4() {
		return board_picture4;
	}
	public void setBoard_picture4(String board_picture4) {
		this.board_picture4 = board_picture4;
	}
	public String getBoard_picture5() {
		return board_picture5;
	}
	public void setBoard_picture5(String board_picture5) {
		this.board_picture5 = board_picture5;
	}
	public int getBoard_capacity() {
		return board_capacity;
	}
	public void setBoard_capacity(int board_capacity) {
		this.board_capacity = board_capacity;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_latitude() {
		return board_latitude;
	}
	public void setBoard_latitude(String board_latitude) {
		this.board_latitude = board_latitude;
	}
	public String getBoard_longitude() {
		return board_longitude;
	}
	public void setBoard_longitude(String board_longitude) {
		this.board_longitude = board_longitude;
	}
	public String getLocal_code() {
		return local_code;
	}
	public void setLocal_code(String local_code) {
		this.local_code = local_code;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMeeting_place() {
		return meeting_place;
	}
	public void setMeeting_place(String meeting_place) {
		this.meeting_place = meeting_place;
	}
	public String getMeeting_address() {
		return meeting_address;
	}
	public void setMeeting_address(String meeting_address) {
		this.meeting_address = meeting_address;
	}
}

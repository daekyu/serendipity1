package kr.co.serendipity.model;

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
	private int category_num;
	private int price;
	private String meeting_place;
	private String meeting_address;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBoard_Num() {
		return board_num;
	}
	public void setBoard_Num(int board_num) {
		this.board_num = board_num;
	}
	public int getUser_Num() {
		return user_num;
	}
	public void setUser_Num(int user_num) {
		this.user_num = user_num;
	}
	public String getBoard_Title() {
		return board_title;
	}
	public void setBoard_Title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_Content() {
		return board_content;
	}
	public void setBoard_Content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_Picture1() {
		return board_picture1;
	}
	public void setBoard_Picture1(String board_picture1) {
		this.board_picture1 = board_picture1;
	}
	public String getBoard_Picture2() {
		return board_picture2;
	}
	public void setBoard_Picture2(String board_picture2) {
		this.board_picture2 = board_picture2;
	}
	public String getBoard_Picture3() {
		return board_picture3;
	}
	public void setBoard_Picture3(String board_picture3) {
		this.board_picture3 = board_picture3;
	}
	public String getBoard_Picture4() {
		return board_picture4;
	}
	public void setBoard_Picture4(String board_picture4) {
		this.board_picture4 = board_picture4;
	}
	public String getBoard_Picture5() {
		return board_picture5;
	}
	public void setBoard_Picture5(String board_picture5) {
		this.board_picture5 = board_picture5;
	}
	public int getBoard_Capacity() {
		return board_capacity;
	}
	public void setBoard_Capacity(int board_capacity) {
		this.board_capacity = board_capacity;
	}
	public String getBoard_Date() {
		return board_date;
	}
	public void setBoard_Date(String board_date) {
		this.board_date = board_date;
	}
	public String getBoard_Latitude() {
		return board_latitude;
	}
	public void setBoard_Latitude(String board_latitude) {
		this.board_latitude = board_latitude;
	}
	public String getBoard_Longitude() {
		return board_longitude;
	}
	public void setBoard_Longitude(String board_longitude) {
		this.board_longitude = board_longitude;
	}
	public String getLocal_Code() {
		return local_code;
	}
	public void setLocal_Code(String local_code) {
		this.local_code = local_code;
	}
	public int getCategory_Num() {
		return category_num;
	}
	public void setCategory_Num(int category_num) {
		this.category_num = category_num;
	}
	public String getMeeting_Place() {
		return meeting_place;
	}
	public void setMeeting_Place(String meeting_place) {
		this.meeting_place = meeting_place;
	}
	public String getMeeting_Address() {
		return meeting_address;
	}
	public void setMeeting_Address(String meeting_address) {
		this.meeting_address = meeting_address;
	}
}

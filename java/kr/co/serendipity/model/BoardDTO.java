package kr.co.serendipity.model;

/*
 * @Class : BoardController
 * @Date : 16.06.08
 * @Author : 김민규
 * @Desc : 여행자가 가이드 구하는 게시판 글 DTO
 */


public class BoardDTO {
	private int board_Num;
	private int user_Num;
	private String board_Title;
	private String board_Content;
	private String board_Picture1;
	private String board_Picture2;
	private String board_Picture3;
	private String board_Picture4;
	private String board_Picture5;
	private int board_Capacity;
	private String board_Date;
	private String board_Latitude;
	private String board_Longitude;
	private String local_Code;
	private int category_Num;
	private int price;
	private String board_Latlng;
	private String meeting_Place;
	private String meeting_Address;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBoard_Num() {
		return board_Num;
	}
	public void setBoard_Num(int board_Num) {
		this.board_Num = board_Num;
	}
	public int getUser_Num() {
		return user_Num;
	}
	public void setUser_Num(int user_Num) {
		this.user_Num = user_Num;
	}
	public String getBoard_Title() {
		return board_Title;
	}
	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}
	public String getBoard_Content() {
		return board_Content;
	}
	public void setBoard_Content(String board_Content) {
		this.board_Content = board_Content;
	}
	public String getBoard_Picture1() {
		return board_Picture1;
	}
	public void setBoard_Picture1(String board_Picture1) {
		this.board_Picture1 = board_Picture1;
	}
	public String getBoard_Picture2() {
		return board_Picture2;
	}
	public void setBoard_Picture2(String board_Picture2) {
		this.board_Picture2 = board_Picture2;
	}
	public String getBoard_Picture3() {
		return board_Picture3;
	}
	public void setBoard_Picture3(String board_Picture3) {
		this.board_Picture3 = board_Picture3;
	}
	public String getBoard_Picture4() {
		return board_Picture4;
	}
	public void setBoard_Picture4(String board_Picture4) {
		this.board_Picture4 = board_Picture4;
	}
	public String getBoard_Picture5() {
		return board_Picture5;
	}
	public void setBoard_Picture5(String board_Picture5) {
		this.board_Picture5 = board_Picture5;
	}
	public int getBoard_Capacity() {
		return board_Capacity;
	}
	public void setBoard_Capacity(int board_Capacity) {
		this.board_Capacity = board_Capacity;
	}
	public String getBoard_Date() {
		return board_Date;
	}
	public void setBoard_Date(String board_Date) {
		this.board_Date = board_Date;
	}
	public String getBoard_Latitude() {
		return board_Latitude;
	}
	public void setBoard_Latitude(String board_Latitude) {
		this.board_Latitude = board_Latitude;
	}
	public String getBoard_Longitude() {
		return board_Longitude;
	}
	public void setBoard_Longitude(String board_Longitude) {
		this.board_Longitude = board_Longitude;
	}
	public String getLocal_Code() {
		return local_Code;
	}
	public void setLocal_Code(String local_Code) {
		this.local_Code = local_Code;
	}
	public int getCategory_Num() {
		return category_Num;
	}
	public void setCategory_Num(int category_Num) {
		this.category_Num = category_Num;
	}
	public String getBoard_Latlng() {
		return board_Latlng;
	}
	public void setBoard_Latlng(String board_Latlng) {
		this.board_Latlng = board_Latlng;
	}
	public String getMeeting_Place() {
		return meeting_Place;
	}
	public void setMeeting_Place(String meeting_Place) {
		this.meeting_Place = meeting_Place;
	}
	public String getMeeting_Address() {
		return meeting_Address;
	}
	public void setMeeting_Address(String meeting_Address) {
		this.meeting_Address = meeting_Address;
	}
	
	
	
	
	
}

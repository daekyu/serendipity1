package kr.co.serendipity.model.dto;

public class ParticipantDTO {
	int parti_num;
	int board_num;
	int user_num;
	int parti_capacity;
	String state;
	String parti_date;
	
	public int getParti_capacity() {
		return parti_capacity;
	}
	public void setParti_capacity(int parti_capacity) {
		this.parti_capacity = parti_capacity;
	}
	public String getParti_date() {
		return parti_date;
	}
	public void setParti_date(String parti_date) {
		this.parti_date = parti_date;
	}
	public int getParti_num() {
		return parti_num;
	}
	public void setParti_num(int parti_num) {
		this.parti_num = parti_num;
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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
}

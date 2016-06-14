/*
 * @Class : RCV_MessageDTO
 * @Date : 16.06.13
 * @Author : 강대규
 * @Desc : 받은 쪽지함 DTO클래스
 */

package kr.co.serendipity.model;

import java.sql.Date;

public class RCV_MessageDTO {
	private int message_num;
	private int sender;
	private int receiver;
	private String message_title;
	private String message_content;
	private Date message_date;
	
	
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getReceiver() {
		return receiver;
	}
	public void setReceiver(int receiver) {
		this.receiver = receiver;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
}

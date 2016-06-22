/*
 * @Class : LocalDTO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : 지역번호 및 지역의 위도, 경도를 담는 DTO클래스
 */

package kr.co.serendipity.model;

public class LocalDTO {
	private String local_code;
	private String local_name;
	private String local_latitude;
	private String local_longitude;
	private String local_img;
	
	public String getLocal_latitude() {
		return local_latitude;
	}
	public void setLocal_latitude(String local_latitude) {
		this.local_latitude = local_latitude;
	}
	public String getLocal_longitude() {
		return local_longitude;
	}
	public void setLocal_longitude(String local_longitude) {
		this.local_longitude = local_longitude;
	}
	public String getLocal_code() {
		return local_code;
	}
	public void setLocal_code(String local_code) {
		this.local_code = local_code;
	}
	public String getLocal_name() {
		return local_name;
	}
	public void setLocal_name(String local_name) {
		this.local_name = local_name;
	}
	public String getLocal_img() {
		return local_img;
	}
	public void setLocal_img(String local_img) {
		this.local_img = local_img;
	}
	
	
	
}

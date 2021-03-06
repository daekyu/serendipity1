/*
 * @Class : LocalDTO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : 지역번호 및 지역의 위도, 경도를 담는 DTO클래스
 */

package kr.co.serendipity.model.dto;

public class LocalDTO {
	private String local_code;
	private String local_name;
	private String local_latitude;
	private String local_longitude;
	private String local_img1;
	private String local_img2;
	private String local_img3;
	private String local_img4;
	
	
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
	public String getLocal_img1() {
		return local_img1;
	}
	public void setLocal_img1(String local_img1) {
		this.local_img1 = local_img1;
	}
	public String getLocal_img2() {
		return local_img2;
	}
	public void setLocal_img2(String local_img2) {
		this.local_img2 = local_img2;
	}
	public String getLocal_img3() {
		return local_img3;
	}
	public void setLocal_img3(String local_img3) {
		this.local_img3 = local_img3;
	}
	public String getLocal_img4() {
		return local_img4;
	}
	public void setLocal_img4(String local_img4) {
		this.local_img4 = local_img4;
	}
	
	
	
}

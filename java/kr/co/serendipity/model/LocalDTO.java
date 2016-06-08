/*
 * @Class : LocalDTO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : 지역번호와 지역이름에 대한 DTO클래스
 */

package kr.co.serendipity.model;

public class LocalDTO {
	private String local_code;
	private String local_name;
	
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
	
	
}

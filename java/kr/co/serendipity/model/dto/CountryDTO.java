/*
 * @Class : CountryDTO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : 국가번호와 국가이름에 대한 DTO클래스
 */

package kr.co.serendipity.model.dto;

public class CountryDTO {
	private String country_code;
	private String country_name;
	
	public String getCountry_code() {
		return country_code;
	}
	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	
	
}

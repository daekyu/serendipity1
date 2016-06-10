/*
 * @Class : LanguageDTO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : 언어에 대한 정보를 담을 DTO클래스
 */
package kr.co.serendipity.model;

public class LanguageDTO {
	private String language_code;
	private String language_name;
	public String getLanguage_code() {
		return language_code;
	}
	public void setLanguage_code(String language_code) {
		this.language_code = language_code;
	}
	public String getLanguage_name() {
		return language_name;
	}
	public void setLanguage_name(String language_name) {
		this.language_name = language_name;
	}
}

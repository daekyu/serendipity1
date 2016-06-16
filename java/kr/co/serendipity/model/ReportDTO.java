/*
 * @Class : ReportDTO
 * @Date : 16.06.11
 * @Author : 강대규
 * @Desc : 신고 DTO 객체 클래스
 */

package kr.co.serendipity.model;

public class ReportDTO {
	private int report_num; //신고글번호
	private int reporter; // 신고한 사람
	private int villain; // 신고당한 사람
	private String report_title; // 제목
	private String report_content; // 신고내용
	
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public int getReporter() {
		return reporter;
	}
	public void setReporter(int reporter) {
		this.reporter = reporter;
	}
	public int getVillain() {
		return villain;
	}
	public void setVillain(int villain) {
		this.villain = villain;
	}
	public String getReport_title() {
		return report_title;
	}
	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	
}

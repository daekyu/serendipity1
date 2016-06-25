package kr.co.serendipity.model;

import java.util.HashMap;

public interface VisitDAO {
	//전체 방문자 증가
	public void setVisitTotalCount();
	
	//전체 방문자 수 조회
	public int getVisitTotalCount(int day);
	
	//오늘의 방문자수 조회
	public int getVisitTodayCount(int day);
	
	//오늘 날짜 조회
	public String getVisitDate(int day);
}

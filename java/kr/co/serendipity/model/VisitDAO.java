package kr.co.serendipity.model;

public interface VisitDAO {
	//전체 방문자 증가
	public void setVisitTotalCount();
	
	//전체 방문자 수 조회
	public int getVisitTotalCount();
	
	//오늘의 방문자수 조회
	public int getVisitTodayCount();
}

/*
 * @Class : VisitDAO
 * @Date : 16.06.24
 * @Author : 이소라
 * @Desc : 방문자수 통계에 이용되는 DAO
 */

package kr.co.serendipity.model.dao;

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

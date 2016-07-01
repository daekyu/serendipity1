/*
 * @Class : AdminDAO
 * @Date : 16.06.10
 * @Author : 강대규
 * @Desc : 관리자의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface AdminDAO {
	// 회원 목록을 가져오는 메소드
	public List<HashMap<String, Object>> getMemberList(); 
	
	//남자 회원수
	public int getMemberCountMale(); 
	
	//여자 회원수
	public int getMemberCountFemale(); 
	
	//월별 신고 횟수
	public int monthReportCount(int day) throws ClassNotFoundException, SQLException;
	
	//월별 가입자 수 
	public int monthJoinCount(int day) throws ClassNotFoundException, SQLException;
	
	//월별 가이드구함 게시판 게시글 수
	public int monthGuideCount(int day) throws ClassNotFoundException, SQLException;
	
	//월별 여행자구함 게시판 게시글 수
	public int monthTravelerCount(int day) throws ClassNotFoundException, SQLException;
	
	//월별 여행후기 게시판 게시글 수
	public int monthReviewCount(int day) throws ClassNotFoundException, SQLException;
	
	//오늘 날짜
	public String getVisitDate(int day) throws ClassNotFoundException, SQLException;
}

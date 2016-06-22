/*
 * @Class : AdminDAO
 * @Date : 16.06.10
 * @Author : 강대규
 * @Desc : 관리자의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.List;

public interface AdminDAO {
	List<MemberDTO> getMemberList(); // 회원 목록을 가져오는 메소드
	
	int getMemberCountMale(); //남자 회원수
	int getMemberCountFemale(); //여자 회원수
	
	//월별 신고 횟수
	public int monthReportCount(int month) throws ClassNotFoundException, SQLException;
	
	//월별 가입자 수 
	public int monthJoinCount(int month) throws ClassNotFoundException, SQLException;
	
	//월별 가이드구함 게시판 게시글 수
	public int monthGuideCount(int month) throws ClassNotFoundException, SQLException;
	
	//월별 여행자구함 게시판 게시글 수
	public int monthTravelerCount(int month) throws ClassNotFoundException, SQLException;
	
	//월별 여행후기 게시판 게시글 수
	public int monthReviewCount(int month) throws ClassNotFoundException, SQLException;
	
	//일별 방문자수
	public int dayVisitCount(int day) throws ClassNotFoundException, SQLException;
}

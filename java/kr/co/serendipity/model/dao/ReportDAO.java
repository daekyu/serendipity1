package kr.co.serendipity.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.co.serendipity.model.dto.ReportDTO;

/*
 * @Class : ReplyDAO
 * @Date : 16.06.15
 * @Author : 이소라
 * @Desc : 신고하기 DAO
 */

public interface ReportDAO {
	
	//신고하는 글쓰기
	public void reportWrite(ReportDTO reportdto) throws ClassNotFoundException, SQLException;
	
	//관리자 페이지에서 신고하는 글 상세보기
	public HashMap<String, Object> reportDetail(ReportDTO reportdto) throws ClassNotFoundException, SQLException;
	
	//관리자 페이지에서 신고하는 글 리스트보기
	public List<HashMap<String, Object>> reportList() throws ClassNotFoundException, SQLException;
	
	//신고글 갯수(페이징 할때)
	public int getReportListCount() throws ClassNotFoundException, SQLException;
	
	//신고하면 신고당한 사람 신고횟수 증가
	public void updateReportCount(ReportDTO reportdto) throws ClassNotFoundException, SQLException;
	
}

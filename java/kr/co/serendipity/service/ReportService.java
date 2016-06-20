package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.ReportDAO;
import kr.co.serendipity.model.ReportDTO;

@Service
public class ReportService {
	
	@Autowired
	SqlSession sqlsession;
	
	// 관리자 페이지에서 신고하는 글 상세보기
	public HashMap<String, Object> reportDetail(ReportDTO reportdto) throws ClassNotFoundException, SQLException {
		ReportDAO dao = sqlsession.getMapper(ReportDAO.class);
		return dao.reportDetail(reportdto);
	}

	// 관리자 페이지에서 신고하는 글 목록보기
	public List<HashMap<String, Object>> reportList() throws ClassNotFoundException, SQLException {
		ReportDAO dao = sqlsession.getMapper(ReportDAO.class);
		return dao.reportList();
	}
	
	public void reportWrite(ReportDTO reportdto) throws ClassNotFoundException, SQLException {
		ReportDAO dao = sqlsession.getMapper(ReportDAO.class);
		dao.reportWrite(reportdto);
	}
	
	public void updateReportCount(ReportDTO reportdto) throws ClassNotFoundException, SQLException {
		ReportDAO dao = sqlsession.getMapper(ReportDAO.class);
		dao.updateReportCount(reportdto);
	}

}

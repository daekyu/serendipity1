package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.AdminDAO;
import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.ReportDAO;

@Service
public class AdminService {
	@Autowired
	private SqlSession sqlsession;
	
	public List<MemberDTO> memberList(){
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.getMemberList();
	}
	
	public int getMemberCountMale(){
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.getMemberCountMale();
	}
	
	public int getMemberCountFemale(){
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.getMemberCountFemale();
	}
	
	public int monthReportCount(int month) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthReportCount(month);
	}
	
	public int monthJoinCount(int month) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthJoinCount(month);
	}
	
	public int monthGuideCount(int month) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthGuideCount(month);
	}
	
	public int monthTravelerCount(int month) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthTravelerCount(month);
	}
	
	public int monthReviewCount(int month) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthReviewCount(month);
	}
}
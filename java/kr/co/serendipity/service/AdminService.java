package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.dao.AdminDAO;
import kr.co.serendipity.model.dao.VisitDAO;

@Service
public class AdminService {
	@Autowired
	private SqlSession sqlsession;
	
	public List<HashMap<String, Object>> memberList(){
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class); //AdminDAO.xml
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
	
	public int monthReportCount(int day) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthReportCount(day);
	}
	
	public int monthJoinCount(int day) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthJoinCount(day);
	}
	
	public int monthGuideCount(int day) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthGuideCount(day);
	}
	
	public int monthTravelerCount(int day) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthTravelerCount(day);
	}
	
	public int monthReviewCount(int day) throws ClassNotFoundException, SQLException{
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.monthReviewCount(day);
	}
	
	public int getVisitTotalCount(int day){
		VisitDAO dao = sqlsession.getMapper(VisitDAO.class);
		return dao.getVisitTotalCount(day);
	}
	
	public int getVisitTodayCount(int day){
		VisitDAO dao = sqlsession.getMapper(VisitDAO.class);
		return dao.getVisitTodayCount(day);
	}
	
	public String getVisitDate(int day){
		VisitDAO dao = sqlsession.getMapper(VisitDAO.class);
		return dao.getVisitDate(day);
	}
}
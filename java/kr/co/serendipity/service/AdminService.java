package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.AdminDAO;
import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.ReportDAO;
import kr.co.serendipity.model.ReportDTO;

@Service
public class AdminService {
	@Autowired
	private SqlSession sqlsession;
	
	public List<MemberDTO> memberList(){
		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		return dao.getMemberList();
	}
	
}
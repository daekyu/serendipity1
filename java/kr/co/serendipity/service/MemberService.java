package kr.co.serendipity.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.CountryDTO;
import kr.co.serendipity.model.LocalDTO;
import kr.co.serendipity.model.MemberDAO;
import kr.co.serendipity.model.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<LocalDTO> localList() {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.localList();
	}
	
	public List<CountryDTO> countryList() {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.countryList();
	}
	
	public int joinMember(MemberDTO memberdto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.joinMember(memberdto);
	}
	
	public MemberDTO login(MemberDTO memberdto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.login(memberdto);
	}
	
	public int loginCheck(MemberDTO memberdto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.loginCheck(memberdto);
	}
	
	public int IdCheck(MemberDTO memberdto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.IdCheck(memberdto);
	}
	
	public MemberDTO checkFindIdEmailInfo(MemberDTO memberdto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.checkFindIdEmailInfo(memberdto);
	}
	
	public MemberDTO checkFindPwEmailInfo(MemberDTO memberdto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.checkFindPwEmailInfo(memberdto);
	}
	
	public void changeToTempPw(MemberDTO memberdto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.changeToTempPw(memberdto);
	}
}

package kr.co.serendipity.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.HobbyDTO;
import kr.co.serendipity.model.LanguageDTO;
import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.MyPageDAO;
import kr.co.serendipity.model.ParticipantDTO;

@Service
public class MyPageService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public MemberDTO myPageGetMemberInfo(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.myPageGetMemberInfo(memberdto);
	}
	
	public String parseLocal(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.parseLocal(memberdto);
	}
	
	public List parseLang(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.parseLang(memberdto);
	}
	
	public List parseHobby(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.parseHobby(memberdto);
	}
	
	public List<HobbyDTO> getHobbyList(){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.getHobbyList();
	}
	
	public List<LanguageDTO> getLanguageList(){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.getLanguageList();
	}
	
	public MemberDTO getMemberInfo(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.getMemberInfo(memberdto);
	}
	
	public ParticipantDTO sendHistory(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.sendHistory(memberdto);
	}
	
	public int countHobby(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.countHobby(memberdto);
	}
	
	public void deleteHobby(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.deleteHobby(memberdto);
	}
	
	public void insertHobby(MemberDTO memberdto, HobbyDTO hobbydto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.insertHobby(memberdto, hobbydto);
	}
	
	public int countLanguage(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.countLanguage(memberdto);
	}
	
	public void deleteLanguage(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.deleteLanguage(memberdto);
	}
	
	public void insertLanguage(MemberDTO memberdto, LanguageDTO languagedto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.insertLanguage(memberdto, languagedto);
	}
	
	public void updateContent(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.updateContent(memberdto);
	}
	
	public String selectPic(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.selectPic(memberdto);
	}
	
	public void updatePic(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.updatePic(memberdto);
	}
	
	public void updatePw(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.updatePw(memberdto);
	}
	
	public void updateHp(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.updateHp(memberdto);
	}
	
	public void updateEmail(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.updateEmail(memberdto);
	}
}

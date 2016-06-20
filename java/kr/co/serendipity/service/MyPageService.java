package kr.co.serendipity.service;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	public List<ParticipantDTO> sendHistory(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.sendHistory(memberdto);
	}
	
	public List<HashMap<String, Object>> acceptHistory(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.acceptHistory(memberdto);
	}
	
	public int countHobby(int user_num){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.countHobby(user_num);
	}
	
	public void deleteHobby(int user_num){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.deleteHobby(user_num);
	}
	
	public void insertHobby(int user_num, String hobbies){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		System.out.println("wkwkwkwkwkwkw : " + user_num);
		System.out.println("asdasdasdads" + hobbies);
		dao.insertHobby(user_num, hobbies);
		System.out.println("aaaaaaasswwwwwwwwwwwwwwwwwww");
	}
	
	public int countLanguage(int user_num){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.countLanguage(user_num);
	}
	
	public void deleteLanguage(int user_num){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.deleteLanguage(user_num);
	}
	
	public void insertLanguage(int user_num, String languages){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.insertLanguage(user_num, languages);
	}
	
	public void updateContent(int user_num, String profile_description){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.updateContent(user_num, profile_description);
	}
	
	public String selectPic(int user_num){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.selectPic(user_num);
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
	
	public List<String> writerName(List<ParticipantDTO> participantdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		List<String> wn = new ArrayList<String>();
		for(int i=0; i < participantdto.size(); i++){
			String writerName = dao.writerName(participantdto.get(i).getBoard_num());
			wn.add(writerName);
		}
		return wn;
	}
	
	public void deleteSendHistory(ParticipantDTO participantdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.deleteSendHistory(participantdto);
	}
	
	public void acceptRequest(ParticipantDTO participantdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.acceptRequest(participantdto);
	}
}

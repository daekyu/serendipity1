package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.dao.MyPageDAO;
import kr.co.serendipity.model.dto.BoardDTO;
import kr.co.serendipity.model.dto.HobbyDTO;
import kr.co.serendipity.model.dto.LanguageDTO;
import kr.co.serendipity.model.dto.MemberDTO;
import kr.co.serendipity.model.dto.ParticipantDTO;

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
	
	public List<String> parseLang(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.parseLang(memberdto);
	}
	
	public List<String> parseHobby(MemberDTO memberdto){
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
	
	public List<HashMap<String, Object>> sendHistory(MemberDTO memberdto, int page){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.sendHistory(memberdto, page);
	}
	
	public List<HashMap<String, Object>> acceptHistory(int un, int page){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.acceptHistory(un, page);
	}
	
	public int getAcceptListCount(MemberDTO memberdto) throws ClassNotFoundException, SQLException {
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.getAcceptListCount(memberdto);
	}
	
	public int getSendListCount(MemberDTO memberdto) throws ClassNotFoundException, SQLException {
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.getSendListCount(memberdto);
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
		dao.insertHobby(user_num, hobbies);
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
	
	public void updateSendHistory(ParticipantDTO participantdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.updateSendHistory(participantdto);
	}
	
	public void updateSendHistory2(ParticipantDTO participantdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.updateSendHistory2(participantdto);
	}
	
	public void acceptRequest(ParticipantDTO participantdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		dao.acceptRequest(participantdto);
	}
	
	public Integer acceptCount(BoardDTO boarddto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.acceptCount(boarddto);
	}
	
	public int getBoardCapacity(ParticipantDTO participantdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.getBoardCapacity(participantdto);
	}
	
	public String country(MemberDTO memberdto){
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		return dao.country(memberdto);
	}
}

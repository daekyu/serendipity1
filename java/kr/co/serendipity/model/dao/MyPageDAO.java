/*
 * @Class : MyPageDAO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : MyPage의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.co.serendipity.model.dto.BoardDTO;
import kr.co.serendipity.model.dto.HobbyDTO;
import kr.co.serendipity.model.dto.LanguageDTO;
import kr.co.serendipity.model.dto.MemberDTO;
import kr.co.serendipity.model.dto.ParticipantDTO;

public interface MyPageDAO {
	// 개인정보수정때 취미 목록을 가져오는 거
	public List<HobbyDTO> getHobbyList();
	
	// 개인정보수정때 언어 목록을 가져오는 거
	public List<LanguageDTO> getLanguageList();
	
	// 회원정보를 가져온는 메소드
	public MemberDTO getMemberInfo(MemberDTO memberdto);
	
	// mypage 를 위한 사용자 정보
	public MemberDTO myPageGetMemberInfo(MemberDTO memberdto);
	
	//추가 정보 수정 (DB에 저장된 취미가 있는지 체크)
	public int countHobby(int user_num);
	
	//추가 정보 수정 (DB에 저장된 취미가 없을 때) - 취미, 관심사
	public void insertHobby(int user_num, String hobbies);
	
	//추가 정보 수정 (DB에 이미 저장된 취미가 있을 때 우선 삭제)
	public void deleteHobby(int user_num);
	
	//추가 정보 수정 (DB에 저장된 언어가 있는지 체크)
	public int countLanguage(int user_num);
	
	//추가 정보 수정 (DB에 이미 저장된 언어가 있을 때 우선 삭제)
	public void deleteLanguage(int user_num);
	
	//추가 정보 수정 (DB에 저장된 언어가 없을 때)
	public void insertLanguage(int user_num, String languages);
	
	//추가 정보 수정 (DB에 저장된 자기소개가 있는지 체크)
	public void updateContent(int user_num, String profile_description);
	
	//기본 정보 수정 (비밀번호 수정)
	public void updatePw(MemberDTO memberdto);
	
	//기본 정보 수정 (전화번호 수정)
	public void updateHp(MemberDTO memberdto);
	
	//기본 정보 수정 (이메일 수정)
	public void updateEmail(MemberDTO memberdto);
	
	//추가 정보 수정 (프로필 사진 경로 저장)
	public void updatePic(MemberDTO memberdto);
	
	//추가 정보 수정 (전 프로필 사진 경로 불러오기 - 파일 삭제를 위해)
	public String selectPic(int user_num);
	
	//지역 코드를 받아 지역명 반환(지역)
	public String parseLocal(MemberDTO memberdto);
	
	//언어 코드를 받아 언어명 반환(언어)
	public List<String> parseLang(MemberDTO memberdto);
	
	//취미 코드를 받아 취미명 반환
	public List<String> parseHobby(MemberDTO memberdto);
	
	//보낸 요청 리스트
	public List<HashMap<String, Object>> sendHistory(MemberDTO memberdto, int page);
	
	//마이페이지 보낸 요청 글쓴이 이름 조인
	public String writerName(int board_num);
	
	//보낸 요청 받는 사람이 거절
	public void updateSendHistory(ParticipantDTO participantdto);
	
	//보낸 요청 보낸사람이 취소
	public void updateSendHistory2(ParticipantDTO participantdto);
	
	//받은 요청 리스트
	public List<HashMap<String, Object>> acceptHistory(int un, int page);
	
	//받은 요청 수락
	public void acceptRequest(ParticipantDTO participantdto);
	
	//받은 요청 페이징 총 받은 요청 수 accept
	public int getAcceptListCount(MemberDTO memberdto) throws ClassNotFoundException, SQLException;
	
	//받은 요청 페이징 총 받은 요청 수 send
	public int getSendListCount(MemberDTO memberdto) throws ClassNotFoundException, SQLException;
	
	//여행자 구함 글의 경우 수락한 인원수를 가져오기
	public Integer acceptCount(BoardDTO boarddto);
	
	//여행자 구함에서 해당글의 신청 가능 인원 수 불러오기
	public int getBoardCapacity(ParticipantDTO participantdto);
	
	//마이페이지 정보수정 국적 출력
	public String country(MemberDTO memberdto);
}

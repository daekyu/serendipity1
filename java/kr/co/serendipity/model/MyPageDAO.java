/*
 * @Class : MyPageDAO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : MyPage의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public interface MyPageDAO {
	List<HobbyDTO> getHobbyList();
	List<LanguageDTO> getLanguageList();
	MemberDTO getMemberInfo(MemberDTO memberdto);
	
	// mypage 를 위한 사용자 정보
	public MemberDTO myPageGetMemberInfo(MemberDTO memberdto);
	
	//추가 정보 수정 (DB에 저장된 취미가 있는지 체크)
	public int countHobby(MemberDTO memberdto);
	
	//추가 정보 수정 (DB에 저장된 취미가 없을 때) - 취미, 관심사
	public void insertHobby(MemberDTO memberdto, String hobbies);
	
	//추가 정보 수정 (DB에 이미 저장된 취미가 있을 때 우선 삭제)
	public void deleteHobby(MemberDTO memberdto);
	
	//추가 정보 수정 (DB에 저장된 언어가 있는지 체크)
	public int countLanguage(MemberDTO memberdto);
	
	//추가 정보 수정 (DB에 이미 저장된 언어가 있을 때 우선 삭제)
	public void deleteLanguage(MemberDTO memberdto);
	
	//추가 정보 수정 (DB에 저장된 언어가 없을 때)
	public void insertLanguage(MemberDTO memberdto, String languages);
	
	//추가 정보 수정 (DB에 저장된 자기소개가 있는지 체크)
	public void updateContent(MemberDTO memberdto);
	
	//기본 정보 수정 (비밀번호 수정)
	public void updatePw(MemberDTO memberdto);
	
	//기본 정보 수정 (전화번호 수정)
	public void updateHp(MemberDTO memberdto);
	
	//기본 정보 수정 (이메일 수정)
	public void updateEmail(MemberDTO memberdto);
	
	//추가 정보 수정 (프로필 사진 경로 저장)
	public void updatePic(MemberDTO memberdto);
	
	//추가 정보 수정 (전 프로필 사진 경로 불러오기 - 파일 삭제를 위해)
	public String selectPic(MemberDTO memberdto);
	
	//지역 코드를 받아 지역명 반환(지역)
	public String parseLocal(MemberDTO memberdto);
	
	//언어 코드를 받아 언어명 반환(언어)
	public List parseLang(MemberDTO memberdto);
	
	//취미 코드를 받아 취미명 반환
	public List parseHobby(MemberDTO memberdto);
	
	//보낸 요청 리스트
	public ParticipantDTO sendHistory(MemberDTO memberdto);
	
}

/*
 * @Class : MyPageDAO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : MyPage의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model;

import java.util.List;

public interface MyPageDAO {
	List<HobbyDTO> getHobbyList();
	List<LanguageDTO> getLanguageList();
	MemberDTO getMemberInfo(MemberDTO dto);
	
	// mypage 를 위한 사용자 정보
	public MemberDTO myPageGetMemberInfo(int user_num);
	
	//추가 정보 수정 (DB에 저장된 취미가 있는지 체크)
	public int countHobby(int user_num);
	
	//추가 정보 수정 (DB에 저장된 취미가 없을 때) - 취미, 관심사
	public void insertHobby(int user_num, String hobby);
	
	//추가 정보 수정 (DB에 이미 저장된 취미가 있을 때 우선 삭제)
	public void deleteHobby(int user_num);
	
	//추가 정보 수정 (DB에 저장된 언어가 있는지 체크)
	public int countLanguage(int user_num);
	
	//추가 정보 수정 (DB에 이미 저장된 언어가 있을 때 우선 삭제)
	public void deleteLanguage(int user_num);
	
	//추가 정보 수정 (DB에 저장된 언어가 없을 때)
	public void insertLanguage(int user_num, String language);
	
	//추가 정보 수정 (DB에 저장된 자기소개가 있는지 체크)
	public void updateContent(int user_num, String profile);
	
	//기본 정보 수정 (비밀번호 수정)
	public void updatePw(int user_num, String pw);
	
	//기본 정보 수정 (전화번호 수정)
	public void updateHp(int user_num, String hp);
	
	//기본 정보 수정 (이메일 수정)
	public void updateEmail(int user_num, String Email);
}

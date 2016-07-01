/*
 * @Class : MemberDAO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : Member의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model.dao;

import java.sql.SQLException;
import java.util.List;

import kr.co.serendipity.model.dto.CountryDTO;
import kr.co.serendipity.model.dto.LocalDTO;
import kr.co.serendipity.model.dto.MemberDTO;

public interface MemberDAO {
	// 회원가입시 지역번호를 출력할 수 있게 지역번호 목록을 가져오는 메소드
	public List<LocalDTO> localList(); 
	
	// 회원가입시 국가번호를 출력할 수 있게 국가번호 목록을 가져오는 메소드
	public List<CountryDTO> countryList(); 
	
	// 회원가입을 요청했을 때 실행되는 메소드
	public int joinMember(MemberDTO memberdto); 
	
	// 로그인할 때 실행되는 메소드
	public MemberDTO login(MemberDTO memberdto); 
	
	// 로그인할때 아이디/비밀번호 맞는지 체크
	public int loginCheck(MemberDTO memberdto); 
	
	// 회원가입시 아이디 중복검사
	public int IdCheck(MemberDTO memberdto);
	
	// 회원가입시 이메일 중복검사
	public int EmailCheck(MemberDTO memberdto);
	
	// 로그인시 비밀번호가 맞는지 검사
	public void ConfirmPassword(MemberDTO memberdto);
	
	// 아이디 찾을 때 이름, 이메일이 있는지 체크
	public MemberDTO checkFindIdEmailInfo(MemberDTO memberdto);
	
	// 비번 찾을 때 이름, 이메일, 아이디가 있는지 체크
	public MemberDTO checkFindPwEmailInfo(MemberDTO memberdto); 
	
	// 비번 찾을 때 임시비밀번호로 바꿈
	public void changeToTempPw(MemberDTO memberdto);
	
	// 회원탈퇴
	public void deleteMember(MemberDTO memberdto);
	
	// ???
	public MemberDTO selectPicture(MemberDTO memberdto) throws ClassNotFoundException, SQLException;
	
	// ???
	public void giveMemberRole(MemberDTO memberdto); // 권한부여하는 메소드
}

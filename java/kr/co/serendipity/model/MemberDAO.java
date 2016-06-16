/*
 * @Class : MemberDAO
 * @Date : 16.06.08
 * @Author : 강대규
 * @Desc : Member의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model;

import java.util.List;

public interface MemberDAO {
	List<LocalDTO> localList(); // 회원가입시 지역번호를 출력할 수 있게 지역번호 목록을 가져오는 메소드
	List<CountryDTO> countryList(); // 회원가입시 국가번호를 출력할 수 있게 국가번호 목록을 가져오는 메소드
	int joinMember(MemberDTO dto); // 회원가입을 요청했을 때 실행되는 메소드
	MemberDTO login(MemberDTO dto); // 로그인할 때 실행되는 메소드
	int loginCheck(MemberDTO memberdto); // 로그인할때 아이디/비밀번호 맞는지 체크
	int IdCheck(MemberDTO memberdto);
}

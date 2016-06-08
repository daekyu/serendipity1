package kr.co.serendipity.model;

import java.util.List;

public interface MemberDAO {
	List<LocalDTO> localList(); // 회원가입시 지역번호를 출력할 수 있게 지역번호 목록을 가져오는 메소드
	List<CountryDTO> countryList(); // 회원가입시 국가번호를 출력할 수 있게 국가번호 목록을 가져오는 메소드
	int joinMember(MemberDTO dto); // 회원가입을 요청했을 때 실행되는 메소드
	List<MemberDTO> login(MemberDTO dto); // 로그인할 때 실행되는 메소드
}

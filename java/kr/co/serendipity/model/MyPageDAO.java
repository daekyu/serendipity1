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
}

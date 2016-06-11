/*
 * @Class : AdminDAO
 * @Date : 16.06.10
 * @Author : 강대규
 * @Desc : 관리자의 CRUD작업을 담당하는 DAO 인터페이스
 */

package kr.co.serendipity.model;

import java.util.List;

public interface AdminDAO {
	List<MemberDTO> getMemberList(); // 회원 목록을 가져오는 메소드
}

/*
 * @Class : MainController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 로그인, 회원가입, 신고기능을 처리하기 위한 컨트롤러
 */

package kr.co.serendipity;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("join_login.htm")
	public String joinLogin() {
		return "/member/join_login";
	}
	
	/*@RequestMapping("join.htm")
	public */
}

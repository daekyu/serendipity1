/*
 * @Class : MainController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 로그인/회원가입 처리를 위한 컨트롤러
 */

package kr.co.serendipity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/")
public class MainController {
	
	@RequestMapping("join_login.htm")
	public String joinLogin() {
		return "/main/join_login";
	}
}

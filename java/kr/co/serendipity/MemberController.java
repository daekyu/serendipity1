/*
 * @Class : MainController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 로그인, 회원가입, 신고기능을 처리하기 위한 컨트롤러
 */

package kr.co.serendipity;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.MemberDAO;
import kr.co.serendipity.model.MemberDTO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("join_login.htm")
	public ModelAndView joinLogin() {
		ModelAndView mav = new ModelAndView("/member/join_login");
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		mav.addObject("local_list", dao.localList());
		mav.addObject("country_list", dao.countryList());
		return mav;
	}
	
	@RequestMapping(value="joinMember.htm", method=RequestMethod.POST)
	public String joinMember(MemberDTO dto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		dao.joinMember(dto);
		
		return "/member/join_login";
	}
	
	@RequestMapping(value="login.htm", method=RequestMethod.POST)
	public String login(MemberDTO dto, HttpSession session) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO member = dao.login(dto);

		if(member == null) {
			
		} else {
			session.setAttribute("id", member.getId());
			session.setAttribute("user_num", member.getUser_num());
			System.out.println("user_num : " + member.getUser_num() + "/" + member.getId() + "/" + member.getPw());
		}
		return "redirect:/index.htm";
	}
	
	@RequestMapping("logout.htm")
	public String logout() {
		return "/member/logout";
	}
	
	@RequestMapping("loginCheck.htm")
	public @ResponseBody int loginCheck(MemberDTO memberdto) {
		MemberDAO dao = sqlsession.getMapper(MemberDAO.class);
		return dao.loginCheck(memberdto);
	}
}

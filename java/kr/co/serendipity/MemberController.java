/*
 * @Class : MainController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 로그인, 회원가입, 신고기능을 처리하기 위한 컨트롤러
 */

package kr.co.serendipity;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.service.MemberService;
import kr.co.serendipity.util.EmailSender;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	@Autowired
	private EmailSender emailsender;
	
	@RequestMapping("join_login.htm")
	public ModelAndView joinLogin() {
		ModelAndView mav = new ModelAndView("/member/join_login");
		mav.addObject("local_list", memberservice.localList());
		mav.addObject("country_list", memberservice.countryList());
		return mav;
	}
	
	@RequestMapping(value="joinMember.htm", method=RequestMethod.POST)
	public String joinMember(MemberDTO memberdto) {
		memberservice.joinMember(memberdto);
		memberservice.giveMemberRole(memberdto);
		return "/member/join_login";
	}
	
	@RequestMapping(value="login.htm", method=RequestMethod.POST)
	public String login(MemberDTO memberdto, HttpSession session) {
		if(memberservice.login(memberdto) == null) {
			
		} else {
			session.setAttribute("id", memberservice.login(memberdto).getId());
			session.setAttribute("user_num", memberservice.login(memberdto).getUser_num());
			session.setAttribute("country_code", memberservice.login(memberdto).getCountry_code());
		}
		return "redirect:/index.htm";
	}
	
	@RequestMapping("logout.htm")
	public String logout() {
		return "/member/logout";
	}
	
	@RequestMapping("loginCheck.htm")
	public @ResponseBody int loginCheck(MemberDTO memberdto) {
		return memberservice.loginCheck(memberdto);
	}
	
	@RequestMapping("IdCheck.htm")
	public @ResponseBody int IdCheck(MemberDTO memberdto) {
		return memberservice.IdCheck(memberdto);
	}
	@RequestMapping("EmailCheck.htm")
	public @ResponseBody int EmailCheck(MemberDTO memberdto){
		return memberservice.EmailCheck(memberdto);
	}
	@RequestMapping("ConfirmPassword.htm")
	public @ResponseBody void ConfirmPassword(MemberDTO memberdto){
		memberservice.ConfirmPassword(memberdto);
	}
	
	@RequestMapping("recover_id_pw.htm")
	public String recoverAccount() {
		return "/member/recover_id_pw";
	}
	
	@RequestMapping("sendFindIdEmail.htm")
	public @ResponseBody MemberDTO sendFindIdEmail(MemberDTO memberdto) throws MessagingException {
		if(memberservice.checkFindIdEmailInfo(memberdto) == null) {
			return null;
		} else {
			MemberDTO member = new MemberDTO();
			member.setEmail(memberservice.checkFindIdEmailInfo(memberdto).getEmail());
			member.setId(memberservice.checkFindIdEmailInfo(memberdto).getId());
			emailsender.sendFindIDEmail(member);
			return memberservice.checkFindIdEmailInfo(memberdto);
		}
	}
	
	@RequestMapping("sendFindPwEmail.htm")
	public @ResponseBody MemberDTO sendFindPwEmail(MemberDTO memberdto) throws MessagingException {
		if(memberservice.checkFindPwEmailInfo(memberdto) == null) {
			return null;
		} else {
			MemberDTO member = new MemberDTO();
			member.setEmail(memberservice.checkFindPwEmailInfo(memberdto).getEmail());
			member.setId(memberservice.checkFindPwEmailInfo(memberdto).getId());
			member.setPw(emailsender.sendFindPWEmail(member));
			memberservice.changeToTempPw(member);
			return memberservice.checkFindPwEmailInfo(memberdto);
		}
	}


}
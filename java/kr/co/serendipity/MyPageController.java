/*
 * @Class : MyPageController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 마이페이지를 구성하는 컨트롤러
 */

package kr.co.serendipity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.BoardDAO;
import kr.co.serendipity.model.BoardDTO;
import kr.co.serendipity.model.MemberDAO;
import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.MyPageDAO;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	@Autowired
	private SqlSession sqlsession;

	@RequestMapping("my_page.htm")
	public String myPage(int user_num, Model model) throws IOException {
		System.out.println("myPage entrance");

		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		MemberDTO dto = dao.myPageGetMemberInfo(user_num);
		model.addAttribute("dto", dto);

		return "/mypage/my_page";
	}

	@RequestMapping("my_page_modifyform.htm")
	public ModelAndView modifyAccount(MemberDTO dto) {
		System.out.println("myPage_modifyform entrance");
		
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		ModelAndView mav = new ModelAndView("/mypage/my_page_modifyform");
		mav.addObject("hobby_list", dao.getHobbyList());
		mav.addObject("language_list", dao.getLanguageList());
		mav.addObject("member_info", dao.getMemberInfo(dto));
		return mav;
	}

	@RequestMapping("my_page_accept_history.htm")
	public String acceptHistory() {
		return "/mypage/my_page_accept_history";
	}

	@RequestMapping("my_page_send_history.htm")
	public String sendHistory() {
		return "/mypage/my_page_send_history";
	}

	@RequestMapping("my_page_notification.htm")
	public String showNotification() {
		return "/mypage/my_page_notification";
	}

	@RequestMapping("my_page_withdraw.htm")
	public String withdraw() {
		return "/mypage/my_page_withdraw";
	}

	@RequestMapping(value = "InfoModify.htm", method = RequestMethod.POST)
	public String infoModify(String[] hobby, String[] language, String profile, int user_num)
			throws ClassNotFoundException, SQLException {
		System.out.println("InfoModify.htm POST entrance");
		MyPageDAO dao = sqlsession.getMapper(MyPageDAO.class);
		
		if (hobby == null) {

		} else {
			int cnt = dao.countHobby(user_num);
			
			if (cnt != 0) {
				dao.deleteHobby(user_num);
			}
			for (int i = 0; i < hobby.length; i++) {
				dao.insertHobby(user_num, hobby[i]);
			}
		}

		if (language == null) {

		} else {
			int cnt = dao.countLanguage(user_num);
			if (cnt != 0) {
				dao.deleteLanguage(user_num);
			}
			for (int i = 0; i < language.length; i++) {
				dao.insertLanguage(user_num, language[i]);
			}
		}

		if (profile.equals("")) {

		} else {
			dao.updateContent(user_num, profile);
		}

		return "redirect:/mypage/my_page.htm?user_num="+user_num;
	}

}

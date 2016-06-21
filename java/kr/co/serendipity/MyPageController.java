/*
 * @Class : MyPageController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 마이페이지를 구성하는 컨트롤러
 */

package kr.co.serendipity;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.HobbyDTO;
import kr.co.serendipity.model.LanguageDTO;
import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.ParticipantDTO;
import kr.co.serendipity.service.MyPageService;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	@Autowired
	private MyPageService mypageservice;

	@RequestMapping("my_page.htm")
	public String myPage(MemberDTO memberdto, Model model) throws IOException {
		System.out.println("myPage entrance");
		
		MemberDTO dto = mypageservice.myPageGetMemberInfo(memberdto);
		String pic = dto.getProfile_picture();
		System.out.println("원본 사진명 : " + pic);
		String Slocal = mypageservice.parseLocal(dto);
		List Slang = mypageservice.parseLang(dto);
		List Shobby = mypageservice.parseHobby(dto);
		
		model.addAttribute("memberdto", dto);
		model.addAttribute("Slocal", Slocal);
		model.addAttribute("Slang", Slang);
		model.addAttribute("Shobby", Shobby);

		return "/mypage/my_page";
	}

	@RequestMapping("my_page_modifyform.htm")
	public ModelAndView modifyAccount(MemberDTO memberdto) {
		System.out.println("myPage_modifyform entrance");

		ModelAndView mav = new ModelAndView("/mypage/my_page_modifyform");
		mav.addObject("hobby_list", mypageservice.getHobbyList());
		mav.addObject("language_list", mypageservice.getLanguageList());
		mav.addObject("member_info", mypageservice.getMemberInfo(memberdto));
		return mav;
	}

	@RequestMapping("my_page_accept_history.htm")
	public String acceptHistory(MemberDTO memberdto, Model model, String pg) throws ClassNotFoundException, SQLException {
		System.out.println("acceptHistory entrance");
		System.out.println("user_num : " + memberdto.getUser_num());
		
		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		
		List<HashMap<String, Object>> participantdto = mypageservice.acceptHistory(memberdto, page);
		System.out.println("participantdto 완");
		int listCount = mypageservice.getAcceptListCount(memberdto);
		System.out.println("listCount : " + listCount);
		maxpage = (int) ((double) listCount / 10 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		model.addAttribute("participantdto", participantdto);
		
		// 위가 하는 첨가 model.addAttribute("board_list", board_list);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listCount", listCount);
		
		return "/mypage/my_page_accept_history";
	}

	@RequestMapping("my_page_send_history.htm")
	public String sendHistory(MemberDTO memberdto, Model model) {
		System.out.println("sendHistory entrance");
		System.out.println("user_num : " + memberdto.getUser_num());
		List<ParticipantDTO> participantdto = mypageservice.sendHistory(memberdto);
		/*List<String> writername = mypageservice.writerName(participantdto);*/
		
		model.addAttribute("participantdto", participantdto);
		/*model.addAttribute("writername", writername);*/
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
	public String infoModify(MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		System.out.println("InfoModify.htm POST entrance");
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		String[] hobbies = request.getParameterValues("hobby_code");
		String[] languages = request.getParameterValues("language_code");

		if (hobbies == null) {
			
		} else {
			
			int cnt = mypageservice.countHobby(user_num);

			if (cnt != 0) {
				mypageservice.deleteHobby(user_num);
			}
			for (int i = 0; i < hobbies.length; i++) {
				mypageservice.insertHobby(user_num, hobbies[i]);
			}
		}

		if (languages == null) {

		} else {
			int cnt = mypageservice.countLanguage(user_num);
			if (cnt != 0) {
				mypageservice.deleteLanguage(user_num);
			}
			for (int i = 0; i < languages.length; i++) {
				mypageservice.insertLanguage(user_num, languages[i]);
			}
		}
		
		String profile_description = request.getParameter("profile_description");
		if (profile_description.equals("")) {

		} else {
			mypageservice.updateContent(user_num, profile_description);
		}
		
		if(!request.getFile("profile_picture").isEmpty()){
			MultipartFile mf = request.getFile("profile_picture");
			System.out.println("mf.getSize() : " + mf.getSize());
			if(mf.getSize()!=0) {
				
				String uploadPath = request.getSession().getServletContext().getRealPath("resources/img/profile_picture");

				//업데이트 전 프로필 사진 삭제
				String beforeFile = mypageservice.selectPic(user_num);

				if(beforeFile != null){
					File file = new File(uploadPath+"\\"+beforeFile);
				    if(file.exists()){
				    	file.delete();
				    }
				}
				
				// 파일 업로드

				String fileName = mf.getOriginalFilename(); //파일명 얻기

				//업로드 파일명을 변경후 저장			
				String uploadedFileName =System.currentTimeMillis() + UUID.randomUUID().toString()+fileName;

				MemberDTO memberdto = new MemberDTO();
				memberdto.setUser_num(user_num);
			    memberdto.setProfile_picture(uploadedFileName);

			    mypageservice.updatePic(memberdto);
			    
			    //지정한주소에 파일 저장	    
			    if(mf.getSize() != 0) {	    	
			    	mf.transferTo(new File(uploadPath+"\\"+uploadedFileName));	    	
			    }
			}
		}
		return "redirect:/mypage/my_page.htm?user_num=" + user_num;
	}

	@RequestMapping(value = "InfoModify2.htm", method = RequestMethod.POST)
	public String infoModify2(MemberDTO memberdto) throws ClassNotFoundException, SQLException {
		System.out.println("InfoModify2.htm POST entrance");

		if (memberdto.getPw().equals("")) {
			
		} else {
			mypageservice.updatePw(memberdto);
		}

		if (memberdto.getHp().equals("")) {

		} else {
			mypageservice.updateHp(memberdto);
		}

		if (memberdto.getEmail().equals("")) {

		} else {
			mypageservice.updateEmail(memberdto);
		}

		return "redirect:/mypage/my_page.htm?user_num=" + memberdto.getUser_num();
	}
	
	@RequestMapping("delete_send_history.htm")
	public String deleteSendHistory(ParticipantDTO participantdto, String check) {
		System.out.println("deleteSendHistory entrance");
		System.out.println("user_num : " + participantdto.getUser_num());
		System.out.println("parti_num : " + participantdto.getParti_num());
		System.out.println("check : " + check);
		int check2 = Integer.parseInt(check);
		mypageservice.deleteSendHistory(participantdto);
		if(check2 == 2){
			return "redirect:/mypage/my_page_accept_history.htm?user_num=" + participantdto.getUser_num();
		}else{
			return "redirect:/mypage/my_page_send_history.htm?user_num=" + participantdto.getUser_num();
		}
	}
	
	@RequestMapping("acceptRequest.htm")
	public String acceptRequest(ParticipantDTO participantdto, HttpSession session) {
		System.out.println("acceptRequest entrance");
		System.out.println("parti_num : " + participantdto.getParti_num());
		mypageservice.acceptRequest(participantdto);
		return "redirect:/mypage/my_page_accept_history.htm?user_num=" + session.getAttribute("user_num");
	}

}

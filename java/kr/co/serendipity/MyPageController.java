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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.BoardDTO;
import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.ParticipantDTO;
import kr.co.serendipity.service.MemberService;
import kr.co.serendipity.service.MyPageService;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {

	@Autowired
	private MyPageService mypageservice;
	
	@Autowired
	private MemberService memberservice;

	@RequestMapping("my_page.htm")
	public String myPage(MemberDTO memberdto, Model model, HttpSession session) throws IOException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{		
			MemberDTO dto = mypageservice.myPageGetMemberInfo(memberdto);
			String pic = dto.getProfile_picture();
			String Slocal = mypageservice.parseLocal(dto);
			List Slang = mypageservice.parseLang(dto);
			List Shobby = mypageservice.parseHobby(dto);
			
			model.addAttribute("memberdto", dto);
			model.addAttribute("Slocal", Slocal);
			model.addAttribute("Slang", Slang);
			model.addAttribute("Shobby", Shobby);

			return "/mypage/my_page";
		}
	}

	@RequestMapping("my_page_modifyform.htm")
	public ModelAndView modifyAccount(MemberDTO memberdto, HttpSession session) {
		if(session.getAttribute("id") == null){
			ModelAndView mav = new ModelAndView("/member/join_login");
			return mav;
		}else{
			String country = mypageservice.country(memberdto);

			ModelAndView mav = new ModelAndView("/mypage/my_page_modifyform");
			mav.addObject("hobby_list", mypageservice.getHobbyList());
			mav.addObject("language_list", mypageservice.getLanguageList());
			mav.addObject("member_info", mypageservice.getMemberInfo(memberdto));
			mav.addObject("country", country);
			
			return mav;
		}
	}

	@RequestMapping("my_page_accept_history.htm")
	public String acceptHistory(MemberDTO memberdto, Model model, String pg, String check, HttpSession session) throws ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			int un = memberdto.getUser_num();
			int page = 1;
			int startpage = 0;
			int endpage = 0;
			int maxpage = 0;
			int check1 = 0;

			if (pg != null) {
				page = Integer.parseInt(pg);
			}
			if(check != null){
				check1 = Integer.parseInt(check);
			}

			List<HashMap<String, Object>> participantdto = mypageservice.acceptHistory(un, page);

			int listCount = mypageservice.getAcceptListCount(memberdto);

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
			model.addAttribute("check1", check1);
			
			return "/mypage/my_page_accept_history";
		}
	}

	@RequestMapping("my_page_send_history.htm")
	public String sendHistory(MemberDTO memberdto, Model model, String pg, HttpSession session) throws ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			int page = 1;
			int startpage = 0;
			int endpage = 0;
			int maxpage = 0;
			
			if (pg != null) {
				page = Integer.parseInt(pg);
			}
			
			List<HashMap<String, Object>> participantdto = mypageservice.sendHistory(memberdto, page);

			int listCount = mypageservice.getSendListCount(memberdto);

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
			
			return "/mypage/my_page_send_history";

		}
	}

	@RequestMapping("my_page_notification.htm")
	public String showNotification(HttpSession session) {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			return "/mypage/my_page_notification";
		}
	}
	
	@RequestMapping("my_page_withdraw.htm")
	public String withdrawForm(HttpSession session) {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			return "/mypage/my_page_withdraw";
		}
	}
	
	@RequestMapping("my_page_withdraw2.htm")
	public String deleteMember(MemberDTO memberdto,HttpServletRequest request, HttpSession session)throws ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			memberservice.deleteMember(memberdto);
			session.invalidate();
			return "redirect:/index.htm";
		}
	}
	@RequestMapping("my_page_withdraw3.htm")
	public String deleteMember2(MemberDTO memberdto,HttpServletRequest request, HttpSession session)throws ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			memberservice.deleteMember(memberdto);
			return "redirect:/admin/member_list.htm";
		}
	}

	@RequestMapping(value = "InfoModify.htm", method = RequestMethod.POST)
	public String infoModify(MultipartHttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
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
		
	}

	@RequestMapping(value = "InfoModify2.htm", method = {RequestMethod.POST,RequestMethod.GET})
	public String infoModify2(MemberDTO memberdto, HttpSession session) throws ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
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
	}
	
	@RequestMapping("delete_send_history.htm")
	public String deleteSendHistory(ParticipantDTO participantdto, String check, HttpSession session) {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			int check2 = Integer.parseInt(check);
			
			if(check2 == 2){
				mypageservice.updateSendHistory(participantdto);
				return "redirect:/mypage/my_page_accept_history.htm?user_num=" + participantdto.getUser_num();
			}else{
				mypageservice.updateSendHistory2(participantdto);
				return "redirect:/mypage/my_page_send_history.htm?user_num=" + participantdto.getUser_num();
			}
		}
	}
	
	@RequestMapping("acceptRequest.htm")
	public String acceptRequest(ParticipantDTO participantdto, HttpSession session, BoardDTO boarddto, String ctn, String pc) {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			int ctn1=0;
			int pc1 = 0;
			int check=0;
			
			if(ctn != null){
				ctn1 = Integer.parseInt(ctn);
			}
			
			if(!pc.isEmpty()){
				pc1 = Integer.parseInt(pc);
			}else{
				pc1=0;
			}

			if(ctn1 == 2){
				if(mypageservice.acceptCount(boarddto) == null){
						mypageservice.acceptRequest(participantdto);
				}else{
					int count = mypageservice.acceptCount(boarddto);
					int pull = mypageservice.getBoardCapacity(participantdto);

					int mi = pull-count;
					if(count >= pull){
						//여행자 구함의 경우 인원 초과하면 신청하지 못하게 해야함
						check=1;
					}else if(mi <= pc1){
						//여행자 구함의 경우 인원 초과하면 신청하지 못하게 해야함
						check=1;
					}else{
						mypageservice.acceptRequest(participantdto);
					}
				}
			}else{
				mypageservice.acceptRequest(participantdto);
			}
			
			return "redirect:/mypage/my_page_accept_history.htm?user_num=" + session.getAttribute("user_num") + "&check=" + check;
		}
	}
}

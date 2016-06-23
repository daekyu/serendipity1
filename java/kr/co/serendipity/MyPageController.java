/*
 * @Class : MyPageController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 마이페이지를 구성하는 컨트롤러
 */

package kr.co.serendipity;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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
	public String acceptHistory(MemberDTO memberdto, Model model, String pg, String check) throws ClassNotFoundException, SQLException {
		System.out.println("acceptHistory entrance");
		System.out.println("user_num : " + memberdto.getUser_num());
		
		int un = memberdto.getUser_num();
		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		int check1 = 0;
		System.out.println("un : " + un);
		
		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		if(check != null){
			check1 = Integer.parseInt(check);
		}
		System.out.println("page : " + page);
		
		List<HashMap<String, Object>> participantdto = mypageservice.acceptHistory(un, page);
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
		model.addAttribute("check1", check1);
		
		return "/mypage/my_page_accept_history";
	}

	@RequestMapping("my_page_send_history.htm")
	public String sendHistory(MemberDTO memberdto, Model model, String pg) throws ClassNotFoundException, SQLException {
		System.out.println("sendHistory entrance");
		System.out.println("user_num : " + memberdto.getUser_num());
		
		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		
		List<HashMap<String, Object>> participantdto = mypageservice.sendHistory(memberdto, page);
		System.out.println("participantdto 완");
		int listCount = mypageservice.getSendListCount(memberdto);
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
	public String acceptRequest(ParticipantDTO participantdto, HttpSession session, BoardDTO boarddto, String ctn, String pc) {
		System.out.println("acceptRequest entrance");
		System.out.println("parti_num : " + participantdto.getParti_num());
		//System.out.println("bn : " + bn);
		System.out.println("ctn : " + ctn);
		System.out.println("pc : " + pc);
		//int bn1=0;
		int ctn1=0;
		int pc1 = 0;
		int check=0;
		/*if(bn != null){
			bn1 = Integer.parseInt(bn);
		}*/
		
		if(ctn != null){
			ctn1 = Integer.parseInt(ctn);
		}
		
		if(!pc.isEmpty()){
			pc1 = Integer.parseInt(pc);
		}else{
			pc1=0;
		}
		System.out.println("ctn1 : " + ctn1);
		
		if(ctn1 == 2){
			System.out.println("여길 안타니?");
			//여기가 에러다
			//List<HashMap<String, Object>> acceptList = mypageservice.acceptCount(participantdto);
			//int ac = mypageservice.acceptCount(participantdto);
			System.out.println("mypageservice.acceptCount(boarddto) (count) : " + mypageservice.acceptCount(boarddto));
			if(mypageservice.acceptCount(boarddto) == null){
				System.out.println("boarddto = null 임");
				mypageservice.acceptRequest(participantdto);
			}else{
				int count = mypageservice.acceptCount(boarddto);
				int pull = mypageservice.getBoardCapacity(participantdto);
				System.out.println("count : " + count);
				System.out.println("pull : " + pull);
				if(count >= pull){
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

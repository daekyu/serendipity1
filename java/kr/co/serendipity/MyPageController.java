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
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String acceptHistory() {
		return "/mypage/my_page_accept_history";
	}

	@RequestMapping("my_page_send_history.htm")
	public String sendHistory(MemberDTO memberdto, Model model) {
		System.out.println("sendHistory entrance");
		ParticipantDTO dto = mypageservice.sendHistory(memberdto);
		
		model.addAttribute("participantdto", dto);
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
	public String infoModify(HobbyDTO hobbydto, LanguageDTO languagedto, MemberDTO memberdto,
			MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		System.out.println("InfoModify.htm POST entrance");
		System.out.println();
		
		String[] hobbies = request.getParameterValues("hobby_code");
		String[] languages = request.getParameterValues("language_code");
		if (hobbydto == null) {
			
		} else {
			
			int cnt = mypageservice.countHobby(memberdto);
			System.out.println("bbbbbbbbb : " + cnt);
			if (cnt != 0) {
				mypageservice.deleteHobby(memberdto);
			}
			for (int i = 0; i < hobbies.length; i++) {
				System.out.println("aaaaaaaaa : " + hobbies[i]);
				mypageservice.insertHobby(memberdto, hobbies[i]);
			}
		}

		if (languagedto == null) {

		} else {
			int cnt = mypageservice.countLanguage(memberdto);
			if (cnt != 0) {
				mypageservice.deleteLanguage(memberdto);
			}
			for (int i = 0; i < languages.length; i++) {
				mypageservice.insertLanguage(memberdto, languages[i]);
			}
		}

		if (memberdto.getProfile_description().equals("")) {

		} else {
			mypageservice.updateContent(memberdto);
		}

		MultipartFile mf = request.getFile("profile_picture");
		System.out.println("mf.getSize() : " + mf.getSize());
		if(mf.getSize()!=0) {
			
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/img/profile_picture");
		    //logger.info("실제 파일 업로드 경로 : "+uploadPath);
		    System.out.println("실제 파일 업로드 경로 : " + uploadPath);
			
			//업데이트 전 프로필 사진 삭제
			String beforeFile = mypageservice.selectPic(memberdto);
			System.out.println("beforeFile : " + beforeFile);
			if(beforeFile != null){
				File file = new File(uploadPath+"\\"+beforeFile);
			    if(file.exists()){
			    	file.delete();
			    }
			}
			
			// 파일 업로드
			System.out.println("파라미터이름 : " + mf.getName());
			System.out.println("파일명 : " + mf.getOriginalFilename());
		    System.out.println("파일사이즈 : " + mf.getSize());
		    
		    String name = mf.getName(); //필드 이름 얻기
			String fileName = mf.getOriginalFilename(); //파일명 얻기
			String contentType = mf.getContentType(); //컨텐츠 타입 얻기
			//업로드 파일명을 변경후 저장			
			String uploadedFileName =System.currentTimeMillis() 
					+ UUID.randomUUID().toString()+fileName;
			//fileName.substring(fileName.lastIndexOf("."))
		    memberdto.setProfile_picture(uploadedFileName);
		    /*dao.updatePic(user_num, uploadPath+"\\"+uploadedFileName);*/
		    mypageservice.updatePic(memberdto);
		    
		    //지정한주소에 파일 저장	    
		    if(mf.getSize() != 0) {	    	
		    	mf.transferTo(new File(uploadPath+"\\"+uploadedFileName));	    	
		    }
		}
		System.out.println();
		System.out.println();
		return "redirect:/mypage/my_page.htm?user_num=" + memberdto.getUser_num();
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

}

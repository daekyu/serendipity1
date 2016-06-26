/*
 * @Class : BoardController
 * @Date : 16.06.08
 * @Author : 源�誘쇨퇋
 * @Desc : �뿬�뻾�옄媛� 媛��씠�뱶 援ы븯�뒗 寃뚯떆�뙋 湲��벐湲�
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.BoardDTO;
import kr.co.serendipity.model.ParticipantDTO;
import kr.co.serendipity.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private BoardService boardservice;

	@RequestMapping("traveler_list.htm")
	public ModelAndView travelerList(String pg, String show, String sort) throws ClassNotFoundException, SQLException {
		int page = 1;
		int basicshow = 8;
		String basicsort= "board_num"; 
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;

		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		
		if (show != null) {
			basicshow = Integer.parseInt(show);
		}
		if (sort != null) {
			basicsort = sort;
		}
		
		System.out.println("show : " + show);
		System.out.println("basicshow : " + basicshow);
		System.out.println("sort : " + basicsort);
		List<HashMap<String, Object>> board_list = boardservice.getBoardList(page, basicshow, basicsort);
		
		/*if(basicsort.equals("price")){
			for(int i=0; i<board_list.size(); i++){
				HashMap<String, Object> bl = board_list.get(i);
			}
		}*/

		int listCount = boardservice.getListCount();

		maxpage = (int) ((double) listCount / basicshow + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		ModelAndView mav = new ModelAndView("/board/traveler_list");
		mav.addObject("board_list", board_list);
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listCount", listCount);
		mav.addObject("basicshow", basicshow);
		mav.addObject("basicsort", basicsort);

		return mav;
	}

	@RequestMapping("guide_list.htm")
	public ModelAndView guideList(String pg, String show, String sort) throws ClassNotFoundException, SQLException {
		int page = 1;
		int basicshow = 8;
		String basicsort = "board_num";
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;

		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		
		if (show != null) {
			basicshow = Integer.parseInt(show);
		}
		
		if (sort != null) {
			basicsort = sort;
		}
		System.out.println("basicsort : " + basicsort);

		List<HashMap<String, Object>> board_list = boardservice.getGBoardList(page,basicshow, basicsort);
		int listCount = boardservice.getGListCount();

		maxpage = (int) ((double) listCount / basicshow + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		ModelAndView mav = new ModelAndView("/board/guide_list");
		mav.addObject("board_list", board_list);
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listCount", listCount);
		mav.addObject("basicshow", basicshow);
		mav.addObject("basicsort", basicsort);

		return mav;
	}

	@RequestMapping(value = "guide_writeform.htm", method = RequestMethod.GET)
	public String guideWriteform(BoardDTO boarddto) {
		return "/board/guide_writeform";
	}

	@RequestMapping(value = "guide_writeform.htm", method = RequestMethod.POST)
	public String guideWriteform(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		boardservice.guideWriteFormPost(boarddto, request);
		return "redirect:/board/guide_list.htm";
	}

	@RequestMapping(value = "traveler_writeform.htm", method = RequestMethod.GET)
	public ModelAndView travelerWriteform(BoardDTO boarddto) {
		System.out.println("traveler_writeform entrance");
		ModelAndView mav = new ModelAndView("/board/traveler_writeform");
		mav.addObject("user_num", boarddto.getUser_num());
		return mav;
	} // 여행자글쓰기, 가이드글쓰기 왜 서로 다른지...?

	@RequestMapping(value = "traveler_writeform.htm", method = RequestMethod.POST)
	public String travelerWriteform(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		System.out.println("bbb : " + boarddto.getPrice());
		boardservice.travelerWriteFormPost(boarddto, request);
		return "redirect:/board/traveler_list.htm";
	}

	@RequestMapping(value = "traveler_detail.htm")
	public ModelAndView travelerDetail(BoardDTO boarddto, HttpSession session) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/board/travel_detail");
		List<ParticipantDTO> participantdto = boardservice.detailParticipant(boarddto);
		int user_num = (Integer)session.getAttribute("user_num");
		System.out.println("(session)user_num : " + user_num);
		int check=0;
		for(int i=0; i<participantdto.size(); i++){
			ParticipantDTO pd = participantdto.get(i);
			if(pd.getUser_num() == user_num){
				check=1;
			}
		}
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		mav.addObject("language",boardservice.getLanguages(boarddto));
		mav.addObject("hobby", boardservice.getHobbies(boarddto));
		mav.addObject("guide", boardservice.getGuide(boarddto));
		mav.addObject("check", check);
		return mav;
	}

	@RequestMapping(value = "guide_detail.htm")
	public ModelAndView guideDetail(BoardDTO boarddto, String check, HttpSession session) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/board/guide_detail");
		int check1 = 0;
		
		if(check != null){
			check1 = Integer.parseInt(check);
		}
		
		List<ParticipantDTO> participantdto = boardservice.detailParticipant(boarddto);
		int user_num = (Integer)session.getAttribute("user_num");
		System.out.println("(session)user_num : " + user_num);
		int realcheck=0;
		for(int i=0; i<participantdto.size(); i++){
			ParticipantDTO pd = participantdto.get(i);
			if(pd.getUser_num() == user_num){
				realcheck=1;
			}
		}
		
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		//총 수락된 인원의 수를 가져와야함
		mav.addObject("accept", boardservice.acceptCount(boarddto));
		mav.addObject("language",boardservice.getLanguages(boarddto));
		mav.addObject("hobby", boardservice.getHobbies(boarddto));
		mav.addObject("check1", check1);
		mav.addObject("realcheck", realcheck);
		return mav;
	}

	@RequestMapping(value = "board_delete.htm")
	public String boardDelete(BoardDTO boarddto, int check) throws ClassNotFoundException, SQLException {
		boardservice.boardDelete(boarddto);
		if (check == 1) {
			return "redirect:/board/traveler_list.htm";
		} else {
			return "redirect:/board/guide_list.htm";
		}
	}

	@RequestMapping(value = "guide_modify.htm", method = RequestMethod.GET)
	public ModelAndView modifyGuideForm(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/board/guide_modifyform");
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		return mav;
	}

	@RequestMapping(value = "guide_modify.htm", method = RequestMethod.POST)
	public String modifyGuideForm(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		List<MultipartFile> flist = request.getFiles("pic");

		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");

		if (flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < 5; i++) {

				String saveFileName = null;
				if (flist.get(i).getOriginalFilename().equals("")) {
					//filenames.add("no_picture");
				} else { // 이미지가 있으면
					String genId = UUID.randomUUID().toString();
					String originalfileName = flist.get(i).getOriginalFilename();

					saveFileName = genId + "_" + originalfileName;

					String savePath = realFolder + "\\" + saveFileName;

					flist.get(i).transferTo(new File(savePath));
					BoardDTO searchDto = boardservice.picSearch(boarddto);
					System.out.println("pic1 : " + searchDto.getBoard_picture1());
					System.out.println("searchBoard_num : " + searchDto.getBoard_num());
					System.out.println("boardPic1 : " + boarddto.getBoard_picture1());
					if(i == 0){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture1();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						System.out.println("여긴오지?");
						boardservice.picUpdate1(saveFileName, searchDto);
						System.out.println("여기는여");
					}else if(i == 1){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture2();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate2(saveFileName, searchDto);
					}else if(i == 2){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture3();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate3(saveFileName, searchDto);
					}else if(i == 3){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture4();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate4(saveFileName, searchDto);
					}else if(i == 4){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture5();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate5(saveFileName, searchDto);
					}
				}
			}
		}
		boardservice.Gupdate(boarddto);
		return "redirect:/board/guide_list.htm";
	}

	@RequestMapping(value = "traveler_modify.htm", method = RequestMethod.GET)
	public ModelAndView modifyTravelerForm(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/board/traveler_modifyform");
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		return mav;
	}

	@RequestMapping(value = "traveler_modify.htm", method = RequestMethod.POST)
	public String modifyTravelerForm(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		List<MultipartFile> flist = request.getFiles("pic");

		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");

		if (flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < 5; i++) {

				String saveFileName = null;
				if (flist.get(i).getOriginalFilename().equals("")) {
					//filenames.add("no_picture");
				} else { // 이미지가 있으면
					String genId = UUID.randomUUID().toString();
					String originalfileName = flist.get(i).getOriginalFilename();

					saveFileName = genId + "_" + originalfileName;

					String savePath = realFolder + "\\" + saveFileName;

					flist.get(i).transferTo(new File(savePath));
					BoardDTO searchDto = boardservice.picSearch(boarddto);
					if(i == 0){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture1();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate1(saveFileName, boarddto);
					}else if(i == 1){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture2();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate2(saveFileName, boarddto);
					}else if(i == 2){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture3();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate3(saveFileName, boarddto);
					}else if(i == 3){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture4();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate4(saveFileName, boarddto);
					}else if(i == 4){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_picture5();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						boardservice.picUpdate5(saveFileName, boarddto);
					}
				}
			}
		}
		boardservice.update(boarddto);
		return "redirect:/board/traveler_list.htm";
	}
	
	@RequestMapping(value = "travelerParty.htm")
	public ModelAndView travelerParty(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		System.out.println("travelerParty entrance");
		boardservice.travelerParty(boarddto);
		ModelAndView mav = new ModelAndView("redirect:/board/traveler_detail.htm?board_num=" + boarddto.getBoard_num());
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		return mav;
	}
	
	@RequestMapping(value = "guideParty.htm")
	public ModelAndView guideParty(HttpServletRequest request, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		System.out.println("guideParty entrance");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int user_num1 = Integer.parseInt(request.getParameter("user_num"));
		int many = Integer.parseInt(request.getParameter("many"));
		int check = 0;
		System.out.println("board_num : " + board_num);
		System.out.println("user_num1 : " + user_num1);
		System.out.println("many : " + many);
		boarddto.setBoard_num(board_num);
		System.out.println("boardservice.acceptCount(boarddto) (count) : " + boardservice.acceptCount(boarddto));
		if(boardservice.acceptCount(boarddto) == null){
			System.out.println("boarddto = null 임");
			boardservice.guideParty(board_num, user_num1, many);
		}else{
			int count = boardservice.acceptCount(boarddto);
			int pull = boardservice.getBoardCapacity(boarddto);
			System.out.println("count : " + count);
			System.out.println("pull : " + pull);
			if(count >= pull){
				//여행자 구함의 경우 인원 초과하면 신청하지 못하게 해야함
				//스크립트로 경고창
				check=1;
			}else{
				boardservice.guideParty(board_num, user_num1, many);
			}
		}
		ModelAndView mav = new ModelAndView("redirect:/board/guide_detail.htm?board_num=" + boarddto.getBoard_num() + "&check=" + check);
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		return mav;
	}
}

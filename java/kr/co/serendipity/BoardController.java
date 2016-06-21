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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.BoardDTO;
import kr.co.serendipity.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	private BoardService boardservice;

	@RequestMapping("traveler_list.htm")
	public ModelAndView travelerList(String pg, String show) throws ClassNotFoundException, SQLException {
		int page = 1;
		int basicshow = 6;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;

		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		
		if (show != null) {
			basicshow = Integer.parseInt(show);
		}
		System.out.println("show : " + show);
		System.out.println("basicshow : " + basicshow);
		List<HashMap<String, Object>> board_list = boardservice.getBoardList(page, basicshow);

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

		return mav;
	}

	@RequestMapping("guide_list.htm")
	public ModelAndView guideList(String pg, String show) throws ClassNotFoundException, SQLException {
		int page = 1;
		int basicshow = 6;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;

		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		
		if (show != null) {
			basicshow = Integer.parseInt(show);
		}

		List<HashMap<String, Object>> board_list = boardservice.getGBoardList(page,basicshow);
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
	public ModelAndView travelerDetail(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/board/travel_detail");
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		mav.addObject("language",boardservice.getLanguages(boarddto));
		mav.addObject("hobby", boardservice.getHobbies(boarddto));
		return mav;
	}

	@RequestMapping(value = "guide_detail.htm")
	public ModelAndView guideDetail(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/board/guide_detail");
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		mav.addObject("language",boardservice.getLanguages(boarddto));
		mav.addObject("hobby", boardservice.getHobbies(boarddto));
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
		int user_num = Integer.parseInt(request.getParameter("user_num"));
		int many = Integer.parseInt(request.getParameter("many"));
		boarddto.setBoard_num(board_num);
		boardservice.guideParty(board_num, user_num, many);
		ModelAndView mav = new ModelAndView("redirect:/board/traveler_detail.htm?board_num=" + boarddto.getBoard_num());
		mav.addObject("boarddto", boardservice.getBoardDetail(boarddto));
		return mav;
	}
}

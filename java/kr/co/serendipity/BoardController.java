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
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.BoardDAO;
import kr.co.serendipity.model.BoardDTO;
import kr.co.serendipity.model.ReportDAO;
import kr.co.serendipity.model.ReportDTO;
import kr.co.serendipity.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BoardService boardservice;

	@RequestMapping("traveler_list.htm")
	public String travelerList(String pg, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("travelerList entrance");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);

		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;

		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		System.out.println("pg = " + pg);
		System.out.println("page = " + page);

		List boardList = dao.getBoardList(page);

		int listCount = dao.getListCount();
		System.out.println("boardList : " + boardList.size());
		System.out.println("listCount : " + listCount);

		maxpage = (int) ((double) listCount / 6 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		model.addAttribute("list", boardList);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listCount", listCount);
		
		BoardDTO dto = (BoardDTO)boardList.get(0);
		System.out.println("page= " + page);
		System.out.println("maxpage= " + maxpage);
		System.out.println("startpage= " + startpage);
		System.out.println("endpage= " + endpage);
		System.out.println("img1 : " +dto.getBoard_Picture1() );

		return "/board/traveler_list";
	}

	@RequestMapping("guide_list.htm")
	public String guideList(String pg, Model model) throws ClassNotFoundException, SQLException {

		System.out.println("guideList entrance");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);

		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;

		if (pg != null) {
			page = Integer.parseInt(pg);
		}
		System.out.println("pg = " + pg);
		System.out.println("page = " + page);

		List boardList = dao.getGBoardList(page);
		int listCount = dao.getGListCount();
		System.out.println("boardList : " + boardList.size());
		System.out.println("listCount : " + listCount);

		maxpage = (int) ((double) listCount / 6 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		model.addAttribute("list", boardList);
		model.addAttribute("page", page);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("listCount", listCount);

		System.out.println("page= " + page);
		System.out.println("maxpage= " + maxpage);
		System.out.println("startpage= " + startpage);
		System.out.println("endpage= " + endpage);

		return "/board/guide_list";
	}

	@RequestMapping(value = "guide_writeform.htm", method = RequestMethod.GET)
	public String guideWriteform(String user_num, Model model) {
		System.out.println("guide_writeform GET entrance");
		return "/board/guide_writeform";
	}

	@RequestMapping(value = "guide_writeform.htm", method = RequestMethod.POST)
	public String guideWriteform(BoardDTO boarddto, MultipartHttpServletRequest request)
			throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		System.out.println("guide_writeform POST entrance");
		boardservice.guideWriteFormPost(boarddto, request);
		return "redirect:/board/guide_list.htm";
	}

	@RequestMapping(value = "traveler_writeform.htm", method = RequestMethod.GET)
	public String travelerWriteform(String user_num, Model model) {
		System.out.println("traveler_writeform GET entrance");
		System.out.println("user_num : " + user_num);

		model.addAttribute("user_num", user_num);
		return "/board/traveler_writeform";
	}

	@RequestMapping(value = "traveler_writeform.htm", method = RequestMethod.POST)
	public String travelerWriteform(BoardDTO boarddto, MultipartHttpServletRequest request)
			throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		System.out.println("traveler_writeform POST entrance");
		boardservice.travelerWriteFormPost(boarddto, request);
		return "redirect:/board/traveler_list.htm";
	}

	@RequestMapping(value = "traveler_detail.htm")
	public String travelerDetail(BoardDTO boarddto, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("travelerDetail entrance");
		System.out.println("board_num : " + boarddto.getBoard_Num());
		
		model.addAttribute("boarddto", boardservice.travelerDetail(boarddto));

		return "/board/travel_detail";
	}

	@RequestMapping(value = "guide_detail.htm")
	public String guideDetail(BoardDTO boarddto, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("guideDetail entrance");
		System.out.println("board_num : " + boarddto.getBoard_Num());
		
		model.addAttribute("boarddto", boardservice.guideDetail(boarddto));
		model.addAttribute("memberdto", boardservice.writerDetail(boarddto));
		return "/board/guide_detail";
	}

	@RequestMapping(value = "board_delete.htm")
	public String boardDelete(BoardDTO boarddto, int check) throws ClassNotFoundException, SQLException {
		System.out.println("boardDelete entrance");
		System.out.println("board_num : " + boarddto.getBoard_Num());
		System.out.println("check : " + check);
		
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
		mav.addObject("boarddto", boardservice.guideDetail(boarddto));

		return mav;
	}

	@RequestMapping(value = "guide_modify.htm", method = RequestMethod.POST)
	public String modifyGuideForm(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		//이거 변경 해야함
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		System.out.println("guide_modify.htm post");
		System.out.println("board_Num : " + boarddto.getBoard_Num());
		System.out.println("board_Content : " + boarddto.getBoard_Content());
		System.out.println("board_latitude : " + boarddto.getBoard_Latitude());
		System.out.println("board_longitude : " + boarddto.getBoard_Longitude());
		
		List<MultipartFile> flist = request.getFiles("pic");

		System.out.println("0번 파일 : " + flist.get(0).getOriginalFilename());
		System.out.println("1번 파일 : " + flist.get(1).getOriginalFilename());
		System.out.println("2번 파일 : " + flist.get(2).getOriginalFilename());
		System.out.println("3번 파일 : " + flist.get(3).getOriginalFilename());
		System.out.println("4번 파일 : " + flist.get(4).getOriginalFilename());

		System.out.println("flist.size() : " + flist.size());

		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");
		System.out.println("실제 파일 업로드 경로 : " + realFolder);
		if (flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < 5; i++) {

				String saveFileName = null;
				if (flist.get(i).getOriginalFilename().equals("")) {
					//filenames.add("no_picture");
				} else { // 이미지가 있으면
					String genId = UUID.randomUUID().toString();
					String originalfileName = flist.get(i).getOriginalFilename();

					System.out.println("filename : " + originalfileName);

					saveFileName = genId + "_" + originalfileName;

					String savePath = realFolder + "\\" + saveFileName;

					flist.get(i).transferTo(new File(savePath));
					BoardDTO searchDto = dao.picSearch(boarddto);
					if(i == 0){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture1();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate1(saveFileName, boarddto);
					}else if(i == 1){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture2();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate2(saveFileName, boarddto);
					}else if(i == 2){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture3();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate3(saveFileName, boarddto);
					}else if(i == 3){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture4();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate4(saveFileName, boarddto);
					}else if(i == 4){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture5();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate5(saveFileName, boarddto);
					}
				}
			}
		}
		
		dao.Gupdate(boarddto);
		return "redirect:/board/guide_list.htm";
	}

	@RequestMapping(value = "traveler_modify.htm", method = RequestMethod.GET)
	public ModelAndView modifyTravelerForm(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);

		ModelAndView mav = new ModelAndView("/board/traveler_modifyform");
		mav.addObject("boarddto", dao.getBoardDetail(boarddto));

		return mav;
	}

	@RequestMapping(value = "traveler_modify.htm", method = RequestMethod.POST)
	public String modifyTravelerForm(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		System.out.println("traveler_modify.htm post");
		System.out.println("board_Num : " + boarddto.getBoard_Num());
		System.out.println("board_Content : " + boarddto.getBoard_Content());
		System.out.println("board_latitude : " + boarddto.getBoard_Latitude());
		System.out.println("board_longitude : " + boarddto.getBoard_Longitude());
		
		List<MultipartFile> flist = request.getFiles("pic");

		System.out.println("0번 파일 : " + flist.get(0).getOriginalFilename());
		System.out.println("1번 파일 : " + flist.get(1).getOriginalFilename());
		System.out.println("2번 파일 : " + flist.get(2).getOriginalFilename());
		System.out.println("3번 파일 : " + flist.get(3).getOriginalFilename());
		System.out.println("4번 파일 : " + flist.get(4).getOriginalFilename());

		System.out.println("flist.size() : " + flist.size());

		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");
		System.out.println("실제 파일 업로드 경로 : " + realFolder);
		if (flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < 5; i++) {

				String saveFileName = null;
				if (flist.get(i).getOriginalFilename().equals("")) {
					//filenames.add("no_picture");
				} else { // 이미지가 있으면
					String genId = UUID.randomUUID().toString();
					String originalfileName = flist.get(i).getOriginalFilename();

					System.out.println("filename : " + originalfileName);

					saveFileName = genId + "_" + originalfileName;

					String savePath = realFolder + "\\" + saveFileName;

					flist.get(i).transferTo(new File(savePath));
					BoardDTO searchDto = dao.picSearch(boarddto);
					if(i == 0){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture1();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate1(saveFileName, boarddto);
					}else if(i == 1){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture2();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate2(saveFileName, boarddto);
					}else if(i == 2){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture3();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate3(saveFileName, boarddto);
					}else if(i == 3){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture4();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate4(saveFileName, boarddto);
					}else if(i == 4){
						//업데이트 전 프로필 사진 삭제
						String beforeFile = searchDto.getBoard_Picture5();
						if(beforeFile != null){
							File file = new File(realFolder+"\\"+beforeFile);
						    if(file.exists()){
						    	file.delete();
						    }
						}
						dao.picUpdate5(saveFileName, boarddto);
					}
				}
			}
		}
		
		dao.update(boarddto);
		return "redirect:/board/traveler_list.htm";
	}

	// 신고하는 글쓰기(가이드가 신고)
	@RequestMapping(value = "report_write1.htm", method = RequestMethod.POST)
	public String ReportWriteGuide(ReportDTO reportdto, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		ReportDAO dao = sqlSession.getMapper(ReportDAO.class);
		dao.ReportWrite(reportdto);
		dao.updateReportCount(reportdto);
		return "redirect:/board/guide_detail.htm?board_num=" + boarddto.getBoard_Num() + "&user_num=" + reportdto.getVillain();
	}

	// 신고하는 글쓰기(여행자가 신고)
	@RequestMapping(value = "report_write2.htm", method = RequestMethod.POST)
	public String ReportWriteTravler(ReportDTO reportdto, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		ReportDAO dao = sqlSession.getMapper(ReportDAO.class);
		dao.ReportWrite(reportdto);
		dao.updateReportCount(reportdto);
		return "redirect:/board/travel_detail.htm?board_num=" + boarddto.getBoard_Num() + "&user_num=" + reportdto.getVillain();
	}
	
	@RequestMapping(value = "travelerParty.htm")
	public ModelAndView travelerParty(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		System.out.println("travelerParty entrance");
		System.out.println("board_num : " + boarddto.getBoard_Num());
		System.out.println("user_num : " + boarddto.getUser_Num());
		
		dao.travelerParty(boarddto);
		ModelAndView mav = new ModelAndView("redirect:/board/traveler_detail.htm?board_num=" + boarddto.getBoard_Num());
		
		mav.addObject("boarddto", dao.getBoardDetail(boarddto));

		return mav;
	}
}

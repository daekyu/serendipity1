/*
 * @Class : BoardController
 * @Date : 16.06.08
 * @Author : 源�誘쇨퇋
 * @Desc : �뿬�뻾�옄媛� 媛��씠�뱶 援ы븯�뒗 寃뚯떆�뙋 湲��벐湲�
 */
package kr.co.serendipity;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
import kr.co.serendipity.model.MemberDAO;
import kr.co.serendipity.model.ReportDAO;
import kr.co.serendipity.model.ReportDTO;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("traveler_list.htm")
	public String travelerList(String pg, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("travelerList entrance");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		
		if(pg != null){
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
		
		System.out.println("page= " + page);
		System.out.println("maxpage= " + maxpage);
		System.out.println("startpage= " + startpage);
		System.out.println("endpage= " + endpage);
		
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
		
		
		if(pg != null){
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
	
	@RequestMapping(value="guide_writeform.htm", method=RequestMethod.GET)
	public String guideWriteform(String user_num, Model model) {
		System.out.println("guide_writeform GET entrance");
		
		model.addAttribute("user_num", user_num);
		return "/board/guide_writeform";
	}
	
	@RequestMapping(value="guide_writeform.htm", method=RequestMethod.POST)
	public String guideWriteform(BoardDTO dto) throws ClassNotFoundException, SQLException {
		System.out.println("guide_writeform POST entrance");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.Gwrite(dto);
		
		return "redirect:/board/guide_list.htm";
	}
	
	@RequestMapping(value="traveler_writeform.htm", method=RequestMethod.GET)
	public String travelerWriteform(String user_num, Model model) {
		System.out.println("traveler_writeform GET entrance");
		System.out.println("user_num : " + user_num);
		model.addAttribute("user_num", user_num);
		return "/board/traveler_writeform";
	}
	
	@RequestMapping(value="traveler_writeform.htm", method=RequestMethod.POST)
	public String travelerWriteform(BoardDTO dto) throws ClassNotFoundException, SQLException {
		System.out.println("traveler_writeform POST entrance");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.write(dto);
		
		return "redirect:/board/traveler_list.htm";
	}
	
	@RequestMapping(value="traveler_detail.htm")
	public String travelerDetail(int board_num, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("travelerDetail entrance");
		System.out.println("board_num : " + board_num);
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		BoardDTO dto = dao.getBoardDetail(board_num);
		model.addAttribute("dto", dto);
		
		return "/board/travel_detail";
	}
	
	@RequestMapping(value="guide_detail.htm")
	public String guideDetail(int board_num, int user_num, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("guideDetail entrance");
		System.out.println("board_num : " + board_num);
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);

		model.addAttribute("dto", dao.getBoardDetail(board_num));
		model.addAttribute("memberdto", dao.getWriterDetail(user_num));
		return "/board/guide_detail";
	}
	
	
	@RequestMapping(value="board_delete.htm")
	public String boardDelete(int board_num, int check) throws ClassNotFoundException, SQLException {
		System.out.println("boardDelete entrance");
		System.out.println("board_num : " + board_num);
		System.out.println("check : " + check);
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		dao.deleteBoard(board_num);
		
		if(check == 1){
			return "redirect:/board/traveler_list.htm";
		}else{
			return "redirect:/board/guide_list.htm";
		}
	}
	
	@RequestMapping(value="guide_modify.htm")
	public ModelAndView modifyGuideForm(int board_num) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		ModelAndView mav = new ModelAndView("/board/guide_modifyform");
		mav.addObject("dto", dao.getBoardDetail(board_num));
		
		return mav;
	}
	
	@RequestMapping(value="traveler_modify.htm", method=RequestMethod.GET)
	public ModelAndView modifyTravelerForm(int board_num) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		
		ModelAndView mav = new ModelAndView("/board/traveler_modifyform");
		mav.addObject("dto", dao.getBoardDetail(board_num));
		
		return mav;
	}
	

	@RequestMapping(value="traveler_modify.htm", method=RequestMethod.POST)
	public String modifyTravelerForm(BoardDTO dto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		System.out.println("traveler_modify.htm post");
		System.out.println("board_Num : " + dto.getBoard_Num());
		System.out.println("board_Content : " + dto.getBoard_Content());
		dao.update(dto);
		return "redirect:/board/traveler_list.htm";
	}

	// 신고하는 글쓰기(가이드가 신고)
	@RequestMapping(value = "report_write1.htm", method = RequestMethod.POST)
	public String ReportWriteGuide(ReportDTO dto, int board_num) throws ClassNotFoundException, SQLException {
		ReportDAO dao = sqlSession.getMapper(ReportDAO.class);
		dao.ReportWrite(dto);
		dao.updateReportCount(dto.getVillain());
		return "redirect:/board/guide_detail.htm?board_num=" + board_num + "&user_num=" + dto.getVillain();
	}

	// 신고하는 글쓰기(여행자가 신고)
	@RequestMapping(value = "report_write2.htm", method = RequestMethod.POST)
	public String ReportWriteTravler(ReportDTO dto, int board_num) throws ClassNotFoundException, SQLException {
		ReportDAO dao = sqlSession.getMapper(ReportDAO.class);
		dao.ReportWrite(dto);
		dao.updateReportCount(dto.getVillain());
		return "redirect:/board/travel_detail.htm?board_num=" + board_num + "&user_num=" + dto.getVillain();
	}
}

/*
 * @Class : BoardController
 * @Date : 16.06.08
 * @Author : 김민규
 * @Desc : 여행자가 가이드 구하는 게시판 글쓰기
 */
package kr.co.serendipity;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.serendipity.model.BoardDAO;
import kr.co.serendipity.model.BoardDTO;

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
		
		if(pg != null && pg.equals("")){
			page = Integer.parseInt(pg);
		}
		
		System.out.println("page = " + page);
		
		List boardList = dao.getBoardList(page);
		System.out.println("boardList : " + boardList.size());
		
		model.addAttribute("list", boardList);
		
		return "/board/traveler_list";
	}
	
	@RequestMapping("guide_list.htm")
	public String guideList() {
		return "/board/guide_list";
	}
	
	@RequestMapping("guide_writeform.htm")
	public String guideWriteform() {
		return "/board/guide_writeform";
	}
	
	@RequestMapping(value="traveler_writeform.htm", method=RequestMethod.GET)
	public String travelerWriteform() {
		System.out.println("traveler_writeform GET entrance");
		return "/board/traveler_writeform";
	}
	
	@RequestMapping(value="traveler_writeform.htm", method=RequestMethod.POST)
	public String travelerWriteform(BoardDTO dto) throws ClassNotFoundException, SQLException {
		System.out.println("traveler_writeform POST entrance");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.write(dto);
		
		return "redirect:/board/traveler_list.htm";
	}
}

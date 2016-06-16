/*
 * @Class : IndexController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : index화면으로 가기 위한 컨트롤러
 */

package kr.co.serendipity;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.BoardDAO;
import kr.co.serendipity.model.BoardDTO;


@Controller
public class IndexController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("index.htm")
	public ModelAndView index(HttpSession session) throws ClassNotFoundException, SQLException {
		
		System.out.println("index entrance");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		ModelAndView mav = new ModelAndView("index");
		
		List<BoardDTO> travelerList = dao.getIndexTravelerRecent();
		List<BoardDTO> guideList = dao.getIndexGuideRecent();
		
		int listCount = dao.getListCount();
		int GlistCount = dao.getGListCount();
		
		System.out.println("travelerList size : " + travelerList.size());
		
		mav.addObject("index", "index");
		mav.addObject("travelerList", travelerList);
		mav.addObject("guideList", guideList);
		mav.addObject("listCount", listCount);
		mav.addObject("GlistCount", GlistCount);


		return mav;
	}
	
}

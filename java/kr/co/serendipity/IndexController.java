/*
 * @Class : IndexController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : index화면으로 가기 위한 컨트롤러
 */

package kr.co.serendipity;

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
	public ModelAndView index(HttpSession session) {
		
		System.out.println("index entrance");
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		ModelAndView mav = new ModelAndView("index");
		
		List travelerList = dao.getIndexTravelerRecent();
		List guideList = dao.getIndexGuideRecent();
		
		System.out.println("travelerList size : " + travelerList.size());
		BoardDTO dto = (BoardDTO)travelerList.get(1);
		System.out.println(dto.getBoard_Content());
		
		mav.addObject("index", "index");
		mav.addObject("travelerList", travelerList);
		mav.addObject("guideList", guideList);


		return mav;
	}
	
}

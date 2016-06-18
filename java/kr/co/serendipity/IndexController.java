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
import kr.co.serendipity.service.IndexService;


@Controller
public class IndexController {
	
	@Autowired
	private IndexService indexservice;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("index.htm")
	public ModelAndView index(HttpSession session) throws ClassNotFoundException, SQLException {
		
		System.out.println("index entrance");
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("index", "index");
		mav.addObject("travelerList", indexservice.getIndexTravelerRecent());
		mav.addObject("guideList", indexservice.getIndexGuideRecent());
		mav.addObject("listCount", indexservice.getListCount());
		mav.addObject("GlistCount", indexservice.getGListCount());

		return mav;
	}
	
}

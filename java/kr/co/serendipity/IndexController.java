/*
 * @Class : IndexController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : index화면으로 가기 위한 컨트롤러
 */

package kr.co.serendipity;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.service.IndexService;


@Controller
public class IndexController {
	
	@Autowired
	private IndexService indexservice;
	
	@RequestMapping("index.htm")
	public ModelAndView index(HttpSession session) throws ClassNotFoundException, SQLException {
		
		System.out.println("index entrance");
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("index", "index");
		mav.addObject("traveler_list", indexservice.getIndexTravelerRecent());
		mav.addObject("guide_list", indexservice.getIndexGuideRecent());
		mav.addObject("list_count", indexservice.getListCount());
		mav.addObject("Glist_count", indexservice.getGListCount());
		mav.addObject("review_list", indexservice.getIndexReview());

		return mav;
	}
	
}

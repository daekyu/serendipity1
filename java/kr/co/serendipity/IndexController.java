/*
 * @Class : IndexController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : index화면으로 가기 위한 컨트롤러
 */

package kr.co.serendipity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class IndexController {
	
	@RequestMapping("index.htm")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("index", "index");
		return mav;
	}
	
}

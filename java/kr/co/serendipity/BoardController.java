/*
 * @Class : BoardController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 여행자/가이드를 구할 때 쓰는 게시판 컨트롤러
 */
package kr.co.serendipity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@RequestMapping("traveler_list.htm")
	public String travelerList() {
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
	
	@RequestMapping("traveler_writeform.htm")
	public String travelerWriteform() {
		return "/board/traveler_writeform";
	}
}

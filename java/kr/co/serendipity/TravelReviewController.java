/*
 * @Class : TravelReviewController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 여행후기 게시판 처리를 위한 컨트롤러
 */

package kr.co.serendipity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/travel_review/")
public class TravelReviewController {
	
	@RequestMapping("review_list.htm")
	public String reviewList() {
		return "/travel_review/review_list";
	}
}

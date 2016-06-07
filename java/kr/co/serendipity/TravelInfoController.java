/*
 * @Class : TravelInfoController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 여행정보를 보여주는 컨트롤러
 */

package kr.co.serendipity;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/travel_info/*")
public class TravelInfoController {
	
	@RequestMapping("travel_info.htm")
	public String travel_info() {
		return "/travel_info/travel_info";
	}
}

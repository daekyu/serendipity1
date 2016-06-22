/*
 * @Class : MainController
 * @Date : 16.06.10
 * @Author : 강대규
 * @Desc : 관리자의 기능을 처리하는 컨트롤러
 */

package kr.co.serendipity;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.service.AdminService;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	@RequestMapping("member_list.htm")
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView("/admin/admin_member_list_page");
		mav.addObject("member_list", adminservice.memberList());
		return mav;
	}
	
	@RequestMapping("stats_list.htm")
	public String statsList() {
		return "/admin/admin_stats_page";
	}
	
	@RequestMapping("member_gender_rate.htm")
	public @ResponseBody JSONObject memberGenderRate(){
		JSONObject rate = new JSONObject();
		ArrayList<Integer> genderRate = new ArrayList<Integer>();
		genderRate.add(adminservice.getMemberCountMale());
		genderRate.add(adminservice.getMemberCountFemale());
		rate.put("data", genderRate);
		return rate;
	}
}

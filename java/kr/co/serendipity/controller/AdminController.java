/*
 * @Class : MainController
 * @Date : 16.06.10
 * @Author : 이소라
 * @Desc : 관리자의 기능을 처리하는 컨트롤러
 */

package kr.co.serendipity.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	public ModelAndView memberList(HttpSession session) {
		if(!session.getAttribute("id").equals("admin")) {
			ModelAndView mav = new ModelAndView("/inc/hasNoAuthority");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/admin/admin_member_list_page");
			mav.addObject("member_list", adminservice.memberList());
			return mav;
		}
	}
	
	@RequestMapping("stats_list.htm")
	public String statsList(HttpSession session) {
		if(!session.getAttribute("id").equals("admin")) {
			return "/inc/hasNoAuthority";
		} else {
			return "/admin/admin_stats_page";
		}
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
	
	@RequestMapping("report_month_count.htm")
	public @ResponseBody JSONObject monthReportCount() throws ClassNotFoundException, SQLException{
		JSONObject monthCount = new JSONObject();
		ArrayList<Integer> count = new ArrayList<Integer>();
		ArrayList<String> day = new ArrayList<String>();
		for(int i=0; i<7; i++){
			count.add(adminservice.monthReportCount(i));
			day.add(adminservice.getVisitDate(i));
		}
		monthCount.put("count", count);
		monthCount.put("day", day);
		return monthCount;
	}
	
	@RequestMapping("join_month_count.htm")
	public @ResponseBody JSONObject monthJoinCount() throws ClassNotFoundException, SQLException{
		JSONObject joinCount = new JSONObject();
		ArrayList<Integer> count = new ArrayList<Integer>();
		ArrayList<String> day = new ArrayList<String>();
		for(int i=0; i<7; i++){
			count.add(adminservice.monthJoinCount(i));
			day.add(adminservice.getVisitDate(i));
		}
		joinCount.put("count", count);
		joinCount.put("day", day);
		return joinCount;
	}
	
	@RequestMapping("board_month_count.htm")
	public @ResponseBody JSONObject monthBoardCount() throws ClassNotFoundException, SQLException{
		JSONObject boardCount = new JSONObject();
		ArrayList<Integer> guideCount = new ArrayList<Integer>();
		ArrayList<Integer> travelerCount = new ArrayList<Integer>();
		ArrayList<Integer> reviewCount = new ArrayList<Integer>();
		for(int i=1; i<13; i++){
			guideCount.add(adminservice.monthGuideCount(i));
			travelerCount.add(adminservice.monthTravelerCount(i));
			reviewCount.add(adminservice.monthReviewCount(i));
		}
		boardCount.put("guide", guideCount);
		boardCount.put("traveler", travelerCount);
		boardCount.put("review", reviewCount);
		return boardCount;
	}
	
	@RequestMapping("visit_today_count.htm")
	public @ResponseBody JSONObject todayVisitCount(){
		JSONObject visitCount = new JSONObject();
		ArrayList<Integer> todayCount = new ArrayList<Integer>();
		ArrayList<String> day = new ArrayList<String>();
		for(int i=0; i<7; i++){
			todayCount.add(adminservice.getVisitTodayCount(i));
			day.add(adminservice.getVisitDate(i));
		}
		visitCount.put("visitCount", todayCount);
		visitCount.put("day", day);
		return visitCount;
	}
}

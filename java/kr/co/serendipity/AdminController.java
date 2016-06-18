/*
 * @Class : MainController
 * @Date : 16.06.10
 * @Author : 강대규
 * @Desc : 관리자의 기능을 처리하는 컨트롤러
 */

package kr.co.serendipity;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.service.AdminService;

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
	
	//관리자 페이지에서 신고하는 글 목록보기
	@RequestMapping("report_list.htm")
	public ModelAndView reportList() throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/admin/admin_report_list");
		mav.addObject("report_list", adminservice.reportList());
		return mav;
	}
	
	// 관리자 페이지에서 신고하는 글 상세보기
	@RequestMapping("report_detail.htm")
	public ModelAndView ReportDetail(int report_num) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/report/report_detail");
		mav.addObject("report_detail", adminservice.ReportDetail(report_num));
		return mav;
	}
}

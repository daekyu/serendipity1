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

import kr.co.serendipity.model.ReportDTO;
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
	
}

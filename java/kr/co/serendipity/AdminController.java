/*
 * @Class : MainController
 * @Date : 16.06.10
 * @Author : 강대규
 * @Desc : 관리자의 기능을 처리하는 컨트롤러
 */

package kr.co.serendipity;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.AdminDAO;
import kr.co.serendipity.model.ReportDAO;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("member_list.htm")
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView("/admin/admin_member_list_page");

		AdminDAO dao = sqlsession.getMapper(AdminDAO.class);
		mav.addObject("member_list", dao.getMemberList());
		return mav;
	}
	
	//관리자 페이지에서 신고하는 글 목록보기
	@RequestMapping("report_list.htm")
	public ModelAndView reportList() throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/admin/admin_report_list");
		ReportDAO dao = sqlsession.getMapper(ReportDAO.class);
		List<HashMap<String, Object>> list = dao.ReportList();
		mav.addObject("report_list", list);
		return mav;
	}
	
	// 관리자 페이지에서 신고하는 글 상세보기
	@RequestMapping("report_detail.htm")
	public ModelAndView ReportDetail(int report_num) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/report/report_detail");
		ReportDAO dao = sqlsession.getMapper(ReportDAO.class);
		HashMap<String, Object> report = dao.ReportDetail(report_num);
		mav.addObject("report_detail", report);
		return mav;
	}
}

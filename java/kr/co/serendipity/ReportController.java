package kr.co.serendipity;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.BoardDTO;
import kr.co.serendipity.model.ReportDTO;
import kr.co.serendipity.service.ReportService;

/*
 * @Class : ReportController
 * @Date : 16.06.15
 * @Author : 이소라
 * @Desc : 신고기능 컨트롤러
*/

@Controller
@RequestMapping("/report/")
public class ReportController {
	@Autowired
	ReportService reportservice;
		
	// 관리자 페이지에서 신고하는 글 목록보기
	@RequestMapping("report_list.htm")
	public ModelAndView reportList(HttpSession session) throws ClassNotFoundException, SQLException {
		if(!session.getAttribute("id").equals("admin")){
			ModelAndView mav = new ModelAndView("/inc/hasNoAuthority");
			return mav;
		}else{
			ModelAndView mav = new ModelAndView("/admin/admin_report_list");
			mav.addObject("report_list", reportservice.reportList());
			return mav;
		}
	}
	
	// 관리자 페이지에서 신고하는 글 상세보기
	@RequestMapping("report_detail.htm")
	public @ResponseBody HashMap<String, Object> reportDetail(ReportDTO reportdto, HttpSession session) throws ClassNotFoundException, SQLException {
		return reportservice.reportDetail(reportdto);
	}
	
	// 신고하는 글쓰기(여행자가 신고)
	@RequestMapping("report_write1.htm")
	public String ReportWriteTravler(ReportDTO reportdto, BoardDTO boarddto, HttpSession session) throws ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			reportservice.reportWrite(reportdto);
			reportservice.updateReportCount(reportdto);
			return "redirect:/board/travler_detail.htm?board_num=" + boarddto.getBoard_num() + "&user_num="
					+ reportdto.getVillain();
		}
	}
	
	// 신고하는 글쓰기(가이드가 신고)
	@RequestMapping("report_write2.htm")
	public String ReportWriteGuide(ReportDTO reportdto, BoardDTO boarddto, HttpSession session) throws ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null){
			return "/member/join_login";
		}else{
			reportservice.reportWrite(reportdto);
			reportservice.updateReportCount(reportdto);
			return "redirect:/board/guide_detail.htm?board_num=" + boarddto.getBoard_num() + "&user_num="
					+ reportdto.getVillain();
		}
	}
}
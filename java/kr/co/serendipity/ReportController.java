package kr.co.serendipity;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView reportList() throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/admin/admin_report_list");
		mav.addObject("report_list", reportservice.reportList());
		return mav;
	}

	// 관리자 페이지에서 신고하는 글 상세보기
	@RequestMapping("report_detail.htm")
	public ModelAndView ReportDetail(ReportDTO reportdto) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/report/report_detail");
		mav.addObject("report_detail", reportservice.ReportDetail(reportdto));
		return mav;
	}
	
	// 신고하는 글쓰기
	@RequestMapping(value = "report_write.htm", method = RequestMethod.POST)
	public String ReportWriteGuide(ReportDTO reportdto, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		reportservice.reportWrite(reportdto);
		reportservice.updateReportCount(reportdto);
		return "redirect:/board/guide_detail.htm?board_num=" + boarddto.getBoard_num() + "&user_num="
				+ reportdto.getVillain();
	}
	
}
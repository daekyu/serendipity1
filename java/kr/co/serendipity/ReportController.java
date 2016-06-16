package kr.co.serendipity;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

import kr.co.serendipity.model.BoardDAO;
import kr.co.serendipity.model.ReportDAO;
import kr.co.serendipity.model.ReportDTO;

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
	SqlSession sqlsession;
		
	//관리자 페이지에서 신고하는 글 상세보기
	@RequestMapping("report_detail.htm")
	public ModelAndView ReportDetail(int report_num) throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/report/report_detail");
		ReportDAO dao = sqlsession.getMapper(ReportDAO.class);
		HashMap<String, Object> report = dao.ReportDetail(report_num);
		mav.addObject("report",report);
		return mav;
	}
	
	//관리자 페이지에서 신고하는 글 리스트보기
	public ModelAndView ReportList() throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/admin/admin_report_list");
		ReportDAO dao = sqlsession.getMapper(ReportDAO.class);
		List<HashMap<String, Object>> list = dao.ReportList();
		mav.addObject("list", list);
		return mav;
	}
	
}

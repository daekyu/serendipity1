package kr.co.serendipity;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.ReviewDAO;
import kr.co.serendipity.model.ReviewDTO;

@Controller
@RequestMapping("/travel_review/")
public class ReviewController {
	@Autowired
	SqlSession sqlsession;
	
	//후기 글쓰기 페이지
	@RequestMapping("review_writeform.htm")
	public ModelAndView reviewWriteForm(){
		ModelAndView mav = new ModelAndView("/travel_review/review_writeform");
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		mav.addObject("local_list",dao.localList());
		return mav;
	}
	
	//글쓰기 처리 페이지
	@RequestMapping(value="review_write.htm", method=RequestMethod.POST)
	public String reviewWrite(ReviewDTO dto, HttpServletRequest request){
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewWrite(dto);
		return "/travel_review/review_list";
	}
}

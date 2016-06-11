/*
 * @Class : TravelReviewController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 여행후기 게시판 처리를 위한 컨트롤러
 */

package kr.co.serendipity;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
public class TravelReviewController {
	@Autowired
	SqlSession sqlsession;
	
	//게시판 목록
	@RequestMapping("review_list.htm")
	public ModelAndView reviewList(String pg) throws ClassNotFoundException, SQLException {
		System.out.println("reviewList entrance");
		ModelAndView mav = new ModelAndView("/travel_review/review_list");
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		
		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		System.out.println("pg = " + pg);
		System.out.println("page = " + page);
		
		List<ReviewDTO> reviewList = dao.reviewList();
		int listCount = dao.getReviewListCount();
		
		System.out.println("reviewList size : " + reviewList.size());
		System.out.println("listCount : " + listCount);
		
		maxpage = (int) ((double) listCount / 6 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;
		
		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		mav.addObject("reviewList",reviewList);
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listCount", listCount);
		
		System.out.println("page= " + page);
		System.out.println("maxpage= " + maxpage);
		System.out.println("startpage= " + startpage);
		System.out.println("endpage= " + endpage);
		return mav;
	}
	
	//게시글 상세보기
	@RequestMapping("review_detail.htm")
	public ModelAndView reviewDetail() throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/travel_review/review_detail");
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		ReviewDTO reviewdetail = dao.reviewDetail();
		mav.addObject("reviewdetail",reviewdetail);
		return mav;
	}

	// 후기 글쓰기 페이지
	@RequestMapping("review_writeform.htm")
	public ModelAndView reviewWriteForm() {
		ModelAndView mav = new ModelAndView("/travel_review/review_writeform");
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		mav.addObject("local_list", dao.localList());
		return mav;
	}

	// 글쓰기 처리 페이지
	@RequestMapping(value = "review_writeform.htm", method = RequestMethod.POST)
	public String reviewWrite(ReviewDTO dto, HttpServletRequest request)
			throws IOException, ClassNotFoundException, SQLException {

		/*
		 * System.out.println("실제 글 등록 처리"); System.out.println("title : " +
		 * dto.getReview_title()); System.out.println("content : " +
		 * dto.getReview_content()); System.out.println("picture1 : " +
		 * dto.getFiles().get(0).getName()); // 첨부 // 파일(CommonsMultipartFile //
		 * > // file) System.out.println("picture2 : " +
		 * dto.getFiles().get(1).getName());
		 * 
		 * // 추후 다중 파일 업로드 // <input type="file" name="files[0]" // <input
		 * type="file" name="files[1]" // files[0] > 1.jpg // files[1] > 2.jpg
		 * 
		 * List<CommonsMultipartFile> files = dto.getFiles(); List<String>
		 * filenames = new ArrayList<String>(); // 파일명만 추출
		 * 
		 * if (files != null && files.size() > 0) { // 업로드한 파일이 하나라도 있다면
		 * 
		 * for (CommonsMultipartFile multipartfile : files) {
		 * 
		 * String fname = multipartfile.getOriginalFilename(); // 파일명 얻기 String
		 * path = request.getSession().getServletContext().getRealPath(
		 * "/travel_review/upload"); String fullpath = path + "\\" + fname;
		 * 
		 * System.out.println(fname + " / " + path + " / " + fullpath);
		 * 
		 * if (!fname.equals("")) { // 서버에 파일 쓰기 작업 FileOutputStream fs = new
		 * FileOutputStream(fullpath); fs.write(multipartfile.getBytes());
		 * fs.close(); } filenames.add(fname); // 실 DB Insert 작업시 .. 파일명 }
		 * 
		 * }
		 * 
		 * // DB저장작업 // DB 저장할 파일 명 dto.setReview_picture1(filenames.get(0)); //
		 * 파일명 1 dto.setReview_picture2(filenames.get(1)); // 파일명 2
		 * dto.setReview_picture3(filenames.get(2)); // 파일명 3
		 * dto.setReview_picture4(filenames.get(3)); // 파일명 4
		 * dto.setReview_picture5(filenames.get(4)); // 파일명 5
		 * 
		 * // 실DB저장 // jdbcTemplate // noticeDao.insert(n);
		 * 
		 */
		System.out.println("title : " + dto.getReview_title());
		System.out.println("content : " + dto.getReview_content());
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewWrite(dto);
		return "redirect:/travel_review/review_list";
	}
}

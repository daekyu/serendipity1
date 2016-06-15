/*
 * @Class : TravelReviewController
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 컨트롤러
 */

package kr.co.serendipity;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.ReplyDAO;
import kr.co.serendipity.model.ReplyDTO;
import kr.co.serendipity.model.ReviewDAO;
import kr.co.serendipity.model.ReviewDTO;
import kr.co.serendipity.model.ReviewLikeDAO;
import kr.co.serendipity.model.ReviewLikeDTO;

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
	@RequestMapping(value="review_detail.htm", method=RequestMethod.GET)
	public ModelAndView reviewDetail(ReviewDTO dto, HttpSession session) throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/travel_review/review_detail");
		ReviewDAO reviewdao = sqlsession.getMapper(ReviewDAO.class);
		ReviewDTO reviewdetail = reviewdao.reviewDetail(dto);
		ReplyDAO replydao = sqlsession.getMapper(ReplyDAO.class);
		List<ReplyDTO> replylist = replydao.replyList(dto.getReview_num());
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		ReviewLikeDTO likedto = new ReviewLikeDTO();
		int user_num = (Integer)session.getAttribute("user_num");
		likedto.setReview_num(dto.getReview_num());
		likedto.setUser_num(user_num);
		int result = likedao.isLike(likedto);
		int count = likedao.reviewLikeCount(dto.getReview_num());
		mav.addObject("reviewdetail",reviewdetail);
		mav.addObject("replylist",replylist);
		mav.addObject("result",result);
		mav.addObject("count",count);
		return mav;
	}
	
	@RequestMapping(value="is_like.htm", method=RequestMethod.POST)
	public @ResponseBody int isLike(ReviewLikeDTO likedto) {
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		return likedao.isLike(likedto);
	}

	// 후기 글쓰기 페이지폼
	@RequestMapping("review_writeform.htm")
	public ModelAndView reviewWriteForm() {
		ModelAndView mav = new ModelAndView("/travel_review/review_writeform");
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		mav.addObject("local_list", dao.localList());
		return mav;
	}
	
	/*@RequestMapping(value="review_like.htm", method=RequestMethod.POST)
	public ModelAndView reviewLike(ReviewLikeDTO dto, HttpSession session) throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/travel_review/review_detail");
		ReviewDAO reviewdao = sqlsession.getMapper(ReviewDAO.class);
		int user_num = (Integer)session.getAttribute("user_num");
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(dto.getReview_num());
		reviewdto.setUser_num(user_num);
		ReviewDTO reviewdetail = reviewdao.reviewDetail(reviewdto);
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		likedao.likeInsert(dto);
		ReplyDAO replydao = sqlsession.getMapper(ReplyDAO.class);
		List<ReplyDTO> replylist = replydao.replyList();
		int result = likedao.isLike(dto);
		int count = likedao.reviewLikeCount(dto.getReview_num());
		mav.addObject("reviewdetail",reviewdetail);
		mav.addObject("replylist",replylist);
		mav.addObject("result",result);
		mav.addObject("count",count);
		return mav;
	}*/
	
	//좋아요 누르기
	@RequestMapping(value="review_like.htm", method=RequestMethod.POST)
	public @ResponseBody int reviewLike(ReviewLikeDTO dto) throws ClassNotFoundException, SQLException{
		//int user_num = (Integer)session.getAttribute("user_num");
		System.out.println("들어왔니?");
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		likedao.likeInsert(dto);
		System.out.println("review_num : "+dto.getReview_num());
		System.out.println("user_num : "+dto.getUser_num());
		List<Integer> list = null;
		//int result = likedao.isLike(dto);
		int count = likedao.reviewLikeCount(dto.getReview_num());
		return count;
	}
	
	/*@RequestMapping(value="delete_review_like.htm", method=RequestMethod.POST)
	public ModelAndView likeDelete(ReviewLikeDTO dto, HttpSession session) throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/travel_review/review_detail");
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		ReviewDAO reviewdao = sqlsession.getMapper(ReviewDAO.class);
		int user_num = (Integer)session.getAttribute("user_num");
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(dto.getReview_num());
		reviewdto.setUser_num(user_num);
		ReviewDTO reviewdetail = reviewdao.reviewDetail(reviewdto);
		likedao.likeDelete(dto);
		ReplyDAO replydao = sqlsession.getMapper(ReplyDAO.class);
		List<ReplyDTO> replylist = replydao.replyList();
		int result = likedao.isLike(dto);
		int count = likedao.reviewLikeCount(dto.getReview_num());
		mav.addObject("reviewdetail",reviewdetail);
		mav.addObject("replylist",replylist);
		mav.addObject("result",result);
		mav.addObject("count",count);
		return mav;
	}*/
	
	//좋아요 취소
	@RequestMapping(value="delete_review_like.htm", method=RequestMethod.POST)
	public @ResponseBody int likeDelete(ReviewLikeDTO dto) throws ClassNotFoundException, SQLException{
		System.out.println("들어왔니?");
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		//int user_num = (Integer)session.getAttribute("user_num");
		likedao.likeDelete(dto);
		System.out.println("review_num : "+dto.getReview_num());
		System.out.println("user_num : "+dto.getUser_num());
		//int result = likedao.isLike(dto);
		int count = likedao.reviewLikeCount(dto.getReview_num());
		return count;
	}
	
	// 댓글쓰기 
	@RequestMapping(value="review_detail.htm", method=RequestMethod.POST)
	public ModelAndView replyWrite(ReplyDTO dto) throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/travel_review/review_detail");
		ReviewDAO reviewdao = sqlsession.getMapper(ReviewDAO.class);
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(dto.getReview_num());
		reviewdto.setUser_num(dto.getUser_num());
		ReviewDTO reviewdetail = reviewdao.reviewDetail(reviewdto);
		ReplyDAO replydao = sqlsession.getMapper(ReplyDAO.class);
		replydao.replyWrite(dto);
		List<ReplyDTO> replylist = replydao.replyList(dto.getReview_num());
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		ReviewLikeDTO likedto = new ReviewLikeDTO();
		likedto.setReview_num(dto.getReview_num());
		likedto.setUser_num(dto.getUser_num());
		int result = likedao.isLike(likedto);
		int count = likedao.reviewLikeCount(likedto.getReview_num());
		mav.addObject("reviewdetail",reviewdetail);
		mav.addObject("replylist",replylist);
		mav.addObject("result",result);
		mav.addObject("count",count);
		return mav;
	}
	
	//댓글삭제
	@RequestMapping("reply_delete.htm")
	public String replyDelete(ReplyDTO dto) throws ClassNotFoundException, SQLException{
		ReplyDAO replydao = sqlsession.getMapper(ReplyDAO.class);
		replydao.replyDelete(dto);
		return "redirect:/travel_review/review_detail.htm?review_num="+dto.getReview_num()+"&user_num="+dto.getUser_num();
	}
	
	//여행후기 게시글 삭제
	@RequestMapping("review_delete.htm")
	public String reviewDelete(int review_num) throws ClassNotFoundException, SQLException{
		ReviewDAO reviewdao = sqlsession.getMapper(ReviewDAO.class);
		reviewdao.reviewDelete(review_num);
		return "redirect:/travel_review/review_list.htm";
	}

	// 글쓰기 처리 페이지
	@RequestMapping(value = "review_writeform.htm", method = RequestMethod.POST)
	public String reviewWrite(ReviewDTO dto, MultipartHttpServletRequest mrequest, HttpServletRequest request)
			throws IOException, ClassNotFoundException, SQLException {
		System.out.println("들어오니");
		
		List<MultipartFile> mflist = mrequest.getFiles("review_picture");
		List<String> filenames = new ArrayList<String>();
		
		System.out.println("0번째 : "+mflist.get(0).getOriginalFilename());
		System.out.println("1번째 : "+mflist.get(1).getOriginalFilename());
		System.out.println("2번째 : "+mflist.get(2).getOriginalFilename());
		System.out.println("3번째 : "+mflist.get(3).getOriginalFilename());
		System.out.println("4번째 : "+mflist.get(4).getOriginalFilename());
		
		String realFolder = mrequest.getSession().getServletContext().getRealPath("resources/img/review_upload");
        if (mflist.size()==1 && mflist.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < 5; i++){
            	
            		String saveFileName = null;
            		if(mflist.get(i).getOriginalFilename().equals("")){
            			filenames.add("사진없음");
            		}
            		else{
            		// 파일 중복명 처리
                    String genId = UUID.randomUUID().toString(); 
                    // 본래 파일명
                    String originalfileName = mflist.get(i).getOriginalFilename(); 
                    
                    System.out.println("filename : "+originalfileName);
                     
                    saveFileName = genId + "_" + originalfileName;
                    // 저장되는 파일 이름
     
                    String savePath = realFolder +"\\"+ saveFileName; // 저장 될 파일 경로
     
                    mflist.get(i).transferTo(new File(savePath)); // 파일 저장
                    filenames.add(saveFileName); // 실 DB Insert 작업시 .. 파일명
            	}
            }
        }
         
        for(int i=0; i<filenames.size(); i++){
        	System.out.println("filename : "+filenames.get(i));
        }
        dto.setReview_picture1(filenames.get(0)); // 파일명1
        dto.setReview_picture2(filenames.get(1)); // 파일명2
        dto.setReview_picture3(filenames.get(2)); // 파일명3
        dto.setReview_picture4(filenames.get(3)); // 파일명4
        dto.setReview_picture5(filenames.get(4)); // 파일명5
        
		System.out.println("title : " + dto.getReview_title());
		System.out.println("content : " + dto.getReview_content());
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewWrite(dto);
		return "redirect:/travel_review/review_list.htm";
	}
	
	@RequestMapping("review_updateform.htm")
	public ModelAndView updateReviewForm(ReviewDTO dto, HttpServletRequest request) throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/travel_review/review_modifyform");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		ReviewDTO review_dto = dao.reviewDetail(dto);
		mav.addObject("review_num", review_num);
		mav.addObject("review_dto",review_dto);
		mav.addObject("local_list", dao.localList());
		return mav;
	}
	
	@RequestMapping("review_update.htm")
	public ModelAndView modifyReview(ReviewDTO dto) throws ClassNotFoundException, SQLException {
		ModelAndView mav = new ModelAndView("/travel_review/review_modifyform");
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		mav.addObject("reviewdto", dao.reviewDetail(dto));
		
		return mav;
	}
}

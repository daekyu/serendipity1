/*
 * @Class : TravelReviewController
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 컨트롤러
 */

package kr.co.serendipity.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.dto.MemberDTO;
import kr.co.serendipity.model.dto.ReplyDTO;
import kr.co.serendipity.model.dto.ReviewDTO;
import kr.co.serendipity.model.dto.ReviewLikeDTO;
import kr.co.serendipity.service.TravelReviewService;

@Controller
@RequestMapping("/travel_review/")
public class TravelReviewController {
	
	@Autowired
	private TravelReviewService travelreviewservice;
	
	//여행후기 게시판 리스트
	@RequestMapping("review_list.htm")
	public ModelAndView reviewList(String pg, HttpServletRequest request, String order, HttpSession session) throws ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null) {
			ModelAndView mav = new ModelAndView("/member/join_login");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/travel_review/review_list");

			int page = 1;
			int startpage = 0;
			String basicorder = "review_num";
			int endpage = 0;
			int maxpage = 0;
			
			if(pg != null){
				page = Integer.parseInt(pg);
			}
			
			if(order != null){
				basicorder = order;
			}
			
			List<HashMap<String,Object>> reviewList = travelreviewservice.reviewList(page, basicorder);
			int listCount = travelreviewservice.getReviewListCount();

			maxpage = (int) ((double) listCount / 5 + 0.95);
			startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
			endpage = startpage + 10 - 1;
			
			if (endpage > maxpage) {
				endpage = maxpage;
			}
			String orderName = "";
			if(basicorder.equals("review_num")){
				orderName = "최신순";
			}
			if(basicorder.equals("like_count")){
				orderName = "좋아요순";
			}
			if(basicorder.equals("reply_count")){
				orderName = "댓글순";
			}
			
			mav.addObject("review_list",reviewList);
			mav.addObject("page", page);
			mav.addObject("maxpage", maxpage);
			mav.addObject("startpage", startpage);
			mav.addObject("endpage", endpage);
			mav.addObject("list_count", listCount);
			mav.addObject("local_list", travelreviewservice.localList());
			mav.addObject("basicorder", basicorder);
			mav.addObject("orderName", orderName);
			return mav;	
		}
	}
	
	//여행후기 게시판 상세보기 
	@RequestMapping(value="review_detail.htm", method=RequestMethod.GET)
	public ModelAndView reviewDetail(ReviewDTO reviewdto, HttpSession session) throws ClassNotFoundException, SQLException{
		if(session.getAttribute("id") == null) {
			ModelAndView mav = new ModelAndView("/member/join_login");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/travel_review/review_detail");
			
			ReviewLikeDTO reviewlikedto = new ReviewLikeDTO();
			reviewlikedto.setReview_num(reviewdto.getReview_num());
			reviewlikedto.setUser_num((Integer)session.getAttribute("user_num"));
			
			mav.addObject("review_detail",travelreviewservice.reviewDetail(reviewdto));
			mav.addObject("reply_list",travelreviewservice.replyList(reviewdto));
			mav.addObject("result",travelreviewservice.isLike(reviewlikedto));
			mav.addObject("count",travelreviewservice.reviewLikeCount(reviewdto));
			return mav;
		}
	}
	
	// 해당 사용자가 해당 게시글에 좋아요를 눌렀는가
	@RequestMapping(value="is_like.htm", method=RequestMethod.POST)
	public @ResponseBody int isLike(ReviewLikeDTO reviewlikedto) {
		return travelreviewservice.isLike(reviewlikedto);
	}

	// 여행후기 글쓰기 폼
	@RequestMapping("review_writeform.htm")
	public ModelAndView reviewWriteForm(HttpSession session) {
		if(session.getAttribute("id") == null) {
			ModelAndView mav = new ModelAndView("/member/join_login");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/travel_review/review_writeform");
			mav.addObject("local_list", travelreviewservice.localList());
			return mav;
		}
	}

	//좋아요 누르기
	@RequestMapping(value="review_like.htm", method=RequestMethod.POST)
	public @ResponseBody int reviewLike(ReviewLikeDTO reviewlikedto) throws ClassNotFoundException, SQLException{
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(reviewlikedto.getReview_num());
		travelreviewservice.likeInsertPlus(reviewdto);
		travelreviewservice.likeInsert(reviewlikedto);
		return travelreviewservice.reviewLikeCount(reviewdto);
	}
	
	//좋아요 취소
	@RequestMapping(value="delete_review_like.htm", method=RequestMethod.POST)
	public @ResponseBody int likeDelete(ReviewLikeDTO dto) throws ClassNotFoundException, SQLException{
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(dto.getReview_num());
		travelreviewservice.likeDeleteMinus(reviewdto);
		travelreviewservice.likeDelete(dto);
		int count = travelreviewservice.reviewLikeCount(reviewdto);
		return count;
	}
	
	// 댓글작성
	@RequestMapping(value="review_detail.htm", method=RequestMethod.POST)
	public String replyWrite(ReplyDTO dto, Model model, HttpSession session) throws ClassNotFoundException, SQLException{
		if(session.getAttribute("id") == null) {
			return "/member/join_login";
		} else {
			ReviewDTO reviewdto = new ReviewDTO();
			reviewdto.setReview_num(dto.getReview_num());
			reviewdto.setUser_num(dto.getUser_num());
			travelreviewservice.replyPlus(reviewdto);
			travelreviewservice.replyWrite(dto);
			ReviewLikeDTO likedto = new ReviewLikeDTO();
			likedto.setReview_num(dto.getReview_num());
			likedto.setUser_num(dto.getUser_num());
			
			model.addAttribute("review_detail", travelreviewservice.reviewDetail(reviewdto));
			model.addAttribute("reply_list", travelreviewservice.replyList(reviewdto));
			model.addAttribute("result", travelreviewservice.isLike(likedto));
			model.addAttribute("count", travelreviewservice.reviewLikeCount(reviewdto));
			return "redirect:/travel_review/review_detail.htm?review_num="+dto.getReview_num()+"&user_num="+dto.getUser_num();
		}
	}
	
	//댓글 삭제
	@RequestMapping("reply_delete.htm")
	public String replyDelete(ReplyDTO dto, HttpSession session) throws ClassNotFoundException, SQLException{
		if(session.getAttribute("id") == null) {
			return "/member/join_login";
		} else {
			ReviewDTO reviewdto = new ReviewDTO();
			reviewdto.setReview_num(dto.getReview_num());
			travelreviewservice.replyMinus(reviewdto);
			travelreviewservice.replyDelete(dto);
			return "redirect:/travel_review/review_detail.htm?review_num="+dto.getReview_num()+"&user_num="+dto.getUser_num();
		}
	}
	
	//여행후기 글삭제
	@RequestMapping("review_delete.htm")
	public String reviewDelete(ReviewDTO reviewdto, HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException, IllegalStateException, IOException{
		if(session.getAttribute("id") == null) {
			return "/member/join_login";
		} else {
			String realFolder = request.getSession().getServletContext().getRealPath("resources/img/review_upload");
			ReviewDTO beforePic = travelreviewservice.selectPicture(reviewdto);
			List<String> beforePics = new ArrayList<String>();
			beforePics.add(beforePic.getReview_picture1());
			beforePics.add(beforePic.getReview_picture2());
			beforePics.add(beforePic.getReview_picture3());
			beforePics.add(beforePic.getReview_picture4());
			beforePics.add(beforePic.getReview_picture5());
			
			for(int i=0; i<beforePics.size(); i++){
					File file = new File(realFolder+"\\"+beforePics.get(i));
				    if(file.exists()){
				    	file.delete();
				}
			}
			travelreviewservice.reviewDelete(reviewdto);
			return "redirect:/travel_review/review_list.htm";
		}
	}

	//여행후기 게시판 글쓰기
	@RequestMapping(value = "review_writeform.htm", method = RequestMethod.POST)
	public String reviewWrite(ReviewDTO dto, MultipartHttpServletRequest mrequest, HttpServletRequest request, HttpSession session) throws IOException, ClassNotFoundException, SQLException {
		if(session.getAttribute("id") == null) {
			return "/member/join_login";
		} else {
			List<MultipartFile> mflist = mrequest.getFiles("review_picture");
			List<String> filenames = new ArrayList<String>();
			
			String realFolder = mrequest.getSession().getServletContext().getRealPath("resources/img/review_upload");
	        if (mflist.size()==1 && mflist.get(0).getOriginalFilename().equals("")) {
	             
	        } else {
	            for (int i = 0; i < 5; i++){
	            	
	            		String saveFileName = null;
	            		if(mflist.get(i).getOriginalFilename().equals("")){
	            			filenames.add("사진없음");
	            		}
	            		else{
	            		
	                    String genId = UUID.randomUUID().toString(); 
	                   
	                    String originalfileName = mflist.get(i).getOriginalFilename(); 

	                    saveFileName = genId + "_" + originalfileName;
	                    
	     
	                    String savePath = realFolder +"\\"+ saveFileName; 
	     
	                    mflist.get(i).transferTo(new File(savePath)); 
	                    filenames.add(saveFileName); 
	            	}
	            }
	        }

	        dto.setReview_picture1(filenames.get(0)); // 파일명1
	        dto.setReview_picture2(filenames.get(1)); // 파일명2
	        dto.setReview_picture3(filenames.get(2)); // 파일명3
	        dto.setReview_picture4(filenames.get(3)); // 파일명4
	        dto.setReview_picture5(filenames.get(4)); // 파일명5
	        
			travelreviewservice.reviewWrite(dto);
			return "redirect:/travel_review/review_list.htm";
		}
	}
	
	@RequestMapping("review_updateform.htm")
	public ModelAndView updateReviewForm(ReviewDTO dto, HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException{
		if(session.getAttribute("id") == null) {
			ModelAndView mav = new ModelAndView("/member/join_login");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/travel_review/review_modifyform");
			mav.addObject("reviewdto",travelreviewservice.reviewDetail(dto));
			mav.addObject("local_list", travelreviewservice.localList());
			return mav;
		}
	}
	
	@RequestMapping("review_update.htm")
	public String updateReview(ReviewDTO reviewdto, MultipartHttpServletRequest mrequest, HttpServletRequest request, HttpSession session) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		if(session.getAttribute("id") == null) {
			return "/member/join_login";
		} else {
			List<MultipartFile> flist = mrequest.getFiles("review_picture");

			String realFolder = mrequest.getSession().getServletContext().getRealPath("resources/img/review_upload");

				for (int i = 0; i < 5; i++) {

					String saveFileName = null;
					if (flist.get(i).getOriginalFilename().equals("")) {
						
					} else { // 이미지가 있으면
						String genId = UUID.randomUUID().toString();
						String originalfileName = flist.get(i).getOriginalFilename();

						saveFileName = genId + "_" + originalfileName;

						String savePath = realFolder + "\\" + saveFileName;

						flist.get(i).transferTo(new File(savePath));
						ReviewDTO searchDto = travelreviewservice.selectPicture(reviewdto);
						if(i == 0){
							//업데이트 전 프로필 사진 삭제
							String beforeFile = searchDto.getReview_picture1();
							if(beforeFile != null){
								File file = new File(realFolder+"\\"+beforeFile);
							    if(file.exists()){
							    	file.delete();
							    }
							}
							reviewdto.setReview_picture1(saveFileName);
							travelreviewservice.reviewPic1Update(reviewdto);
						}else if(i == 1){
							//업데이트 전 프로필 사진 삭제
							String beforeFile = searchDto.getReview_picture2();
							if(beforeFile != null){
								File file = new File(realFolder+"\\"+beforeFile);
							    if(file.exists()){
							    	file.delete();
							    }
							}
							reviewdto.setReview_picture2(saveFileName);
							travelreviewservice.reviewPic2Update(reviewdto);
						}else if(i == 2){
							//업데이트 전 프로필 사진 삭제
							String beforeFile = searchDto.getReview_picture3();
							if(beforeFile != null){
								File file = new File(realFolder+"\\"+beforeFile);
							    if(file.exists()){
							    	file.delete();
							    }
							}
							reviewdto.setReview_picture3(saveFileName);
							travelreviewservice.reviewPic3Update(reviewdto);
						}else if(i == 3){
							//업데이트 전 프로필 사진 삭제
							String beforeFile = searchDto.getReview_picture4();
							if(beforeFile != null){
								File file = new File(realFolder+"\\"+beforeFile);
							    if(file.exists()){
							    	file.delete();
							    }
							}
							reviewdto.setReview_picture4(saveFileName);
							travelreviewservice.reviewPic4Update(reviewdto);
						}else if(i == 4){
							//업데이트 전 프로필 사진 삭제
							String beforeFile = searchDto.getReview_picture5();
							if(beforeFile != null){
								File file = new File(realFolder+"\\"+beforeFile);
							    if(file.exists()){
							    	file.delete();
							    }
							}
							reviewdto.setReview_picture5(saveFileName);
							travelreviewservice.reviewPic5Update(reviewdto);
						}
					}
				}
			travelreviewservice.reviewUpdate(reviewdto);
			return "redirect:/travel_review/review_list.htm";
		}
	}
	
	@RequestMapping("replyNotificationCheck.htm")
	public @ResponseBody List<HashMap<String, Object>> replyNotificationCheck(MemberDTO memberdto) throws ClassNotFoundException, SQLException {
		return travelreviewservice.replyNotificationCheck(memberdto);
	}
	
	@RequestMapping("changeReplyState.htm")
	public @ResponseBody int changeReplyNotification(ReplyDTO replydto) throws ClassNotFoundException, SQLException {
		return travelreviewservice.changeReplyNotificationState(replydto);
	}
	
	//여행후기 게시판 지역별로 필터링
	@RequestMapping("filteringReviewList.htm")
	public ModelAndView filteringReviewList(String local_code, HttpSession session) throws ClassNotFoundException, SQLException{
		if(session.getAttribute("id") == null) {
			ModelAndView mav = new ModelAndView("/member/join_login");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/travel_review/review_list");
			mav.addObject("review_list", travelreviewservice.filteringReviewList(local_code));
			mav.addObject("local_list", travelreviewservice.localList());
			mav.addObject("local_code", local_code);
			mav.addObject("local_name", travelreviewservice.getLocalName(local_code));
			return mav;
		}
	}
	
	@RequestMapping("likeNotificationCheck.htm")
	public @ResponseBody List<HashMap<String, Object>> likeNotificationCheck(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException {
		return travelreviewservice.likeNotificationCheck(reviewdto);
	}
	
	@RequestMapping("changeLikeState.htm")
	public void changeLikeState(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException {
		travelreviewservice.changeLikeState(reviewdto);
	}
}

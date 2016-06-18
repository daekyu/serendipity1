/*
 * @Class : TravelReviewController
 * @Date : 16.06.09
 * @Author : 이소라
 * @Desc : 여행후기 게시판 컨트롤러
 */

package kr.co.serendipity;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.serendipity.model.LocalDTO;
import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.ReplyDAO;
import kr.co.serendipity.model.ReplyDTO;
import kr.co.serendipity.model.ReviewDAO;
import kr.co.serendipity.model.ReviewDTO;
import kr.co.serendipity.model.ReviewLikeDAO;
import kr.co.serendipity.model.ReviewLikeDTO;
import kr.co.serendipity.service.TravelReviewService;

@Controller
@RequestMapping("/travel_review/")
public class TravelReviewController {
	@Autowired
	SqlSession sqlsession;
	
	@Autowired
	private TravelReviewService travelreviewservice;
	
	//여행후기 게시판 리스트
	@RequestMapping("review_list.htm")
	public ModelAndView reviewList(String pg, HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("reviewList entrance");
		ModelAndView mav = new ModelAndView("/travel_review/review_list");

		List<HashMap<String,Object>> reviewList = travelreviewservice.reviewList();
		int listCount = travelreviewservice.getReviewListCount();
		
		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}

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
		mav.addObject("local_list", travelreviewservice.localList());

		return mav;
	}
	
	//여행후기 게시판 상세보기 
	@RequestMapping(value="review_detail.htm", method=RequestMethod.GET)
	public ModelAndView reviewDetail(ReviewDTO reviewdto, HttpSession session) throws ClassNotFoundException, SQLException{
		ModelAndView mav = new ModelAndView("/travel_review/review_detail");
		
		ReviewLikeDTO reviewlikedto = new ReviewLikeDTO();
		reviewlikedto.setReview_num(reviewdto.getReview_num());
		reviewlikedto.setUser_num((Integer)session.getAttribute("user_num"));
		
		mav.addObject("review_detail",travelreviewservice.reviewDetail(reviewdto));
		mav.addObject("reply_list",travelreviewservice.replyList(reviewdto));
		mav.addObject("result",travelreviewservice.isLike(reviewlikedto));
		mav.addObject("count",travelreviewservice.reviewLikeCount(reviewdto));
		return mav;
	}//
	
	// 해당 사용자가 해당 게시글에 좋아요를 눌렀는가
	@RequestMapping(value="is_like.htm", method=RequestMethod.POST)
	public @ResponseBody int isLike(ReviewLikeDTO reviewlikedto) {
		return travelreviewservice.isLike(reviewlikedto);
	}

	// 여행후기 글쓰기 폼
	@RequestMapping("review_writeform.htm")
	public ModelAndView reviewWriteForm() {
		ModelAndView mav = new ModelAndView("/travel_review/review_writeform");
		mav.addObject("local_list", travelreviewservice.localList());
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
	public @ResponseBody int reviewLike(ReviewLikeDTO reviewlikedto) throws ClassNotFoundException, SQLException{
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(reviewlikedto.getReview_num());
		travelreviewservice.likeInsertPlus(reviewdto);
		travelreviewservice.likeInsert(reviewlikedto);
		return travelreviewservice.reviewLikeCount(reviewdto);
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
	/////////////////////여기까지함//////////////////////
	//좋아요 취소
	@RequestMapping(value="delete_review_like.htm", method=RequestMethod.POST)
	public @ResponseBody int likeDelete(ReviewLikeDTO dto) throws ClassNotFoundException, SQLException{
		System.out.println("�뱾�뼱�솕�땲?");
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(dto.getReview_num());
		likedao.likeDeleteMinus(reviewdto);
		likedao.likeDelete(dto);
		System.out.println("review_num : "+dto.getReview_num());
		System.out.println("user_num : "+dto.getUser_num());
		//int result = likedao.isLike(dto);
		int count = likedao.reviewLikeCount(reviewdto);
		return count;
	}
	
	// 댓글작성
	@RequestMapping(value="review_detail.htm", method=RequestMethod.POST)
	public String replyWrite(ReplyDTO dto, Model model) throws ClassNotFoundException, SQLException{
		ReviewDAO reviewdao = sqlsession.getMapper(ReviewDAO.class);
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(dto.getReview_num());
		reviewdto.setUser_num(dto.getUser_num());
		HashMap<String, Object> reviewdetail = reviewdao.reviewDetail(reviewdto);
		ReplyDAO replydao = sqlsession.getMapper(ReplyDAO.class);
		replydao.replyPlus(reviewdto);
		replydao.replyWrite(dto);
		List<HashMap<String, Object>> replylist = replydao.replyList(reviewdto);
		ReviewLikeDAO likedao = sqlsession.getMapper(ReviewLikeDAO.class);
		ReviewLikeDTO likedto = new ReviewLikeDTO();
		likedto.setReview_num(dto.getReview_num());
		likedto.setUser_num(dto.getUser_num());
		int result = likedao.isLike(likedto);
		int count = likedao.reviewLikeCount(reviewdto);
		
		model.addAttribute("review_detail", reviewdetail);
		model.addAttribute("reply_list", replylist);
		model.addAttribute("result", result);
		model.addAttribute("count", count);
		/*mav.addObject("reviewdetail",reviewdetail);
		mav.addObject("replylist",replylist);
		mav.addObject("result",result);
		mav.addObject("count",count);*/
		return "redirect:/travel_review/review_detail.htm?review_num="+dto.getReview_num()+"&user_num="+dto.getUser_num();
	}
	
	//댓글 삭제
	@RequestMapping("reply_delete.htm")
	public String replyDelete(ReplyDTO dto) throws ClassNotFoundException, SQLException{
		ReplyDAO replydao = sqlsession.getMapper(ReplyDAO.class);
		ReviewDTO reviewdto = new ReviewDTO();
		reviewdto.setReview_num(dto.getReview_num());
		replydao.replyMinus(reviewdto);
		replydao.replyDelete(dto);
		return "redirect:/travel_review/review_detail.htm?review_num="+dto.getReview_num()+"&user_num="+dto.getUser_num();
	}
	
	//여행후기 글삭제
	@RequestMapping("review_delete.htm")
	public String reviewDelete(int review_num, HttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException{
		ReviewDAO reviewdao = sqlsession.getMapper(ReviewDAO.class);
		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/review_upload");
		ReviewDTO beforePic = reviewdao.selectPicture(review_num);
		List<String> beforePics = new ArrayList<String>();
		beforePics.add(beforePic.getReview_picture1());
		beforePics.add(beforePic.getReview_picture2());
		beforePics.add(beforePic.getReview_picture3());
		beforePics.add(beforePic.getReview_picture4());
		beforePics.add(beforePic.getReview_picture5());
		
		for(int i=0; i<beforePics.size(); i++){
			System.out.println("before pics: "+beforePics.get(i));
				File file = new File(realFolder+"\\"+beforePics.get(i));
			    if(file.exists()){
			    	file.delete();
			}
		}
		reviewdao.reviewDelete(review_num);
		return "redirect:/travel_review/review_list.htm";
	}

	//여행후기 게시판 글쓰기
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
            		// �뙆�씪 以묐났紐� 泥섎━
                    String genId = UUID.randomUUID().toString(); 
                    // 蹂몃옒 �뙆�씪紐�
                    String originalfileName = mflist.get(i).getOriginalFilename(); 
                    
                    System.out.println("filename : "+originalfileName);
                     
                    saveFileName = genId + "_" + originalfileName;
                    // ���옣�릺�뒗 �뙆�씪 �씠由�
     
                    String savePath = realFolder +"\\"+ saveFileName; // ���옣 �맆 �뙆�씪 寃쎈줈
     
                    mflist.get(i).transferTo(new File(savePath)); // �뙆�씪 ���옣
                    filenames.add(saveFileName); // �떎 DB Insert �옉�뾽�떆 .. �뙆�씪紐�
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
		HashMap<String, Object> review_dto = dao.reviewDetail(dto);
		mav.addObject("reviewdto",review_dto);
		mav.addObject("local_list", dao.localList());
		return mav;
	}
	
	@RequestMapping("review_update.htm")
	public String updateReview(ReviewDTO dto, MultipartHttpServletRequest mrequest, HttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException {
		
		System.out.println("�뱾�뼱�삤�땲");
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String realFolder = mrequest.getSession().getServletContext().getRealPath("resources/img/review_upload");
		ReviewDTO beforePic = dao.selectPicture(review_num);
		List<String> beforePics = new ArrayList<String>();
		beforePics.add(beforePic.getReview_picture1());
		beforePics.add(beforePic.getReview_picture2());
		beforePics.add(beforePic.getReview_picture3());
		beforePics.add(beforePic.getReview_picture4());
		beforePics.add(beforePic.getReview_picture5());
		
		for(int i=0; i<beforePics.size(); i++){
			System.out.println("before pics: "+beforePics.get(i));
				File file = new File(realFolder+"\\"+beforePics.get(i));
			    if(file.exists()){
			    	file.delete();
			}
		}
		
		List<MultipartFile> mflist = mrequest.getFiles("review_picture");
		List<String> filenames = new ArrayList<String>();
		
		System.out.println("0踰덉㎏ : "+mflist.get(0).getOriginalFilename());
		System.out.println("1踰덉㎏ : "+mflist.get(1).getOriginalFilename());
		System.out.println("2踰덉㎏ : "+mflist.get(2).getOriginalFilename());
		System.out.println("3踰덉㎏ : "+mflist.get(3).getOriginalFilename());
		System.out.println("4踰덉㎏ : "+mflist.get(4).getOriginalFilename());
		
		
        if (mflist.size()==1 && mflist.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < 5; i++){
            	
            		String saveFileName = null;
            		if(mflist.get(i).getOriginalFilename().equals("")){
            			filenames.add("사진없음");
            		}
            		else{
            		// �뙆�씪 以묐났紐� 泥섎━
                    String genId = UUID.randomUUID().toString(); 
                    // 蹂몃옒 �뙆�씪紐�
                    String originalfileName = mflist.get(i).getOriginalFilename(); 
                    
                    System.out.println("filename : "+originalfileName);
                     
                    saveFileName = genId + "_" + originalfileName;
                    // ���옣�릺�뒗 �뙆�씪 �씠由�
     
                    String savePath = realFolder +"\\"+ saveFileName; // ���옣 �맆 �뙆�씪 寃쎈줈
     
                    mflist.get(i).transferTo(new File(savePath)); // �뙆�씪 ���옣
                    filenames.add(saveFileName); // �떎 DB Insert �옉�뾽�떆 .. �뙆�씪紐�
            	}
            }
        }
         
        for(int i=0; i<filenames.size(); i++){
        	System.out.println("filename : "+filenames.get(i));
        }
        dto.setReview_picture1(filenames.get(0)); // �뙆�씪紐�1
        dto.setReview_picture2(filenames.get(1)); // �뙆�씪紐�2
        dto.setReview_picture3(filenames.get(2)); // �뙆�씪紐�3
        dto.setReview_picture4(filenames.get(3)); // �뙆�씪紐�4
        dto.setReview_picture5(filenames.get(4)); // �뙆�씪紐�5
        
		System.out.println("title : " + dto.getReview_title());
		System.out.println("content : " + dto.getReview_content());
		
		
		dao.reviewUpdate(dto);
		return "redirect:/travel_review/review_list.htm";
	}
	
	@RequestMapping("replyNotificationCheck.htm")
	public @ResponseBody List<HashMap<String, Object>> replyNotificationCheck(MemberDTO memberdto) throws ClassNotFoundException, SQLException {
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		return dao.replyNotificationCheck(memberdto);
	}
	
	@RequestMapping("changeReplyState.htm")
	public @ResponseBody int changeReplyNotification(ReplyDTO replydto) throws ClassNotFoundException, SQLException {
		System.out.println("제발 여기좀 타자");
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		
		System.out.println("여기는 타는거니?");
		return dao.changeReplyNotificationState(replydto);
	}
	
	//여행후기 게시판 지역별로 필터링
	@RequestMapping("filteringReviewList.htm")
	public String filteringReviewList(String local_code ,Model model) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		List<LocalDTO> local_list = dao.localList();
		List<HashMap<String,Object>> reviewList = dao.filteringReviewList(local_code);
		model.addAttribute("review_list", reviewList);
		model.addAttribute("local_list", local_list);
		model.addAttribute("local_code", local_code);
		return "/travel_review/review_list";
	}
	
	//여행후기 게시판 리스트 정렬(최신순)
	@RequestMapping("orderReviewList1.htm")
	public String orderReviewList1(Model model) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		List<HashMap<String,Object>> reviewList = dao.orderReviewList1();
		List<LocalDTO> local_list = dao.localList();
		model.addAttribute("review_list", reviewList);
		model.addAttribute("local_list", local_list);
		model.addAttribute("order", "최신순");
		return "/travel_review/review_list";
	}
	
	// 여행후기 게시판 리스트 정렬(최신순)
	@RequestMapping("orderReviewList2.htm")
	public String orderReviewList2(Model model) throws ClassNotFoundException, SQLException {
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		List<HashMap<String, Object>> reviewList = dao.orderReviewList2();
		List<LocalDTO> local_list = dao.localList();
		model.addAttribute("review_list", reviewList);
		model.addAttribute("local_list", local_list);
		model.addAttribute("order", "좋아요순");
		return "/travel_review/review_list";
	}
	
	// 여행후기 게시판 리스트 정렬(최신순)
	@RequestMapping("orderReviewList3.htm")
	public String orderReviewList3(Model model) throws ClassNotFoundException, SQLException {
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		List<HashMap<String, Object>> reviewList = dao.orderReviewList3();
		List<LocalDTO> local_list = dao.localList();
		model.addAttribute("review_list", reviewList);
		model.addAttribute("local_list", local_list);
		model.addAttribute("order", "댓글순");
		return "/travel_review/review_list";
	}
}

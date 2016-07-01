package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.dao.ReplyDAO;
import kr.co.serendipity.model.dao.ReviewDAO;
import kr.co.serendipity.model.dao.ReviewLikeDAO;
import kr.co.serendipity.model.dto.LocalDTO;
import kr.co.serendipity.model.dto.MemberDTO;
import kr.co.serendipity.model.dto.ReplyDTO;
import kr.co.serendipity.model.dto.ReviewDTO;
import kr.co.serendipity.model.dto.ReviewLikeDTO;

@Service
public class TravelReviewService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<HashMap<String,Object>> reviewList(int page, String basicorder) throws ClassNotFoundException, SQLException {
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.reviewList(page, basicorder);
	}
	
	public int getReviewListCount() throws ClassNotFoundException, SQLException {
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.getReviewListCount();
	}
	
	public List<LocalDTO> localList() {
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.localList();
	}
	
	public HashMap<String, Object> reviewDetail(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException {
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.reviewDetail(reviewdto);
	}
	
	public List<HashMap<String, Object>> replyList(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException {
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		return dao.replyList(reviewdto);
	}
	
	public int isLike(ReviewLikeDTO reviewlikedto) {
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		return dao.isLike(reviewlikedto);
	}
	
	public int reviewLikeCount(ReviewDTO reviewdto) {
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		return dao.reviewLikeCount(reviewdto);
	}
	
	public void likeInsertPlus(ReviewDTO reviewdto) {
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		dao.likeInsertPlus(reviewdto);
	}
	
	public void likeInsert(ReviewLikeDTO reviewlikedto) {
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		dao.likeInsert(reviewlikedto);
	}
	
	public void likeDeleteMinus(ReviewDTO reviewdto){
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		dao.likeDeleteMinus(reviewdto);
	}
	
	public void likeDelete(ReviewLikeDTO reviewlikedto){
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		dao.likeDelete(reviewlikedto);
	}
	
	public void replyPlus(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		dao.replyPlus(reviewdto);
	}
	
	public void replyWrite(ReplyDTO replydto) throws ClassNotFoundException, SQLException{
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		dao.replyWrite(replydto);
	}
	
	public void replyMinus(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		dao.replyMinus(reviewdto);
	}
	
	public void replyDelete(ReplyDTO replydto) throws ClassNotFoundException, SQLException{
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		dao.replyDelete(replydto);
	}
	
	public ReviewDTO selectPicture(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.selectPicture(reviewdto);
	}
	
	public void reviewDelete(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewDelete(reviewdto);
	}
	
	public void reviewWrite(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewWrite(reviewdto);
	}
	
	public void reviewUpdate(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewUpdate(reviewdto);
	}
	
	public void reviewPic1Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewPic1Update(reviewdto);
	}
	
	public void reviewPic2Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewPic2Update(reviewdto);
	}
	
	public void reviewPic3Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewPic3Update(reviewdto);
	}
	
	public void reviewPic4Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewPic4Update(reviewdto);
	}
	
	public void reviewPic5Update(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		dao.reviewPic5Update(reviewdto);
	}
	
	public List<HashMap<String, Object>> replyNotificationCheck(MemberDTO memberdto) throws ClassNotFoundException, SQLException{
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		return dao.replyNotificationCheck(memberdto);
	}
	
	public int changeReplyNotificationState(ReplyDTO replydto) throws ClassNotFoundException, SQLException{
		ReplyDAO dao = sqlsession.getMapper(ReplyDAO.class);
		return dao.changeReplyNotificationState(replydto);
	}
	
	public List<HashMap<String,Object>> filteringReviewList(String local_code) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.filteringReviewList(local_code);
	}
	
	public String getLocalName(String local_code) throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.getLocalName(local_code);
	}
	
	public List<HashMap<String,Object>> likeNotificationCheck(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException {
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		return dao.likeNotificationCheck(reviewdto);
	}
	
	public void changeLikeState(ReviewDTO reviewdto) throws ClassNotFoundException, SQLException {
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		dao.changeLikeState(reviewdto);
	}
	
}

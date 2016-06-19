package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.LocalDTO;
import kr.co.serendipity.model.MemberDTO;
import kr.co.serendipity.model.ReplyDAO;
import kr.co.serendipity.model.ReplyDTO;
import kr.co.serendipity.model.ReviewDAO;
import kr.co.serendipity.model.ReviewDTO;
import kr.co.serendipity.model.ReviewLikeDAO;
import kr.co.serendipity.model.ReviewLikeDTO;

@Service
public class TravelReviewService {
	
	private SqlSession sqlsession;
	
	public List<HashMap<String,Object>> reviewList() throws ClassNotFoundException, SQLException {
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.reviewList();
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
	
	public List<HashMap<String,Object>> orderReviewList1() throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.orderReviewList1();
	}
	
	public List<HashMap<String,Object>> orderReviewList2() throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.orderReviewList2();
	}
	
	public List<HashMap<String,Object>> orderReviewList3() throws ClassNotFoundException, SQLException{
		ReviewDAO dao = sqlsession.getMapper(ReviewDAO.class);
		return dao.orderReviewList3();
	}
	
	
}
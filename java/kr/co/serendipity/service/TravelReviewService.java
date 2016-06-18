package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.LocalDTO;
import kr.co.serendipity.model.ReplyDAO;
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
	
	/*public int reviewLikeCount(ReviewDTO reviewdto) {
		ReviewLikeDAO dao = sqlsession.getMapper(ReviewLikeDAO.class);
		return dao.reviewLikeCount(reviewdto);
	}*/
	
}

package kr.co.serendipity.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.dao.TravelInfoDAO;
import kr.co.serendipity.model.dto.LocalDTO;
import kr.co.serendipity.model.dto.ReviewDTO;
import kr.co.serendipity.model.dto.TravelInfoDTO;

@Service
public class TravelInfoService {
	@Autowired
	private SqlSession sqlsession;
	
	public List<LocalDTO> getLocalList(){
		TravelInfoDAO dao = sqlsession.getMapper(TravelInfoDAO.class);
		return dao.getLocalList();
	}
	
	public TravelInfoDTO getLocalInfo(LocalDTO localdto){
		TravelInfoDAO dao = sqlsession.getMapper(TravelInfoDAO.class);
		return dao.getLocalInfo(localdto);
	}
	
	public List<ReviewDTO> getLocalReviewList(LocalDTO localdto){
		TravelInfoDAO dao = sqlsession.getMapper(TravelInfoDAO.class);
		return dao.getLocalReviewList(localdto);
	}
	
	public int getCountLocalReviewList(LocalDTO localdto){
		TravelInfoDAO dao = sqlsession.getMapper(TravelInfoDAO.class);
		return dao.getCountLocalReviewList(localdto);
	}
}

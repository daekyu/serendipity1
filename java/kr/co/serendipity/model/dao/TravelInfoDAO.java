package kr.co.serendipity.model.dao;

import java.util.List;

import kr.co.serendipity.model.dto.LocalDTO;
import kr.co.serendipity.model.dto.ReviewDTO;
import kr.co.serendipity.model.dto.TravelInfoDTO;

public interface TravelInfoDAO {
	// 지역 목록을 가져오는 메소드
	public List<LocalDTO> getLocalList();
	
	// 지역정보를 가져오는 메소드
	public TravelInfoDTO getLocalInfo(LocalDTO localdto);
	
	//지역별 인기 여행기 상위3개 추천
	public List<ReviewDTO> getLocalReviewList(LocalDTO localdto);
	
	//지역별 인기 여행기 갯수
	public int getCountLocalReviewList(LocalDTO localdto);
}

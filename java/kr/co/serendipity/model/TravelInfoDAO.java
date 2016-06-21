package kr.co.serendipity.model;

import java.util.List;

public interface TravelInfoDAO {
	List<LocalDTO> getLocalList();
	TravelInfoDTO getLocalInfo(LocalDTO localdto);
	
	//지역별 인기 여행기 상위3개 추천
	List<ReviewDTO> getLocalReviewList(LocalDTO localdto);
	
	//지역별 인기 여행기 갯수
	int getCountLocalReviewList(LocalDTO localdto);
}

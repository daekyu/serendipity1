package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.List;

public interface ReviewDAO {
	//여행후기 쓰기
	public int reviewWrite(ReviewDTO dto);
	
	//여행후기 작성시 지역 받아오기
	List<LocalDTO> localList();
	
}

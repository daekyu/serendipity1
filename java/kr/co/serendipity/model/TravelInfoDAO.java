package kr.co.serendipity.model;

import java.util.List;

public interface TravelInfoDAO {
	List<LocalDTO> getLocalList();
	TravelInfoDTO getLocalInfo(String local_code);
}
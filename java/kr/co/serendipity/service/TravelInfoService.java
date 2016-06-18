package kr.co.serendipity.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.LocalDTO;
import kr.co.serendipity.model.TravelInfoDAO;
import kr.co.serendipity.model.TravelInfoDTO;

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
}

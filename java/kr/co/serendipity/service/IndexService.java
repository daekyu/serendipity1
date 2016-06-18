package kr.co.serendipity.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.serendipity.model.BoardDAO;
import kr.co.serendipity.model.BoardDTO;

@Service
public class IndexService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<BoardDTO> getIndexTravelerRecent() {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getIndexTravelerRecent();
	}
	
	public List<BoardDTO> getIndexGuideRecent() {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getIndexGuideRecent();
	}
	
	public int getListCount() throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getListCount();
	}
	
	public int getGListCount() throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getGListCount();
	}
}

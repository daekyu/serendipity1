package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.List;

/*
* @interface : BoardDAO
* @Date : 2016. 06. 08.
* @Author : 김민규
* @Desc : 여행자가 가이드 구하는 기능 함수
*/ 


public interface BoardDAO {
	//글쓰기
	public void write(BoardDTO dto) throws ClassNotFoundException, SQLException;
	
	//글 목록
	public List getBoardList(int page) throws ClassNotFoundException, SQLException;
}

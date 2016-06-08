package kr.co.serendipity.model;

import java.sql.SQLException;

/*
* @interface : BoardDAO
* @Date : 2016. 06. 08.
* @Author : 김민규
* @Desc : 여행자가 가이드 구하는 기능 함수
*/ 


public interface BoardDAO {
	//글쓰기
	public int write(BoardDTO dto) throws ClassNotFoundException, SQLException;
}

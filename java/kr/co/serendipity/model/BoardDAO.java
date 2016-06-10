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
	
	//총 글 수
	public int getListCount() throws ClassNotFoundException, SQLException;
	
	//글 목록
	public List getBoardList(int page) throws ClassNotFoundException, SQLException;
	
	//글 상세 -- 가이드 구함, 여행자 구함 게시판 공통
	public BoardDTO getBoardDetail(int board_num) throws ClassNotFoundException, SQLException;
	
	//글 삭제 -- 가이드 구함, 여행자 구함 게시판 공통
	public void deleteBoard(int board_num) throws ClassNotFoundException, SQLException;
	
	
	//    -----------------여행자 구함 게시판 
	//여행자 구함 글쓰기
	public void Gwrite(BoardDTO dto) throws ClassNotFoundException, SQLException;
	
	//여행자 구함 총 글 수
	public int getGListCount() throws ClassNotFoundException, SQLException;
		
	//여행자 구함 글 목록
	public List getGBoardList(int page) throws ClassNotFoundException, SQLException;
	
	// -------------------------index 페이지 여행자 구함, 가이드 구함 게시판 최신글 4개만 보기
	
	//가이드 구함 최신글 4개만 보기
	public List getIndexTravelerRecent();
	
	//여행자 구함 최신글 4개만 보기
	public List getIndexGuideRecent();
}

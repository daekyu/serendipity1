package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

/*
* @interface : BoardDAO
* @Date : 2016. 06. 08.
* @Author : 김민규
* @Desc : 여행자가 가이드 구하는 기능 함수
*/ 


public interface BoardDAO {
	//글쓰기
	public void write(BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
	//총 글 수
	public int getListCount() throws ClassNotFoundException, SQLException;
	
	//글 목록
	public List<HashMap<String, Object>> getBoardList(int page) throws ClassNotFoundException, SQLException;
	
	//글 상세 -- 가이드 구함, 여행자 구함 게시판 공통
	public HashMap<String, Object> getBoardDetail(BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
	//글 삭제 -- 가이드 구함, 여행자 구함 게시판 공통
	public void deleteBoard(BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
	//글 수정
	public void update(BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
	//글 수정 개별 이미지 1 수정
	public void picUpdate1(String pic, BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
	//글 수정 개별 이미지 2 수정
	public void picUpdate2(String pic, BoardDTO boarddto) throws ClassNotFoundException, SQLException;
		
	//글 수정 개별 이미지 3 수정
	public void picUpdate3(String pic, BoardDTO boarddto) throws ClassNotFoundException, SQLException;
		
	//글 수정 개별 이미지 4 수정
	public void picUpdate4(String pic, BoardDTO boarddto) throws ClassNotFoundException, SQLException;
		
	//글 수정 개별 이미지 5 수정
	public void picUpdate5(String pic, BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
	//이미지 삭제를 위한 이미지 명 검색
	public BoardDTO picSearch(BoardDTO boarddto);
	
	//    -----------------여행자 구함 게시판 
	//여행자 구함 글쓰기
	public void Gwrite(BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
	//여행자 구함 총 글 수
	public int getGListCount() throws ClassNotFoundException, SQLException;
		
	//여행자 구함 글 목록
	public List<HashMap<String, Object>> getGBoardList(int page) throws ClassNotFoundException, SQLException;
	
	//여행자 글 수정
	public void Gupdate(BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	

	// -------------------------index 페이지 여행자 구함, 가이드 구함 게시판 최신글 4개만 보기
	
	//가이드 구함 최신글 4개만 보기
	public List<HashMap<String, Object>> getIndexTravelerRecent();
	
	//여행자 구함 최신글 4개만 보기
	public List<HashMap<String, Object>> getIndexGuideRecent();
	
	//-----------------------------가이드 구함, 여행자 구함 신청
	
	public void travelerParty(BoardDTO boarddto);
	
	//글 쓴 사람의 언어 선택한거
	public List<HashMap<String, Object>> getLanguages(BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
	//글 쓴 사람의 취미 선택한거
	public List<HashMap<String, Object>> getHobbies(BoardDTO boarddto) throws ClassNotFoundException, SQLException;
	
}

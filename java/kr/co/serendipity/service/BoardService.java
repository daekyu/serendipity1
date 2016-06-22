package kr.co.serendipity.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.serendipity.model.BoardDAO;
import kr.co.serendipity.model.BoardDTO;
import kr.co.serendipity.model.MemberDTO;

@Service
public class BoardService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<HashMap<String, Object>> getBoardList(int page, int basicshow, String basicsort) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getBoardList(page, basicshow, basicsort);
	}
	
	public int getListCount() throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getListCount();
	}
	
	public List<HashMap<String, Object>> getGBoardList(int page, int basicshow, String basicsort) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getGBoardList(page, basicshow, basicsort);
	}
	
	public int getGListCount() throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getGListCount();
	}
	
	public void guideWriteFormPost(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException{
		List<MultipartFile> flist = request.getFiles("pic");
		List<String> filenames = new ArrayList<String>();

		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");

		if (flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")) {
			
		} else {
			for (int i = 0; i < 5; i++) {

				String saveFileName = null;
				if (flist.get(i).getOriginalFilename().equals("")) {
					filenames.add("no_picture");
				} else {
					String genId = UUID.randomUUID().toString();
					String originalfileName = flist.get(i).getOriginalFilename();

					saveFileName = genId + "_" + originalfileName;

					String savePath = realFolder + "\\" + saveFileName;

					flist.get(i).transferTo(new File(savePath));
					filenames.add(saveFileName);
				}
			}
		}

		boarddto.setBoard_picture1(filenames.get(0));
		boarddto.setBoard_picture2(filenames.get(1));
		boarddto.setBoard_picture3(filenames.get(2));
		boarddto.setBoard_picture4(filenames.get(3));
		boarddto.setBoard_picture5(filenames.get(4));

		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		boarddao.Gwrite(boarddto);
	}
	
	public void travelerWriteFormPost(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException{	
		List<MultipartFile> flist = request.getFiles("pic");
		List<String> filenames = new ArrayList<String>();

		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");
		if (flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < 5; i++) {

				String saveFileName = null;
				if (flist.get(i).getOriginalFilename().equals("")) {
					filenames.add("no_picture");
				} else {
					String genId = UUID.randomUUID().toString();
					String originalfileName = flist.get(i).getOriginalFilename();

					saveFileName = genId + "_" + originalfileName;

					String savePath = realFolder + "\\" + saveFileName;

					flist.get(i).transferTo(new File(savePath));
					filenames.add(saveFileName);
				}
			}
		}
		boarddto.setBoard_picture1(filenames.get(0));
		boarddto.setBoard_picture2(filenames.get(1));
		boarddto.setBoard_picture3(filenames.get(2));
		boarddto.setBoard_picture4(filenames.get(3));
		boarddto.setBoard_picture5(filenames.get(4));

		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		boarddao.write(boarddto);
	}
	
	public HashMap<String, Object> getBoardDetail(BoardDTO boarddto) throws ClassNotFoundException, SQLException{
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		HashMap<String, Object> boarddto1 = boarddao.getBoardDetail(boarddto);
		return boarddto1;
	}
	
	public void boardDelete(BoardDTO boarddto) throws ClassNotFoundException, SQLException{
		
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		HashMap<String, Object> boarddto1 = boarddao.getBoardDetail(boarddto);
		String realFolder = "C:\\Kosta_112th\\Project_3rd\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Serendipity\\resources\\img\\board_picture";
		//String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");
		if(boarddto1.get("BOARD_PICTURE1").equals("") ){
			
		}else{
			File file = new File(realFolder+"\\"+boarddto1.get("BOARD_PICTURE1"));
		    if(file.exists()){
		    	file.delete();
		    }
		}
		if(boarddto1.get("BOARD_PICTURE2").equals("") ){
					
				}else{
					File file = new File(realFolder+"\\"+boarddto1.get("BOARD_PICTURE2"));
				    if(file.exists()){
				    	file.delete();
				    }
				}
		if(boarddto1.get("BOARD_PICTURE3").equals("") ){
			
		}else{
			File file = new File(realFolder+"\\"+boarddto1.get("BOARD_PICTURE3"));
		    if(file.exists()){
		    	file.delete();
		    }
		}
		if(boarddto1.get("BOARD_PICTURE4").equals("") ){
			
		}else{
			File file = new File(realFolder+"\\"+boarddto1.get("BOARD_PICTURE4"));
		    if(file.exists()){
		    	file.delete();
		    }
		}
		if(boarddto1.get("BOARD_PICTURE5").equals("") ){
			
		}else{
			File file = new File(realFolder+"\\"+boarddto1.get("BOARD_PICTURE5"));
		    if(file.exists()){
		    	file.delete();
		    }
		}
		
		boarddao.deleteBoard(boarddto);
	}
	
	public BoardDTO picSearch(BoardDTO boarddto) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.picSearch(boarddto);
	}
	
	public void picUpdate1(String saveFileName, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.picUpdate1(saveFileName, boarddto);
	}
	
	public void picUpdate2(String saveFileName, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.picUpdate1(saveFileName, boarddto);
	}
	
	public void picUpdate3(String saveFileName, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.picUpdate3(saveFileName, boarddto);
	}
	
	public void picUpdate4(String saveFileName, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.picUpdate4(saveFileName, boarddto);
	}
	
	public void picUpdate5(String saveFileName, BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.picUpdate5(saveFileName, boarddto);
	}
	
	public void Gupdate(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.Gupdate(boarddto);
	}
	
	public void update(BoardDTO boarddto) throws ClassNotFoundException, SQLException {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.update(boarddto);
	}
	
	public void travelerParty(BoardDTO boarddto) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.travelerParty(boarddto);
	}
	
	public void guideParty(int board_num, int user_num, int many) {
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.guideParty(board_num, user_num, many);
	}
	
	public List<HashMap<String, Object>> getLanguages(BoardDTO boarddto) throws ClassNotFoundException, SQLException{
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getLanguages(boarddto);
	}
	
	public List<HashMap<String, Object>> getHobbies(BoardDTO boarddto) throws ClassNotFoundException, SQLException{
		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		return dao.getHobbies(boarddto);
	}
}

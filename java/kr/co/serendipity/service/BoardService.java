package kr.co.serendipity.service;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.serendipity.model.BoardDAO;
import kr.co.serendipity.model.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public void guideWriteFormPost(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException{
		
		List<MultipartFile> flist = request.getFiles("pic");
		List<String> filenames = new ArrayList<String>();

		System.out.println("0번 파일 : " + flist.get(0).getOriginalFilename());
		System.out.println("1번 파일 : " + flist.get(1).getOriginalFilename());
		System.out.println("2번 파일 : " + flist.get(2).getOriginalFilename());
		System.out.println("3번 파일 : " + flist.get(3).getOriginalFilename());
		System.out.println("4번 파일 : " + flist.get(4).getOriginalFilename());
		System.out.println("flist.size() : " + flist.size());

		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");
		System.out.println("실제 파일 업로드 경로 : " + realFolder);
		if (flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < 5; i++) {

				String saveFileName = null;
				if (flist.get(i).getOriginalFilename().equals("")) {
					filenames.add("no_picture");
				} else {
					String genId = UUID.randomUUID().toString();
					String originalfileName = flist.get(i).getOriginalFilename();

					System.out.println("filename : " + originalfileName);

					saveFileName = genId + "_" + originalfileName;

					String savePath = realFolder + "\\" + saveFileName;

					flist.get(i).transferTo(new File(savePath));
					filenames.add(saveFileName);
				}
			}
		}
		System.out.println("filenames.get(0) : " + filenames.get(0));
		System.out.println("filenames.get(1) : " + filenames.get(1));
		boarddto.setBoard_Picture1(filenames.get(0));
		System.out.println("dto.getBoard_Picture1() : " + boarddto.getBoard_Picture1());
		boarddto.setBoard_Picture2(filenames.get(1));
		boarddto.setBoard_Picture3(filenames.get(2));
		boarddto.setBoard_Picture4(filenames.get(3));
		boarddto.setBoard_Picture5(filenames.get(4));

		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		boarddao.Gwrite(boarddto);
		
	}
	
	public void travelerWriteFormPost(BoardDTO boarddto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException{
		
		List<MultipartFile> flist = request.getFiles("pic");
		List<String> filenames = new ArrayList<String>();

		System.out.println("0번 파일 : " + flist.get(0).getOriginalFilename());
		System.out.println("1번 파일 : " + flist.get(1).getOriginalFilename());
		System.out.println("2번 파일 : " + flist.get(2).getOriginalFilename());
		System.out.println("3번 파일 : " + flist.get(3).getOriginalFilename());
		System.out.println("4번 파일 : " + flist.get(4).getOriginalFilename());

		System.out.println("flist.size() : " + flist.size());

		String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");
		System.out.println("실제 파일 업로드 경로 : " + realFolder);
		if (flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < 5; i++) {

				String saveFileName = null;
				if (flist.get(i).getOriginalFilename().equals("")) {
					filenames.add("no_picture");
				} else {
					String genId = UUID.randomUUID().toString();
					String originalfileName = flist.get(i).getOriginalFilename();

					System.out.println("filename : " + originalfileName);

					saveFileName = genId + "_" + originalfileName;

					String savePath = realFolder + "\\" + saveFileName;

					flist.get(i).transferTo(new File(savePath));
					filenames.add(saveFileName);
				}
			}
		}
		System.out.println("filenames.get(0) : " + filenames.get(0));
		System.out.println("filenames.get(1) : " + filenames.get(1));
		boarddto.setBoard_Picture1(filenames.get(0));
		System.out.println("dto.getBoard_Picture1() : " + boarddto.getBoard_Picture1());
		boarddto.setBoard_Picture2(filenames.get(1));
		boarddto.setBoard_Picture3(filenames.get(2));
		boarddto.setBoard_Picture4(filenames.get(3));
		boarddto.setBoard_Picture5(filenames.get(4));

		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		boarddao.write(boarddto);
		
	}
	
	public BoardDTO travelerDetail(BoardDTO boarddto) throws ClassNotFoundException, SQLException{
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		BoardDTO boarddto1 = boarddao.getBoardDetail(boarddto);
		
		return boarddto1;
	}
	
	public BoardDTO guideDetail(BoardDTO boarddto) throws ClassNotFoundException, SQLException{
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		BoardDTO boarddto1 = boarddao.getBoardDetail(boarddto);
		
		return boarddto1;
	}
	
	public BoardDTO writerDetail(BoardDTO boarddto) throws ClassNotFoundException, SQLException{
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		BoardDTO boarddto1 = boarddao.getBoardDetail(boarddto);
		
		return boarddto1;
	}
	
	public void boardDelete(BoardDTO boarddto) throws ClassNotFoundException, SQLException{
		
		BoardDAO boarddao = sqlsession.getMapper(BoardDAO.class);
		BoardDTO boarddto1 = boarddao.getBoardDetail(boarddto);
		String realFolder = "C:\\Kosta_112th\\Project_3rd\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Serendipity\\resources\\img\\board_picture";
		//String realFolder = request.getSession().getServletContext().getRealPath("resources/img/board_picture");
		if(boarddto1.getBoard_Picture1().equals("") ){
			
		}else{
			File file = new File(realFolder+"\\"+boarddto1.getBoard_Picture1());
		    if(file.exists()){
		    	file.delete();
		    }
		}
		if(boarddto1.getBoard_Picture2().equals("") ){
					
				}else{
					File file = new File(realFolder+"\\"+boarddto1.getBoard_Picture1());
				    if(file.exists()){
				    	file.delete();
				    }
				}
		if(boarddto1.getBoard_Picture3().equals("") ){
			
		}else{
			File file = new File(realFolder+"\\"+boarddto1.getBoard_Picture1());
		    if(file.exists()){
		    	file.delete();
		    }
		}
		if(boarddto1.getBoard_Picture4().equals("") ){
			
		}else{
			File file = new File(realFolder+"\\"+boarddto1.getBoard_Picture1());
		    if(file.exists()){
		    	file.delete();
		    }
		}
		if(boarddto1.getBoard_Picture5().equals("") ){
			
		}else{
			File file = new File(realFolder+"\\"+boarddto1.getBoard_Picture1());
		    if(file.exists()){
		    	file.delete();
		    }
		}
		
		boarddao.deleteBoard(boarddto);
	}
	
	public void modifyGuideFormPost(BoardDTO boarddto, MultipartHttpServletRequest request){
		
	}
	
}

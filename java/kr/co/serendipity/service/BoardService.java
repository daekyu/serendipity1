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
	
	public void guideWriteFormPost(BoardDTO dto, MultipartHttpServletRequest request) throws ClassNotFoundException, SQLException, IllegalStateException, IOException{
		
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
		dto.setBoard_Picture1(filenames.get(0));
		System.out.println("dto.getBoard_Picture1() : " + dto.getBoard_Picture1());
		dto.setBoard_Picture2(filenames.get(1));
		dto.setBoard_Picture3(filenames.get(2));
		dto.setBoard_Picture4(filenames.get(3));
		dto.setBoard_Picture5(filenames.get(4));

		BoardDAO dao = sqlsession.getMapper(BoardDAO.class);
		dao.Gwrite(dto);
		
	}
	
	
	
}

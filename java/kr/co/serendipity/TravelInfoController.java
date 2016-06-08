/*
 * @Class : TravelInfoController
 * @Date : 16.06.07
 * @Author : 강대규
 * @Desc : 여행정보를 출력하기 위한 컨트롤러
 */

package kr.co.serendipity;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.serendipity.model.LocalDTO;
import kr.co.serendipity.model.TravelInfoDAO;
import kr.co.serendipity.model.TravelInfoDTO;


@Controller
@RequestMapping("/travel_info/")
public class TravelInfoController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@RequestMapping("travel_info.htm")
	public String travel_info() {
		
		return "/travel_info/travel_info";
	}
	
	@RequestMapping("getLocalList.htm")
	public @ResponseBody List<LocalDTO> getLocalList() {
		TravelInfoDAO dao = sqlsession.getMapper(TravelInfoDAO.class);
		return dao.getLocalList();
	}
	
	@RequestMapping("getLocalInfo.htm")
	public @ResponseBody TravelInfoDTO getLocalInfo(String local_code) {
		TravelInfoDAO dao = sqlsession.getMapper(TravelInfoDAO.class);
		return dao.getLocalInfo(local_code);
	}
}

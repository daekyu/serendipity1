package kr.co.serendipity.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TravelInfoService {
	@Autowired
	private SqlSession sqlsession;
}

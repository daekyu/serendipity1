package kr.co.serendipity.model;

public interface IdCheckDAO {
	
	int IdCheck(IdCheckDTO idcheckdto); //회원가입시 아이디의 중복이 없는지 체크 

}

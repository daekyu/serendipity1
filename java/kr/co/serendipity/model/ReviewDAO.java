package kr.co.serendipity.model;

import java.sql.SQLException;
import java.util.List;

public interface ReviewDAO {
	
	//�����ı� ����
	public void reviewWrite(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//�����ı� �ۼ��� ���� �޾ƿ���
	List<LocalDTO> localList();
	
	//�����ı� �Խ��� ���
	public List<ReviewDTO> reviewList() throws ClassNotFoundException, SQLException;
	
	//�Խñ� �󼼺���
	public ReviewDTO reviewDetail() throws ClassNotFoundException, SQLException;
	
	//����¡ ó���� ���� �� �� ���� ���ϱ�
	public int getReviewListCount() throws ClassNotFoundException, SQLException;
	
	//�Խñ� ����
	public void reviewUpdate(ReviewDTO dto) throws ClassNotFoundException, SQLException;
	
	//�Խñ� ����
	public void reviewDelete(int review_num) throws ClassNotFoundException, SQLException;


}

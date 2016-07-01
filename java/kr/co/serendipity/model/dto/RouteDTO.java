package kr.co.serendipity.model.dto;

public class RouteDTO {
	private int board_num;
	private String route_latlag;
	private int route_seq;
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getRoute_latlag() {
		return route_latlag;
	}
	public void setRoute_latlag(String route_latlag) {
		this.route_latlag = route_latlag;
	}
	public int getRoute_seq() {
		return route_seq;
	}
	public void setRoute_seq(int route_seq) {
		this.route_seq = route_seq;
	}
	
}

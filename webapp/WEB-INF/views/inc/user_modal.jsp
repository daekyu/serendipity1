<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">아이디</h4>
      </div>
      
      
      <div class="modal-body">
      
        <div class="product-tab">
		  <ul class="nav nav-tabs">
		  	<li class="active"><a href="#profile">프로필보기</a></li>
			<li><a href="#sendMessage">쪽지보내기</a></li>
			<li><a href="#chatting">채팅신청하기</a></li>
			<li><a href="#reporting">신고하기</a></li>
		  </ul><!-- .nav-tabs -->	
		  <div class="tab-content">
		  	<div class="tab-pane active" id="profile">
		  		<div class="bottom-padding">
		  	<div class="row">
			<div class="images-box col-xs-9 col-sm-6 col-md-4">
			  <div class="carousel-box load" data-carousel-pagination="true" data-carousel-nav="false" data-carousel-one="true" data-autoplay-disable="true">
				  <div class="carousel">
					<div class="image">
					  <img class="replace-2x" src=".././content/img/team-big-1.jpg" alt="" title="" width="768" height="768">
					</div>
				  </div>
				<div class="clearfix"></div>
				<div class="pagination switches"></div>
			  </div>
			</div>
		  
			<div class="employee-description col-sm-8 col-md-8">
			  <h3 class="name">이소라</h3>
			  <div class="role"></div>
			  <div>
				<p>프로필 소개 인사말 ㅎㅇㅎㅇㅎㅇ ㅂㄱㅂㄱ ㅂㅇㅂㅇ</p>
			  </div>
			  <div class="social">
			  </div>
			</div>
			<div class="clearfix"></div>
		  </div>
			<br><br>
			<div class="table-responsive">
			<table class="table table-bordered">
			
				<tr>
					<th class="danger" colspan="2">Information</th>
				</tr>
				
				<tr>
					<th class="danger">지역</th>
					<td>ㅁㄴㅇ ----join 으로 지역명 변환</td>
				</tr>
				
				<tr>
					<th class="danger">언어</th>
					<td>한국어, 영어, 일본어 ------- join 필요</td>
				</tr>
				
				<tr>
					<th class="danger">취미</th>
					<td>롤, 리그오브레전드, 엘오엘 ------ join 필요</td>
				</tr>
				
				<tr>
					<th class="danger">관심사</th>
					<td>술, 음식 join ------ join 필요</td>
				</tr>
			</table>
			</div>
		  </div>
		  	</div>
		  
			<div class="tab-pane" id="sendMessage">
				<form>
					<table class="table center">
						<tr>
							<td>
								<textarea class="form-control" style="resize:none; height:100px;" wrap="soft" name=""></textarea>
							</td>
						</tr>
						
						<tr>
							<td>
								<input class="btn btn-success" type="submit" value="전송">
							</td>
						</tr>
					</table>
				</form>
			</div>
			
			<div class="tab-pane" id="chatting">
				<a href="javascript:doPop2()"><button class="btn btn-danger btn-lg btn-block">신청</button></a>
			</div><!-- #reviews -->
			
			<div class="tab-pane" id="reporting">
			<form action="">
				<table class="table center">
					<tr>
						<td>
							<input type="text" class="form-control" placeholder="제목을 입력해주세요">
						</td>
					</tr>
					
					<tr>
						<td>
							<textarea class="form-control" placeholder="상세한 이유를 작성해주세요" style="resize:none; height:100px;" wrap="soft" name=""></textarea>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="submit" class="btn btn-success" value="전송">
						</td>
					</tr>
				</table>
			</form>
			</div><!-- #reviews -->
		  </div><!-- .tab-content -->
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div></div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="http://localhost:8090/serendipity/resources/ckeditor/ckeditor.js"></script> 
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"> --%>
<script type="text/javascript">

window.CKEDITOR_BASEPATH = 'http://example.com/path/to/libs/ckeditor/';

$(function() {
	
	var index=1;
	
	$('#ckeditor').keyup(function() {
		  console.log($('#ckeditor').val()); 
	   });
	
	$('#addBtn').click(function() {
		if(index<=4) {
			$('#addPic').append('<input type="file" id="pic' + index + '" name="pic' + index + '">');
			index++;
		} else {
			alert('더 이상 추가할 수 없습니다');
		}
	});
	$('#minusBtn').click(function() {
		if(index>1) {
			index--;
			$('#pic' + index).remove();
		} else {
			alert('더 이상 삭제할 수 없습니다.');
		}
	});
	
	 
	   $('#submit3').click(function() {
	         // ckeditor 내용 추출
	         var sendNoteData = CKEDITOR.instances.ckeditor.getData();
	         console.log(CKEDITOR.instances.ckeditor.getData());
	         // 히든 인풋에 추출한 내용 삽입.
	         $('#board_Content').val(sendNoteData);
	      
	         // 강제 서브밋
	         $('#bofom').submit();
	      });
	
});
</script>
<section id="main">
	<header class="page-header">
		<div class="container">
			<h1 class="title">가이드가 여행자를 구하기 위해 글을 올리는 곳</h1>
		</div>
	</header>

	<article class="content">
		<div class="container">
			<form action="" id="bofom" method="post">
				<table class="table center">
					<tr>
						<td><h6>글 제목</h6></td>
						<td colspan="5"><input class="form-control" type="text" name="board_Title"></td>
					</tr>
					<tr>
						<td>인원수</td>
						<td><input class="form-control" type="text"></td>
						<td>날짜</td>
						<td><input class="form-control" type="text"></td>
						<td>가격</td>
						<td><input class="form-control" type="text" name="price"></td>
					</tr>
					<tr>
						<td>설명</td>
						<td colspan="5">
						<!-- <textarea class="form-control" style="resize:none; height:400px;" wrap="soft" name="board_Content"></textarea> -->
						
							<textarea name="board_Content" id="ckeditor"></textarea>
                  	
                  	 <script type="text/javascript">
					     CKEDITOR.replace( 'ckeditor',{
	       				 	width:'90%',
	      				  	height:'400px'
	 						  
					   });
					 </script>
							
						
						</td>
					</tr>
					<tr>
						<td>Meeting Point</td>
						<td colspan="5">
							<div class="map-box bottom-padding">
								<div class="map-canvas" data-zoom="17" data-lat="37.548441"
									data-lng="126.985664" data-title="Bryant Park"
									data-content="New York, NY" style="height: 700px;"></div>
							</div>
						</td>
					</tr>
					<tr>
						<td>사진</td>
						<td id="addPic" colspan="4"><input type="file" id="pic0" name="pic0"></td>
						<td align="center">
							<button type="button" id="addBtn" class="btn btn-success">추가</button>
							<button type="button" id="minusBtn" class="btn btn-danger">빼기</button>
						</td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<input type="submit" class="btn btn-success" value="등록">
							<input type="reset" class="btn btn-danger" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</article><!-- .content -->
</section><!-- #main -->
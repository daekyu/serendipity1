<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
$(function() {
	var index=1;
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
});
</script>
<section id="main">
	<header class="page-header">
		<div class="container">
			<h1 class="title">여행자가 가이드를 구하기 위해 글 작성하는 곳</h1>
		</div>
	</header>

	<article class="content">
		<div class="container">
			<form>
				<table class="table center">
					<tr>
						<td><h6>글 제목</h6></td>
						<td colspan="5"><input class="form-control" type="text"></td>
					</tr>
					<tr>
						<td>날짜</td>
						<td><input class="form-control" type="text"></td>
						<td>지불할 가격</td>
						<td><input class="form-control" type="text"></td>
					</tr>
					<tr>
						<td>설명</td>
						<td colspan="5"><textarea class="form-control" style="resize:none; height:400px;" wrap="soft"></textarea></td>
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
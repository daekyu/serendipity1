<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#table_pic1').hide();
	$('#table_pic2').hide();
	$('#table_pic3').hide();
	$('#table_pic4').hide();
	$('#table_pic5').hide(); 
	var index=1;
	
	$('#addBtn').click(function() {
		if(index<=5) {
			$('#table_pic'+index).show();
			index++;
		} else {
			alert('더 이상 추가할 수 없습니다');
		}
		console.log(index);
	});
	$('#minusBtn').click(function() {
		if(index>1) {
			index--;
			$('#pic'+index).val("");
			$('#title_pic'+index).val("");
			$('#desc_pic'+index).val("");
			$('#table_pic'+index).hide();
		} else {
			alert('더 이상 삭제할 수 없습니다.');
		}
		console.log(index);
	});
	
	//SUBMIT했을 때 사진의 확장자를 찾아서 이미지파일이 아니면 전송하지 못하게 하자. 이건 좀 나중에 ㅎㅎㅎ
});
</script>
<section id="main">
	<header class="page-header">
		<div class="container">
			<h1 class="title">여행 후기</h1>
		</div>
	</header>

	<article class="content">
		<div class="container">
			<form>
				<table class="table center">
					<tr>
						<td><h6>글 제목</h6></td>
						<td colspan="4"><input class="form-control" type="text"></td>
						<td>
							<button type="button" id="addBtn" class="btn btn-success">사진추가</button>
							<button type="button" id="minusBtn" class="btn btn-danger">사진빼기</button>
						</td>
					</tr>
					<tr>
						<td>여행테마</td>
						<td><input class="form-control" type="text"></td>
						<td>지역</td>
						<td><input class="form-control" type="text"></td>
						<td>날짜</td>
						<td><input class="form-control" type="text"></td>
					</tr>
					
					<tr>
						<td colspan="6">
						<div class="product-tab">
							<ul class="nav nav-tabs" id="">
								<li class="active"><a href="#description">전체적인 설명</a></li> 
								<li id="menu_pic"><a href="#tab_pic">사진</a></li>
							</ul>
							<!-- .nav-tabs -->

							<div class="tab-content">
							
								<div class="tab-pane active" id="description">
									<textarea class="form-control" style="resize:none; height:200px;" wrap="soft"></textarea>
								</div>

								<div class="tab-pane active" id="tab_pic">
									<table class="table" id="table_pic1">
										<tr>
											<th colspan="2">
												사진 1
											</th>
										</tr>
										<tr>
											<td>사진</td>
											<td><input type="file" name="pic1"></td>
										</tr>
										
										<tr>
											<td>제목 : </td>
											<td><input type="text" class="form-control" name="title_pic1"></td>
										</tr>
										
										<tr>
											<td>설명 : </td>
											<td><textarea name="desc_pic1" class="form-control" style="resize:none; height:100px;" wrap="soft"></textarea></td>
										</tr>
									</table>
									
									<table class="table" id="table_pic2">
										<tr>
											<th colspan="2">
												사진 2
											</th>
										</tr>
										<tr>
											<td>사진</td>
											<td><input type="file" id="pic2" name="pic2"></td>
										</tr>
										
										<tr>
											<td>제목 : </td>
											<td><input type="text" id="title_pic2" class="form-control" name="title_pic2"></td>
										</tr>
										
										<tr>
											<td>설명 : </td>
											<td><textarea name="desc_pic2" id="desc_pic2" class="form-control" style="resize:none; height:100px;" wrap="soft"></textarea></td>
										</tr>
									</table>
									
									<table class="table" id="table_pic3">
										<tr>
											<th colspan="2">
												사진 3
											</th>
										</tr>
										<tr>
											<td>사진</td>
											<td><input type="file" id="pic3" name="pic3"></td>
										</tr>
										
										<tr>
											<td>제목 : </td>
											<td><input type="text" id="title_pic3" class="form-control" name="title_pic3"></td>
										</tr>
										
										<tr>
											<td>설명 : </td>
											<td><textarea name="desc_pic3" id="desc_pic3" class="form-control" style="resize:none; height:100px;" wrap="soft"></textarea></td>
										</tr>
									</table>
									
									<table class="table" id="table_pic4">
										<tr>
											<th colspan="2">
												사진 4
											</th>
										</tr>
										<tr>
											<td>사진</td>
											<td><input type="file" id="pic4" name="pic1"></td>
										</tr>
										
										<tr>
											<td>제목 : </td>
											<td><input type="text" id="title_pic4" class="form-control" name="title_pic1"></td>
										</tr>
										
										<tr>
											<td>설명 : </td>
											<td><textarea name="desc_pic1" id="desc_pic4" class="form-control" style="resize:none; height:100px;" wrap="soft"></textarea></td>
										</tr>
									</table>
									
									<table class="table" id="table_pic5">
										<tr>
											<th colspan="2">
												사진 5
											</th>
										</tr>
										<tr>
											<td>사진</td>
											<td><input type="file" id="pic5" name="pic1"></td>
										</tr>
										
										<tr>
											<td>제목 : </td>
											<td><input type="text" id="title_pic5" class="form-control" name="title_pic1"></td>
										</tr>
										
										<tr>
											<td>설명 : </td>
											<td><textarea name="desc_pic1" id="desc_pic5" class="form-control" style="resize:none; height:100px;" wrap="soft"></textarea></td>
										</tr>
									</table>
								</div> 
								<!-- #reviews -->
							</div>
							<!-- .tab-content -->
						</div>
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
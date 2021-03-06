<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src=".././resources/js/sweetalert.min.js"> </script>
<link rel="stylesheet" type="text/css" href=".././resources/js/sweetalert.css">
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		var index = 1;
		$('#addBtn').click(function() {
			if (index <= 5) {
				$('#table_pic' + index).show();
				index++;
			} else {
				swal('더 이상 추가할 수 없습니다');
			}
		});
		$('#minusBtn').click(function() {
			if (index > 1) {
				index--;
				$('#pic' + index).val("");
				$('#title_pic' + index).val("");
				$('#desc_pic' + index).val("");
				$('#table_pic' + index).hide();
			} else {
				swal('더 이상 삭제할 수 없습니다.');
			}
		});
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
			<form action="review_update.htm?review_num=${reviewdto.REVIEW_NUM}" method="post" enctype="multipart/form-data">
				<!-- enctype="multipart/form-data" -->
				<table class="table center">
					<tr>
						<td>
							<h6>글 제목</h6>
						</td>
						<td colspan="4">
							<input class="form-control" type="text" name="review_title" value="${reviewdto.REVIEW_TITLE}">
						</td>
						<td>
							<button type="button" id="addBtn" class="btn btn-success">사진추가</button>
							<button type="button" id="minusBtn" class="btn btn-danger">사진빼기</button>
						</td>
					</tr>
					<tr>
						<td>지역</td>
						<td>
							<select class="form-group" name="local_code">
								<option value="-">--</option>
								<c:forEach var="i" items="${local_list}">
									<option value="${i.local_code}"
										<c:if test="${i.local_code == reviewdto.LOCAL_CODE}">selected="selected"</c:if>>${i.local_name} / ${i.local_code}
									</option>
								</c:forEach>
							</select>
						</td>
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
										<textarea class="form-control" style="resize: none; height: 200px;" wrap="soft" name="review_content">${reviewdto.REVIEW_CONTENT}</textarea>
									</div>

									<div class="tab-pane" id="tab_pic">
										<table class="table" id="table_pic1">
											<tr>
												<th colspan="2">사진 1</th>
											</tr>
											<tr>
												<td>사진</td>
												<td>
													<input type="file" name="review_picture">수정전 파일 : 
													<input type="text" readonly="readonly" value="${reviewdto.REVIEW_PICTURE1}" size="80">
												</td>
											</tr>

											<tr>
												<td>설명 :</td>
												<td>
													<textarea class="form-control" style="resize: none; height: 100px;" wrap="soft" name="review_content1">${reviewdto.REVIEW_CONTENT1}</textarea>
												</td>
											</tr>
										</table>

										<table class="table" id="table_pic2">
											<tr>
												<th colspan="2">사진 2</th>
											</tr>
											<tr>
												<td>사진</td>
												<td>
													<input type="file" id="pic2" name="review_picture">수정전 파일 : 
													<input type="text" readonly="readonly" value="${reviewdto.REVIEW_PICTURE2}" size="80">
												</td>
											</tr>

											<tr>
												<td>설명 :</td>
												<td>
													<textarea name="review_content2" id="desc_pic2" class="form-control" style="resize: none; height: 100px;" wrap="soft">${reviewdto.REVIEW_CONTENT2}</textarea>
												</td>
											</tr>
										</table>

										<table class="table" id="table_pic3">
											<tr>
												<th colspan="2">사진 3</th>
											</tr>
											<tr>
												<td>사진</td>
												<td>
													<input type="file" id="pic3" name="review_picture">수정전 파일 : <input type="text" readonly="readonly" value="${reviewdto.REVIEW_PICTURE3}" size="80">
												</td>
											</tr>

											<tr>
												<td>설명 :</td>
												<td>
													<textarea name="review_content3" id="desc_pic3" class="form-control" style="resize: none; height: 100px;" wrap="soft">${reviewdto.REVIEW_CONTENT3}</textarea>
												</td>
											</tr>
										</table>

										<table class="table" id="table_pic4">
											<tr>
												<th colspan="2">사진 4</th>
											</tr>
											<tr>
												<td>사진</td>
												<td>
													<input type="file" id="pic4" name="review_picture">수정전 파일 : <input type="text" readonly="readonly" value="${reviewdto.REVIEW_PICTURE4}" size="80">
												</td>
											</tr>

											<tr>
												<td>설명 :</td>
												<td>
													<textarea name="review_content4" id="desc_pic4" class="form-control" style="resize: none; height: 100px;" wrap="soft">${reviewdto.REVIEW_CONTENT4}</textarea>
												</td>
											</tr>
										</table>

										<table class="table" id="table_pic5">
											<tr>
												<th colspan="2">사진 5</th>
											</tr>
											<tr>
												<td>사진</td>
												<td>
													<input type="file" id="pic5" name="review_picture">수정전 파일 : <input type="text" readonly="readonly" value="${reviewdto.REVIEW_PICTURE5}" size="80">
												</td>
											</tr>

											<tr>
												<td>설명 :</td>
												<td>
													<textarea name="review_content5" id="desc_pic5" class="form-control" style="resize: none; height: 100px;" wrap="soft">${reviewdto.REVIEW_CONTENT5}</textarea>
												</td>
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
	</article>
	<!-- .content -->
</section>
<!-- #main -->
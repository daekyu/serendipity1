<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script type="text/javascript" src=".././resources/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"href=".././resources/js/sweetalert.css">
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="http://localhost:8090/serendipity/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	window.CKEDITOR_BASEPATH = 'http://example.com/path/to/libs/ckeditor/';
	$(function() {
		$('#table_pic1').hide();
		$('#table_pic2').hide();
		$('#table_pic3').hide();
		$('#table_pic4').hide();
		$('#table_pic5').hide();

		var index = 1;

		$('#addBtn').click(function() {
			if (index <= 5) {
				$('#table_pic' + index).show();
				index++;
			} else {
				swal('더 이상 추가할 수 없습니다!');
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
				swal('더 이상 삭제할 수 없습니다!');
			}
		});

		$('#ckeditor').keyup(function() {
			console.log($('#ckeditor').val());
		});

		$('#submit3').click(function() {
			var sendNoteData = CKEDITOR.instances.ckeditor.getData();
			console.log(CKEDITOR.instances.ckeditor.getData());
			$('#board_Content').val(sendNoteData);
			$('#bofom').submit();
		});
	});
</script>
<section id="main">
	<header class="page-header">
		<div class="container">
			<h1 class="title">
				<spring:message code="travel_review_inc_writefom" />
			</h1>
		</div>
	</header>

	<article class="content">
		<div class="container">
			<form action="" id="bofom" method="post" enctype="multipart/form-data">
				<table class="table center">
					<tr>
						<td>
							<h6><spring:message code="travel_review_inc_writefom1" /></h6>
						</td>
						<td colspan="4"><input class="form-control" type="text" name="review_title"></td>
						<td>
							<button type="button" id="addBtn" class="btn btn-success">
								<spring:message code="travel_review_inc_writefom2" />
							</button>
							<button type="button" id="minusBtn" class="btn btn-danger">
								<spring:message code="travel_review_inc_writefom3" />
							</button>
						</td>
					</tr>
					<tr>
						<td><spring:message code="travel_review_inc_writefom4" /></td>
						<td>
							<select class="form-group" name="local_code">
									<option value="-">--</option>
									<c:forEach var="i" items="${local_list}">
										<option value="${i.local_code}">${i.local_name}</option>
									</c:forEach>
							</select>
						</td>
					</tr>

					<tr>
						<td colspan="6">
							<div class="product-tab">
								<ul class="nav nav-tabs" id="">
									<li class="active">
										<a href="#description"><spring:message code="travel_review_inc_writefom5" /></a>
									</li>
									<li id="menu_pic">
										<a href="#tab_pic"><spring:message code="travel_review_inc_writefom6" /></a>
									</li>
								</ul>
								<!-- .nav-tabs -->

								<div class="tab-content">
									<div class="tab-pane active" id="description">
										<textarea class="form-control" style="resize: none; height: 200px;" wrap="soft" name="review_content" id="ckeditor"></textarea>
										<script type="text/javascript">
											CKEDITOR.replace('ckeditor', {
												width : '100%',
												height : '400px',
											});
										</script>
									</div>

									<div class="tab-pane" id="tab_pic">
										<table class="table" id="table_pic1">
											<tr>
												<th colspan="2"><spring:message code="travel_review_inc_writefom7" /></th>
											</tr>
											<tr>
												<td><spring:message code="travel_review_inc_writefom8" /></td>
												<td><input type="file" id=pic1 name="review_picture"></td>
											</tr>

											<tr>
												<td><spring:message code="travel_review_inc_writefom9" /></td>
												<td><textarea class="form-control" style="resize: none; height: 100px;" wrap="soft" name="review_content1"></textarea></td>
											</tr>
										</table>

										<table class="table" id="table_pic2">
											<tr>
												<th colspan="2"><spring:message code="travel_review_inc_writefom10" /></th>
											</tr>
											<tr>
												<td><spring:message code="travel_review_inc_writefom11" /></td>
												<td><input type="file" id="pic2" name="review_picture"></td>
											</tr>

											<tr>
												<td><spring:message code="travel_review_inc_writefom12" />
												</td>
												<td><textarea name="review_content2" id="desc_pic2" class="form-control" style="resize: none; height: 100px;" wrap="soft"></textarea></td>
											</tr>
										</table>

										<table class="table" id="table_pic3">
											<tr>
												<th colspan="2"><spring:message code="travel_review_inc_writefom13" /></th>
											</tr>
											<tr>
												<td><spring:message code="travel_review_inc_writefom14" /></td>
												<td><input type="file" id="pic3" name="review_picture"></td>
											</tr>

											<tr>
												<td><spring:message code="travel_review_inc_writefom15" />
												</td>
												<td><textarea name="review_content3" id="desc_pic3" class="form-control" style="resize: none; height: 100px;" wrap="soft"></textarea></td>
											</tr>
										</table>

										<table class="table" id="table_pic4">
											<tr>
												<th colspan="2"><spring:message code="travel_review_inc_writefom16" /></th>
											</tr>
											<tr>
												<td><spring:message code="travel_review_inc_writefom17" /></td>
												<td><input type="file" id="pic4" name="review_picture"></td>
											</tr>

											<tr>
												<td><spring:message code="travel_review_inc_writefom18" /></td>
												<td><textarea name="review_content4" id="desc_pic4" class="form-control" style="resize: none; height: 100px;" wrap="soft"></textarea></td>
											</tr>
										</table>

										<table class="table" id="table_pic5">
											<tr>
												<th colspan="2"><spring:message code="travel_review_inc_writefom19" /></th>
											</tr>
											<tr>
												<td><spring:message code="travel_review_inc_writefom20" /></td>
												<td><input type="file" id="pic5" name="review_picture"></td>
											</tr>

											<tr>
												<td><spring:message code="travel_review_inc_writefom21" />
												</td>
												<td><textarea name="review_content5" id="desc_pic5" class="form-control" style="resize: none; height: 100px;" wrap="soft"></textarea></td>
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
							<input type="submit" class="btn btn-success" value="<spring:message code="travel_review_inc_writefom22"/>">
							<input type="reset" class="btn btn-danger" value="<spring:message code="travel_review_inc_writefom23"/>">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</article>
	<!-- .content -->
</section>
<!-- #main -->
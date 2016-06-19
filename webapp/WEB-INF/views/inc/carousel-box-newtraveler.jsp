<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여행자구함 새 글을 보여주는 부분 -->
<div class="full-width-box bottom-padding cm-padding-bottom-36">
	<div class="fwb-bg fwb-fixed band-5">
		<div class="overlay"></div>
	</div>

	<div class="container">
		<div class="title-box title-white">
			<a href="board/traveler_list.htm" class="btn">More <span
				class="glyphicon glyphicon-arrow-right"></span></a>
			<h1 class="title no-top-padding">가이드가 필요해~~(여행자가 가이드를 구하기 위해 글을
				올리는 곳)</h1>
		</div>
		<div class="row text-center">
			<c:choose>
				<c:when test="${listCount eq 0}">
				 	글이 존재하지 않습니다.
				 </c:when>
				<c:otherwise>
					<c:forEach var="i" items="${traveler_list}">
						<div class="col-sm-3 col-md-3 rotation employee">
							<div class="default">
								<div class="image">
									<img class="replace-2x img-list" src="${pageContext.request.contextPath}/resources/img/board_picture/${i.board_picture1}" alt=""
										title="" width="270" height="270">
								</div>
								<div class="description">
									<div class="vertical">
										<h3 class="name">${i.board_title}</h3>
										<div class="role">여행자 번호 : ${i.user_num}</div>
									</div>
								</div>
							</div>
							<a href="board/traveler_detail.htm?board_num=${i.board_num}">
								<div class="employee-hover">
									<h3 class="name">${i.board_title}</h3>
									<h3 class="name">여행자 번호 : ${i.user_num}</h3>
									<div class="role">지역</div>
									<div class="image">
										<!-- 여행자 프로필 사진을 넣어주자 -->
										<img class="replace-2x" src="content/img/team-1.jpg" alt=""
											title="" width="270" height="270">
									</div>
									<div>
										<p>하고싶은 여행에 대한 간단한 설명</p>
										<div class="contact">
											<b>사용언어: </b>한국어, 영어
										</div>
										<div class="contact">
											<b>관심사: </b>맛집, 야경
										</div>
									</div>
								</div>
							</a>
							<!-- .employee-hover -->
						</div>
						<!-- .employee -->
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
</div>
<!-- .full-width-box -->
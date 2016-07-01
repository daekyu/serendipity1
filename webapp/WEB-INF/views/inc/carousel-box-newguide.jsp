<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- 가이드구함 새 글을 보여주는 부분 -->
<div class="full-width-box bottom-padding cm-padding-bottom-36">
	<div class="fwb-bg fwb-fixed band-5">
		<div></div>
	</div>

	<div class="container">
		<div class="title-box title-white">
			<a href="board/guide_list.htm" class="btn"><spring:message code="index.inc.carousel-box-newguide"/> <span
				class="glyphicon glyphicon-arrow-right"></span></a>
			<h1 class="title no-top-padding" style="color: black;"><spring:message code="index.inc.carousel-box-newtraveler1"/></h1>
		</div>

		<div class="row text-center">
			<c:choose>
				<c:when test="${GlistCount eq 0}">
				 <spring:message code="index.inc.carousel-box-newguide2"/>
				 </c:when>
				<c:otherwise>
					<c:forEach var="i" items="${guide_list}">
						<div class="col-sm-2 col-md-2 rotation employee">
							<div class="default">
								<div class="image">
									<img class="replace-2x img-list" src="${pageContext.request.contextPath}/resources/img/board_picture/${i.BOARD_PICTURE1}" alt=""
										title="" width="270" height="270">
								</div>
								<div class="description">
									<div class="vertical">
										<h3 class="name">${i.BOARD_TITLE}</h3>
										<div class="role"><spring:message code="index.inc.carousel-box-newguide3"/> ${i.ID}</div>
									</div>
								</div>
							</div>
								<div class="employee-hover">
									<h3 class="name">제목 : ${i.BOARD_TITLE}</h3>
									<h3 class="name"><spring:message code="index.inc.carousel-box-newguide4"/> ${i.ID}</h3>
									<h3 class="name"><spring:message code="index.inc.carousel-box-newguide5"/> ${i.LOCAL_NAME}</h3>
									<div class="image">
										<!-- 가이드 프로필 사진을 넣어주자 -->
										<img class="replace-2x" src="${pageContext.request.contextPath}/resources/img/profile_picture/${i.PROFILE_PICTURE}" alt=""
											title="" width="70" height="70">
									</div>
									<div>
										<div class="contact">
											<b><spring:message code="index.inc.carousel-box-newguide8"/></b>${i.PRICE} / <spring:message code="index.inc.carousel-box-newguide9"/>
										</div>
										<br><br><br><br><br><br>
										<div class="contact" align="center">
											<a href="board/guide_detail.htm?board_num=${i.BOARD_NUM}&user_num=${i.USER_NUM}" class="btn btn-warning btn-lg btn-block"><spring:message code="index.inc.carousel-box-newguide10"/></a>
										</div>
										
									</div>
								</div> <!-- .employee-hover -->
						</div>
						<!-- .employee -->
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
</div>
<!-- .full-width-box -->
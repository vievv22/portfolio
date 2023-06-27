<%@page import="com.movie.biz.dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/movie.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="admin/movie/movie.js"></script>
</head>
<body>
<div class="bar">
	<div>
		<img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img src="images/arrow.png" alt=">" width="10px">&nbsp;&nbsp;영화&nbsp;&nbsp;<img src="images/arrow.png" alt=">" width="10px">&nbsp;&nbsp;${movieVO.title}의 상세정보
	</div>
</div>
<div id="moviedetail">
	<img class="movie-image2" src="movie_images/${movieVO.poster_url}">
	<div class="overlay"></div>
	<div class="content">
		<h1 style="margin-left: 200px;">${movieVO.title}</h1><br>
		<div class="m_info">
			<img class="poster-image" src="movie_images/${movieVO.poster_url}">
			<table class="info-table" style="width: 475px;">
	
				<tr>
					<td style="width: 100px;">감독</td>
					<td>${director}</td>
				</tr>
				<tr>
					<td>배우</td>
					<td>${caster}</td>
				</tr>
				<tr>
					<td>장르</td>
					<td>${genre}</td>
				</tr>
				<tr>
					<td>러닝타임</td>
					<td>${movieVO.playtime}분</td>
				</tr>
				<tr>
					<td>관람 연령</td>
					<td>
						<c:choose>
							<c:when test="${movieVO.age == 0}">
								전체 연령 관람가
							</c:when>
							<c:otherwise>
								${movieVO.age}세 이상 관람가
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>나라</td>
					<td>${movieVO.nation}</td>
				</tr>
				<tr>
					<td>개봉일자</td>
					<td><fmt:formatDate value="${movieVO.opendate}" pattern="yyyy.MM.dd" /></td>
				</tr>
				<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
				<tr>
					<td>줄거리</td>
					<td>${story}</td>
				</tr>				
			</table>
		</div>
	</div>
</div>
	<br><br><br><br><br>
	<h2 style="margin-left: 475px;">트레일러</h2><br>
	<div class="m_trailer" style="margin-left: 475px;">
		${trailer}
	</div>
	<br><br><br><br>
	<h2 style="margin-left: 475px;">스틸컷</h2><br>
	<div class="main-view" style="margin-left: 475px;">
		<ul class="slideshow">
			<c:forEach items="${stillcut}" var="stillcut" varStatus="status">
				<li ><img src="stillcut_images/${stillcut}"></li>
			</c:forEach>
		</ul>
		<button class="prev-button">&lt;</button>
		<button class="next-button">&gt;</button>
	</div>
	<br><br><br><br><br>
	<form name="frm" id="myform" method="post">
		<h2 style="margin-left: 475px;">${movieVO.title}에 대한 이야기!</h2><br>
		<p style="margin-left: 475px;">관람객 별점 : ${averageStars}/5점</p>
		<c:choose>
			<c:when test="${empty reviewList}">
				<p style="margin-left: 475px;">작성된 리뷰가 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="review" items="${reviewList}" varStatus="status">
					<div class="review-item">
						<p style="margin-left: 475px;"><span class="star-rating"><script>document.write(convertToStars(${review.stars}));</script> ${review.stars}/5점</span></p>
						<p style="margin-left: 475px;"><span><c:out value="${review.userId}"/></span></p>
						<p style="margin-left: 475px;"><span><c:out value="${review.comments}"/></span></p><br>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</form>
<%@ include file="../footer.jsp" %>
</body>
</html>

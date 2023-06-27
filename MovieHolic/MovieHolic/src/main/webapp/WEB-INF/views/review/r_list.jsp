<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<%@ include file="../header.jsp"%>
<html>
<head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
<script src="review/review.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<link rel="stylesheet" href="css/review.css" />
<style>
.star-rating span.star {
	font-size: 1.5em;
	display: inline-block;
	position: relative;
	color: #FAD103;
}
</style>

<div class="bar"><div><img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;마이페이지&nbsp;&nbsp;<img src="images/arrow.png" alt=">" width="10px">&nbsp;&nbsp;리뷰 내역</div></div>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="middle">
	<br>

	<h2>My Page</h2>
	<div class="flex-container">
		<div class="flex-item">

			<br>
			<div class="ponit-grade">
				<c:choose>

					<c:when test="${userDetail.point < 400}">
						<b>Friends</b>
					</c:when>
					<c:when test="${userDetail.point >= 400 && userDetail.point < 600}">
						<b>Silver</b>
					</c:when>
					<c:when test="${userDetail.point >= 600 && userDetail.point < 800}">
						<b>골드</b>
					</c:when>
					<c:otherwise>
						<b>VIP</b>
					</c:otherwise>
				</c:choose>
			</div>
			<br> <span><b>${userDetail.name}</b></span><span> 님 반가워욧!</span>
			<br> <br> <span>Point ${userDetail.point} 점</span> <br>





			<div id="Lv">
				<c:choose>
					<c:when test="${userDetail.point < 100}">
    Lv.1까지 <b>40,000원 남았어요!</b>
					</c:when>
					<c:when test="${userDetail.point >= 100 && userDetail.point < 200}">
    Lv.1까지 <b>30,000원 남았어요!</b>
					</c:when>
					<c:when test="${userDetail.point >= 200 && userDetail.point < 300}">
    Lv.1까지 <b>20,000원 남았어요!</b>
					</c:when>
					<c:when test="${userDetail.point >= 300 && userDetail.point < 400}">
    Lv.1까지 <b>10,000원 남았어요!</b>
					</c:when>
					<c:when test="${userDetail.point >= 400 && userDetail.point < 500}">
    Lv.2까지 <b>20,000원 남았어요!</b>
					</c:when>
					<c:when test="${userDetail.point >= 500 && userDetail.point < 600}">
    Lv.2까지 <b>10,000원 남았어요!</b>
					</c:when>
					<c:when test="${userDetail.point >= 600 && userDetail.point < 700}">
    Lv.2까지 <b>10,000원 남았어요!</b>
					</c:when>
					<c:when test="${userDetail.point >= 700 && userDetail.point < 800}">
    Lv.2까지 <b>10,000원 남았어요!</b>
					</c:when>
					<c:otherwise>
						<b>VIP님 환영합니다!</b>
					</c:otherwise>
				</c:choose>

			</div>
			<br> <br>
			<div class="grade-container">
				<div class="grade">Friends</div>
				<div class="grade">
					<b>Lv.1</b>
				</div>
				<div class="grade">
					<b>Lv.2</b>
				</div>
				<div class="grade">
					<b>Lv.3</b>
				</div>
			</div>
			<br>
			<div class="line"></div>
			<br>
			<div class="grade-container">
				<div class="grade">0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div class="grade">4만원</div>
				<div class="grade">6만원</div>
				<div class="grade">8만원</div>
			</div>

		</div>




	<div class="flex-item-right">
		<br>
		<div class="botton-container">
			<div class="my-botton ">
				<button type="button" onclick="location.href='reviewList2?userId=${userDetail.id}'">리 뷰</button>

			</div>
			<div class="my-botton ">
				<button type="button" onclick="location.href='qna_list'">문의</button>
			</div>
			<div class="my-botton ">
				<button type="button" onclick="location.href='memberInfo'">회원정보</button>
			</div>
		</div>
<img alt="광고이미지" src="https://www.lottecinema.co.kr/NLCHS/Content/images/member/my_club_315_bravo_230301.jpg">
	</div>
	</div>
	
<br>
	<br>
	<br>
	<h3>리뷰 내역</h3>

	<c:if test="${empty reviewList2}">
		<p>
			<img src="images/느낌표.png" width="80px">
		</p>
		<p id="noneTicket">작성한 리뷰가 없습니다.</p>
	</c:if>

	<c:choose>

		<c:when test="${not empty reviewList2}">

			<table class="container">
				<tr height="60px" class="font">
					<td width="80px">리뷰 번호</td>
					<td width="200px">관람 영화</td>
					<td width="420px">코멘트</td>
					<td width="150px">작성 일시</td>
					<td width="150px">별점</td>
					<td width="100px">삭제</td>
				</tr>
				
				<c:forEach items="${reviewList2}" var="reviewVO">
					<tr>
						<td>${reviewVO.numb}</td>
						<td><a href="movieDetail?numb=${reviewVO.movie_numb}">${reviewVO.title}</a></td>
						<td>${reviewVO.comments}</td>
						<td><fmt:formatDate value="${reviewVO.regdate}" pattern="yyyy. MM. dd" /></td>
						<td><span class="star-rating"><script>document.write(convertToStars(${reviewVO.stars}));</script></span></td>
						<td><a href="#" onclick="confirmDelete('${reviewVO.numb}')">삭제</a></td>
					</tr>
					</c:forEach>
				
			</table>
		</c:when>
	</c:choose>
</div>	


</body>
</html>
<%@ include file="../footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/ticketing.css" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background-color: #242333;
	color: #fff;
}
</style>
<div class="body2">
	<h3>${title}</h3>
	<span>${startTime}~${endTime} (${rnumb}관) 잔여좌석
		${scnt-ticketingSummary.total_p_num}/${scnt}석</span> <br>
	<div class="ticket-quantity">
		<label for="adult">일반</label> <select id="adult" name="adult">
			<option value="0">0명</option>
			<option value="1">1명</option>
			<option value="2">2명</option>
			<option value="3">3명</option>
			<option value="4">4명</option>
			<option value="5">5명</option>
			<option value="6">6명</option>
			<option value="7">7명</option>
			<option value="8">8명</option>
		</select> <label for="youth">청소년</label> <select id="youth" name="youth">
			<option value="0">0명</option>
			<option value="1">1명</option>
			<option value="2">2명</option>
			<option value="3">3명</option>
			<option value="4">4명</option>
			<option value="5">5명</option>
			<option value="6">6명</option>
			<option value="7">7명</option>
			<option value="8">8명</option>
		</select> <label for="concession">경로/우대</label> <select id="concession"
			name="concession">
			<option value="0">0명</option>
			<option value="1">1명</option>
			<option value="2">2명</option>
			<option value="3">3명</option>
			<option value="4">4명</option>
			<option value="5">5명</option>
			<option value="6">6명</option>
			<option value="7">7명</option>
			<option value="8">8명</option>
		</select>
	</div>
	<div class="container">
		<div class="screen"></div>

		<div class="row">
			<c:forEach var="seatVO" items="${roomseats}" varStatus="loop">
				<c:set var="reserved" value="false" />
				<c:forEach var="alreadySeat" items="${alreadySeats}">
					<c:if test="${seatVO.name == alreadySeat}">
						<c:set var="reserved" value="true" />
					</c:if>
				</c:forEach>

				<c:if test="${reserved}">
					<span class="seat occupied">${seatVO.name}</span>
				</c:if>
				<c:if test="${!reserved}">
					<span class="seat">${seatVO.name}</span>
				</c:if>

				<c:if test="${loop.index % 12 == 1 || loop.index % 12 == 9}">
     			 &nbsp;&nbsp; <!-- 빈 공간을 나타내는 HTML 엔티티입니다 -->
				</c:if>

				<c:if test="${loop.index % 12 == 11}">
					<br />
				</c:if>
			</c:forEach>
		</div>
	</div>
	<p class="text">
		선택하신<span id="count">0</span>인의 전체 예매 금액은 <span id="total">0</span>원
		입니다.

	</p>
	<br>

	<button type="button" class="custom-button" onclick="goPaymentPage()">결제하기</button>
</div>
<%@ include file="../footer.jsp"%>
<script src="ticketing/ticketing.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/ticketing.css" />
<script src="ticketing/ticketing.js"></script>
<style>
  .center {
    text-align: center;
  }
</style>

<body>
  <h3 class="center">${movieName.title} ${startTime}~ ${endTime} (${rnumb}관)</h3>
  <p class="center">잔여좌석 ${scnt - ticketingSummary.total_p_num}/${scnt}석</p>
  <br>
  <div class="center">screen</div>
  <div class="center">
    <c:forEach var="seatVO" items="${roomseats}" varStatus="loop">
      <c:set var="reserved" value="false" />
      <c:forEach var="alreadySeat" items="${alreadySeats}">
        <c:if test="${seatVO.name == alreadySeat}">
          <c:set var="reserved" value="true" />
        </c:if>
      </c:forEach>
      <c:if test="${reserved}">
        <span class="reserved-seat">${seatVO.name}</span>
      </c:if>
      <c:if test="${!reserved}">
        <span class="seat-name">${seatVO.name}</span>
      </c:if>
      <c:if test="${loop.index % 12 == 1 || loop.index % 12 == 9}">
        &nbsp;
      </c:if>
      <c:if test="${loop.index % 12 == 11}">
        <br />
      </c:if>
    </c:forEach>
  </div>
  <br>
  <c:choose>
    <c:when test="${age == 12}">
      <div class="center"><p>본 영화는 <b>만 12세 이상</b> 관람가 영화 입니다.</p>
      <p>만 12세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에 관람이 가능합니다.</p>
      <p>연령 확인 불가 시 입장이 제한될 수 있습니다.</p></div>
    </c:when>
    <c:when test="${age == 15}">
      <div class="center"><p>본 영화는 <b>만 15세 이상</b> 관람가 영화 입니다.</p>
      <p>만 15세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에 관람이 가능합니다.</p>
      <p>연령 확인 불가 시 입장이 제한될 수 있습니다.</p></div>
    </c:when>
    <c:when test="${age == 18}">
      <div class="center"><p>본 영화는 <b>청소년 관람 불가</b>  영화 입니다.</p>
      <p>만 18세 미만의 고객님(영, 유아 포함)은 보호자가 있어도 관람하실 수 없으며,</p>
      <p>만 18세 이상이라도 [초등교육법]에 따라 재학중인 학생은 관람이 불가합니다.</p></div>
    </c:when>
    <c:otherwise>
      <p></p>
    </c:otherwise>
  </c:choose>
  <div class="button-container">
    <button type="button" class="custom-button" onclick="closeWindow()">취소</button>
    <button type="button" class="custom-button" onclick="redirectToTicketingChoice()">인원/좌석 선택</button>
  </div>
  <c:set var="startTime" value="${startTime}" scope="session" />
  <c:set var="endTime" value="${endTime}" scope="session" />
  <c:set var="room" value="${room}" scope="session" />
  <c:set var="schedule_numb" value="${schedule_numb}" scope="session" />
  <c:set var="scnt" value="${scnt}" scope="session" />
  <c:set var="title" value="${movieName.title}" scope="session" />
  <c:set var="movie_numb" value="${movie_numb}" scope="session" />
  <c:set var="rnumb" value="${rnumb}" scope="session" />

</body>
</body>

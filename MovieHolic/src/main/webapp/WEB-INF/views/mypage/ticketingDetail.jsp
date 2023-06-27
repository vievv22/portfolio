<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mypage.css" />
<style>
#middle {
  font-family: Arial, sans-serif;
  margin-top: 70px;
  	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-bottom: 50px;
}
.ticket-container{
border : 2px solid #727272;
width: 800px;
border-radius:10px;
background-color: #FFFFFA;
	/* 외부 그림자 */
	box-shadow: 2px 2px 4px 5px gray;
	margin-bottom:20px;

}
</style>
</head>
<div class="bar"><div><img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;마이페이지&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;예매 상세</div></div>
<div class="mypage-mid" id="middle">
	<h3>예매 내역</h3>
<div class="ticket-container">
  <table class="ticket-table">
    <tr>
      <td rowspan="7" class="poster-cell">
        <img src="movie_images/${ticketingVO.poster_url}" class="poster-image">
      </td>
      <td class="ticket-label"><b>영화 제목</b></td>
      <td>${ticketingVO.movie_title}</td>
    </tr>
    <tr>
      <td><b>예매번호</b></td>
      <td>${ticketingVO.numb}</td>
    </tr>
    <tr>
    <td></td>
      <td  style="color:red;">위의 예매번호로 해당 극장에서 티켓을 찾으세요.</td>
    </tr>
    <tr>
      <td><b>상영 일시</b></td>
      <td>
        <fmt:formatDate value="${ticketingVO.start_day}" pattern="yyyy-MM-dd" />
        (<fmt:formatDate value="${ticketingVO.start_day}" pattern="E" />) ${ticketingVO.start_time}
      </td>
    </tr>
    <tr>
      <td><b>상영관</b></td>
      <td>${ticketingVO.th_name} ${ticketingVO.r_numb}관</td>
    </tr>
    <tr>
      <td><b>관람인원</b></td>
      <td>${ticketingVO.p_num}명</td>
    </tr>
    <tr>
      <td><b>좌석</b></td>
      <td>${ticketingVO.seat_name}</td>
    </tr>
  </table>
  
  <table class="details-table">
    <tr>
      <td class="details-label"><b>결제 일시</b></td>
      <td 	style="border-bottom:1px solid #727272;"><fmt:formatDate value="${ticketingVO.regdate}" pattern="yyyy-MM-dd HH:mm" /></td>
    </tr>
    <tr>
      <td><b>결제 금액 (${ticketingVO.p_num}매)</b></td>
      <td>${ticketingVO.price}원</td>
    </tr>
    <tr>
      <td rowspan="2"><b>상태</td>
      <c:choose>
        <c:when test="${ticketingVO.cancelyn == 'y'}">
          <td style="color: red;">예매 취소</td>
        </c:when>
        <c:otherwise>
          <td>예매 완료</td>
        </c:otherwise>
      </c:choose>
    </tr>
    <tr>
      <td>
        <c:if test="${ticketingVO.cancelyn == 'n'}">
			<c:set var="currentTime" value="<%= new Date() %>"/>
			<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${currentTime}" var="currentTimestamp" />
			<c:set var="startDayTokens" value="${fn:split(ticketingVO.start_day, ' ')}" />
			<c:set var="formattedMonth" value="" />
			<c:choose>
			  <c:when test="${startDayTokens[1] eq 'Jan'}">
			    <c:set var="formattedMonth" value="01" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Feb'}">
			    <c:set var="formattedMonth" value="02" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Mar'}">
			    <c:set var="formattedMonth" value="03" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Apr'}">
			    <c:set var="formattedMonth" value="04" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'May'}">
			    <c:set var="formattedMonth" value="05" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Jun'}">
			    <c:set var="formattedMonth" value="06" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Jul'}">
			    <c:set var="formattedMonth" value="07" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Aug'}">
			    <c:set var="formattedMonth" value="08" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Sep'}">
			    <c:set var="formattedMonth" value="09" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Oct'}">
			    <c:set var="formattedMonth" value="10" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Nov'}">
			    <c:set var="formattedMonth" value="11" />
			  </c:when>
			  <c:when test="${startDayTokens[1] eq 'Dec'}">
			    <c:set var="formattedMonth" value="12" />
			  </c:when>
			</c:choose>
			
			<c:set var="formattedStartDay" value="${startDayTokens[5]}-${formattedMonth}-${startDayTokens[2]}" />
			
			<c:set var="formattedStartDateTime" value="${formattedStartDay} ${ticketingVO.start_time}" />
			
			
			<c:choose>
			  <c:when test="${formattedStartDateTime > currentTimestamp}">
			              <a href="#" onclick="confirmCancel()" class="box-link">예매 취소</a>
			  </c:when>
			  <c:otherwise>
			  취소 불가
			  </c:otherwise>
			</c:choose>	
        </c:if>
        &nbsp;&nbsp;
      
      </td>
    </tr>
  </table>
  </div>
  <a href="#" onclick="history_back()" class="box-link">목록</a>
</div>

<script>
	function history_back() {
		history.back(-1); // 이전 페이지로 돌아감
	}

	function confirmCancel() {
		if (confirm("예매를 취소하시겠습니까?")) {
			// 사용자가 "예"를 선택한 경우
			var numb = "${ticketingVO.numb}"; // 예매번호 값
			location.href = "/movie/cancel_ticketing?numb=" + numb; // 예매 취소 URL로 이동
			alert("예매 취소가 완료되었습니다."); // 예매 취소 완료 알림 창 띄우기
		} else {
			// 사용자가 "아니오"를 선택한 경우
			// 추가 동작이 필요한 경우 여기에 작성합니다.
		}
	}
</script>
</html>
<%@ include file="../footer.jsp"%>

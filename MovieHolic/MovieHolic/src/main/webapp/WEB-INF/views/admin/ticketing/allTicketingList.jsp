<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp" %>
	<link rel="stylesheet" href="css/admin/ticketing.css" />
	<script src="admin/ticketing/ticketing.js"></script>
 <main class="page-content">
    <div class="container-fluid">
	<h1 align="center">예매 리스트</h1>
	<hr>
			<div class="row">
			<div class="col-md-6">
				<label for="items-per-page" class="form-label">페이지당 항목 수:</label> <select
					id="items-per-page" class="form-select"
					onchange="changeItemsPerPage(this)">
					<option value="10" ${selectedValue == 10 ? 'selected' : ''}>10개씩
						보기</option>
					<option value="20" ${selectedValue == 20 ? 'selected' : ''}>20개씩
						보기</option>
					<option value="30" ${selectedValue == 30 ? 'selected' : ''}>30개씩
						보기</option>
				</select>
			</div>
			<div class="col-md-4 text-end" style="align:right">
				<div class="input-group">
					<input type="text" class="form-control" id="search-input"
						placeholder="아이디 입력" style="text-align: center;">&nbsp;&nbsp;
					<button class="btn btn-primary" onclick="searchSchedule()">검색</button>
					&nbsp;&nbsp;
					<button class="btn btn-primary" onclick="searchSchedule()">전체</button>
				</div>
			</div>
		</div>
	<br>
	<table class="schedule-table">
		<thead>
			<tr>
				<th width="100px">예매 번호</th>
				<th width="100px">ID</th>
				<th width="100px">극장</th>
				<th width="50px">관</th>
				<th width="300px">영화 제목</th>
				<th width="150px">상영일</th>
				<th width="100px">시작 시간</th>
				<th width="100px">종료 시간</th>
				<th width="50px">인원</th>
				<th width="100px">가격</th>
				<th width="150px">예매일</th>
				<th width="150px">예매 상태</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${allTicketingList}" var="ticketingVO">
			<tr height="50px">
				<td>${ticketingVO.numb}</td>
				<td>${ticketingVO.user_id}</td>
				<td>${ticketingVO.th_name}</td>
				<td>${ticketingVO.r_numb}</td>
				<td>${ticketingVO.movie_title}</td>
				<td><fmt:formatDate value="${ticketingVO.start_day}" pattern="yyyy-MM-dd" /></td>
				<td>${ticketingVO.start_time}</td>
				<td>${ticketingVO.end_time}</td>
				<td>${ticketingVO.p_num}</td>
				<td>${ticketingVO.price}</td>
				<td><fmt:formatDate value="${ticketingVO.regdate}" pattern="yyyy-MM-dd" /></td>
				
				<c:choose>
				<c:when test="${ticketingVO.cancelyn == 'n'}">
					<td>예매 완료</td>
				</c:when>
				<c:otherwise>
					<td>취소</td>
				</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<br><br>
	<div>
	<ul class="pagination">
	
		<c:if test="${pageMaker.prev}">
			<li class="paginate_button previous">
				<a href="get_all_ticketing_list${pageMaker.makeQuery(pageMaker.startPage-1)}&select=${selectedValue}&id=${id}"><<</a>
			</li>
		</c:if>
				
		<!-- [1][2][3]... 표시 부분 -->
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="index">
			<a style="margin-right:10px;" href="get_all_ticketing_list${pageMaker.makeQuery(index)}&select=${selectedValue}&id=${id}">${index}</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
			<li class="paginate_button next">
				<a href="get_all_ticketing_list${pageMaker.makeQuery(pageMaker.endPage+1)}&select=${selectedValue}&id=${id}">>></a>
			</li>
		</c:if>	
			
	</ul>
</div>
	</div>
  </main>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/admin/schedule.css" />
<script src="admin/schedule/schedule.js"></script>
<script>
var theaterName = '<%=request.getParameter("theater_name")%>';
var theater_name = '${scheduleList[0].theater_name}';
</script>
<body
	style="font-family: Arial, sans-serif; background-color: #f5f5f5; margin: 0;">
	<main class="page-content">
	<div class="container-fluid">
		<h1 align="center">상영 일정</h1>
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
			<div class="col-md-4 text-end">
				<div class="input-group">
					<input type="text" class="form-control" id="search-input"
						placeholder="영화 제목 입력" style="text-align: center;">&nbsp;&nbsp;
					<button class="btn btn-primary" onclick="searchSchedule()">검색</button>
					&nbsp;&nbsp;
					<button class="btn btn-primary" onclick="searchSchedule()">전체</button>
				</div>
			</div>
		</div>

		<br>
		<table class="schedule-table" style="width: 100%;">
			<tr>
				<th>번호</th>
				<th>극장 이름</th>
				<th>관 번호</th>
				<th width="250px;">영화 제목</th>
				<th>상영일</th>
				<th>시작 시간</th>
				<th>종료 시간</th>
				<th style="width: 150px;">관리</th>
			</tr>
			<c:forEach items="${scheduleList}" var="scheduleVO"
				varStatus="status">
				<tr>
					<td>${status.index + 1}</td>
					<td class="theater-name">${scheduleVO.theater_name}</td>
					<td class="room-number">${scheduleVO.room_numb}</td>
					<td class="movie-title">${scheduleVO.title}</td>
					<td class="showing-day"><c:set var="formattedDate"
							value="${fn:substring(scheduleVO.s_day, 0, 10)}" />
						${formattedDate}</td>
					<td class="start-time">${scheduleVO.start_time}</td>
					<td class="end-time">${scheduleVO.end_time}</td>
					<td><c:set var="currentTime" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${currentTime}" pattern="yyyy-MM-dd"
							var="currentDate" /> <c:set var="hasValidCondition"
							value="${scheduleVO.count >= 1 || formattedDate le currentDate}" />

						<c:choose>
							<c:when test="${hasValidCondition}">
								<button class="delete-button"
									onclick="delete_schedule(${scheduleVO.numb})" disabled>삭제
									불가</button>
							</c:when>
							<c:otherwise>
								<button class="delete-button"
									onclick="delete_schedule(${scheduleVO.numb})">삭제</button>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
		<br> <br>
		<div>
			<ul class="pagination">
				<!-- 이전 페이지 링크 -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="theater_schedule_list${pageMaker.makeQuery(pageMaker.startPage-1)}&theater_name=${scheduleList[0].theater_name}&select=${selectedValue}&title=${title}"><<</a>
					</li>
				</c:if>

				<!-- 페이지 번호 링크 -->
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="index">
					<li class="paginate_button"><a
						href="theater_schedule_list${pageMaker.makeQuery(index)}&theater_name=${scheduleList[0].theater_name}&select=${selectedValue}&title=${title}">${index}</a>
					</li>
				</c:forEach>

				<!-- 다음 페이지 링크 -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="theater_schedule_list${pageMaker.makeQuery(pageMaker.endPage+1)}&theater_name=${scheduleList[0].theater_name}&select=${selectedValue}&title=${title}">>></a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
	</main>
	</div>
</body>

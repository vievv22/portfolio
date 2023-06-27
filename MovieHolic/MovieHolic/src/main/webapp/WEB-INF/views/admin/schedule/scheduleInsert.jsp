<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
<link rel="stylesheet" href="css/admin/schedule.css" />
<meta charset="UTF-8">
<body style="font-family: Arial, sans-serif; background-color: #f2f2f2;">
	<main class="page-content">
	<div class="container-fluid">

		<h1 class="h1" style="text-align: center;">상영 일정 등록</h1>
		<hr>
		<form method="post" id="schedule_form" class="schedule_form">
			<input type="hidden" name="movie_numb" value=""> <input
				type="hidden" name="theater_numb" value=""> <input
				type="hidden" name="room_numb" value=""> <input
				type="hidden" name="s_day" value=""> <input type="hidden"
				name="start_times" value=""> <input type="hidden"
				name="end_times" value=""> <input type="hidden"
				name="start_day" value=""> <input type="hidden"
				name="theater_name" value=""> <input type="hidden"
				name="end_day" value=""> <label>영화 선택</label>
			<div id="movieList"></div>
			<br> <label>극장 선택</label>
			<div id="localList"></div>
			<div id="theaterList"></div>
			<br>
			<div class="radio-container">
				<label class="custom-radio"> <input type="radio"
					name="scheduleType" value="single" checked> <span>단일
						등록</span> <span class="checkmark"></span>
				</label> <label class="custom-radio"> <input type="radio"
					name="scheduleType" value="batch"> <span>일괄 등록</span> <span
					class="checkmark"></span>
				</label>
			</div>
			<br>
			<div id="singleDateWrapper">
				<label>상영 일정 날짜</label> <input id="dateInput" type="date"
					name="date" required>
			</div>
			<div id="batchDateWrapper" style="display: none;">
				<label>시작 날짜</label> <input type="date" name="startDate"
					id="startDateInput" required> <br>
				<br> <label>종료 날짜</label> <input type="date" name="endDate"
					id="endDateInput" disabled required>
			</div>
			<br>
			<div>
				<label>상영 시간</label>
				<div id="timeList">
					<input type="time" class="startTimeInput" value="08:00" disabled
						required>
				</div>
				<button type="button" id="addTimeButton">시간 추가</button>
			</div>
			<br> <label>상영관</label>
			<div id="roomList"></div>
			<br>
			<button type="button" onclick="go_save_schedule()">등록</button>
		</form>

	</div>
	</main>
	</div>
</body>
<script src="admin/schedule/schedule.js"></script>


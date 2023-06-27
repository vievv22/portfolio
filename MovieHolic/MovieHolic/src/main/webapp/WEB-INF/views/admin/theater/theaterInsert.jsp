<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="admin/theater/theater.js"></script>
<link rel="stylesheet" href="css/admin/theater.css" />
<body style="font-family: Arial, sans-serif; background-color: #f2f2f2;">
	<main class="page-content">
	<div class="container-fluid">
		<h1>극장 등록</h1>
		<hr>
		<div class="container2">

			<form method="post" class="theater-form" id="theater_insert_form">
				<div class="section">
					<p>극장 이름</p>
					<input type="text" name="name" class="name-input" maxlength="6"
						oninput="limitInput(this, 7)"
						onkeypress="return isHangulKey(event)" placeholder="극장명 입력"
						required /> <span class="warning-message" id="warning-message"></span>
					<p class="name-status" id="name-status"></p>
				</div>
				<fieldset class="section">
					<legend>&nbsp;&nbsp;&nbsp;주소</legend>
					<label>우편번호</label> <input type="text" name="zip_num" id="zip_num"
						size="10" required readonly><br>
					<br> <input type="button" value="우편번호찾기" onclick="kakaopost()"><br>
					<br> <label>권역</label> <input type="text"
						style="height: 35px;" name="local" id="local" size="50" required
						readonly><br>
					<br> <label>상세주소</label> <input type="text" name="address"
						id="address" size="50" readonly
						value="<%=(request.getParameter("address") != null ? request.getParameter("address") : "") + " "
					+ (request.getParameter("zip_num") != null ? request.getParameter("zip_num") : "")%>"><br>
					<br>
				</fieldset>
				<fieldset class="section">
					<legend>&nbsp;&nbsp;&nbsp;관 추가</legend>
					<div id="rooms-container"></div>
					<button type="button" class="add-room-button" onclick="addRoom()">+</button>
				</fieldset>
				<input type="button" class="submit-button"
					onclick="insert_theater_action()" value="등록">
			</form>
		</div>
	</div>
	</main>
	</div>
</body>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../header.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=79e85ca7dbebb891beea0558c07823ba&libraries=services"></script>
<link rel="stylesheet" href="css/admin/theater.css" />
<script src="admin/theater/theater.js"></script>
<body style="font-family: Arial, sans-serif; background-color: #f2f2f2;">
	<main class="page-content">
	<div class="container-fluid">
		<h1>극장 상세 정보</h1>
		<hr>
		<div class="container">
			<div id="local" class="div-container div-container-local"
				style="flex: 1;">지역</div>
			<div id="theater" class="div-container div-container-theater"
				style="flex: 1;">극장</div>
			<div id="table-container" class="table-container"
				style="overflow: auto;">
				<table class="detail-table">
					<tr>
						<td>극장명</td>
						<td class="placeholder">N/A</td>
						<td>총관</td>
						<td class="placeholder">N/A</td>
					</tr>
					<tr>
						<td>지역</td>
						<td class="placeholder">N/A</td>
						<td>총 좌석</td>
						<td class="placeholder">N/A</td>
					</tr>
					<tr>
						<td>주소</td>
						<td class="placeholder">N/A</td>
						<td>운영 상태</td>
						<td class="placeholder">N/A</td>
					</tr>
				</table>
				<br>
				<br>
				<button id="close-theater-btn" class="close-btn"
					style="display: none;">폐점</button>
			</div>
		</div>
		<br>
		<br>
		<div id="room-container"></div>
	</div>
	</main>
	</div>
</body>

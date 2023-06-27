<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/theater.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@600&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=79e85ca7dbebb891beea0558c07823ba&libraries=services"></script>
<script src="theater/theater.js"></script>
<div class="bar">
	<div>
		<img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img
			src="images/arrow.png" alt=">" width="10px">&nbsp;&nbsp;극장&nbsp;&nbsp;<img
			src="images/arrow.png" alt=">" width="10px">&nbsp;&nbsp;극장 정보
	</div>
</div>
<div class="middle">
	<div style="margin: 25px auto; width: 1100px; text-align: center;">
		<h2>극장 조회</h2>
	</div>
	<div class="container">
		<div
			style="padding: 0; margin: 0; text-align: center; height: 50px; border-left: 1px solid #E2E2E2;">
			<p>지역</p>
			<div id="local" class="div-container div-container-local"
				style="overflow-y: auto; max-height: 385px;"></div>
		</div>
		<div
			style="text-align: center; height: 50px; border-left: 1px solid #E2E2E2;">
			<p>극장</p>
			<div id="theater" class="div-container div-container-theater"
				style="overflow-y: auto; max-height: 385px;">극장을 선택해주세요.</div>
		</div>
		<div class="info"
			style="text-align: center; height: 50px; border-left: 1px solid #E2E2E2; border-right: 1px solid #E2E2E2;">
			<p>정보</p>
			<div id="table-container" class="table-container">
				<table class="theater-table">
					<tr>
						<td style="width: 75px;">극장명</td>
						<td class="placeholder">N/A</td>
					</tr>
					<tr>
						<td style="width: 75px;">총관</td>
						<td class="placeholder">N/A</td>
					</tr>
					<tr>
						<td style="width: 75px;">지역</td>
						<td class="placeholder">N/A</td>
					</tr>
					<tr>
						<td style="width: 75px;">총 좌석</td>
						<td class="placeholder">N/A</td>
					</tr>
					<tr>
						<td style="width: 75px;">주소</td>
						<td class="placeholder" style="overflow: auto;">N/A</td>
					</tr>
					<tr>
						<td style="width: 75px;">운영</td>
						<td class="placeholder">N/A</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- address.jsp를 인클루드할 영역 -->
<div id="map-container">
	<jsp:include page="addressMap.jsp">
		<jsp:param name="address" value="${address}" />
	</jsp:include>
</div>
<%@ include file="../footer.jsp"%>
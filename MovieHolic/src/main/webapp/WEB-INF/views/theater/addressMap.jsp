<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 카카오 지도 API 스크립트를 로드합니다 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79e85ca7dbebb891beea0558c07823ba"></script>
<style>
#map {
	position: relative;
	text-align: center;
	margin: 100px auto;
}

#map h3 {
	margin: 0;
	padding: 10px;
	background-color: white;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
}
</style>
<div id="map"></div>
<script src="theater/theater.js"></script>
<script>
	var address = "<%=request.getParameter("address")%>";
	//주소 값을 전달하여 지도를 표시합니다
	if (address) {
		showMap(address);
	} else {
		var mapContainer = document.getElementById("map");
		mapContainer.innerHTML = "[No map available to display]";
		mapContainer.style.width = "1000px";
		mapContainer.style.height = "0";
	}
</script>


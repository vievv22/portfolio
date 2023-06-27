/**
 * 
 */
<!-- theaterInfo -->
// 최초 지역 목록 출력
$(document).ready(function() {
    // AJAX 요청 보내기
    $.ajax({
        url: "get_local_list", // 요청할 URL
        method: "GET",
        dataType: "json",
        success: function(data){ // 요청이 성공한 경우 실행될 콜백 함수
            // 응답 데이터를 처리하여 표시할 HTML 생성
            var html = "";
            for (var i= 0; i <data.length; i++){
                html += "<p style='padding-bottom:10px;'>" + data[i].local + "</p>";
            }
            
            // 결과를 표시할 div 영역에 HTML 삽입
            $("#local").html(html);
        },
        error: function(xhr, status, error) { // 요청이 실패한 경우 실행될 콜백 함수
            console.log("AJAX 요청 실패: " + error);
        }
    });
});

// 지역 선택 시 이벤트 처리
$(document).on("click", "#local p", function() {
    var local = $(this).text(); // 클릭된 지역 값 가져오기
    
    // AJAX 요청 보내기
    $.ajax({
        url: "get_theater_list",
        method: "GET",
        data: {local: local},
        dataType: "json",
        success: function(data){
            var html = "";
            for (var i=0; i < data.length; i++){
                html += "<p class='theater-name' style='padding-bottom:5px;' data-numb='" + data[i].numb + "'>" + data[i].name + "</p>";
            }
            
            $("#theater").html(html);
        },
        error: function(xhr, status, erro){
            console.log("AJAX 요청 실패" + error);
        }
    });
});

// 극장 이름 클릭시 이벤트 처리
$(document).on("click",".theater-name", function() {
    var numb = $(this).data("numb");
    $.ajax({
        url: "get_theater_detail",
        method: "GET",
        data: { numb: numb },
        dataType: "json",
        success: function(response) {
            var clickedAddress = response.local + " " +  response.address;

            // 주소 값을 전달하여 지도를 표시하기 위해 컨트롤러를 호출합니다
				$.ajax({
				    url: "get_address_map",
				    method: "GET",
				    data: { address: clickedAddress },
				    dataType: "html",
				    success: function(response) {
				        // 성공적으로 받아온 HTML을 address.jsp가 인클루드된 영역에 삽입
				        $("#map-container").html(response);
				    },
				    error: function(xhr, status, error) {
				        console.log("AJAX 요청 실패: " + error);
				    }
				});
     	   
            // 극장 상세 정보를 받아와서 처리할 로직 작성
            // 예시: 상세 정보를 표시할 div 영역에 HTML 삽입
            // 정보
            // 극장명
            $("#table-container tr:nth-child(1) td:nth-child(2)").text(response.name);
            // 지역
            $("#table-container tr:nth-child(3) td:nth-child(2)").text(response.local);
            // 주소
            $("#table-container tr:nth-child(5) td:nth-child(2)").text(response.address);
            // 총관
            $("#table-container tr:nth-child(2) td:nth-child(2)").text(response.room);
            // 총 좌석
            $("#table-container tr:nth-child(4) td:nth-child(2)").text(response.seat);
            // 폐관 여부
            $("#table-container tr:nth-child(6) td:nth-child(2)").text('운영 중');
            
        }
    });
});

<!-- addressMap -->
function showMap(address) {
    var container = document.getElementById("map");
    var options = {
        center: new kakao.maps.LatLng(0, 0),
        level: 3,
    };
    var map = new kakao.maps.Map(container, options);

    var geocoder = new kakao.maps.services.Geocoder();

    geocoder.addressSearch(address, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            var marker = new kakao.maps.Marker({
                map: map,
                position: coords,
            });

            map.setCenter(coords);
            
	           // '위치'라는 문구를 생성하여 지도 위에 추가
            var locationLabel = document.createElement("h3");
            locationLabel.textContent = "위치";
            locationLabel.style.position = "absolute";
            locationLabel.style.top = "10px";
            locationLabel.style.left = "50%";
            locationLabel.style.transform = "translateX(-50%)";
            locationLabel.style.zIndex = "1";  // 위치 문구가 상위에 표시되도록 설정
            container.appendChild(locationLabel); 
            
            // 지도가 표시될 때 width와 height 설정
            container.style.width = "1000px";
            container.style.height = "700px";
        } else {
            // 지도가 표시되지 않을 때 width와 height 설정
            container.style.width = "0";
            container.style.height = "0";
        }
    });
}



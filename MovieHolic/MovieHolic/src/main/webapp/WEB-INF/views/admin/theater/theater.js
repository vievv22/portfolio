/**
 * 
 */
<!-- theaterDetail -->
// 최초 지역 목록 출력
$(document).ready(function() {
    // AJAX 요청 보내기
    $.ajax({
        url: "get_admin_local_list", // 요청할 URL
        method: "GET",
        dataType: "json",
        success: function(data){ // 요청이 성공한 경우 실행될 콜백 함수
            // 응답 데이터를 처리하여 표시할 HTML 생성
            var html = "";
            for (var i= 0; i <data.length; i++){
                html += "<p>" + data[i].local + "</p>";
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
        url: "get_admin_theater_list",
        method: "GET",
        data: {local: local},
        dataType: "json",
        success: function(data){
            var html = "";
            for (var i=0; i < data.length; i++){
                html += "<p class='theater-name' data-numb='" + data[i].numb + "'>" + data[i].name + "</p>";
            }
            
            $("#theater").html(html);
        },
        error: function(xhr, status, erro){
            console.log("AJAX 요청 실패" + error);
        }
    });
});


$(document).on("click", "#close-theater-btn", function () {
	    var confirmed = confirm("극장을 폐점하시겠습니까?");
	    if (confirmed) {
	        var numb = $(".theater-name.active").data("numb");
	        $.ajax({
	            url: "get_admin_update_theater",
	            method: "GET",
	            data: { numb: numb },
	            success: function () {
	                // Handle the success response
	                $("#close-theater-btn").hide();
	                // 폐점 여부를 나타내는 텍스트 업데이트
	                $("#table-container tr:nth-child(3) td:nth-child(4)").text("n");
	            },
	            error: function (xhr, status, error) {
	                console.log("AJAX 요청 실패:", error);
	            }
	        });
	    }
	});




// 극장 이름 클릭시 이벤트 처리
	$(document).on("click", ".theater-name", function() {
	    // 모든 .theater-name 요소에서 active 클래스 제거
	    $(".theater-name").removeClass("active");
	    // 클릭된 .theater-name 요소에 active 클래스 추가
	    $(this).addClass("active");
	
	    var numb = $(this).data("numb");
    $.ajax({
        url: "get_admin_theater_detail",
        method: "GET",
        data: { numb: numb },
        dataType: "json",
        success: function(response) {
     	   
            // 극장 상세 정보를 받아와서 처리할 로직 작성
            // 예시: 상세 정보를 표시할 div 영역에 HTML 삽입
            // 정보
            // 극장명
            $("#table-container tr:nth-child(1) td:nth-child(2)").text(response.name);
            // 지역
            $("#table-container tr:nth-child(2) td:nth-child(2)").text(response.local);
            // 주소
            $("#table-container tr:nth-child(3) td:nth-child(2)").text(response.address);
            // 총관
            $("#table-container tr:nth-child(1) td:nth-child(4)").text(response.room);
            // 총 좌석
            $("#table-container tr:nth-child(2) td:nth-child(4)").text(response.seat);
            // 폐관 여부
            $("#table-container tr:nth-child(3) td:nth-child(4)").text('운영 중');
         
            // 폐점 여부에 따라 폐점 버튼 보이기/감추기
            if (response.useyn === 'y') {
                $("#close-theater-btn").show();
            } else {
                $("#close-theater-btn").hide();
            }
            $("#room-container").show();
            $.ajax({
     	       url: "get_admin_room_list",
     	       method: "GET",
     	       data: { numb: numb },
     	       dataType: "json",
     	       success: function(data) {
     	    	   if (data.length > 0) {
     	                // 테이블 생성을 위한 요소들을 준비합니다.
     	                var table = $("<table></table>");
     	                var thead = $("<thead></thead>");
     	                var tbody = $("<tbody></tbody>");
     	                var trHeader = $("<tr></tr>");
     	                var th1 = $("<th></th>").text("Room Number");
     	                var th2 = $("<th></th>").text("Avaliable Seat");
     	                
     	                // 테이블 헤더를 구성합니다.
     	                trHeader.append(th1, th2);
     	                thead.append(trHeader);
     	                table.append(thead, tbody);
     	                
     	                // 각 room 정보를 테이블에 추가합니다.
     	                for (var i = 0; i < data.length; i++) {
     	                    var room = data[i];
     	                    var tr = $("<tr></tr>");
     	                    var td1 = $("<td></td>").text(room.numb + '관');
     	                    var td2 = $("<td></td>").text(room.cnt + ' 인');
     	                    tr.append(td1, td2);
     	                    tbody.append(tr);
     	                }
     	                
     	                // 생성된 테이블을 room-container에 추가합니다.
     	                $("#room-container").empty().append(table);
     	            } else {
     	                // 데이터가 없는 경우 메시지를 표시합니다.
     	                $("#room-container").text("No rooms available.");
     	            }
     	       },
     	       error: function(xhr, status, error) {
     	           console.log("AJAX 요청 실패:", error);
     	       }
     	   });
        }
    });
});

	// 극장 상세 정보 업데이트
	function updateTheaterDetails(numb) {
	    $.ajax({
	        url: "get_admin_theater_detail",
	        method: "GET",
	        data: { numb: numb },
	        dataType: "json",
	        success: function(response) {
	            // 극장 상세 정보 업데이트 로직 작성
	            // ...

	            // 폐점 여부에 따라 폐점 버튼 보이기/감추기
	            if (response.useyn === 'y') {
	                $("#close-theater-btn").show();
	            } else {
	                $("#close-theater-btn").hide();
	            }

	            // 테이블 및 내용 업데이트 로직 작성
	            // ...
	        },
	        error: function(xhr, status, error) {
	            console.log("AJAX 요청 실패:", error);
	        }
	    });
	}


<!-- theaterInsert -->

var checkName = 0;

function validateSeatsInput(input) {
	  var seats = input.value.trim();
	  
	  if (seats < 0) {
	    alert("인원 수는 0 이상이어야 합니다.");
	    input.value = ""; // 해당 필드 값을 초기화합니다.
	    return false;
	  } else if (seats > 121) {
		  alert("인원 수는 120 이하여야 합니다.");
		  input.value = ""; // 해당 필드 값을 초기화합니다.
		  return false;
	  }
	  
	  return true;
	}

	document.addEventListener("input", function(event) {
	  if (event.target.classList.contains("seat-input")) {
	    var input = event.target;
	    validateSeatsInput(input);
	  }
	});
	
	

function validateForm() {
	  var theaterName = document.getElementsByName("name")[0].value.trim();
	  var zipCode = document.getElementById("zip_num").value.trim();
	  var region = document.getElementById("local").value.trim();
	  var address = document.getElementById("address").value.trim();
	  
	  // 인원 수 입력 확인
	  var seatInputList = document.getElementsByClassName("seat-input");
	  for (var i = 0; i < seatInputList.length; i++) {
	    var seatInput = seatInputList[i];
	    if (seatInput.value.trim() === "") {
	      alert("인원 수를 입력하세요.");
	      return false;
	    }
	  }

	  if (theaterName === "" || zipCode === "" || region === "" || address === "") {
	    alert("모든 필드를 입력해주세요.");
	    return false;
	  }

	  return true;
	}



function insert_theater_action() {
	  var isValid = validateForm();

	  if (!isValid) {
	    return; // 폼 제출을 중단합니다.
	  }

	  
	  var roomsContainer = document.querySelector("#rooms-container");
	  var roomCount = roomsContainer.childElementCount;

	  if (roomCount < 1) {
	    alert("적어도 1개 이상의 관을 추가해야 합니다.");
	    return; // 폼 제출을 중단합니다.
	  }
	  
	  if(checkName === 0) {
		  alert("극장 명을 확인해주세요!");
		  return;
	  }

	  var form = document.getElementById("theater_insert_form");
	  if(confirm('정말 등록하시겠습니까?')){
		  form.action = "insert_theater";
		  form.submit();
		} else {
		  return false;
	  }
	  
	}


function limitInput(input, maxLength) {
	  var theaterName = input.value.trim();
	  if (theaterName === "") {
	    return false;
	  } else if (theaterName.length > maxLength) {
	    input.value = theaterName.slice(0, maxLength);
	    return false;
	  } 
	}

	function isHangulKey(event) {
	  var keyCode = event.which || event.keyCode;
	  var keyValue = String.fromCharCode(keyCode);
	  var pattern = /^[가-힣]+$/;
	  return pattern.test(keyValue);
	}

	function isConsonantAndVowel(text) {
	  var pattern = /[ㄱ-ㅎㅏ-ㅣ]/;
	  return pattern.test(text);
	}





var MAX_ROOM_COUNT = 10;
var MAX_SEAT_COUNT = 150;

$(document).ready(function() {
	  var warningMessage = ""; // 경고 메시지를 저장할 변수

	    $("input[name='name']").on("blur", function() {
	        var theaterName = $(this).val();
	        if (theaterName === "") {
	            warningMessage = "극장명을 입력하세요."; // 빈 값일 경우 경고 메시지 설정
	            updateWarningMessage();
	            return;
	        } else if (isConsonantAndVowel(theaterName)) {
	            $(this).val("");
	            alert("자음 또는 모음만 입력할 수 없습니다.");
	          }
	        $.ajax({
	            url: "get_check_theater_name",
	            type: "GET",
	            data: { name: theaterName },
	            dataType: "json",
	            success: function(result) {
	                if (result === false) {
	                    $("input[name='name']").css("background-color", "aliceblue");
	                    $("#name-status").text("사용 가능한 이름입니다.").css("color", "blue");
	                    checkName = 1;
	                } else {
	                    $("input[name='name']").css("background-color", "");
	                    $("#name-status").text("이미 존재하는 극장명입니다.").css("color", "red");
	                    checkName = 0;
	                }
	                warningMessage = ""; // 경고 메시지 초기화
	                updateWarningMessage();
	            }
	        });
	    });

	    // 경고 메시지 업데이트 함수
	    function updateWarningMessage() {
	        if (warningMessage !== "") {
	            $("#name-status").text(warningMessage).css("color", "red");
	        }
	    }

	    // input 포커스를 잃었을 때 경고 메시지 업데이트
	    $("input[name='name']").on("focusout", function() {
	        updateWarningMessage();
	    });

	    // 다른 요소를 클릭했을 때 경고 메시지 업데이트
	    $(document).on("click", function(e) {
	        if ($(e.target).is("input[name='name']")) {
	            return;
	        }
	        updateWarningMessage();
	    });
	});

function kakaopost() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      var roadAddress = data.roadAddress; // 도로명 주소
	      var buildingName = data.buildingName; // 건물명

	      document.querySelector("#zip_num").value = data.zonecode;
	      document.querySelector("#local").value = data.sido;
	      
	      if (buildingName && buildingName !== "") {
	        // 건물명이 존재하는 경우 도로명 주소와 건물명을 함께 할당
	        document.querySelector("#address").value = roadAddress + " " + buildingName;
	      } else {
	        // 건물명이 존재하지 않는 경우 도로명 주소만 할당
	        document.querySelector("#address").value = roadAddress;
	      }

	      // 주소 입력 후 포커스 이동
	      document.querySelector("#address").focus();
	    }
	  }).open();
	}




function renumberRooms() {
	  var roomRows = document.querySelectorAll(".room-row");
	  for (var i = 0; i < roomRows.length; i++) {
	    roomRows[i].querySelector("span").textContent = (i + 1) + "관    ";
	  }
	}

function addRoom() {
	  var roomsContainer = document.querySelector("#rooms-container");
	  var roomNumber = roomsContainer.childElementCount + 1; // 새로운 관 번호

	  if (roomNumber > MAX_ROOM_COUNT){
		  alert("최대 관 개수에 도달하였습니다.");
		  return;
	  }
	  
	  // 인원 수 입력 확인
	  if (roomNumber > 1) {
	    var seatInput = $(roomsContainer.lastElementChild).find(".seat-input");
	    if (seatInput.length > 0 && seatInput.val() === "") {
	      alert("인원 수를 입력하세요.");
	      return;
	    }
	  } else {
	    // 최초 1관인 경우 관 이름을 입력받습니다.
	    var nameInput = document.querySelector("input[name='name']");
	    if (!nameInput.value) {
	      alert("극장 이름을 입력하세요.");
	      return;
	    }
	  }

	  // 새로운 관 정보를 담을 div 요소 생성
	  var roomDiv = document.createElement("div");
	  roomDiv.className = "room-row";

	  // 관 번호 텍스트
	  var roomNumberSpan = document.createElement("span");
	  roomNumberSpan.textContent = roomNumber + "관";
	  roomDiv.appendChild(roomNumberSpan);

	  // 인원 수 입력
	  var seatInput = document.createElement("input");
	  seatInput.className = "seat-input";
	  seatInput.type = "number";
	  seatInput.name = "seats";
	  seatInput.min = "48";
	  seatInput.max = "120";
	  seatInput.value = "48";
	  seatInput.step = "12";
	  seatInput.placeholder = "인원 수";
	  seatInput.max = MAX_SEAT_COUNT;
	  seatInput.style.width= "150px";
	  roomDiv.appendChild(seatInput);
	  
	  seatInput.addEventListener("blur", function() {
		  var inputValue = parseInt(seatInput.value);

		  if (inputValue < 48 || inputValue % 12 !== 0) {
		    alert("입력값은 48 이상이어야 하고, 12의 배수여야 합니다.");
		    seatInput.value="48";
		  }
		});
	
	  // 줄 삭제 버튼
	  var deleteButton = document.createElement("button");
	  deleteButton.type = "button";
	  deleteButton.textContent = "Delete";
	  deleteButton.style.margin= "0 15px";
	  deleteButton.onclick = function() {
	    roomsContainer.removeChild(roomDiv);
	    renumberRooms();
	  };
	  
	  roomDiv.appendChild(deleteButton);

	  // 새로운 관 정보를 추가
	  roomsContainer.appendChild(roomDiv);

	  renumberRooms();
	}
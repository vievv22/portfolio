/**
 * 
 */



 $(document).ready(function() {
            var currentDate = new Date();
            var currentMonth = currentDate.getMonth();
            var currentYear = currentDate.getFullYear();
            var currentDay = currentDate.getDate();
            var calendarContainer = $("#calendar");
            var selectedTheater = null;
            var selectedMovie = null;
            var scheduleContainer = $("#scheduleList");
            var fDate;
            
            function initializeCalendar() {
            	renderCalendar();
            }
            function formatDate(date) {
            	var day = date.getDate().toString().padStart(2, '0');
            	return day;
            }

            function renderCalendar() {
                var calendarHTML = "";

                calendarHTML += "<div class='calendar-row'>";
                
/*
 * // 이전 버튼 생성 if (currentDay - 7 <= 0) { calendarHTML += "<div
 * class='calendar-item prev-button disabled'>&lt;</div>"; } else {
 * calendarHTML += "<div class='calendar-item prev-button'>&lt;</div>"; }
 */

                var startDate = new Date(currentYear, currentMonth, currentDay);

                for (var i = 0; i < 7; i++) {
                    // 날짜 출력
                    var day = startDate.getDate();
                    var dayText = (startDate.getMonth() === currentMonth) ? day : "";
                    var formattedDate = formatDate(startDate);

                    var dayClass = (day === currentDay) ? "selected" : "";

                    if (day < currentDay) {
                        dayClass += " disabled";
                    }

                    var weekDays = ['일', '월', '화', '수', '목', '금', '토'];
                    var dayOfWeek = weekDays[startDate.getDay()];
					
                    calendarHTML += "<div style='text-align:center;'>" + dayOfWeek;
                    calendarHTML += "<div class='calendar-item " + dayClass + "'>" + dayText + "</div></div>";

                    startDate.setDate(startDate.getDate() + 1);
                    
                    // 다음 달로 넘어갈 때 처리
                    if (startDate.getMonth() !== currentMonth) {
                      if (currentMonth === 11) {
                        currentYear++;
                        currentMonth = 0;
                      } else {
                        currentMonth++;
                      }
                      startDate = new Date(currentYear, currentMonth, 1);
                     // calendarHTML += "</div><div class='calendar-row'>";
                    }
                }

                 calendarContainer.html(calendarHTML);

                $(".calendar-item").on("click", function () {
                    if (!$(this).hasClass("disabled")) {
                        $(".calendar-item").removeClass("selected");
                        $(this).addClass("selected");
                        var selectedDateText = $(this).text().split('\n')[0];
                        var selectedDate = formatDate(new Date(currentYear, currentMonth, selectedDateText));
                    	 // 시간과 분이 한 자리 수인 경우 앞에 0을 추가하여 2자리로 만들기
                     // 예시: "12:59" 형식의 현재 시간 문자열이 formattedCurrentTime 변수에
						// 저장됩니다.
	 	            
                        if (selectedTheater && selectedMovie) {
                            // yyyy-MM-dd 형식으로 날짜 변환
                            if(currentDay > selectedDate) {
                            	var a = 1;
                        	} else {
                        		a = 0;
                        	}
							
                       		 var formattedDate = currentYear + '-' + (currentMonth + a).toString().padStart(2, '0') + '-' + selectedDate;
                      		 
                            // 상영 일정 목록을 가져오기
                            $.ajax({
                                url: "get_schedule_list",
                                type: "GET",
                                data: {
                                    s_day: formattedDate,
                                    theater: selectedTheater,
                                    movie_numb: selectedMovie
                                },
                                dataType: 'json',
                                contentType: 'application/json; charset=utf-8',
                                success: function(data) {
                                    renderScheduleList(data, scheduleContainer, formattedDate);
                                },
                                error: function(xhr, status, error) {
                                    console.error(xhr.responseText);
                                }
                            });

                        }
                    }
                });

            }
            
            
            function renderScheduleList(data, container, formattedDate) {
                var scheduleHTML = "";
                
                if (data.length > 0) {
                    scheduleHTML += "<h3>" + data[0].title + "</h3>";
                    scheduleHTML += "<div class='schedule-group'>";
                    for (var i = 0; i < data.length; i++) {
                        var isSelectable = data[i].ecnt !== data[i].scnt; // Check
																			// different
                        var currentDate = getCurrentDate(); // Get current date
                        // 현재 시간과 분 가져오기
                        var now = new Date();
                        var currentDay = now.getDate();
                        var currentHour = now.getHours();
                        var currentMinute = now.getMinutes();
                        var selectedDay = formattedDate.substr(8,10);
                        
                        // 시간 값이 한 자리인 경우 앞에 0을 붙여 두 자리로 표현
                        if (currentHour < 10) {
                          currentHour = "0" + currentHour;
                        }

                        // 분 값이 한 자리인 경우 앞에 0을 붙여 두 자리로 표현
                        if (currentMinute < 10) {
                          currentMinute = "0" + currentMinute;
                        }
                        
                        var currentTime = currentHour + ":" + currentMinute;
                        
                        
                        if((currentDay == selectedDay) && (data[i].start_time < currentTime)) {
                        	
                        } else {
                        fDate = formattedDate;
                        scheduleHTML += "<div class='schedule-item";
                        if (!isSelectable) {
                            scheduleHTML += " disabled-schedule"; // Apply
																	// disabled
																	// style
																	// class
                        }
                        
                        }
                        // 현재 시간과 분 가져오기
                        var now = new Date();
                        var currentDay = now.getDate();
                        var currentHour = now.getHours();
                        var currentMinute = now.getMinutes();
                        var selectedDay = formattedDate.substr(8,10);
                     // 시간 값이 한 자리인 경우 앞에 0을 붙여 두 자리로 표현
                        if (currentHour < 10) {
                          currentHour = "0" + currentHour;
                        }

                        // 분 값이 한 자리인 경우 앞에 0을 붙여 두 자리로 표현
                        if (currentMinute < 10) {
                          currentMinute = "0" + currentMinute;
                        }
                        
                        var currentTime = currentHour + ":" + currentMinute;
                        
                        
                        if((currentDay == selectedDay) && (data[i].start_time < currentTime)) {
                        	
                        } else {
                        
	                        scheduleHTML += "' data-ecnt='" + data[i].ecnt + "' data-scnt='" + data[i].scnt + "' data-start_time='" + data[i].start_time + 
	                        "' data-end_time='" + data[i].end_time + "' data-numb='" + data[i].numb +
	                        "' data-movie_numb='" + data[i].movie_numb +
	                        "' data-age='" + data[i].age +
	                        "' data-theater_numb='" + data[i].theater_numb +
	                        "' data-room_numb='" + data[i].room_numb + 
	                        "' data-title='" + data[i].title +
	                        "' data-ecnt='" + data[i].ecnt+
	                        "' data-rnumb='" + data[i].rnumb + "'>" + "시간 <b>" + data[i].start_time + "</b><br>";
                        
                        if (data[i].ecnt === null || isNaN(data[i].ecnt)) {
                            scheduleHTML += "<font style='color:red'>" + "0</font> / " +  data[i].scnt + "&nbsp;";
                        } else {
                            scheduleHTML += "<font style='color:red'>" + data[i].ecnt + "</font>/" + data[i].scnt + "&nbsp;";
                        }
                        
                        scheduleHTML += data[i].rnumb + "관" + "</div>";

                        if (formattedDate === currentDate && compareTimes(data[i].start_time, getCurrentTime())) {
                            alert("선택한 일자와 시간이 현재 시간보다 지났습니다.");
                            return false;
                        }
                    }
                    }
                    scheduleHTML += "</div>";
                } else {
                    scheduleHTML = "<p>No schedule available</p>";
                }
                container.html(scheduleHTML);
            }
			
            function getCurrentDate() {
                var now = new Date();
                return new Date(now.getFullYear(), now.getMonth(), now.getDate());
            }

            function compareTimes(time1, time2) {
                var t1 = new Date("2000/01/01 " + time1);
                var t2 = new Date("2000/01/01 " + time2);
                return t1.getTime() < t2.getTime();
            }

            function getCurrentTime() {
                var now = new Date();
                var hours = now.getHours().toString().padStart(2, '0');
                var minutes = now.getMinutes().toString().padStart(2, '0');
                return hours + ':' + minutes;
            }
            
            

	            // 일정 선택 시 선택된 모습 표시
	            $(document).on("click", ".schedule-item", function() {
	                // Remove the highlight from previously selected schedule
	                $(".schedule-item").removeClass("selected-schedule");
	                
	                // Highlight the selected schedule
	                $(this).addClass("selected-schedule");
	 
	                var startTime = $(this).data("start_time");
	                var currentDate = getCurrentDate();
	                var currentTime = getCurrentTime();
	


	                var currentDate = getCurrentDate();
	                var formattedCurrentDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1).toString().padStart(2, '0') + '-' + currentDate.getDate().toString().padStart(2, '0');

	                if (formattedCurrentDate === fDate &&startTime < currentTime) {
	                    alert("선택한 일자와 시간이 현재 시간보다 지났습니다.");
	                    return false;
	                }

                var age = $(this).data("age");
                var title = $(this).data("title");
                var time = $(this).data("time");
                var ecnt = $(this).data("ecnt");
                var startTime = $(this).data("start_time");
                var endTime = $(this).data("end_time");
                var scnt = $(this).data("scnt");
                var room = $(this).data("room_numb");
                var movie = $(this).data("movie_numb");
                var numb = $(this).data("numb");
                var rnumb = $(this).data("rnumb");
                
                if(ecnt == scnt) {
                	alert('해당 관은 선택할 수 없습니다!');
                	return false;
                }

                var url = "ticketing_popup";

                url += "?age=" + age;
                url += "&title=" + title;
                url += "&ecnt=" + ecnt;
                url += "&scnt=" + scnt;
                url += "&startTime=" + startTime;
                url += "&endTime=" + endTime;
                url += "&room=" + room;
                url += "&movie=" + movie;
                url += "&numb=" + numb;
                url += "&rnumb=" + rnumb;
                
                var width = 600;
                var height = 600;

                var left = window.screen.width / 2 - width / 2;
                var top = window.screen.height / 2 - height / 2;

                window.open(url, "Check Confirmation", "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top);
           
            });
            
            initializeCalendar();

            // 지역 목록 최초 출력
            $.ajax({
                url: "get_local_list_ticketing",
                type: "GET",
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                success: function(data) {
                    var localList = "";
                    for (var i = 0; i < data.length; i++) {
                        localList += "<li style='padding:10px;' class='localItem'>" + data[i] + "</li>";
                    }
                    $("#localList").html("<ul>" + localList + "</ul>");
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });

            // 지역 선택 시 극장 목록 출력
            $(document).on("click", ".localItem", function() {
            	$(".localItem").removeClass("selected-location");
            	 
                var local = $(this).text();
                $.ajax({
                    url: "get_theater_list_ticketing",
                    type: "GET",
                    data: {
                        local: local
                    },
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function(data) {
                        var theaterList = "";
                        for (var i = 0; i < data.length; i++) {
                            theaterList += "<li style='padding:10px;' class='theaterItem' data-theater_numb='" + data[i].numb + "'>" + data[i].name + "</li>";
                        }
                        $("#theaterList").html("<ul>" + theaterList + "</ul>");
                        selectedTheater = null;
                        selectedMovie = null;
                        $(".calendar-item").removeClass("selected");
                        $(".calendar-item").addClass("disabled");
                        $("#scheduleList").html("");
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
                // Highlight the selected location
                $(this).addClass("selected-location");
            });

            // 극장 선택 시 영화 목록 출력
            $(document).on("click", ".theaterItem", function() {
                // Remove the highlight from previously selected theater
                $(".theaterItem").removeClass("selected-theater");

                selectedTheater = $(this).data("theater_numb");
                $.ajax({
                    url: "get_movie_list",
                    type: "GET",
                    data: {
                        theater_numb: selectedTheater
                    },
                    dataType: 'json',
                    contentType: 'application/json; charset=utf-8',
                    success: function(data) {
                        var movieList = "";
                        for (var i = 0; i < data.length; i++) {
                            movieList += "<li style='padding:10px;' class='movieItem' data-movie_numb='" + data[i].numb + "'>" + data[i].title + "</li>";
                        }
                        $("#movieList").html("<ul>" + movieList + "</ul>");
                        selectedMovie = null;
                        $(".calendar-item").removeClass("selected");
                        $(".calendar-item").addClass("disabled");
                        $("#scheduleList").html("");
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
                // Highlight the selected theater
                $(this).addClass("selected-theater");
            });

            // 영화 선택 시 캘린더 활성화
            $(document).on("click", ".movieItem", function() {
                // Remove the highlight from previously selected movie
                $(".movieItem").removeClass("selected-movie");
                
                selectedMovie = $(this).data("movie_numb");
                $(".calendar-item").removeClass("disabled");
                $(".prev-button").addClass("disabled");
                $("#scheduleList").html("");
                
                // Highlight the selected movie
                $(this).addClass("selected-movie");
            });
        });


 <!-- ticketingInfo -->
	function closeWindow() {
		window.close(); // 창 닫기
	}
	function redirectToTicketingChoice() {
		  // 현재 창을 닫기
		  window.close();

		  // 원래의 창으로 이동하기
		  if (window.opener) {
		    window.opener.location.href = 'ticketingChoice';
		  }
		
	}
	
<!-- ticketingChoice -->
// 좌석 요소들을 선택합니다.
const seats = document.querySelectorAll('.seat');

// 선택된 좌석 수와 총 가격을 추적하는 변수들을 초기화합니다.
let selectedSeats = 0;
let totalPrice = 0;
let totalCount = 0;
let selectedSeatArray = [];


function handleSeatClick() {
	  // 청소년, 일반, 경로우대 항목을 선택하지 않았을 때의 상태를 확인합니다.
	  const isSelectionIncomplete =
	    parseInt(adultSelect.value) === 0 &&
	    parseInt(youthSelect.value) === 0 &&
	    parseInt(concessionSelect.value) === 0;

	  // 청소년, 일반, 경로우대 항목을 선택하지 않았을 때는 좌석 클릭 이벤트를 막습니다.
	  if (isSelectionIncomplete) {
	    return;
	  }

	  // 클릭된 좌석 요소의 인덱스를 가져옵니다.
	  const seatIndex = Array.from(seats).indexOf(this);

	  // 클릭된 좌석이 이미 선택된 상태인지 확인합니다.
	  const isAlreadySelected = this.classList.contains('selected');

	  // 클릭된 좌석이 이미 occupied 상태인지 확인합니다.
	  const isOccupied = this.classList.contains('occupied');

	  //  occupied 상태인 경우 클릭을 무시합니다.
	  if (isOccupied) {
	    return;
	  }

	  // 이미 선택된 상태이면 선택 해제하고, 그렇지 않으면 선택합니다.
	  if (isAlreadySelected) {
	    this.classList.remove('selected');
	    selectedSeats--;
	    totalPrice -= calculateSeatPrice();

	    // 좌석이 선택 해제된 경우 배열에서 해당 좌석을 제거합니다.
	    const index = selectedSeatArray.indexOf(this.textContent);
	    if (index > -1) {
	      selectedSeatArray.splice(index, 1);
	    }
	  } else {
	    // 선택된 좌석 수가 선택한 인원 수 이하일 때만 선택을 허용합니다.
	    const maxSeats = parseInt(adultSelect.value) + parseInt(youthSelect.value) + parseInt(concessionSelect.value);
	    if (selectedSeats < maxSeats) {
	      this.classList.add('selected');
	      selectedSeats++;
	      totalPrice += calculateSeatPrice();

	      // 좌석을 선택할 때마다 배열에 해당 좌석을 추가합니다.
	      selectedSeatArray.push(this.textContent);
	    }
	  }

	  // 선택된 좌석 배열을 확인하기 위해 콘솔에 출력합니다.
	  console.log(selectedSeatArray);
	}

// 좌석의 가격을 계산하는 함수입니다.
function calculateSeatPrice() {
// 각 좌석마다 다른 가격을 부여하고, 해당 가격을 반환하는 로직을 구현합니다.
// 일반 좌석은 14000원, 청소년 좌석은 12000원, 경로우대 좌석은 10000원으로 가정합니다.
const adultCount = parseInt(adultSelect.value);
const youthCount = parseInt(youthSelect.value);
const concessionCount = parseInt(concessionSelect.value);
const adultPrice = 14000;
const youthPrice = 12000;
const concessionPrice = 10000;
const totalPrice = adultCount * adultPrice + youthCount * youthPrice + concessionCount * concessionPrice;

return totalPrice;
}
// 선택된 좌석 수와 총 가격을 업데이트하는 함수입니다.
function updateSeatInfo() {
// 선택된 좌석 수를 가져옵니다.
const adultCount = parseInt(adultSelect.value);
const youthCount = parseInt(youthSelect.value);
const concessionCount = parseInt(concessionSelect.value);
const totalCount = adultCount + youthCount + concessionCount;
// 선택된 좌석 수와 총 가격을 HTML 요소에 업데이트합니다.
document.getElementById('count').textContent = totalCount;
document.getElementById('total').textContent = calculateSeatPrice();
}

// 각 좌석 요소에 클릭 이벤트 리스너를 추가합니다.
seats.forEach((seat) => {
seat.addEventListener('click', handleSeatClick);
});


// 각각의 셀렉트 박스 요소를 가져옵니다.
var adultSelect = document.getElementById('adult');
var youthSelect = document.getElementById('youth');
var concessionSelect = document.getElementById('concession');

// 셀렉트 박스 변경 이벤트 리스너를 추가합니다.
adultSelect.addEventListener('change', updateTotal);
youthSelect.addEventListener('change', updateTotal);
concessionSelect.addEventListener('change', updateTotal);


function goPaymentPage() {
const adultCount = parseInt(adultSelect.value);
const youthCount = parseInt(youthSelect.value);
const concessionCount = parseInt(concessionSelect.value);
const totalCount = adultCount + youthCount + concessionCount;
  const adultPrice = 14000;
  const youthPrice = 12000;
  const concessionPrice = 10000;
  const totalPrice = adultCount * adultPrice + youthCount * youthPrice + concessionCount * concessionPrice;
const selectedSeatsString = selectedSeatArray.join(", ");

if (selectedSeats === totalCount && totalCount !== 0) {


  const form = document.createElement('form');
  form.method = 'POST';
  form.action = 'payment';

  const inputSeats = document.createElement('input');
  inputSeats.type = 'hidden';
  inputSeats.name = 'selectedSeatsString';
  inputSeats.value = selectedSeatsString;

  const inputPrice = document.createElement('input');
  inputPrice.type = 'hidden';
  inputPrice.name = 'totalPrice';
  inputPrice.value = totalPrice;
  
  const inputCount = document.createElement('input');
  inputCount.type = 'hidden';
  inputCount.name = 'totalCount';
  inputCount.value = totalCount;

  form.appendChild(inputSeats);
  form.appendChild(inputPrice);
  form.appendChild(inputCount);
  document.body.appendChild(form);
  form.submit();
} else if (totalCount == 0) {
  alert("인원을 선택해주세요");
} else {
  alert("인원과 좌석 수가 일치하지 않습니다.");
}
}


// 선택된 인원 수의 합을 계산하여 제한을 적용하는 함수입니다.
function updateTotal() {
var adultCount = parseInt(adultSelect.value);
var youthCount = parseInt(youthSelect.value);
var concessionCount = parseInt(concessionSelect.value);
var totalCount = adultCount + youthCount + concessionCount;

// 선택된 인원 수의 합이 8명을 초과하는 경우, 제한을 적용합니다.
if (totalCount > 8) {
// 선택된 인원 수를 조정합니다.
var remainingCount = 8 - adultCount;

if (remainingCount >= 0) {
// 각각의 셀렉트 박스에 선택된 인원 수를 설정합니다.
adultSelect.value = adultCount;
youthSelect.value = remainingCount;
concessionSelect.value = 0;
} else {
// 선택이 무효화되도록 처리합니다.
// 청소년과 경로우대 선택 항목을 0으로 설정합니다.
youthSelect.value = 0;
concessionSelect.value = 0;

// 이미 선택된 좌석들을 초기화합니다.
seats.forEach((seat) => {
  if (seat.classList.contains('selected')) {
    seat.classList.remove('selected');
    selectedSeats--;
    totalPrice -= calculateSeatPrice();
  }
});
}
}

// 선택된 좌석 수와 총 가격을 업데이트합니다.
updateSeatInfo();


}
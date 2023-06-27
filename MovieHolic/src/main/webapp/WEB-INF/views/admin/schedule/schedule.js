/**
 * 
 */
<!-- scheduleList -->
function delete_schedule(numb) {
    if (confirm("정말 삭제하시겠습니까?")) {
      var link =
        "delete_schedule?numb=" +
        numb +
        "&theater_name=" +
        theater_name;
      window.location.href = link;
    }
  }
  
  function changeItemsPerPage(selectElement) {
  	  var selectedValue = selectElement.value;
  	  var title = document.getElementById("search-input").value;
  	  
  	  location.href = "theater_schedule_list?select=" + selectedValue + "&theater_name=" + theater_name + "&title=" + title;
  	}

  function searchSchedule() {
      var selectedValue = document.getElementById("items-per-page").value;
      var title = document.getElementById("search-input").value;

      // 검색 조건을 기반으로 페이지를 다시 로드하는 로직 작성
      location.href = "theater_schedule_list?select=" + selectedValue + "&theater_name=" + theaterName + "&title=" + title;
    }
  
<!-- scheduleInsert -->

// 단일 등록과 일괄 등록 라디오 버튼 요소를 가져옵니다.
var singleRadio = document.querySelector('input[name="scheduleType"][value="single"]');
var batchRadio = document.querySelector('input[name="scheduleType"][value="batch"]');

// 입력 필드 요소를 가져옵니다.
var dateInput = document.getElementById("dateInput");
var endDateInput = document.getElementById("endDateInput");
var startDateInput = document.getElementById("startDateInput");

// 단일 등록 라디오 버튼을 선택한 경우
singleRadio.addEventListener("change", function() {
  if (this.checked) {
    // 입력 필드 값을 초기화합니다.
    endDateInput.value = "";
    startDateInput.value = "";
  }
});

// 일괄 등록 라디오 버튼을 선택한 경우
batchRadio.addEventListener("change", function() {
  if (this.checked) {
    // 입력 필드 값을 초기화합니다.
    dateInput.value = "";
  }
});


	var start_times = []; // 배열로 시작 시간들을 저장할 변수
	var end_times = []; // 배열로 종료 시간들을 저장할 변수
	var theater_name;
	// select 요소의 change 이벤트 핸들러 등록
	$("#theaterList").on("change", "select", function() {
	  // 선택된 옵션의 theater_name 속성 값을 가져와 변수에 할당
	  theater_name = $(this).find("option:selected").attr("theater_name");
	});
	
	function go_save_schedule() {
		var movie_numb = $("select[name='movie']").val();
		var theater_numb = $("select[name='theater']").val();
		var room_numb = $("select[name='room']").val();
		var s_day = $("input[name='date']").val();
		var start_day = $("input[name='startDate']").val();
		var end_day = $("input[name='endDate']").val();
		var scheduleType = $("input[name='scheduleType']:checked").val();
		

/*
 * if (newTimeSlot.is(':empty')) { alert('Timeslot이 비어 있습니다!'); return false; //
 * 서브밋을 막기 위해 리턴하거나, 다른 적절한 조치를 취하세요. }
 */

		
		
		if (scheduleType === "single") {
			if (movie_numb === "" || theater_numb === "" || room_numb === ""
					|| s_day === "" || start_times.length === 0
					|| end_times.length === 0) {
				alert("모든 필드를 입력해주세요.");
				return;
			}
		} else if (scheduleType === "batch") {
			if (movie_numb === "" || theater_numb === "" || room_numb === ""
					|| start_day === "" || end_day === ""
					|| start_times.length === 0 || end_times.length === 0) {
				alert("모든 필드를 입력해주세요.");
				return;
			}
		}
		
		var newTimeSlot = $('.time-slot');

		   if (!newTimeSlot.length) {
		      alert('Timeslot이 비어 있습니다!');
		      return false;
		   }
		
	    
		$.ajax({
			url : "get_check_schedule",
			type : "POST",
			data : {
				movie_numb : movie_numb,
				theater_numb : theater_numb,
				room_numb : room_numb,
				s_day : s_day,
				start_day : start_day,
				end_day : end_day,
				theater_name : theater_name
			},
			success : function(result) {
				if (result === "1") {
					alert("이미 등록된 날짜입니다.");
				} else if (result === "0") {
					if(confirm('정말 등록하시겠습니까?')){
						var form = document.getElementById("schedule_form");
						form.action = "insert_schedule";
						form.movie_numb.value = movie_numb;
						form.theater_numb.value = theater_numb;
						form.theater_name.value = theater_name;
						form.room_numb.value = room_numb;
						form.s_day.value = s_day;
						form.start_times.value = start_times.join(",");
						form.end_times.value = end_times.join(",");
						form.start_day.value = start_day;
						form.end_day.value = end_day;
						form.submit();
	
						alert("일정 등록이 완료되었습니다!");
					} else {
						return false;
					}
				}
			},
			error : function() {
				alert("서버 오류가 발생했습니다.");
			},
		});
	}

	// 단일 일정과 일괄 일정의 입력 필드 제어
	$('input[name="scheduleType"]').change(function() {
		var selectedType = $(this).val();
		if (selectedType === "single") {
			$("#singleDateWrapper").show();
			$("#batchDateWrapper").hide();
			$("#endDateInput").prop("disabled", true).prop("required", false);
		} else if (selectedType === "batch") {
			$("#singleDateWrapper").hide();
			$("#batchDateWrapper").show();
			$("#endDateInput").prop("disabled", false).prop("required", true); // 시작
																				// 날짜
																				// input
																				// 요소에
																				// 블록
																				// 처리
			$("#startDateInput").attr("min", currentDate);
			$("#startDateInput").attr("max", maxDate); // 현재일 + 30일로 설정
		}
	});

	// 현재 시스템 날짜 가져오기
	var currentDate = new Date();
	currentDate.setDate(currentDate.getDate() + 1);
	// 30일 후의 날짜 계산
	var maxDate = new Date();
	maxDate.setDate(currentDate.getDate() + 30);

	// 날짜 형식 변환 (YYYY-MM-DD)
	currentDate = currentDate.toISOString().split('T')[0];
	maxDate = maxDate.toISOString().split('T')[0];

	// 상영 일정 날짜가 열렸을 때 현재 시스템 날짜부터 30일 이내의 값만 선택할 수 있도록 처리
	$("#singleDateWrapper input[name='date']").attr("min", currentDate).attr(
			"max", maxDate);

	// 시작 날짜 선택 시 종료 날짜 옵션 설정
	$("#startDateInput").change(function() {
		var startDate = moment($(this).val(), "YYYY-MM-DD");
		var maxEndDate = moment(startDate).add(30, 'days').valueOf(); // Unix
																		// 타임스탬프
																		// 형식으로
																		// 변경

		if (startDate.isValid()) {
			// 종료 날짜 옵션 설정
			$("#endDateInput").prop("disabled", false);
			$("#endDateInput").attr("min", $(this).val());
			$("#endDateInput").attr("max",
					moment(maxEndDate).format("YYYY-MM-DD")); // 포맷 변경하여 설정
		} else {
			// 시작 날짜가 선택되지 않은 경우 종료 날짜 선택 불가 처리
			$("#endDateInput").val("");
			$("#endDateInput").prop("disabled", true);
		}
	});

	$(document).ready(function() {
		var startTimeInput = $('.startTimeInput');
		var timeList = $('#timeList');
		var addTimeButton = $('#addTimeButton');

		// 페이지 로드 시 시작 시간 입력 필드의 최소값 설정
		startTimeInput.attr("min", "08:00 AM");

		// 시작 시간 입력 필드의 변경 이벤트 처리
		startTimeInput.on("change", function() {
			var startTime = startTimeInput.val();

			// 이전에 추가한 시작 시간의 계산된 종료 시간 + 15분 이후의 시간만 선택 가능하도록 제한
			var lastEndTimeSlot = timeList
					.find(".time-slot:last");

			
			if (lastEndTimeSlot.length > 0) {
				var previousEndTime = lastEndTimeSlot
						.data("endTime");
				var previousEndTimeMoment = moment(
						previousEndTime, "h:mm A");
				var minStartTime = previousEndTimeMoment.add(
						15, "minutes").format("h:mm A");
				startTimeInput.attr("min", minStartTime);
			}
		});

		// 시간 추가 버튼 클릭 이벤트 처리
		addTimeButton
				.on(
						"click",
						function() {
							var startTime = startTimeInput
									.val();

							if (startTime === "") {
								alert("시작 시간을 입력하세요!");
								return;
							}

							var selectedMovie = $(
									"select[name='movie']")
									.val();
							if (selectedMovie === "") {
								alert("영화를 선택하세요!");
								return;
							}

							var playtime = $(
									"select[name='movie'] option:selected")
									.data("playtime");
							var startTimeMoment = moment(
									startTime, "h:mm A");

							var newStartTime;
							var lastEndTimeSlot = timeList
									.find(".time-slot:last");
							
							
							if (lastEndTimeSlot.length > 0) {
								// 이전 종료시간에 15분을 더한 값
								var previousEndTime = lastEndTimeSlot
										.data("endTime");
								var previousEndTimeMoment = moment(
										previousEndTime,
										"h:mm A");
								newStartTime = previousEndTimeMoment
										.add(15, "minutes")
										.format("h:mm A");
								

								
								// 시작 시간이 이전 종료 시간의 값보다 작은 경우 경고 메시지 출력 후 반환
								if (startTimeMoment
										.isBefore(previousEndTimeMoment)) {
									alert("시작 시간은 이전 상영 종료 시간보다 15분 이후로 입력해야 합니다.");
									return;
								}
							} else {
								// 시작시간이 없는 경우, 기본값으로 설정
								newStartTime = startTime;
							}

							var endTimeMoment = startTimeMoment
									.clone().add(playtime,
											'minutes');
							var endTime = endTimeMoment
									.format("h:mm A");
							var endTimeCheck = endTimeMoment
									.format("h:mm A");

							// 시작 시간과 종료 시간이 범위를 벗어나면 경고 메시지 출력 후 반환
							if (!isWithinRange(startTime,
									endTimeCheck)) {
								alert("시작 시간과 종료 시간은 오전 8시부터 오후 12시 사이로 설정해야 합니다.");
								return;
							}

							var newTimeSlot = $('<div class="time-slot">');
							newTimeSlot.text("상영 시간: "
									+ startTime
									+ " - "
									+ endTimeMoment
											.format("HH:mm"));
							newTimeSlot
									.data("endTime", endTime);

							start_times.push(startTime);
							end_times.push(endTimeMoment
									.format("HH:mm"));

							var deleteButton = $('<button class="delete-button">Delete</button>');
							deleteButton.on("click",
									function() {
										newTimeSlot.remove();
									});

							newTimeSlot.append(deleteButton);
							timeList.append(newTimeSlot);

							// 이전 시간 블록들 블럭 처리
							timeList.children(".time-slot")
									.addClass("blocked");
						});

		// 시작 시간이 오전 8시부터 오후 12시 사이에 있는지 확인하는 함수
		function isWithinRange(startTime, endTime) {
			var minTime = moment("08:00 AM", "h:mm A");
			var maxTime = moment("24:00 PM", "h:mm A").add(15,
					"minutes"); // 종료시간 + 15분까지로 설정
			var startTimeMoment = moment(startTime, "h:mm A");
			var endTimeMoment = moment(endTime, "h:mm A");
			return startTimeMoment.isBetween(minTime, maxTime,
					null, '[]')
					&& endTimeMoment.isBetween(minTime,
							maxTime, null, '[]');
		}

		// 영화 선택 이벤트 처리
		$(document).on(
				"change",
				"select[name='movie']",
				function() {
					var selectedMovie = $(this).val();
					movie_numb = selectedMovie;
					if (selectedMovie === "") {
						startTimeInput.prop("disabled", true); // 시작시간 입력 필드를
																// 비활성화
					} else {
						startTimeInput.prop("disabled", false); // 시작시간 입력 필드를
																// 활성화
					}

					// 영화 선택이 변경될 때 timeList 초기화
					timeList.children().not(
							'input.startTimeInput').remove();
				});

		// 영화 목록 가져오기
		$
				.ajax({
					url : "get_open_movie_list",
					type : "GET",
					dataType : "json",
					success : function(data) {
						var movieList = data;
						if (movieList.length === 0) {
							// 상영중인 영화가 없을 경우, 문구를 출력
							$("#movieList").text(
									"상영중인 영화가 존재하지 않습니다.");
						} else {
							// 영화 선택 목록에 옵션 추가
							var selectElement = $("<select>")
									.attr("name", "movie");
							var defaultOption = $("<option>")
									.val("").text("영화를 선택해주세요");
							selectElement.append(defaultOption);

							for (var i = 0; i < movieList.length; i++) {
								var movie = movieList[i];
								var optionElement = $(
										"<option>").val(
										movie.numb).text(
										movie.title).data(
										"playtime",
										movie.playtime);
								selectElement
										.append(optionElement);
							}
							// 선택한 요소에 생성된 select 요소 추가
							$("#movieList").append(
									selectElement);
						}
					},
					error : function(xhr, status, error) {
						console.log(error);
					}
				});

		// 초기 지역 값 설정
		var selectedLocal = '';

		// 극장 목록을 가져오는 함수
		function getTheaterList(local) {
			$.ajax({
				url : "get_admin_theater_list",
				type : "GET",
				dataType : "json",
				data : {
					local : local
				}, // 선택한 지역 값을 전송
				success : function(data) {
					var theaterList = data;
					if (theaterList.length === 0) {
						$("#theaterList").text(
								"극장이 존재하지 않습니다.");
					} else {
						// 영화 선택 목록에 옵션 추가
						selectElement = $("<select>").attr("name", "theater");
						for (var i = 0; i < theaterList.length; i++) {
							var theater = theaterList[i];
							var optionElement = $("<option>")
									     .val(theater.numb)
								        .attr("theater_name", theater.name)
								        .text(theater.name);
							selectElement
									.append(optionElement);
						}
						// 선택한 요소에 생성된 select 요소 추가
						$("#theaterList").empty()
								.append(selectElement);

						// 극장 값 변경 시 관 목록 가져오기
						$("select[name='theater']")
								.on(
										"change",
										function() {
											var selectedTheater = $(
													this)
													.val();
											getRoomList(selectedTheater);
										});

						// 최초로 가져온 극장 값으로 관 목록 가져오기
						var selectedTheater = theaterList[0].numb;
						getRoomList(selectedTheater);

						// 최초로 가져온 극장 값 선택
						$("select[name='theater']")
								.val(selectedTheater)
								.change();
					}
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			});
		}

		// 관 목록을 가져오는 함수
		function getRoomList(theater) {
			$
					.ajax({
						url : "get_admin_room_lists",
						type : "GET",
						dataType : "json",
						data : {
							theater : theater
						}, // 선택한 극장 값을 전송
						success : function(data) {
							var roomList = data;
							if (roomList.length === 0) {
								$("#roomList").text(
										"관이 존재하지 않습니다.");
							} else {
								// 영화 선택 목록에 옵션 추가
								var selectElement = $(
										"<select>").attr(
										"name", "room");
								for (var i = 0; i < roomList.length; i++) {
									var room = roomList[i];
									var optionElement = $(
											"<option>").val(
											room.id).text(
											room.numb);
									selectElement
											.append(optionElement);
								}
								// 선택한 요소에 생성된 select 요소 추가
								$("#roomList").empty().append(
										selectElement);
							}
						},
						error : function(xhr, status, error) {
							console.log(error);
						}
					});
		}

		// 지역 목록 가져오기
		$
				.ajax({
					url : "get_admin_local_list",
					type : "GET",
					dataType : "json",
					success : function(data) {
						var localList = data;
						if (localList.length === 0) {
							$("#localList").text(
									"지역이 존재하지 않습니다.");
						} else {
							// 영화 선택 목록에 옵션 추가
							var selectElement = $("<select>")
									.attr("name", "local");
							for (var i = 0; i < localList.length; i++) {
								var local = localList[i];
								var optionElement = $(
										"<option>").val(
										local.local).text(
										local.local);
								selectElement
										.append(optionElement);
							}
							// 선택한 요소에 생성된 select 요소 추가
							$("#localList").append(
									selectElement);

							// 지역 값 변경 시 극장 목록 가져오기
							$("select[name='local']")
									.on(
											"change",
											function() {
												selectedLocal = $(
														this)
														.val();
												getTheaterList(selectedLocal);
											});

							// 최초로 가져온 지역 값으로 극장 목록 가져오기
							selectedLocal = localList[0].local;
							getTheaterList(selectedLocal);

							// 최초로 가져온 지역 값 선택
							$("select[name='local']").val(
									selectedLocal).change();
						}
					},
					error : function(xhr, status, error) {
						console.log(error);
					}
				});
	});
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/admin/main.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>관리자 대시보드</title>
<style>

</style>
</head>
<!-- 각 파일마다 필수 추가 부분 -->
  <main class="page-content">
    <div class="container-fluid">
    	<h2 style="color:#828282; margin-top:0;">DashBoard</h2> <hr>
		<!-- Content Row -->
		    <div class="row">
		
		    <!-- 결제 합산금액 -->
		    <div class="col-xl-3 col-md-6 mb-4">
		    <div class="card border-left-primary shadow h-100 py-2 box1">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
		                        결제 합산금액</div>
						<div class="h5 mb-0 font-weight-bold text-gray-800">
						    <fmt:formatNumber value="${ticketingVO.totalPrice}" pattern="#,###" />
						    원
						</div>
		                </div>
		                <div class="col-auto">
		                   <i class="fas fa-dollar-sign fa-2x text-gray-300"></i> <!-- 달러 아이콘 -->
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 예매 건수 -->
		<div class="col-xl-3 col-md-6 mb-4">
		    <div class="card border-left-success shadow h-100 py-2 box2">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
		                        예매 건수</div>
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">${ticketingVO.totalTicketing } 건</div>
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-ticket-alt fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 회원 수 -->
		<div class="col-xl-3 col-md-6 mb-4">
		    <div class="card border-left-info shadow h-100 py-2 box3">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
		                        회원 수</div>
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">${memberVO.totalUsers } 명</div>
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-users fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 질문 수 -->
		<div class="col-xl-3 col-md-6 mb-4">
		    <div class="card border-left-warning shadow h-100 py-2 box4">
		        <div class="card-body">
		            <div class="row no-gutters align-items-center">
		                <div class="col mr-2">
		                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
		                        질문 수</div>
		                    <div class="h5 mb-0 font-weight-bold text-gray-800">${qnaVO.totalQna } 건</div>
		                </div>
		                <div class="col-auto">
		                    <i class="fas fa-question-circle fa-2x text-gray-300"></i>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>


<!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">올해의 실적</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <canvas id="chart"></canvas>
                                    <script>
										  // ticketingMonthList 변수에서 데이터를 가져옵니다.
										  var ticketingMonthList = [
											  <c:forEach items="${ticketingMonthList}" var="ticketing" varStatus="status">
											    {
											      "total_price": "${ticketing.totalPrice}"
											    }<c:if test="${!status.last}">,</c:if>
											  </c:forEach>
											];
										
										  // 월과 합계 금액을 담을 배열을 초기화합니다.
										  var months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
										  var totalPrices = [];
										
										  // ticketingMonthList에서 월과 합계 금액을 추출하여 배열에 추가합니다.
										  ticketingMonthList.forEach(function(item) {
										    totalPrices.push(item.total_price);
										  });
										
										  // 선형 그래프를 그리기 위한 설정을 정의합니다.
										  var ctx = document.getElementById('chart').getContext('2d');
										  var chart = new Chart(ctx, {
											    type: 'line',
											    data: {
											        labels: months.map(function(month) { return month + '월'; }),
											        datasets: [{
											            label: 'Total Price',
											            data: totalPrices,
											            borderColor: '#ff6384',
											            backgroundColor: 'transparent',
											            pointBackgroundColor: '#ff6384',
											            pointRadius: 5,
											            lineTension: 0.2 // 곡선의 완만도를 조정 (값이 작을수록 완만해짐)
											        }]
											    },
											    options: {
											        responsive: true,
											        maintainAspectRatio: false,
											        scales: {
											            x: {
											                ticks: {
											                    fontStyle: 'bold',
											                }
											            },
											            y: {
											                ticks: {
											                    beginAtZero: true,
											                    callback: function(value, index, values) {
											                        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
											                    }
											                }
											            }
											        }
											    }
											});





										</script>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary" id="reservation-status"></h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <canvas id="myChart"></canvas>
                                    <script>
								        // ticketingList 값을 가져와서 처리
								       var ticketingList = [
										  <c:forEach items="${ticketingList}" var="ticketing" varStatus="status">
										    {
										      "movie_title": "${ticketing.movie_title}",
										      "movie_count": "${ticketing.movie_count}"
										    }<c:if test="${!status.last}">,</c:if>
										  </c:forEach>
										];
								
								        // 차트 생성을 위한 데이터 배열 생성
								        var labels = [];
								        var data = [];
								        var colors = [];
								
								        // ticketingList를 기반으로 데이터 배열 채우기
								        for (var i = 0; i < ticketingList.length; i++) {
								            var ticketing = ticketingList[i];
								            labels.push(ticketing.movie_title);
								            data.push(ticketing.movie_count);
								            colors.push(getRandomColor());
								        }
								
								        // 차트 생성
								        var ctx = document.getElementById('myChart').getContext('2d');
								        var myChart = new Chart(ctx, {
								            type: 'doughnut',
								            data: {
								                labels: labels,
								                datasets: [{
								                    data: data,
								                    backgroundColor: colors,
								                    borderColor: 'white',
								                    borderWidth: 1, // 원의 굵기를 조절
								                    hoverBorderWidth: 2 // 호버 시 원의 굵기를 더 크게 조절
								                }]
								            },
								            options: {
								                responsive: true,
								                maintainAspectRatio: false, // 가로 세로 비율 유지하지 않음
								                cutout: '70%',
								                plugins: {
								                    legend: {
								                        display: false
								                    },
								                    tooltip: {
								                        callbacks: {
								                            label: function(context) {
								                                var label = context.label || '';
								                                var value = context.raw || '';
								                                return label + ': ' + value + '건';
								                            }
								                        }
								                    },
								                    legend: {
								                        position: 'bottom' // title 항목들을 그래프 아래에 배치하기 위해 legend의 위치를 'bottom'으로 설정
								                    },
								                    datalabels: {
								                        display: true,
								                        color: 'white',
								                        font: {
								                            size: '14'
								                        },
								                        formatter: function(value, context) {
								                            var label = context.chart.data.labels[context.dataIndex];
								                            return label + ': ' + value;
								                        },
								                        borderRadius: 50, // 원형 모양을 사용하기 위해 borderRadius를 50%로 설정
								                        borderWidth: 0, // 직사각형 도형을 제거하기 위해 borderWidth를 0으로 설정
								                        anchor: 'end' // 제목 텍스트 옆에 배치되도록 anchor를 'end'로 설정
								                    }
								                }
								            }
								        });
										
								        window.addEventListener('resize', function() {
								            myChart.resize();
								        });

								
								        // 무작위 색상 반환 함수
								        function getRandomColor() {
								            var letters = '0123456789ABCDEF';
								            var color = '#';
								            for (var i = 0; i < 6; i++) {
								                color += letters[Math.floor(Math.random() * 16)];
								            }
								            return color;
								        }
								        
								        // 현재 시스템의 월을 가져오는 함수
								        function getCurrentMonth() {
								          var currentDate = new Date();
								          var month = currentDate.getMonth() + 1; // JavaScript에서 월은 0부터 시작하므로 1을 더해줍니다.
								          return month;
								        }
								        
								        // 페이지 로드 시 멘트 설정 함수 호출
								        window.onload = function() {
								          var month = getCurrentMonth();
								          document.getElementById('reservation-status').innerHTML = month + '월 예약 현황';
								        };
								    </script>
                                </div>
                            </div>
                        </div>
                    </div>
    </div>
    </div>
  </main>
</div>
<!-- 여기까지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>

<head>
 <link rel="stylesheet" href="css/notice.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body><br><br>
<div class="container2" id="container2">
	<h1 class="loginh1">고객센터 홈</h1>
 	<hr width="50%">

	<div class="accordion-container">

		



		<h3>자주하는 질문</h3>

		<div class="container">

			<button class="collapsible">Q. 영화 예매를 위해 회원가입이 필요한가요?</button>
			<div class="content">
				<p>A. 네, 영화 예매를 위해서는 회원가입이 필요합니다. <br>회원으로 가입하면 개인정보를 등록하고 티켓 예매, 결제,<br> 예매 내역 확인 등의 서비스를 이용할 수 있습니다.</p>
			</div>
			<button class="collapsible">Q. 예매한 영화 티켓은 어떻게 수령하나요?</button>
			<div class="content">
				<p>A. 예매한 영화 티켓은 영화관 현장에서 수령할 수 있습니다. <br> 예약 시 입력한 예매 정보를 확인하여 티켓을 발급해 드립니다.</p>
			</div>
			<button class="collapsible">Q. 취소 또는 변경된 예매는 어떻게 처리되나요?</button>
			<div class="content">
				<p>A. 예매 취소 또는 변경은 일정 기간 이내에만 가능하며,  <br>온라인 예매 시스템을 통해 직접 처리할 수 있습니다. 취소 또는 변경에 <br>따른 수수료 또는 환불 정책은 예매 시스템 운영 정책에 따라 다를 수 있습니다.</p>
			</div>
			<button class="collapsible">Q. 예매한 좌석은 어떻게 선택하나요?</button>
			<div class="content">
				<p>A. 예매 시스템에서는 영화 상영관의 좌석 배치도를 제공하고, <br> 고객은 원하는 좌석을 선택할 수 있습니다. <br> 좌석 선택은 예매 단계에서 시각적으로 확인하고 선택할 수 있습니다.</p>
			</div>
			<button class="collapsible">Q. 예매한 영화의 상영일정을 확인할 수 있나요?</button>
			<div class="content">
				<p>A. 네, 예매 시스템에서는 상영 중인 영화의 일정과 상영관<br> 정보를 확인할 수 있습니다. 예매하려는 영화의 상영 일정을<br> 선택하여 예매할 수 있습니다.</p>
			</div>



			<script>
				var coll = document.getElementsByClassName("collapsible");
				var i;

				for (i = 0; i < coll.length; i++) {
					coll[i].addEventListener("click", function() {
						this.classList.toggle("active");
						var content = this.nextElementSibling;
						if (content.style.maxHeight) {
							content.style.maxHeight = null;
						} else {
							content.style.maxHeight = content.scrollHeight
									+ "px";
						}
					});
				}
			</script>

		<br>
		<br>
		</div>
		
		
		<h3>최신 공지사항</h3>
		<table>
		
			<tr>
				<th>제목</th>      
				<th>작성일</th>
			</tr>
			<c:forEach items="${noticeVO}" var="noticeVO">
			<tr>
				<td><a href="notice_view?numb=${noticeVO.numb}">${noticeVO.title}</a></td>
				<td><fmt:formatDate value="${noticeVO.regdate}" type="date"/></td>
			</tr>
			</c:forEach>
		</table><br>  
			<button type="button" onclick="location.href='notice_list'">더보기</button><br>


		</div>



</div>	
</body>
</html>

<%@ include file="../footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 헤더 -->
<%@ include file="../header.jsp"%>
<meta charset="UTF-8">
<title>paymentPage</title>
</head>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/json2/20150503/json2.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="stylesheet" href="css/ticketing.css" />
</head>
<script>
      // merchant_uid 값 랜덤 생성
      const random = (length = 8) => {
       const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
       let str = '';

       for (let i = 0; i < length; i++) {
         str += chars.charAt(Math.floor(Math.random() * chars.length));
       }
          return str;
       };
        var IMP = window.IMP; 
        IMP.init("imp70336285"); // 가맹점 식별코드
        
 
        var name = '${title}';
        var amount = '${totalPrice}';
        var customer_uid = '${memberVO.id}';
        var buyer_email = '${memberVO.email}';
        var buyer_name = '${memberVO.name}';
        var buyer_tel = '${memberVO.tel}';
        
        // 결제 창
        function payments(pg) {
           IMP.request_pay({
              pg : pg,
              pay_method : 'card', // 기능 없음.
              merchant_uid: random(4) + "order", // 상점에서 관리하는 주문 번호
              name : name,   // 품목(영화)
              amount : amount, // 빌링키 발급만 진행하며 결제승인을 하지 않습니다. // 가격
              customer_uid : customer_uid, // 필수 입력
              buyer_email : buyer_email,
              buyer_name : buyer_name,
              buyer_tel : buyer_tel
           }, function(rsp) {
              if ( rsp.success ) {
            	  var form = document.getElementById("payform");
            	  form.action = "go_payment";
            	  form.submit();
            	 
                 alert('결제가 완료되었습니다!');
              } else {
               alert("실패 :코드("+rsp.error_code+") / message(" +rsp.error_msg+")"+random(2));
                 return false;
              }
           });   
        }
     </script>
<body class="payments">
<!-- HTML 페이지 -->
<form id="payform"  method="post">
  <!-- 필요한 데이터를 폼 필드로 추가합니다 -->
  <input type="hidden" name="p_num" value="${ticketingVO.p_num }">
  <input type="hidden" name="price" value="${ticketingVO.price }">
  <input type="hidden" name="seat_name" value="${ticketingVO.seat_name }">
  <input type="hidden" name="user_id" value="${ticketingVO.user_id }">
  <input type="hidden" name="schedule_numb" value="${ticketingVO.schedule_numb }">
  <input type="hidden" name="movie_numb" value="${ticketingVO.movie_numb }">
</form>
<div class="bar"><div>예매&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;영화선택&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;좌석선택&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;결제하기</div></div>

<div class="body2">
	<div style="margin: 25px auto; width: 1100px; text-align: center;">
		<h2>결제하기</h2>
  	</div>
  <div class="payment-container">
  <table class="custom-table" >
    <tr>
      <td height="40px" class="center" colspan="3">예매 정보</td>
    </tr>
    <tr>
      <td class="poster-cell" rowspan="6" style="border-bottom:none;"><img src="movie_images/${poster.poster_url}" alt="" style="width:200px; height:300px;"/></td>
      <td>영화명</td>
      <td>${title}</td>
    </tr>
    <tr>
      <td>총 결제금액</td>
      <td>${totalPrice}원</td>
    </tr>
    <tr>
      <td>극장</td>
      <td>${theater_name.name}</td>
    </tr>
    <tr>
      <td>상영관</td>
      <td>${rnumb}관</td>
    </tr>
    <tr>
      <td>상영시간</td>
      <td>${startTime}~${endTime}</td>
    </tr>
    <tr>
      <td style="border-bottom:none;">좌석</td>
      <td style="border-bottom:none;">${selectedSeatsString}</td>
    </tr>
  </table>
  </div>
  <br><br>
  <div>
    <ul>
      <li>인터넷 예매는 온라인상으로 영화 예매 20분 전까지 취소 가능하며 20분 이후에는 현장에서 취소하셔야 합니다.</li>
      <li>취소는 상영시간 전까지 하실 수 있으며, 전화로 취소 요청을 하실 경우 취소가 되지 않습니다.</li>
      <li>입장 지연에 따른 관람 불편을 최소화하기 위해 본 영화는 10분 후 상영이 시작됩니다.</li>
    </ul>
  </div>
  <br>
  
  <table class="checkbox-table">
    <tr>
      <td>
        <input type="checkbox" id="masterCheckbox">
        <label for="masterCheckbox">결제대행 서비스 약관에 모두 동의</label>
      </td>
      <td width="150px"></td>
      <td align="right">
        &nbsp;&nbsp;&nbsp;<input type="checkbox" id="checkbox4" class="Checkbox">
        <label for="checkbox4">상기 결제내용을 모두 확인하였습니다.</label>
      </td>
    </tr>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;
        <input type="checkbox" id="checkbox1" class="slaveCheckbox">
        <label for="checkbox1">전자금융거래 이용 약관</label>
      </td>
      <td align="right"><a>전문확인</a></td>
      <td></td>
    </tr>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;
        <input type="checkbox" id="checkbox2" class="slaveCheckbox">
        <label for="checkbox2">개인정보 수집 이용약관</label>
      </td>
      <td align="right" ><a>전문확인</a></td>
      <td></td>
    </tr>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;
        <input type="checkbox" id="checkbox3" class="slaveCheckbox">
        <label for="checkbox3">개인정보 제공 및 위탁 안내 확인</label>
      </td>
      <td align="right"><a>전문확인</a></td>
      <td></td>
    </tr>
    <tr><td height="30px" style="border-bottom:1px solid #333;" colspan="3"></td></tr>
  </table>

  <div class="button-container">
    <button class="custom-button" onclick="checkAllCheckboxesAndSubmitKakao()">카카오페이</button>
    <button class="custom-button" onclick="checkAllCheckboxesAndSubmitToss()">토스페이</button>
    <button class="custom-button" type="button" onclick="redirectToTicketing()">예매취소</button>
  </div>
  </div>
<script type="text/javascript">
  const masterCheckbox = document.getElementById('masterCheckbox');
  const checkbox4 = document.getElementById('checkbox4');
  const slaveCheckboxes = document.querySelectorAll('.slaveCheckbox');

  function checkAllCheckboxesAndSubmitKakao() {
	  if (masterCheckbox.checked && checkbox4.checked && checkAllSlaveCheckboxes()) {
	    // 모든 체크박스가 선택된 상태일 때 결제 처리 로직을 수행하도록 작성하세요.
	    // 예시로 confirm 창을 띄우는 코드를 추가하였습니다.
	    confirmPayment();
	  } else {
	    alert("모든 약관에 동의해야 결제할 수 있습니다.");
	  }
	}

	function confirmPayment() {
	  // 결제 처리를 위한 코드를 추가하세요.
	  // 예시로 confirm 창을 띄우고 확인/취소에 따라 동작을 수행하도록 작성하였습니다.
	  if (confirm("결제를 진행하시겠습니까?")) {
	    // 결제 처리 로직을 수행하세요.
	    payments('kakaopay');
	  } else {
	    // 취소 동작을 수행하세요.
	    alert("결제가 취소되었습니다.");
	  }
	}
  function checkAllSlaveCheckboxes() {
    let allChecked = true;
    slaveCheckboxes.forEach(function (checkbox) {
      if (!checkbox.checked) {
        allChecked = false;
      }
    });
    return allChecked;
  }

  masterCheckbox.addEventListener('change', function () {
    const isChecked = masterCheckbox.checked;
    slaveCheckboxes.forEach(function (checkbox) {
      checkbox.checked = isChecked;
    });
  });

  function checkAllCheckboxesAndSubmitToss() {
	  if (masterCheckbox.checked && checkbox4.checked && checkAllSlaveCheckboxes()) {
	    // 모든 체크박스가 선택된 상태일 때 결제 처리 로직을 수행하도록 작성하세요.
	    // 예시로 confirm 창을 띄우는 코드를 추가하였습니다.
	    confirmPayment2();
	  } else {
	    alert("모든 약관에 동의해야 결제할 수 있습니다.");
	  }
	}

	function confirmPayment2() {
	  // 결제 처리를 위한 코드를 추가하세요.
	  // 예시로 confirm 창을 띄우고 확인/취소에 따라 동작을 수행하도록 작성하였습니다.
	  if (confirm("결제를 진행하시겠습니까?")) {
	    // 결제 처리 로직을 수행하세요.
	    payments('tosspayments');
	  } else {
	    // 취소 동작을 수행하세요.
	    alert("결제가 취소되었습니다.");
	  }
	}
  function checkAllSlaveCheckboxes() {
    let allChecked = true;
    slaveCheckboxes.forEach(function (checkbox) {
      if (!checkbox.checked) {
        allChecked = false;
      }
    });
    return allChecked;
  }

  masterCheckbox.addEventListener('change', function () {
    const isChecked = masterCheckbox.checked;
    slaveCheckboxes.forEach(function (checkbox) {
      checkbox.checked = isChecked;
    });
  });
  function redirectToTicketing() {
    window.location.href = 'ticketing';
  }
  
</script>

</body>

</html>
<%@ include file="../footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ include file="../header.jsp" %>
<html>
<head>
    <title>Ticketing</title>
    <link rel="stylesheet" href="css/ticketing.css" />
    <script src="ticketing/ticketing.js"></script>
    <style>
   	#middle {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	ul {
		list-style: none;
		padding: 0;
	}
	li:hover {
		cursor: pointer;
	}
	.schedule-item {
	border: 2px solid #B2B2B2;
	border-radius: 8px;
}


    </style>
    <script type="text/javascript">

       
    </script>
</head>

<div class="bar"><div><img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;예매&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;빠른예매</div></div>

<div id="middle">
	<div style="margin: 25px auto; width: 1100px; text-align: center;">
		<h2>예매하기</h2>
  	</div>
	<br>
<form id="ticketing_form" method="post">
<div class="flex-container">
    <div class="flex-item-left" style="height:500px;">
        <h3 class="align">지역</h3>
        <div id="localList" class="scrollable-list" style="text-align:center;"></div>
    </div>
    <div class="flex-item-left">
        <h3 class="align">극장</h3>
        <div id="theaterList" class="scrollable-list"  style="text-align:center;"></div>
    </div>
    <div class="flex-item-center">
        <h3 class="align">영화</h3>
        <div id="movieList" class="scrollable-list2"  style="text-align:center;"></div>
    </div>
    <div class="flex-item-right">
        <h3 class="align">날짜</h3>
        <div id="calendar" class="scrollable-list3"></div>
        <h3 class="align">상영 일정</h3>
		<div id="schedule-container" class="scrollable-list4">
   		 <ul id="scheduleList"></ul>
    	</div>
	</div>
	
</div>
<div><img src="https://mlink-cdn.netinsight.co.kr/2023/06/12/18c644314171d589634593556e8b320f.jpg"></div>
</form>
</div>
</html>
<%@ include file="../footer.jsp" %>
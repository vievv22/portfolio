<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/memberdetail.css" />
 <link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
 <script src="mypage/mypage.js"></script>
 <div class="bar"><div><img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;마이페이지&nbsp;&nbsp;<img src="images/arrow.png" alt=">" width="10px">&nbsp;&nbsp;회원정보</div></div>
<meta charset="UTF-8">
<title>회원정보조회</title>

</head>

<body>
<div id="middle">
   <br>

   <h2>My Page</h2>
   <div class="flex-container">
      <div class="flex-item">

         <br>
         <div class="ponit-grade">
            <c:choose>

               <c:when test="${userDetail.point < 400}">
                  <b>Friends</b>
               </c:when>
               <c:when test="${userDetail.point >= 400 && userDetail.point < 600}">
                  <b>Silver</b>
               </c:when>
               <c:when test="${userDetail.point >= 600 && userDetail.point < 800}">
                  <b>Gold</b>
               </c:when>
               <c:otherwise>
                  <b>VIP</b>
               </c:otherwise>
            </c:choose>
         </div>
         <br> <span><b>${userDetail.name}</b></span><span> 님 반가워요!</span>
         <br> <br> <span>Point : ${userDetail.point} 점</span> <br>





         <div id="Lv">
            <c:choose>
               <c:when test="${userDetail.point < 400}">
    Lv.1까지 <b>${40000 - userDetail.point * 100}원 남았어요!</b>
               </c:when>

               <c:when test="${userDetail.point >= 400 && userDetail.point < 600}">
    Lv.2까지 <b>${60000 - userDetail.point * 100}원 남았어요!</b>
               </c:when>

               <c:when test="${userDetail.point >= 600 && userDetail.point < 800}">
    vip까지 <b>${80000 - userDetail.point * 100}원 남았어요!</b>
               </c:when>
               <c:otherwise>
                  <b>VIP님 환영합니다!</b>
               </c:otherwise>
            </c:choose>

         </div>
         <br> <br>
         <div class="grade-container">
            <div class="grade">Friends</div>
            <div class="grade">
               <b>Lv.1</b>
            </div>
            <div class="grade">
               <b>Lv.2</b>
            </div>
            <div class="grade">
               <b>VIP</b>
            </div>
         </div>
         <br>
         <div class="line"></div>
         <br>
         <div class="grade-container">
            <div class="grade">0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="grade">4만원</div>
            <div class="grade">6만원</div>
            <div class="grade">8만원</div>
         </div>

      </div>




   <div class="flex-item-right">
      <br>
      <div class="botton-container">
         <div class="my-botton ">
            <button type="button" onclick="location.href='reviewList2?userId=${userDetail.id}'">리 뷰</button>
         </div>
         <div class="my-botton ">
            <button type="button" onclick="location.href='qna_list'">문의</button>
         </div>
         <div class="my-botton ">
            <button type="button" onclick="location.href='memberInfo'">회원정보</button>
         </div>
      </div>
<img alt="광고이미지" src="https://www.lottecinema.co.kr/NLCHS/Content/images/member/my_club_315_bravo_230301.jpg">
   </div>
   </div>

   <br>
   <br>
   <br>

</div>




    
 <div class="container2" id="container2">

<form id=update_form name="update_form" method="post">
	<h1 class="loginh1">회원정보</h1>
	
	<table>
		<tr>
			<th>아이디</th><td>${userDetail.id}</td>
			<th>이 름</th><td>${userDetail.name}</td>
		</tr>
		<tr>
			<th >전화번호</th><td>${userDetail.tel.substring(0, 3)}-${userDetail.tel.substring(3, 7)}-${userDetail.tel.substring(7)}</td>

			<th >생년월일</th><td>${userDetail.birth.substring(0, 4)}-${userDetail.birth.substring(4, 6)}-${userDetail.birth.substring(6)}</td>

		</tr>
		<tr>
			<th>이메일</th><td>${userDetail.email}</td>
	
			<th>포인트</th><td>${userDetail.point}</td>
		</tr>
		<tr>
			<th>가입일자</th><td><fmt:formatDate value="${userDetail.regdate}" pattern="yyyy-MM-dd" /></td>
		
			<th>비밀번호</th>
    		<td>
    			<input type="password" id="pwd" name="pwd" value="" />
    			<input type="hidden" id="pwdCheck" name="pwdCheck" value="${userDetail.pwd}" />
    		</td>
		</tr>
	</table><br><br>
	
	<div>
		<button class="submit" onclick="return go_pwdCheck()">회원 수정</button>
		<button class="submit" onclick="return gopwdCheck()">비밀번호 변경</button>
		<button class="submit" onclick="return go_userDelete()">회원 탈퇴</button>
	</div>
		
		
</form>
</div>
</body>
</html><br>
<%@ include file="../footer.jsp" %>
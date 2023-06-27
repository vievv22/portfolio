<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MovieHolic</title>
<link rel="stylesheet" href="css/main.css"/>
 <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous">
 <link rel="icon" href="images/logo.ico" type="image/x-icon">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>
</style>
<body style="margin:0; padding:0; min-width: 1400px;">
<div class="header">
<div class="top-bar">
    <div class="inner con relative">
        <div class="logo-box">
            <a href="index" class="absolute-center absolute-middle"><img src="images/logo3.png" alt="무비홀릭로고" width="150px" ></a>
        </div>
        <div class="link-box">
            <div class="left absolute">
                <a href="#">VIP ROUNGE</a>
                <a href="#">멤버십</a>
                <a href="customer">고객센터</a>
            </div>
            <div class="right absolute">
      			 <!-- 일반 회원 로그인 시 마이페이지 로그아웃 표시 부분-->
				 <c:if test="${not empty sessionScope.loginUser}">
				 	 <!-- 로그인한 사용자 정보가 세션에 저장되어 있는 경우에만 실행할 내용 -->
				 	 <c:if test="${sessionScope.loginUser.id != 'admin'}">
				 		 <span>${sessionScope.loginUser.name} 님 </span>
				 		 <a href="logout">로그아웃</a>
					 </c:if>
				 </c:if>
			 
			
			     <c:if test="${empty sessionScope.loginUser}">
			 		 <!-- 로그인 실패 또는 로그인하지 않은 경우에만 실행할 내용 -->
			 		  <a href="login_form">로그인 / 회원가입</a>
				</c:if>
			 
			 
				<!-- 관리자 admin 로그인 시 관리자 페이지 보여줌 --> 
			    <c:if test="${not empty sessionScope.loginUser}">
				    <!-- 로그인한 사용자 정보가 세션에 저장되어 있는 경우에만 실행할 내용 -->
				    <c:if test="${sessionScope.loginUser.id == 'admin'}">
				        <!-- 사용자의 ID가 'admin'인 경우에만 실행할 내용 -->
				        <span>관리자 님 </span>
				        <a href="logout">로그아웃</a>
				        <a href="adminPage">관리자 페이지</a>
				    </c:if>
				</c:if> 
            </div>
        </div>
        <nav>
            <div class="inner row">
                <div class="nav-1 cell">
                <ul class="row">
                    <li class="cell"><a href="#"></a></li>
                    <li class="cell"><a href="#"></a></li>
                </ul>
            </div>
            <div class="nav-2 cell">
                <ul class="row">
                <li class="cell">
                    <a href="#">영화</a>
                      <ul class="row">
                        <li class="cell"><a href="getMovieList3">전체영화</a></li>
                        <li class="cell"><a href="#">큐레이션</a></li>
                        <li class="cell"><a href="#">무비포스트</a></li>
                    </ul>
                  
                </li>
                <li class="cell">
                    <a href="#">예매</a>
                      
					<ul class="row">
                        <li class="cell"><a href="ticketing_form">빠른예매</a></li>
                        <li class="cell"><a href="#">상영시간표</a></li>
                    </ul>
                   
                </li>
                <li class="cell">
                    <a href="#">극장</a>
                    
                    <ul class="row">
                        <li class="cell"><a href="get_theater_view">전체극장</a></li>
                        <li class="cell"><a href="#">특별관</a></li>
                    </ul>
                   
                </li>
                <li class="cell">
                    <a href="#">이벤트</a>
                   
                    <ul class="row">
                        <li class="cell"><a href="#">진행중 이벤트</a></li>
                        <li class="cell"><a href="#">지난 이벤트</a></li>
                        <li class="cell"><a href="#">당첨자발표</a></li>
                    </ul>
                   
                </li>
                <li class="cell">
                    <a href="#">스토어</a></li>
                <li class="cell"><a href="#">혜택</a>
               		
                    <ul class="row">
                        <li class="cell"><a href="#">멤버십</a></li>
                        <li class="cell"><a href="#">제휴/할인</a></li>
                    </ul>
                    
                </li>
            </ul>
        </div>
        <div class="nav-3 cell">
            <ul class="row">
            
            
            
                <!-- 일반 회원 로그인 시 마이페이지 로그아웃 표시 부분-->
             <c:if test="${not empty sessionScope.loginUser}">
                 <!-- 로그인한 사용자 정보가 세션에 저장되어 있는 경우에만 실행할 내용 -->
                 <c:if test="${sessionScope.loginUser.id != 'admin'}">
                   
                   <li class="cell"><a href="ticketing_form"></a></li>
                      <li class="cell"><a href="mypage"></a></li>
                </c:if>
             </c:if>
          
         
              <c:if test="${empty sessionScope.loginUser}">
                 <!-- 로그인 실패 또는 로그인하지 않은 경우에만 실행할 내용 -->
                 <li class="cell"><a href="ticketing_form"></a></li>
                      <li class="cell"><a href="mypage"></a></li>
            </c:if>
          
          
            <!-- 관리자 admin 로그인 시 관리자 페이지 보여줌 --> 
             <c:if test="${not empty sessionScope.loginUser}">
                <!-- 로그인한 사용자 정보가 세션에 저장되어 있는 경우에만 실행할 내용 -->
                <c:if test="${sessionScope.loginUser.id == 'admin'}">
                    <!-- 사용자의 ID가 'admin'인 경우에만 실행할 내용 -->
                      <li class="cell"><a href="#"></a></li>
                      <li class="cell"><a href="adminPage"></a></li>
                    
                </c:if>
            </c:if> 


            </ul>
        </div>
    </div>
    </nav>
</div>
</div>
</div><div class="bg"></div>
</body>
</html>

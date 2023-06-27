<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/admin/movie.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 로드 -->
  <!-- 개봉일 달력 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.css">
</head>
<body style="background-color:#f2f2f2;">
<main class="page-content" >
    <div class="container-fluid">	
    	   <div class="container" style="text-align:center;">
	     <h3>영화 등록</h3></div>
	<hr>
<div class="container">
  <form class="user-info-form" name="frm" id="movie_form" method="post" enctype="multipart/form-data">
    <ul>
      <li>
        <div class="input-group">
          <label class="tit" for="userId">제목</label>
          <input class="form-ctrl" name="title" id="title" type="text" placeholder="제목을 입력하세요" required>
        </div>
      </li>
      
      <li>
        <div class="input-group">
          <label class="tit" for="userPass">줄거리</label>
          <textarea class="form-ctrl2" name="story" id="story" rows="4" placeholder="줄거리를 입력하세요" required></textarea>
        </div>
      </li>
      
      <li>
        <div class="input-group">
          <div class="checkbox-group">
            <label class="tit" for="userPass">장르</label>
            <label>
              <input type="checkbox" name="genre" id="genre1" value="액션">액션
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre2" value="코미디">코미디
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre3" value="모험">모험
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre4" value="SF">SF
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre5" value="드라마">드라마
            </label>         
            <label>
              <input type="checkbox" name="genre" id="genre7" value="공포">공포
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre8" value="가족">가족
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre9" value="뮤지컬">뮤지컬
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre10" value="로맨스">로맨스
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre11" value="판타지">판타지
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre12" value="범죄">범죄
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre6" value="애니메이션">애니메이션
            </label>
          </div>
        </div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">감독</label>
          <input class="form-ctrl" type="text" name="director" id="director" placeholder="감독을 입력하세요" required>
        </div>
      </li>
      
       <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">배우</label>  
         <div id="directorContainer">
	      <div class="casterBox">
	        <textarea name="caster" id="caster" class="form-ctrl" style="height: 30px;"></textarea>
	        <button type="button" class="btn-caster" onclick="removeTextarea(this.parentNode)">-</button>
	      </div>
	    </div>&nbsp;&nbsp;&nbsp;
	    <button type="button" class="btn-caster" onclick="addMoreTextarea()">+</button> 
        </div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">포스터</label>
          <input class="form-ctrl" type="file" name="poster" id="poster_url" required>
        </div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">개봉일</label>
          <input class="form-ctrl" type="date" id="opendate" name="opendate" required> 
        </div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">러닝타임</label>
          <input class="form-ctrl" type="number" name="playtime" id="playtime" placeholder="숫자만 입력하세요       Ex) nn분 >> nn" required>	  
	 	</div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">관람 나이</label>
		  <select class="form-ctrl" name="age" id="age">
			<option value="0">전체 관람가</option>
			<option value="12">12세</option>
			<option value="15">15세</option>
			<option value="18">18세</option>
		 </select>
	 	</div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">나라</label>
		  <select class="form-ctrl" name="nation" id="nation">
			<option value="한국">한국</option>
			<option value="미국">미국</option>
			<option value="일본">일본</option>
			<option value="영국">영국</option>
		 </select>
	 	</div>
      </li>
      
      <li>
	  <div class="input-group">
	  <label class="tit" for="userId">종영 여부</label>
	  <div class="radio-group">
	    <label class="radio-label">&nbsp;&nbsp;&nbsp;
	      <input class="form-ctrl" type="radio" name="ny" id="ny" value="n" checked>
	      <span>상영 및 개봉예정</span>
	    </label>&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;
	    <label class="radio-label">
	      <input class="form-ctrl" type="radio" name="ny" id="ny" value="y">
	      <span>종영</span>
	    </label>
	  </div>
	</div>
	</li>
	
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">트레일러</label>
          <input class="form-ctrl" type="text" name="trailer" id="trailer" placeholder="<Ifame> 태그를 입력하세요" required="required">
		  
	 	</div>
      </li>
      
      <li>
     <div id="container" class="input-group user-id">
	  <label class="tit" for="userId">스틸컷</label>
	  <div id="inputWrapper">
	    <input class="form-ctrl" type="file" name="stillcut_name" id="stillcut" multiple="multiple">
	  </div>&nbsp;&nbsp;&nbsp;
	  <button type="button" onclick="addMoreStillcut()" class="btn-caster">+</button>
	</div>
      </li>
    </ul>
    <div class="btn-area">
      <input class="btn-submit" type="button" value="등록" onClick="go_save()">
    </div>
  </form>
</div>
	  </div>
  </main>
</body>
</html>

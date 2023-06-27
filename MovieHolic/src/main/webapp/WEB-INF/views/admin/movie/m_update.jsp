<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script type="text/javascript" src="movie.js"></script>-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 라이브러리 로드 -->
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="css/admin/movie.css" />
  <!-- 개봉일 달력 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.css">
</head>

<body style="background-color:#f2f2f2;">>
<main class="page-content">
    <div class="container-fluid">
   <div class="container" style="text-align:center;">
	     <h3>영화 수정</h3></div>
	<hr>
<div class="container">
  <form class="user-info-form" name="frm" id="update_form" method="post" enctype="multipart/form-data">
   <input type="hidden" name="numb" value="${movieVO.numb}">
   <input type="hidden" name="nonmakeImage" value="${movieVO.poster_url}"> <!-- 기존이미지저장 -->
   <input type="hidden" name="nonmakeTrailer" value="${fn:escapeXml(movieVO.trailer)}"> <!-- 기존트레일러저장 --> <ul>
      <li>
        <div class="input-group">
          <label class="tit" for="userId">제목</label>
          <input class="form-ctrl" name="title" id="title" type="text" value="${movieVO.title}" required>
        </div>
      </li>
      
      <li>
        <div class="input-group">
          <label class="tit" for="userPass">줄거리</label>
          <textarea class="form-ctrl2" name="story" rows="4" id="story" required>${movieVO.story}</textarea>
        </div>
      </li>
      
      <li>
        <div class="input-group">
          <div class="checkbox-group">
            <label class="tit" for="userPass">장르</label>
            <label>
              <input type="checkbox" name="genre" id="genre1" value="액션"
              ${genreList.contains("액션") ? 'checked' : ''}>액션
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre2" value="코미디"
              ${genreList.contains("코미디") ? 'checked' : ''}>코미디
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre3" value="모험"
              ${genreList.contains("모험") ? 'checked' : ''}>모험
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre4" value="SF"
              ${genreList.contains("SF") ? 'checked' : ''}>SF
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre5" value="드라마"
              ${genreList.contains("드라마") ? 'checked' : ''}>드라마
            </label>         
            <label>
              <input type="checkbox" name="genre" id="genre7" value="공포"
              ${genreList.contains("공포") ? 'checked' : ''}>공포
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre8" value="가족"
              ${genreList.contains("가족") ? 'checked' : ''}>가족
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre9" value="뮤지컬"
              ${genreList.contains("뮤지컬") ? 'checked' : ''}>뮤지컬
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre10" value="로맨스"
              ${genreList.contains("로맨스") ? 'checked' : ''}>로맨스
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre11" value="판타지"
               ${genreList.contains("판타지") ? 'checked' : ''}>판타지
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre12" value="범죄"
                 ${genreList.contains("범죄") ? 'checked' : ''}>범죄
            </label>
            <label>
              <input type="checkbox" name="genre" id="genre6" value="애니메이션"
               ${genreList.contains("애니메이션") ? 'checked' : ''}>애니메이션
            </label>
          </div>
        </div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">감독</label>
          <input class="form-ctrl" type="text" name="director" id="director"  value="${movieVO.director}" required>
        </div>
      </li>
      
       <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">배우</label>  
         <div id="directorContainer">
          <% 
	        String[] casterArray = (String[]) request.getAttribute("casterArray");
	        if (casterArray != null) {
	          for (int i = 0; i < casterArray.length; i++) {
	      %>
	      <div class="casterBox" id="casterBox<%= i %>">
	        <textarea name="caster"  id="caster<%= i %>"  class="form-ctrl" style="height: 30px;"><%= casterArray[i] %></textarea>
	        <button type="button" class="btn btn-caster" onclick="removeTextarea2(this.parentNode)">-</button>
	      </div>
	      <%
	          }
	        }
	      %>
	    </div>&nbsp;&nbsp;&nbsp;
	    <button type="button" class="btn btn-caster" onclick="addMoreTextarea2()">+</button> 
        </div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">포스터</label>
          <!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
		  <img src="movie_images/${movieVO.poster_url}" width="200pt"><br> 
          <input class="form-ctrl" type="file" name="poster_image" id="poster_url">
          <input type="hidden" name="poster" value="${movieVO.poster_url}">
        </div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">개봉일</label>
          <input class="form-ctrl" type="date" id="opendate" name="opendate"  value="${formattedOpendate}" required>   
        </div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">러닝타임</label>
          <input class="form-ctrl" type="number" name="playtime" id="playtime" value="${movieVO.playtime}" required>	  
	 	</div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">관람 나이</label>
		  <select class="form-ctrl" name="age" id="age">
			<option value="0" ${movieVO.age == 0 ? 'selected' : ''}>전체 관람가</option>
			<option value="12" ${movieVO.age == 12 ? 'selected' : ''}>12세</option>
			<option value="15" ${movieVO.age == 15 ? 'selected' : ''}>15세</option>
			<option value="18" ${movieVO.age == 18 ? 'selected' : ''}>18세</option>
		 </select>
	 	</div>
      </li>
      
      <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">나라</label>
		  <select class="form-ctrl" name="nation" id="nation">
			<option value="한국" ${movieVO.nation == '한국' ? 'selected' : ''}>한국</option>
			<option value="미국" ${movieVO.nation == '미국' ? 'selected' : ''}>미국</option>
			<option value="일본" ${movieVO.nation == '일본' ? 'selected' : ''}>일본</option>
			<option value="영국" ${movieVO.nation == '영국' ? 'selected' : ''}>영국</option>
		 </select>
	 	</div>
      </li>
      
      <li>
	  <div class="input-group">
	  <label class="tit" for="userId">종영 여부</label>
	  <div class="radio-group">
	    <label class="radio-label">&nbsp;&nbsp;&nbsp;
	      <input class="form-ctrl" type="radio" name="ny" id="ny" value="n"  ${movieVO.ny == 'n' ? 'checked' : ''}>
	      <span>상영 및 개봉예정</span>
	    </label>&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;
	    <label class="radio-label">
	      <input class="form-ctrl" type="radio" name="ny" id="ny" value="y" ${movieVO.ny == 'y' ? 'checked' : ''}>
	      <span>종영</span>
	    </label>
	  </div>
	</div>
	</li>
	  <li>
        <div class="input-group user-id">
          <label class="tit" for="userId">트레일러</label>
          <input class="form-ctrl" type="text" name="trailer" id="trailer" value="${fn:escapeXml(movieVO.trailer)}" required>	  
	 	</div>
      </li>
	<li>
	  <div id="container" class="input-group user-id">
	    <label class="tit" for="userId">스틸컷</label>
	    <div id="inputWrapper">
	      <c:forEach items="${stillcut}" var="stillcut" varStatus="status">
	        <div class="stillcut-wrapper">
	          <img src="stillcut_images/${stillcut}" width="400px"><br>
	          <span>${stillcut}</span>
	          <button type="button" onclick="removeStillcut2(this, '${stillcut}')" class="btn-caster">-</button><br>
	        </div>
	      </c:forEach>
	    </div>&nbsp;&nbsp;&nbsp;
	    <button type="button" onclick="addMoreStillcut2()" class="btn-caster">+</button>
	  </div>
	</li>

    </ul>
    <div class="btn-area text-left">
      <input class="btn btn-submit" type="button" value="수정" onClick="go_save2()">
    </div>
  </form>
</div>

	  </div>
  </main>
</body>
</html>

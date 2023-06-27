<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/movie.css" />
<title>Insert title here</title>
</head>
<body>
<div class="bar"><div><img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;영화</div></div>
<div align="center"><br><br><br>
	<div class="h2">박스 오피스</div><br><br><br>
	<form name="frm" id="afrm" method="post">
	  <table id="n_list">
	    <c:set var="today" value="<%= new java.util.Date() %>" />
	    <tr>
	      <c:set var="count" value="0" />
	      <c:forEach items="${getMovieList3}" var="MovieVO" varStatus="status">
	        <c:if test="${MovieVO.opendate.before(today)}">
	          <c:if test="${count % 4 == 0}">
	            </tr><tr>
	          </c:if>
	          <td>
	           <div class="movie-card">
				  <a href="movieDetail?numb=${MovieVO.numb}">
				    <img class="movie-image" src="movie_images/${MovieVO.poster_url}"><br></a><br><br>
				    <span class="movie-title">${MovieVO.title}</span><br>	  
				</div>
	          </td>
	          <c:set var="count" value="${count + 1}" />
	        </c:if>
	      </c:forEach>
	    </tr>
	  </table><br><br>	
		<div class="h2">상영 예정작</div><br><br><br>
		<table id="f_list">
			 <c:set var="today" value="<%= new java.util.Date() %>" />
	    <tr>
	      <c:set var="count" value="0" />
	      <c:forEach items="${getMovieList3}" var="MovieVO" varStatus="status">
	        <c:if test="${MovieVO.opendate.after(today)}">
	          <c:if test="${count % 4 == 0}">
	            </tr><tr>
	          </c:if>
	          <td>
	           <div class="movie-card">
				  <a href="movieDetail?numb=${MovieVO.numb}">
				    <img class="movie-image" src="movie_images/${MovieVO.poster_url}"><br></a><br><br>
				    <span class="movie-title">${MovieVO.title}</span><br>		  
				</div>
	          </td>
	          <c:set var="count" value="${count + 1}" />
	        </c:if>
	      </c:forEach>
	    </tr>
		</table>		
		</form>
		<br><br><br><br><br><br>
	</div>
</body>
</html>
<%@ include file="../footer.jsp" %>
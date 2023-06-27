<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/movie.css" />
<style>
	
</style>
<title></title>
</head>
<body>
  <div align="center" class="h2">
    <form name="frm" id="mfrm" method="post"><br><br>
      <div >무비 차트</div><br>
      <table id="m_list">
        <tr>
          <c:forEach items="${getMovieList}" var="movie" varStatus="status">
            <td>
              <div class="movie-card">
                <div class="number-badge">${status.index + 1}위</div><br>
                <a href="movieDetail?numb=${movie.numb}">
                  <img class="movie-image" src="movie_images/${movie.poster_url}"><br><br></a><br>
                <span class="movie-title">${movie.title}</span><br>
              </div>
            </td>
            <c:if test="${(status.index + 1) % 4 == 0 || status.last}">
              </tr><tr>
            </c:if>
          </c:forEach>
        </tr>
      </table>
    </form>
  </div>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/admin/movie.css" />
</head>
<style>
 body {
    margin: 0;
    padding: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f2f2f2;
  }
    h1 {
    font-size: 24px;
    text-align: center;
    margin-bottom: 20px;
  }
</style>
<body>
<main class="page-content">
    <div class="container-fluid">	
   <div class="container" style="text-align:center;">
	     <h3>영화 상세보기</h3></div>
  <div class="container3">
    <form name="frm" id="detail_form" method="post">
      <input type="hidden" name="pageNum" value="${criteria.pageNum}">
      <input type="hidden" name="rowsPerPage" value="${criteria.rowsPerPage}">
      <input type="hidden" name="numb" value="${movieVO.numb}">
      
      <table id="dlist">
        <tr>
          <th width="200px">제목</th>
          <td colspan="11" width="400px">${movieVO.title}</td>
        </tr>
        <tr>
          <th>줄거리</th>
          <td colspan="11">${story}</td>
        </tr>
        <tr>
          <th>장르</th>
          <td colspan="11">${genre}</td>
        </tr>
        <tr>
          <th>감독</th>
          <td colspan="11">${director}</td>
        </tr>
        <tr>
          <th>배우</th>
          <td colspan="11">${caster}</td>
        </tr>
        <tr>
          <th>포스터</th>
          <td colspan="11">
            <img src="movie_images/${movieVO.poster_url}" alt="포스터">
          </td>
        </tr>
        <tr>
          <th>개봉일</th>
          <td colspan="11">
            <fmt:formatDate value="${movieVO.opendate}" pattern="yyyy.MM.dd" />
          </td>
        </tr>
        <tr>
          <th>등록일</th>
          <td colspan="11">
            <fmt:formatDate value="${movieVO.regdate}" pattern="yyyy.MM.dd" />
          </td>
        </tr>
        <tr>
          <th>상영 시간</th>
          <td colspan="11">${movieVO.playtime}분</td>
        </tr>
        <tr>
          <th>관람 연령</th>
          <td colspan="11">
            <c:choose>
              <c:when test="${movieVO.age == 0}">
                전체 연령 관람가
              </c:when>
              <c:otherwise>
                ${movieVO.age}세 이상 관람가
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
        <tr>
          <th>나라</th>
          <td colspan="11">${movieVO.nation}</td>
        </tr>
        <tr>
          <th>종영 여부</th>
          <td colspan="11">
            <c:choose>
              <c:when test="${movieVO.ny == 'y'}">종영</c:when>
              <c:otherwise>상영</c:otherwise>
            </c:choose>
          </td>
        </tr>
        <tr>
          <th>트레일러</th>
          <td colspan="11">${movieVO.trailer}</td>
        </tr>
        <tr>
          <th>스틸컷</th>
          <td colspan="11">
            <c:forEach items="${stillcut}" var="stillcut" varStatus="status">
              <img src="stillcut_images/${stillcut}" alt="스틸컷">
            </c:forEach>
          </td>
        </tr>
      </table>
      
      <div class="btn-container">
        <input class="btn" type="button" value="수정" onclick="go_mod()">&nbsp;&nbsp;&nbsp;
        <input class="btn" type="button" value="목록" onclick="go_list()">
      </div>
    </form>
  </div>
  	  </div>
  </main>
</body>
</html>

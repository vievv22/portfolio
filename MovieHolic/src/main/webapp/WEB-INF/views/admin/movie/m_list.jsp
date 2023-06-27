<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/admin/movieList.css" />
<script src="admin/movie/movie.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<main class="page-content">
    <div class="container-fluid">
	<section class="notice">
	  <div class="page-title">
	        <div class="container" style="text-align:center;">
	            <h3>영화 리스트</h3>
	        </div>
	    </div>
	
	    <!-- board seach area -->
	    <div id="board-search">
	        <div class="container">
	            <div class="search-window">
	               <form name="frm" id="mov_form" method="post">
	               <table id="a_m_list">
	                    <div class="search-wrap">
	                        <label for="search" class="blind">영화 제목 검색</label>
	          	            <input type="text" name="key" id="key" placeholder="검색어를 입력해주세요.">
	                        <button type="button" class="btn btn-dark" name="btn_search" onclick="go_search()">검색</button>
	                    </div>
	                     
                    </table>	               
	            </div>
	        </div>
	    </div>
	   
	  <!-- board list area -->
	    <div id="board-list">
	        <div class="container">
	            <table class="board-table" id="movieList">
	                <thead>
	                <tr>
	                    <th scope="col" class="th-num">순서</th>
	                    <th scope="col" class="th-numb">번호</th>
	                    <th scope="col" class="th-title">제목</th>
	                    <th scope="col" class="th-open">개봉일</th>
	                    <th scope="col" class="th-date">등록일</th>
	                </tr>
	                </thead>
	                <tbody>
	            
					<c:forEach items="${movieList}" var="movieVO" varStatus="status">
	                <tr>
	                    <td>${(pageMaker.totalCount - (pageMaker.cri.pageNum - 1) * pageMaker.cri.rowsPerPage - status.count) + 1}</td>
	                    <td>${movieVO.numb}</td>
	                    <th><a href="#" onclick="go_detail('${pageMaker.cri.pageNum}', '${pageMaker.cri.rowsPerPage}', '${movieVO.numb}')">${movieVO.title}</a></th>
	                    <td><fmt:formatDate value="${movieVO.opendate}" pattern="yyyy. M. d." /></td>
	                    <td><fmt:formatDate value="${movieVO.regdate}"/></td>
	                </tr>
	         		</c:forEach>
					<tr><td colspan="8">${paging}</td></tr>
	                </tbody>
	            </table><br>
	          	 <%@ include file="page_area.jsp" %><br><br>
	            </form>
	        </div>
	    </div>
		<br><br><br><br><br><br>
	</section>
	  </div>
  </main>
</html>


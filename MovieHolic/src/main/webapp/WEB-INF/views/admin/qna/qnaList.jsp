<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ include file="../header.jsp" %> 
  <link rel="stylesheet" href="css/admin/qnaList.css" />
  <script src="admin/qna/qna.js"></script>

<body>
<main class="page-content">
    <div class="container-fluid">
    
	<h1 align="center">Q&amp;A 게시글</h1>
  	<hr>
  	<br>

<form name="frm" method="post">
<input type="hidden" name="numb">  
	<table class="schedule-table">
  <tr>
   <th>순번</th> <th>제목</th> <th>작성자</th> <th>작성일</th>   <th>답변여부</th>  
  </tr>
  <c:choose>
	<c:when test="${qnaListSize<=0}">
		<tr>
			<td colspan="8" align="center" height="25">
			등록된 1:1 문의가 없습니다.
			</td>
		</tr>
	</c:when>
	  <c:otherwise>
			    
		  <c:forEach items="${qnaList}" var="qnaVO" varStatus="status">  
		      <tr>
		      <td width="10%">${(pageMaker.totalCount - (pageMaker.cri.pageNum - 1) * pageMaker.cri.rowsPerPage - status.count) + 1}</td>
			 
		      <td width="60%"> 
		      <a class="link" href="admin_qna_detail?numb=${qnaVO.numb}" onclick="go_view('${qnaVO.numb}')">
		 			${qnaVO.title} 
		      </a>
		      </td>
		      <td width="10%"> ${qnaVO.user_id} </td>
		      <td  width="10%"> <fmt:formatDate value="${qnaVO.regdate}"/></td>
		      <td  width="10%">
			      <c:choose>          
			        <c:when test="${qnaVO.repyn == 'n'}">
				    	<span style="color: red;">미처리</span>
					</c:when>
					<c:otherwise>
				   	 	<span>답변완료</span>
				  </c:otherwise>
			      </c:choose>      
			  </td>
		      
		      
		      </tr>
		    </c:forEach>
	     </c:otherwise>			
	</c:choose>
    </table><br><br>
       <%@ include file="page_area_qna.jsp" %>
      
    </form>    
</body>

</html>
</main>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %><br>
	<link rel="stylesheet" href="css/admin/memberlist.css" />
<script src="admin/member/member.js"></script>

<main class="page-content">
    <div class="container-fluid">
 
  	<h1 align="center">회원 리스트</h1>
  	<hr>
  	<br>
     
    <form name="formm" id="member_List" method="post">
      	<table class="schedule-table">
      
     		 <td>
			
				<input type="text" name="key" id="key" placeholder="이름을 입력해주세요">
				<input class="btn" type="button" name="btn_search" value="검색" onclick="go_search()">
				
			</td>
     	 </table>
      
      <table class="schedule-table">
	     <thead>
		      <tr>
		       	<th>순번</th>  
		       	<th>ID</th> 
		       	<th>이름</th> 
		       	<th>전화번호</th> 
		       	<th>생년월일</th> 
		       	<th>이메일</th> 
		       	<th>포인트</th> 
		       	<th>가입일</th> 
		       	<th>활동여부</th>
		      </tr>
	      </thead>
	      <tbody>
		      <c:choose>
				<c:when test="${memberListSize<=0}">
					<tr>
						<td colspan="8" align="center" height="25">
						등록된 회원이 없습니다
						</td>
					</tr>
				</c:when>
			    <c:otherwise>
			    
			      <c:forEach items="${memberList}"  var="memberVO" varStatus="status">
				      <tr>  
				       <td width="70">${(pageMaker.totalCount - (pageMaker.cri.pageNum - 1) * pageMaker.cri.rowsPerPage - status.count) + 1}</td>
			    		<td> ${memberVO.id} </td>    
				        <td> ${memberVO.name} </td>      
						<td> ${memberVO.tel.substring(0, 3)}-${memberVO.tel.substring(3, 7)}-${memberVO.tel.substring(7)}</td>    
				        <td> ${memberVO.birth.substring(0, 4)}-${memberVO.birth.substring(4, 6)}-${memberVO.birth.substring(6)} </td> 
				        <td> ${memberVO.email} </td>    
				        <td> ${memberVO.point} </td> 
				        <td> <fmt:formatDate value="${memberVO.regdate}" type="date"/></td>
				        <td>
							<c:choose>
								<c:when test="${memberVO.useyn=='n'}">탈퇴회원</c:when>
								<c:otherwise>일반회원</c:otherwise>
							</c:choose>
						</td>
			      
				      </tr>
			      </c:forEach>   
			    
			      	<div>${paging}</div>
			
				 </c:otherwise>			
			</c:choose>
		</tbody>
      </table>
      <br>
         <%@ include file="page_area.jsp" %>

    </form>
 
    </main>
</div>
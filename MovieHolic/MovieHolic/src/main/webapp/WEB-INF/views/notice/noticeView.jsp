<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>  
 <link rel="stylesheet" href="css/noticedetail.css" /> 


<br><br><br><br><br>
  <article>
      <h2> 공지사항 </h2>
    <br><br><br>
    <form name="formm" method="post">
    
      
      
        <div class="noticetitle">${noticeVO.title}</div><br>
     	
        <div class="noticeregdate"> <span>등록일</span><span class="noticeregdate"><fmt:formatDate value="${noticeVO.regdate}" type="date"/></span></div>
      
 
 		
     	<hr class="hr">
     	<br><br>
        <p>${noticeVO.content} </p>
        <br><br>
    	<hr class="hr">
     <div id="buttons">
      <input type="button"  value="목록보기"     class="submit"  onclick="location.href='notice_list'"> 
      </div>
    </form>
  </article>
  <br><br><br><br><br>
<%@ include file="../footer.jsp" %>
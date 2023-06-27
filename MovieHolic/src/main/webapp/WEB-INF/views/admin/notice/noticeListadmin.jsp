<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
  <link rel="stylesheet" href="css/admin/noticeList.css" />
<br><br><br><br><br>

<body>

<main class="page-content">
   <div class="container-fluid">


  <h1 align="center">공지사항</h1>
  <hr>
  <br>

  
  
  
  <form name="formm" id="noticeList" method="post">
    <table class="schedule-table">
      <tr>
        <th width="20%">번호</th>
        <th width="60%">제목</th>
        <th width="20%">등록일</th>
      </tr>
        
          <c:forEach items="${noticeList}" var="noticeVO" >
            <tr>
              <td>${noticeVO.numb}</td>
              <td><a class="link"  href="notice_view_admin?numb=${noticeVO.numb}">${noticeVO.title}</a></td>
              <td><fmt:formatDate value="${noticeVO.regdate}" type="date"/></td>
             
            </tr>
           
            
          </c:forEach>
         
            
    </table>
   
    
  </form>
 </div>
  </main>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>
<br><br><br><br><br>
 <link rel="stylesheet" href="css/notice.css" />

<article>
  <h2>공지사항</h2>
  <h3>MovieHolic의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</h3>
  <hr>
  <br><br>
  <form name="formm" id="noticeList" method="post">
    <table>
      <tr>
        <th width="7%">번호</th>
        <th width="73%">제목</th>
        <th width="20%">등록일</th>
      </tr>
      <c:choose>
        <c:when test="${memberListSize <= 0}">
          <tr>
            <td colspan="3" align="center" height="25">등록된 공지사항이 없습니다.</td>
          </tr>
        </c:when>
        <c:otherwise>
          <c:forEach items="${noticeList}" var="noticeVO" varStatus="status">
            <tr>
              <td>${(pageMaker.totalCount - (pageMaker.cri.pageNum - 1) * pageMaker.cri.rowsPerPage - status.count) + 1}</td>
              <td><a href="notice_view?numb=${noticeVO.numb}">${noticeVO.title}</a></td>
              <td><fmt:formatDate value="${noticeVO.regdate}" type="date"/></td>
             
            </tr>
           
            
          </c:forEach>
         <br>
            <div>${paging}</div> 
         
        </c:otherwise>
      </c:choose>
    </table>
    <%@ include file="page_area_noticeList.jsp" %>
    
  </form>
</article>
<br><br><br><br><br>
<%@ include file="../footer.jsp" %>
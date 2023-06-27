<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ include file="../header.jsp" %>

 <link rel="stylesheet" href="css/qna.css" />
 <link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
 <div class="bar"><div><img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;마이페이지&nbsp;&nbsp;<img src="images/arrow.png" alt=">" width="10px">&nbsp;&nbsp;문의 내역</div></div>
 
<body>
<div id="middle">
   <br>

   <h2>My Page</h2>
   <div class="flex-container">
      <div class="flex-item">

         <br>
         <div class="ponit-grade">
            <c:choose>

               <c:when test="${userDetail.point < 400}">
                  <b>Friends</b>
               </c:when>
               <c:when test="${userDetail.point >= 400 && userDetail.point < 600}">
                  <b>Silver</b>
               </c:when>
               <c:when test="${userDetail.point >= 600 && userDetail.point < 800}">
                  <b>골드</b>
               </c:when>
               <c:otherwise>
                  <b>VIP</b>
               </c:otherwise>
            </c:choose>
         </div>
         <br> <span><b>${userDetail.name}</b></span><span> 님 반가워욧!</span>
         <br> <br> <span>Point ${userDetail.point} 점</span> <br>





         <div id="Lv">
            <c:choose>
               <c:when test="${userDetail.point < 100}">
    Lv.1까지 <b>40,000원 남았어요!</b>
               </c:when>
               <c:when test="${userDetail.point >= 100 && userDetail.point < 200}">
    Lv.1까지 <b>30,000원 남았어요!</b>
               </c:when>
               <c:when test="${userDetail.point >= 200 && userDetail.point < 300}">
    Lv.1까지 <b>20,000원 남았어요!</b>
               </c:when>
               <c:when test="${userDetail.point >= 300 && userDetail.point < 400}">
    Lv.1까지 <b>10,000원 남았어요!</b>
               </c:when>
               <c:when test="${userDetail.point >= 400 && userDetail.point < 500}">
    Lv.2까지 <b>20,000원 남았어요!</b>
               </c:when>
               <c:when test="${userDetail.point >= 500 && userDetail.point < 600}">
    Lv.2까지 <b>10,000원 남았어요!</b>
               </c:when>
               <c:when test="${userDetail.point >= 600 && userDetail.point < 700}">
    Lv.2까지 <b>10,000원 남았어요!</b>
               </c:when>
               <c:when test="${userDetail.point >= 700 && userDetail.point < 800}">
    Lv.2까지 <b>10,000원 남았어요!</b>
               </c:when>
               <c:otherwise>
                  <b>VIP님 환영합니다!</b>
               </c:otherwise>
            </c:choose>

         </div>
         <br> <br>
         <div class="grade-container">
            <div class="grade">Friends</div>
            <div class="grade">
               <b>Lv.1</b>
            </div>
            <div class="grade">
               <b>Lv.2</b>
            </div>
            <div class="grade">
               <b>Lv.3</b>
            </div>
         </div>
         <br>
         <div class="line"></div>
         <br>
         <div class="grade-container">
            <div class="grade">0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="grade">4만원</div>
            <div class="grade">6만원</div>
            <div class="grade">8만원</div>
         </div>

      </div>




   <div class="flex-item-right">
      <br>
      <div class="botton-container">
         <div class="my-botton ">
            <button type="button" onclick="location.href='reviewList2?userId=${userDetail.id}'">리 뷰</button>

         </div>
         <div class="my-botton ">
            <button type="button" onclick="location.href='qna_list'">문의</button>
         </div>
         <div class="my-botton ">
            <button type="button" onclick="location.href='memberInfo'">회원정보</button>
         </div>
      </div>
<img alt="광고이미지" src="https://www.lottecinema.co.kr/NLCHS/Content/images/member/my_club_315_bravo_230301.jpg">
   </div>
   </div>
   <!--위에는 고정-->

<br><br><br>

</div>
  
  
<div class="container2" id="container2">

	<h1 class="loginh1">1:1 고객 게시판</h1>
  
    <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
    <hr width="50%"><br>
    <form name="formm" method="post">
      <table id="qnaList" style="margin: 0 auto;">
      <tr>
       <th>번호</th> <th>제목</th> <th>등록일</th> <th>답변 여부</th>    
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
		      <c:forEach items="${qnaList}"  var="qnaVO" varStatus="status">
		      <tr> 
		      	<td width="10%">${(pageMaker.totalCount - (pageMaker.cri.pageNum - 1) * pageMaker.cri.rowsPerPage - status.count) + 1}</td>
				<td width="60%"> <a href="qna_view?numb=${qnaVO.numb}"> ${qnaVO.title} </td>      
		        <td width="20%"> <fmt:formatDate value="${qnaVO.regdate}" type="date"/></td>
		        <td width="10%"> 
		          <c:choose>
		            <c:when test="${qnaVO.repyn=='n'}"> no </c:when>
		            <c:when test="${qnaVO.repyn=='y'}"> yes </c:when>
		          </c:choose>
		        </td>    
		      </tr>
		      </c:forEach> 
	       </c:otherwise>			
	  </c:choose>   
      </table>
        <%@ include file="page_area_qnaList.jsp" %>
      <div>
      	  <button type="button" class="submit" onclick="location.href='qna_write_form'">1:1 질문하기</button><br><br>
	  </div> 
</form>
</div>
</body>
</html><br>
<%@ include file="../footer.jsp" %>
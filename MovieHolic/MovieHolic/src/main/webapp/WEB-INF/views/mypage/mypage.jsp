<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

   
<%@ include file="../header.jsp"%>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style>

.bar {
  height: 25px;
  background-color: #503396;
  color: #fff;
  padding: 10px;
  display: flex;
  flex-direction: row; /* 수평 방향으로 정렬 */
  align-items: center; /* 수직 방향으로 가운데 정렬 */
  justify-content: space-between; /* 수평 방향으로 아이템 간격을 동일하게 정렬 */
  padding-left: 400px; /* 왼쪽 여백 추가 */
}

#middle {
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: center;
   margin-bottom: 50px;

}

.table {
   
}

.flex-container {
   display: flex;
   border: 0px solid #000;
   border-radius: 10px;
   height: 330px;
   flex-wrap: nowrap; /* 수정: nowrap으로 설정 */
   justify-content: space-between;
   /* 외부 그림자 */
   box-shadow: 2px 2px 4px 5px gray;
}

.flex-item-right {
   flex: 1;
   border-left: 1px solid #E2E2E2;
   padding: 10px;
   width: 500px;
   text-align: center;
}

.flex-item {
   flex: 1;
   padding: 10px;
   width: 500px;
}

button {
   width: 100px;
   height: 50px;
   background-color: #ffffff;
   color: #000000;
   border: none;
   text-align: center;
   line-height: 50px;
   font-size: 15px;
   font-weight: bold;
   cursor: pointer;
   font-family: 'Noto Sans KR', sans-serif;
}

.reviewButton {
   width: 100px;
   font-size: 12px;
   background-color: #ffffff;
   color: #000000;
   border: none;
   text-align: center;
   font-weight: bold;
   cursor: pointer;
   font-family: 'Noto Sans KR', sans-serif;
}

.botton-container {
   display: flex;
   justify-content: center;
   height: 100px;
   flex-wrap: nowrap; /* 수정: nowrap으로 설정 */

}

.my-botton {
   width: 120px;
   text-align: center;
   height: 50px;
   background-color: #ffffff;
   color: #000;
   border: 1px solid #A8A8A8;
   border-radius: 8px;
   margin:10px;
}

.grade-container {
   display: flex;
   flex-wrap: nowrap; /* 수정: nowrap으로 설정 */
   justify-content: space-between;
}

.grade {
   font-size: 14px;
}

.line {
   border-bottom: 1px solid #A8A8A8;
}

#Lv {
   font-size: 20px;
   text-align: center;
}

.container {
   box-shadow: 2px 2px 4px 5px gray;
   text-align: center;
   border: 0px solid #000;
   border-radius: 10px;
       text-decoration: none;
}



  .container tr:first-child {
    background-color: #f2f2f2; /* 첫 번째 행 배경색 */
  }


.font {
   font-weight: bold;
   font-family: 'Noto Sans KR', sans-serif;
}
  .font a {
    text-decoration: none; /* 링크의 밑줄 제거 */
  }

.ponit-grade {
   border-radius: 5px; background-color : #503396;
   color: white;
   width: 70px;
   text-align: center;
   background-color: #503396;
}

td {
   font-size: 12px;
}
</style>
<script>
   
</script>
<div class="bar"><div><img src="images/home.png" alt="홈" width="15px">&nbsp;&nbsp;<img src="images/arrow.png" alt=">"width="10px">&nbsp;&nbsp;마이페이지</div></div>


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
                  <b>Gold</b>
               </c:when>
               <c:otherwise>
                  <b>VIP</b>
               </c:otherwise>
            </c:choose>
         </div>
         <br> <span><b>${userDetail.name}</b></span><span> 님 반가워요!</span>
         <br> <br> <span>Point ${userDetail.point} 점</span> <br>





         <div id="Lv">
            <c:choose>
               <c:when test="${userDetail.point < 400}">
    Lv.1까지 <b>${40000 - userDetail.point * 100}원 남았어요!</b>
               </c:when>

               <c:when test="${userDetail.point >= 400 && userDetail.point < 600}">
    Lv.2까지 <b>${60000 - userDetail.point * 100}원 남았어요!</b>
               </c:when>

               <c:when test="${userDetail.point >= 600 && userDetail.point < 800}">
    vip까지 <b>${80000 - userDetail.point * 100}원 남았어요!</b>
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
               <b>VIP</b>
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

   <br>
   <br>
   <br>
   <h3>예매 내역</h3>



   <c:if test="${empty ticketingList}">
      <p>
         <img src="images/느낌표.png" width="80px">
      </p>
      <p id="noneTicket">예매 내역이 없습니다.</p>
   </c:if>

   <c:choose>

      <c:when test="${not empty ticketingList}">

         <table class="container">
            <tr height="60px" class="font">
               <th width="70px">예매 번호</th>
               <th width="150px">관람 영화</th>
               <th width="110px">관람 극장</th>
               <th width="110px">관람 일시</th>
               <th width="80px">관람 인원</th>
               <th width="110px">관람 좌석</th>
               <th width="81px">결제 금액</th>
               <th width="110px">예매 일시</th>
               <th width="80px">상태</th>
               <th width="80px">리뷰쓰기</th>
               <!-- 리뷰쓰기 버튼 제목 추가 -->
            </tr>

            <c:forEach items="${ticketingList}" var="ticketingVO">
               <tr height="45px">
                  <td class="font"><a href="my_ticketing_detail?numb=${ticketingVO.numb}" style="text-decoration:none;">${ticketingVO.numb}</a></td>
                  <td>${ticketingVO.movie_title}</td>
                  <td>${ticketingVO.th_name}점-&nbsp;${ticketingVO.r_numb}관</td>
                  <td class="startDay"><fmt:formatDate
                        value="${ticketingVO.start_day}" pattern="yyyy-MM-dd" />
                     ${ticketingVO.start_time}</td>
                  <!-- 클래스 추가 -->
                  <td>${ticketingVO.p_num}명</td>
                  <td>${ticketingVO.seat_name}</td>
                  <td>${ticketingVO.price}원</td>
                  <td><fmt:formatDate value="${ticketingVO.regdate}"
                        pattern="yyyy-MM-dd" /></td>
                  <c:choose>
                     <c:when test="${ticketingVO.cancelyn == 'y'}">
                        <td>예매 취소</td>
                        <td></td>
                     </c:when>
                     <c:otherwise>


                        <c:set var="currentTime" value="<%= new Date() %>"/>
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${currentTime}" var="currentTimestamp" />
                        <c:set var="startDayTokens" value="${fn:split(ticketingVO.start_day, ' ')}" />
                        <c:set var="formattedMonth" value="" />
                        <c:choose>
                          <c:when test="${startDayTokens[1] eq 'Jan'}">
                            <c:set var="formattedMonth" value="01" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Feb'}">
                            <c:set var="formattedMonth" value="02" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Mar'}">
                            <c:set var="formattedMonth" value="03" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Apr'}">
                            <c:set var="formattedMonth" value="04" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'May'}">
                            <c:set var="formattedMonth" value="05" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Jun'}">
                            <c:set var="formattedMonth" value="06" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Jul'}">
                            <c:set var="formattedMonth" value="07" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Aug'}">
                            <c:set var="formattedMonth" value="08" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Sep'}">
                            <c:set var="formattedMonth" value="09" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Oct'}">
                            <c:set var="formattedMonth" value="10" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Nov'}">
                            <c:set var="formattedMonth" value="11" />
                          </c:when>
                          <c:when test="${startDayTokens[1] eq 'Dec'}">
                            <c:set var="formattedMonth" value="12" />
                          </c:when>
                        </c:choose>
                        
                        <c:set var="formattedStartDay" value="${startDayTokens[5]}-${formattedMonth}-${startDayTokens[2]}" />
                        
                        <c:set var="formattedStartDateTime" value="${formattedStartDay} ${ticketingVO.start_time}" />
                        
                        
                        <c:choose>
                          <c:when test="${formattedStartDateTime > currentTimestamp}">
                            <td>취소 가능</td>
                          </c:when>
                          <c:otherwise>
                            <td>취소 불가</td>
                          </c:otherwise>
                        </c:choose>   


                        <td><c:choose>
                              <c:when test="${ticketingVO.reviewCheck == '1' }">
                            작성 완료
                         </c:when>
                              <c:otherwise>
                                 <input type="button" class="reviewButton"
                                    onclick="writeReview('${ticketingVO.numb}','${ticketingVO.movie_numb}',
                                    '${ticketingVO.start_day}', '${ticketingVO.start_time}')"
                                    value="리뷰쓰기"></input>
                              </c:otherwise>
                           </c:choose></td>
                     </c:otherwise>
                  </c:choose>
               </tr>
            </c:forEach>
         </table>
      </c:when>
      <c:otherwise>

      </c:otherwise>
   </c:choose>


   <hr>
   <%@ include file="../page_area.jsp"%>
</div>
<script>

   function getCurrentDateTime() {
     var currentDate = new Date();
     var currentTimestamp = currentDate.getTime(); // 현재 시간을 밀리초로 변환
     return currentTimestamp;
   }

   // 리뷰쓰기 버튼 상태를 확인하고 변경하는 함수
   function checkReviewButton(button) {
      var startDay = button.parentNode.parentNode.querySelector(".startDay").innerText; // 시작 일자 가져오기
      var startDateTime = new Date(startDay.replace(/-/g, "/")).getTime(); // 시작 일자를 Date 객체로 변환하여 밀리초로 가져오기
      var currentDateTime = getCurrentDateTime();

   }

   /// 페이지가 로드되었을 때 리뷰쓰기 버튼 상태 확인
   window.addEventListener("load", function() {
      var reviewButtons = document.querySelectorAll(".reviewButton"); // reviewButton 클래스를 가진 모든 버튼 선택

      for (var i = 0; i < reviewButtons.length; i++) {
         var reviewButton = reviewButtons[i];
         checkReviewButton(reviewButton); // 각 버튼의 상태 확인
      }

   });
   

   // 리뷰 쓰기
   function writeReview(numb, movie_numb, start_day, start_time) {
        // 값을 가져와 변수에 저장
        var ticketing_numb = numb;
        var movie_numb = movie_numb;
        var startYear = start_day.substring(start_day.length-4);
        var startDate = start_day.split(' ').slice(1, 3).join(' ');
        var startDay = startDate.split(' ').slice(1,2).join(' ');
        startDate = startDate + ' ' + startYear;
        startDate = new Date(startDate).toISOString().split('T')[0];
        startDate = startDate.split('-').slice(0,2).join('-');
        startDate = startDate + '-' + startDay;
        
       // startDay = new Date(startDay).toISOString().split('T')[0];
        var startTime = start_time;
        var currentDateTime = new Date();
        var startDateTime = new Date(startDate + ' ' + startTime);
        
        // 리뷰 기능 완성하고 부등호 방향 고치기
        if (currentDateTime > startDateTime) {
          var queryString = "movie_numb=" + encodeURIComponent(movie_numb) + "&ticketing_numb=" + encodeURIComponent(ticketing_numb);
          var url = "reviewInsertForm?" + queryString;
          var width = 500;
          var height = 400;

          var left = (window.innerWidth - width) / 2;
          var top = (window.innerHeight - height) / 2;


          var features = 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top + ',scrollbars=no';
          window.open(url, '', features);
     
          
        } else {
          alert('아직 관람 시간이 되지 않았습니다.');
          return false;
        }
      }

</script>
<%@ include file="../footer.jsp"%>
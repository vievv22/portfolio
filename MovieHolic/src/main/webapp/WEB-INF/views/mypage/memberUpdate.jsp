<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
 <br><br><br><br><br><br>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/memberupdate.css" />
  <script src="mypage/mypage.js"></script>
<meta charset="UTF-8">
<title>회원정보 수정</title>

</head>


<body>

   
   <div class="container" id="container">
      
      <form id=update_form name="frm" method="post">
      
         <h1 class="loginh1">회원정보 변경</h1>
      
         <table>
            <tr>
               <th>아이디</th>
               <td><input type="text" value="${userDetail.id}" readonly></td>
            </tr>
            <tr>
               <th>이  름</th>
               <td><input type="text" value="${userDetail.name}" readonly></td>
            </tr>
            <tr>
               <th>전화번호</th>
               <td class="tel-container">
               <select id="phone1"  oninput="changePhone1()" style="width:98px; height:40px; text-align:center;">
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="017">017</option>
            </select>
               
                  <!-- <input id="phone1" type="text" size="1" maxlength="3" placeholder="" oninput="changePhone1()"> -->
                  &nbsp;-&nbsp;&nbsp;
                  <input id="phone2" type="text" size="3" maxlength="4" placeholder="" oninput="changePhone2()">
                  &nbsp;-&nbsp;&nbsp;
                  <input id="phone3" type="text" size="3" maxlength="4" placeholder="" oninput="changePhone3()">
                  <input type="hidden" name="tel" id="tel">
               </td>
            </tr>
            <tr>
               <th>생년월일</th>
               <td><input type="text" value="${userDetail.birth.substring(0, 4)}-${userDetail.birth.substring(4, 6)}-${userDetail.birth.substring(6)}" readonly></td>
            
            </tr>
            <tr>
               <th>이메일</th>
               <td><input type="text" value="${userDetail.email}" readonly></td>
            </tr>
            <tr>
               <th>포인트</th>
               <td><input type="text" value="${userDetail.point}" readonly></td>
            </tr>
         </table><br><br>
         
         <div>
            <button  class="submit" onclick="go_mod_save()">변경</button>
            <button  class="submit" onclick="go_mov()">취소</button>
         </div>
   
         
      </form>
   </div>
   </body>
</html>
<%@ include file="../footer.jsp" %>
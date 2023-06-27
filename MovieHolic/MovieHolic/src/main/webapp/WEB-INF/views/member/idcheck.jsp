<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/member.css" />
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

<script src="member/member.js"></script>
</head>
<body class="findPwdResult">
 <div class="form-container sign-in-container">
  <form method="post" name="formm" id="theform" action="id_check_form" >
  		<h1  align="center">ID 중복확인</h1><hr><br>

    
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">	
        <script type="text/javascript">
          opener.document.formm.id.value="";
        </script>
        ${id}는 이미 사용중인 아이디입니다.<br><br><br>
        <button type="submit" class="cancel" onclick="idok()">확인</button>	<br>
      </c:if>
      <c:if test="${message == -1}">
        ${id}는 사용 가능한 ID입니다.
      <br><br><br><button type="submit" class="cancel" onclick="idok('${id}')">사용</button>	<br>
    	
      </c:if>
    </div>
  </form>
  </div>
</body>
</html>
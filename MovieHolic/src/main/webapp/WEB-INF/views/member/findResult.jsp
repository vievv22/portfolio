<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="css/member.css" />
<script type="text/javascript">
function idok(){
  self.close();
}
</script>
</head>
<body class="findPwdResult">
<div id="wrap">
  <h1 align="center">아이디 찾기</h1>
  <hr>
  <form method=post name=formm style="margin-right:0 " action="id_check_form" >
    
	    <div style="margin-top: 20px" align="center">   
		      <c:if test="${message == 1}">
			        <script type="text/javascript">
			        opener.document.formm.id.value="";
			        </script>
			       	 <td>고객님의 정보와 일치하는 아이디입니다.</td>
			        <br> <br> <br>
			      	<span> ${id}</span>
		      </c:if>
		      <c:if test="${message == -1}">
		                     가입하지 않은 ID입니다.
		      </c:if>
	    </div>
	    <br><br>
	    <button type="submit" class="cancel" onclick="idok()">확인</button>	<br>
  </form>
</div>  
</body>
</html>
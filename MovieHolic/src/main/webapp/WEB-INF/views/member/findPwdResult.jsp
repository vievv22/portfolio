<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/member.css" />
<script src="member/member.js"></script>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>


</head>
<body class="findPwdResult">
<div id="wrap">
  <h1 align="center">비밀번호 찾기</h1><hr>
  <form method="post" name="formm" action="change_pwd" id="pwd_form" style="margin-right:0">
  	 
  	 <div style="margin-top: 20px" align="center">
  	 	
  		<c:if test="${message == 1}">
  			<td>비밀번호를 변경해 주세요.</td>
			<br> <br> 
			<input type=text name="id" value="${id}" readonly="readonly" style="width: 200px;"><br> 
			
  			<input type="password"  name="pwd" id="pwd" placeholder="새 비밀번호" style="width: 200px;"><br> 
	        
	        <input type="password"  name="pwdCheck" id="pwdcheck" placeholder="새 비밀번호 확인" style="width: 200px;"><br><br>
	        
	        <button type="submit" class="cancel" onclick="return changePassword()">확인</button>	<br>
	    </c:if>   
	</div>
	
		
	
    
    <div><br>
    	<c:if test="${message == -1}">
    	가입하지 않은 ID입니다.
    	
    	
    	<br><br><br> 
    	<button type="submit" class="cancel" onclick="idok()">확인</button>	<br>
    	</c:if>
    </div>
  </form>
</div>  
</body>
</html>
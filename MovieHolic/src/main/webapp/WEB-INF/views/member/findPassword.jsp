<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="css/member.css" />
<script src="member/member.js"></script>
	  
  </head>
  <body>
  <div class="form-container sign-in-container">
	  	<h1 align="center">비밀번호 찾기</h1>
	  	<hr>
	 
		
		<form name="findPW" id="findPW" action="find_pwd" method="post">
		
			<input type="text" name="id" id="id" value="" placeholder="아이디"> <br>
		
			
			<input type="text" name="name" id="name" value="" placeholder="이름"><br>
		
			
			<input type="text" name="email" id="email" value="" placeholder="이메일"><br><br>
		
			<button type="submit" class="submit" onclick="return findPassword()">확인</button><br><br>
	
		</form>
	</div>
</body>
</html>
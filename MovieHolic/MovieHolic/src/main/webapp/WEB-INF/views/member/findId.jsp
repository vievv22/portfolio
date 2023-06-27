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
	  	<h1 class="loginh1" >아이디 찾기</h1><hr><br>
	  	
	  	
	  	
		<form name="findId" id="findId" action="find_id" method="post">
			
			<input name="name" type="text" id="name" value="" placeholder="이름" ><br>
					
			<input name="email" type="text" id="email" value="" placeholder="이메일"><br><br>
				
			<button type="submit" class="submit" onclick="return findMemberId()">확인</button><br>	
		</form>
	
	</div>
</body>
</html>
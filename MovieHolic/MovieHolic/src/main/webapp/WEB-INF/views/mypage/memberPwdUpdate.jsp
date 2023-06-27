<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
 <br><br><br><br><br><br><br>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="css/memberupdate.css" />
 <script src="mypage/mypage.js"></script>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

</head>


<body>
<div class="container2" id="container">


	<form id=updatePwd_form name="updatePwd_form" method="post">
	
	
		<h1 class="loginh1">비밀번호 변경</h1>
		<table>
			<tr>
				<th>비밀번호 입력</th>
				<td><input type="password" id="pwd" name="pwd" value=""></td>
			</tr>
			<tr>
				<th>비밀번호 재입력</th>
				<td><input type="password" id="pwd2"  name="pwd2" value=""></td>
			</tr>
		 
			
			</table><br>
			<div>
				<button  class="my-botton" class="submit" onclick="go_mod_save2()">변경</button>
				<button  class="my-botton" class="submit" onclick="go_mov2()">취소</button>
			
			</div><br><br>
		
	
	
	</form>
</div>
</body>
</html><br><br>
<%@ include file="../footer.jsp" %>
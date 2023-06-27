<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<br>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/login.css" />
<script src="member/member.js"></script>
</head>

<!-- HTML 내용 생략 -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<div class="bodylogin">

	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form id="join" method="post" name="formm">
				<h1 class="loginh1">회원가입</h1><br>
				<div class="id-container">
					<input onkeydown="return blockKoreanInput(event)" oninput="blockKoreanInput(this)" type="text" name="id" id="id" placeholder="ID" value="${id}" size="20"
					maxlength="20">
					<input type="button" value="중복 체크"  onclick="idcheck()">
				</div>
				<input type="hidden" name="reid" id="reid" value="${reid}">
				
	    		<input type="password"  name="pwd" id="pwd" placeholder="Password" size="20" maxlength="20">
	    		<input type="password"  name="pwdCheck" id="pwdCheck" placeholder="Password" size="20" maxlength="20">
				
				<input onkeypress="return isHangulKey(event)" type="text" name="name" id="name" placeholder="Name" size="20" >
				
				<div class="tel-container">
				<select id="phone1" style="width:98px; height:40px; text-align:center;">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="017">017</option>
				</select>
				<!-- <input id="phone1" type="text" size="1" maxlength="3" placeholder="010" oninput="validatePhone1(this);"	> -->&nbsp;-&nbsp;&nbsp;&nbsp;
	       		<input id="phone2" type="text" size="3" maxlength="4" placeholder="0000" oninput="validateInput(this);">&nbsp;-&nbsp;&nbsp;&nbsp;
	       		<input id="phone3" type="text" size="3" maxlength="4" placeholder="0000" oninput="validateInput(this);">
	        	<input type="hidden" name="tel" id="tel">
	        	</div>
	        	
	        	<div class="form-group email-form" align="center">
	        		<div class="input-group"  style="width:355px; display:flex;">
        				<input onkeydown="return blockKoreanInput(event)" oninput="blockKoreanInput(this)" type="text" class="form-control" name="email1" id="email1" placeholder="Email" maxlength="15">
						<select class="form-control" name="email2" id="email2" 
							style="height:40px; margin-left:20px; margin-top:7px;">
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@hanmail.com</option>
						 <option>@yahoo.co.kr</option>
						</select>
	        		</div>
        		</div>
        		<div style="display:flex">
					<div class="mail-check-box">
						<input style="width:192.2px; margin-right:10px;"
						class="form-control mail-check-input" id="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
	        		<div class="input-group-addon">
						<input style="font-size: 8px; width:112px; height:40px; margin-left:10px;"
						 type="button" class="btn btn-primary" id="mail-Check-Btn" value="본인인증"></input>
					</div>
				</div>
				<span id="mail-check-warn"></span>
				<script>
				var result = 0;
				var email1 = document.getElementById("email1");
				
				 $(document).ready(function() {
					 $("input[name='email1']").on("blur", function() {
							 const email = $('#email1').val() + $('#email2').val(); // 이메일 주소값 얻어오기!
							 if($('#email1').val()==="") {
								 alert('이메일을 입력해주세요!');
								 return false;
							 } else {
					        $.ajax({
					            url: "check_email",
					            type: "GET",
					            data: { email: email },
					            dataType: "json",
					            success: function(data) {
					                if (data === 1) {
					                    $("input[name='email1']").css("background-color", "aliceblue");
					                    alert('사용 가능한 이메일입니다\n본인인증을 해주세요');
					               		result = 1;
					                } else if(data === 0) {
					                    $("input[name='email1']").css("background-color", "#FF8C8C");
					                    alert('이미 존재하는 이메일입니다!');
					                    email1.value = "";
					                }
					            }
					        });
							 }
					    });
				 });
				 
				$('#mail-Check-Btn').click(function() {
					const email = $('#email1').val() + $('#email2').val(); // 이메일 주소값 얻어오기!
					console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
					const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
					
					$.ajax({
						type : 'get',
						url : '<c:url value ="/mailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
						success : function (data) {
							console.log("data : " +  data);
							checkInput.attr('disabled',false);
							code =data;
							alert('인증번호가 전송되었습니다.')
						}			
					}); // end ajax
				}); // end send eamil

				// 인증번호 비교 
				// blur -> focus가 벗어나는 경우 발생
				$('.mail-check-input').blur(function () {
					const inputCode = $(this).val();
					const $resultMsg = $('#mail-check-warn');
					
					if(inputCode === code){
						$resultMsg.html('인증번호가 일치합니다.');
						$resultMsg.css('color','green');
						$('#mail-Check-Btn').attr('disabled',true);
						$('#userEamil1').attr('readonly',true);
						$('#userEamil2').attr('readonly',true);
						$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
				         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
					}else{
						$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
						$resultMsg.css('color','red');
						
						 alert('인증번호가 일치하지 않습니다. 다시 확인해주세요!');
					    $('.mail-check-input').val(''); // 이메일 입력 필드 초기화
					}
				});
				</script>
				
				<input type="text" name="birth" id="birth" placeholder="Birth ex)19961030" size="20" 
				onblur="isBirthDay()" onkeydown="fn_press_han(this);"
				onkeypress="fn_press_han(this);">
				<br>
				
				
				<button class="submit" onclick="return go_save()">Sign Up</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form method="post" action="login">
				<h1 class="loginh1">로그인</h1>
				<div class="logina-container">
		   <!-- <a href="#" class="logina"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="logina"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="logina"><i class="fab fa-linkedin-in"></i></a> -->
				</div>
				
				<input name="id" type="text" placeholder="아이디"><br> 
				<input name="pwd" type="password" placeholder="비밀번호"> 
				<span>
					<a href="#" class="submit" onclick="find_id_form()">ID </a>/ 
					<a href="#" class="submit" onclick="find_pwd_form()"> PW</a> 찾기
				</span>
				<br>
				<button type="submit" class="submit">Login</button>
		
			</form>
			
		
				
  
			
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1 class="loginh1">Welcome Back!</h1>
					<p class="loginp">연결하려면 등록된 정보로 로그인하십시오.</p>
					<button class="ghost" id="signIn">로그인</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1 class="loginh1">Hello, Friend!</h1>
					<p class="loginp">회원이 되시면 다양한 서비스를 이용하실 수<br> 있습니다.</p>
					<button class="ghost" id="signUp">회원가입</button>
				</div>
			</div>
		</div>
	</div>


</div>
</html>
<script>
	const signUpButton = document.getElementById('signUp');
	const signInButton = document.getElementById('signIn');
	const container = document.getElementById('container');

	signUpButton.addEventListener('click', function() {
		
		container.classList.add("right-panel-active");
	});

	signInButton.addEventListener('click', function() {
		container.classList.remove("right-panel-active");
	});
</script>


<br>
<%@ include file="../footer.jsp"%>

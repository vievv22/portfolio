
// 아이디 찾기 화면 요청
function find_id_form() {

	var url = "find_id_form";
	window
			.open(url, "_blank_",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350")

}

// 아이디 찾기 화면 요청
function find_pwd_form() {

	var url = "find_pwd_form";
	window
			.open(url, "_blank_",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=450")

}


function idcheck() {

	// jsp 파일에서 id로 가지고 오는 방법
	if (document.getElementById("id").value == "") {

		alert("아이디를 입력해 주세요.")
		document.getElementById("id").focus(); // focus(); 해당 입력 칸 클릭됨.

		return false;

	}

	// 아이디가 입력된 경우 작은 팝업 윈도우 표시
	var url = "id_check_form?id=" + document.getElementById("id").value;
	window
			.open(url, "_blank_",
					"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350")

}

function getPhoneNumber() {
	var phone1 = document.getElementById("phone1").value;
	var phone2 = document.getElementById("phone2").value;
	var phone3 = document.getElementById("phone3").value;

	// '-'를 제외하고 숫자만 포함한 전화번호를 반환
	var phoneNumber = phone1 + phone2 + phone3;
	phoneNumber = phoneNumber.replace(/-/g, ''); // '-' 제거

	return phoneNumber;
}

// 값이 들어갔는지 체크
function go_save() {
	
	var id = document.getElementById("id").value;
	var reid = document.getElementById("reid").value;

	if (document.getElementById("id").value == "") {

		alert("아이디 입력을 해주세요.")
		document.getElementById("id").focus();

		return false;

	} else if (document.getElementById("reid").value == "") {

		alert("아이디 중복체크를 해주세요.")
		document.getElementById("id").focus();

		return false;

	} else if (document.getElementById("pwd").value == "") {

		alert("비밀번호를 입력해 주세요.")
		document.getElementById("pwd").focus();

		return false;

	} else if (document.getElementById("pwd").value != document
			.getElementById("pwdCheck").value) {

		alert("비밀번호가 일치하지 않습니다.")
		document.getElementById("pwd").focus();

		return false;

	} else if (document.getElementById("name").value == "") {

		document.getElementById("nameError").innerHTML = "이름이 올바르지 않습니다."
		document.getElementById("name").focus();

		return false;

	} else if (document.getElementById("email1").value == "") {

		alert("이메일을 입력해 주세요.")
		document.getElementById("email1").focus();

		return false;

	} else if (document.getElementById("phone1").value == "") {

		alert("전화번호를 입력해 주세요.")
		document.getElementById("phone1").focus();

		return false;

	} else if (document.getElementById("phone2").value == "") {

		alert("전화번호를 입력해 주세요.")
		document.getElementById("phone2").focus();

		return false;

	} else if (document.getElementById("phone3").value == "") {

		alert("전화번호를 입력해 주세요.")
		document.getElementById("phone3").focus();

		return false;

	} else if (document.getElementById("birth").value == "") {

		alert("생년월일을 입력해 주세요.")

		return false;

	} else if (document.getElementById("mail-check-input").value == ""){
		alert("이메일 인증을 완료해주세요.")
		document.getElementById("mail-check-input").focus();
		
		return false;
	} else {

		var id = document.getElementById("id").value;
		var pwd = document.getElementById("pwd").value;
		var name = document.getElementById("name").value;
		var phone1 = document.getElementById("phone1").value;
		var phone2 = document.getElementById("phone2").value;
		var phone3 = document.getElementById("phone3").value;

		// 이름 유효성
		var nameRegex = /^[가-힣]+$/;
		if (!nameRegex.test(name)) {
			alert("이름은 한글로만 입력해 주세요.");
			return;
		}

		// 유효성 검사 로직
		// 아이디 검사
		if (id.length > 20) {
			alert("아이디는 20자 이하여야 합니다.");
			return;
		}
		// 비밀번호 검사
		if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]+$/
				.test(pwd)) {
			alert("비밀번호는 영문자, 숫자, 특수문자를 모두 포함해야 합니다.");
			return;
		}

		if (pwd.length < 8 || pwd.length > 16) {
			alert("비밀번호는 8자에서 16자 사이어야 합니다.");
			return;
		}

		// 1. 전화번호 길이 확인
		if (phone1.length !== 3 || phone2.length !== 4 || phone3.length !== 4) {
			alert("전화번호의 형식이 올바르지 않습니다.");
			return;
		}
		// 2. 전화번호 유효성 확인
		if (!/^\d+$/.test(phone1) || !/^\d+$/.test(phone2)
				|| !/^\d+$/.test(phone3)) {
			alert("전화번호는 숫자로만 입력해야 합니다.");
			return;
		}
	}

	var tel = getPhoneNumber();
	document.getElementById("join").elements.namedItem("tel").value = tel;

	document.getElementById("join").action = "join"; // 회원가입 요청 URL
	document.getElementById("join").submit();

}
// --login.jsp
// idcheck.jsp
function idok(id) {
	if(id!=null){
	opener.formm.id.value = id;
	opener.formm.reid.value = id; //reid 중복체크 했는지 확인을 위해 값을 보냄
	}
	self.close(); // ID 중복체크 윈도우(작은창) 닫기
}


// findPwdResult.jsp
//새 비밀번호 변경
function changePassword() {
	var password = document.getElementById("pwd").value;
	var passwordCheck = document.getElementById("pwdcheck").value;
	

	// 비밀번호 유효성 검사 정규식
	var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$!%^&*])[a-zA-Z\d@#$!%^&*]{8,}$/;

	if (password === "") {
		alert("비밀번호를 입력해 주세요");
		document.getElementById("pwd").focus();
		return false;
	} else if (password !== passwordCheck) {
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("pwd").focus();
		return false;
	} else if (!passwordPattern.test(password)) {
		alert("비밀번호는 특수문자, 영어, 숫자의 조합으로 8자 이상이어야 합니다.");
		document.getElementById("pwd").focus();
		return false;
	} else {
		var confirmed = confirm("비밀번호를 변경하시겠습니까?");
		if (confirmed) {
			var form = document.getElementById("pwd_form");
			form.action = "change_pwd";
			form.submit();
			alert("비밀번호가 성공적으로 변경되었습니다.");
		}

	}
}

// findPassword.jsp

// 비밀번호 찾기
function findPassword() {
	if (document.getElementById("id").value == "") {
		alert("아이디를 입력해 주세요");
		document.getElementById("id").focus();
		return false;
	} else if (document.getElementById("name").value == "") {
		alert("이름을 입력해 주세요");
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	} else {
		var form = document.getElementById("findPW");
		form.action = "find_pwd";
		form.submit();
	}
}

// findId.jsp
// 이름과 이메일로 아이디 찾기 요청
function findMemberId() {
	if (document.getElementById("name").value == "") {
		alert("이름을 입력해 주세요");
		document.getElementById("name").focus();
		return false;
	} else if (document.getElementById("email").value == "") {
		alert("이메일을 입력해 주세요");
		document.getElementById("email").focus();
		return false;
	} else {
		var form = document.getElementById("findId");
		form.action = "find_id";
		form.submit();
	}
}





function isBirthDay() {
	var birth = document.getElementById("birth");
	dateStr = birth.value;
	console.log(dateStr)
	var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	var today = new Date(); // 날짜 변수 선언
	var yearNow = today.getFullYear(); // 올해 연도 가져옴

	if (dateStr.length <=8) {
	// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
		if (1900 > year || year > yearNow){
			birth.value="";
			return false;
		} else if (month < 1 || month > 12) {
			birth.value="";
			return false;
		} else if (day < 1 || day > 31) {
			birth.value="";
			return false;
		} else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			birth.value="";
			return false;
		} else if (month == 2) {

			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>29 || (day==29 && !isleap)) {
				birth.value="";
				return false;
			} else {
				birth.value="";
				return true;
			} //end of if (day>29 || (day==29 && !isleap))
		} else {
			return true;
		}//end of if
	}
	else {
		//1.입력된 생년월일이 8자 초과할때 :  auth:false
		birth.value="";
		alert('생년월일을 확인해주세요!!');
		return false;
	}
}





function isHangulKey(event) {
	  var keyCode = event.which || event.keyCode;
	  var keyValue = String.fromCharCode(keyCode);
	  var pattern = /^[가-힣]+$/;
	  return pattern.test(keyValue);
}

function blockKoreanInput(event) {
	  var keyCode = event.which || event.keyCode;
	  var inputValue = event.target.value || "";
	  var pattern = /^[a-zA-Z0-9@._-]*$/;

	  if (/[ㄱ-ㅎㅏ-ㅣ가-힣]/.test(inputValue)) {
	    event.target.value = inputValue.replace(/[ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
	    return false;
	  }

	  return pattern.test(event.key);
	}



function fn_press(event, type) {
	if(type == "numbers") {
		if(event.keyCode < 48 || event.keyCode > 57) return false;
	}
}
/* 한글입력 방지 */
function fn_press_han(obj)
{
    //좌우 방향키, 백스페이스, 딜리트, 탭키에 대한 예외
    if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39
    || event.keyCode == 46 ) return;
    //obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}

function validateInput(input) {
    input.value = input.value.replace(/\D/g, '');
  }

function validatePhone1(input) {
    var allowedPrefixes = ['010', '011', '017'];
    var inputValue = input.value
    
    // 입력값이 허용된 접두사 중 하나인지 확인
    var isValidPrefix = allowedPrefixes.some(function(prefix) {
      return inputValue.startsWith(prefix);
    });
    
    // 허용된 접두사가 아니면 입력값을 초기화
    if (!isValidPrefix || isNaN(inputValue)) {
      input.value = '';
    }
    
    // 입력값이 3자리를 초과하면 자동으로 잘라냄
    if (inputValue.length > 3) {
      input.value = inputValue.slice(0, 3);
    }
  }
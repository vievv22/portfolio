function getPhoneNumber() {
    var phone1 = document.getElementById("phone1").value;
    var phone2 = document.getElementById("phone2").value;
    var phone3 = document.getElementById("phone3").value;

    // '-'를 제외하고 숫자만 포함한 전화번호를 반환
    var phoneNumber = phone1 + phone2 + phone3;
    phoneNumber = phoneNumber.replace(/-/g, ''); // '-' 제거

    return phoneNumber;
  }

  
//회원수정 완료
function go_mod_save(){
   
 
  
  

   if (document.getElementById("phone1").value == ""){
   
   alert("전화번호를 입력해 주세요.")
   document.getElementById("phone1").focus();
   
   return false;      
   
   }else if (document.getElementById("phone2").value == ""){
   
   alert("전화번호를 입력해 주세요.")
   document.getElementById("phone2").focus();
   
   return false;      
   
   }else if (document.getElementById("phone3").value == ""){
   
   alert("전화번호를 입력해 주세요.")
   document.getElementById("phone3").focus();
   
   return false;         
   
   } else {
   
     var phone1 = document.getElementById("phone1").value;
     var phone2 = document.getElementById("phone2").value;
     var phone3 = document.getElementById("phone3").value;
     
    
      // 1. 전화번호 길이 확인
     if (phone1.length !== 3 || phone2.length !== 4 || phone3.length !== 4) {
       alert("전화번호의 형식이 올바르지 않습니다.");
       return;
     }
      // 2. 전화번호 유효성 확인
     if (!/^\d+$/.test(phone1) || !/^\d+$/.test(phone2) || !/^\d+$/.test(phone3)) {
       alert("전화번호는 숫자로만 입력해야 합니다.");
       return;
     }
}
   
   
   
   
   
      var tel = getPhoneNumber();
      document.getElementById("update_form").elements.namedItem("tel").value = tel;
      var theform = document.getElementById("update_form");
      theform.action="userUpdate";
      theform.submit();
   
   
   
}








// 취소 버튼 클릭시 뒤로가기
function go_mov() {
   var theform = document.getElementById("update_form");
   theform.action = "memberInfo";
   theform.method="GET";
   theform.submit();
}













//비밀번호 수정 완료
function go_mod_save2() {
   if (document.getElementById("pwd").value == "") {
      alert("비밀번호를 입력하세요.");
      document.getElementById("pwd").focus();
      return false;
   } else if (document.getElementById("pwd2").value == "") {
      alert("비밀번호 재입력을 확인해주세요.");
      document.getElementById("pwd2").focus();
      return false;
   }else if(document.getElementById("pwd").value != document.getElementById("pwd2").value) {
      alert("정확한 비밀번호를 입력하세요.");
      document.getElementById("pwd").focus();
      return false;
   }else {
      
      var pwd = document.getElementById("pwd").value;
      
      if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]+$/.test(pwd)) {
          alert("비밀번호는 영문자, 숫자, 특수문자를 모두 포함해야 합니다.");
          return;
      }
        
      if (pwd.length < 8 || pwd.length > 16) {
          alert("비밀번호는 8자에서 16자 사이어야 합니다.");
          return;
      }
        
      
   }
   
   
   alert("비밀번호 변경이 완료되었습니다.");
   var form = document.getElementById("updatePwd_form");
   form.action="userPwdUpdate";
   form.submit();   
   
}


// 취소 버튼 클릭시 뒤로가기
function go_mov2() {
   var theform = document.getElementById("updatePwd_form");
   theform.action = "memberInfo";
   theform.method="GET";
   theform.submit();
}













//회원 상세보기 내 탈퇴 버튼
function go_userDelete() {
    if (document.getElementById("pwd").value == "") {
        alert("비밀번호를 입력하세요.");
        document.getElementById("pwd").focus();
        return false;
    } else if (document.getElementById("pwd").value != document.getElementById("pwdCheck").value) {
        alert("정확한 비밀번호를 입력하세요.");
        document.getElementById("pwd").focus();
        return false;
    } else if (document.getElementById("pwd").value == document.getElementById("pwdCheck").value) {
        var confirmation = confirm("정말로 탈퇴하시겠습니까?"); // 확인과 취소 버튼이 있는 알림 대화 상자

        if (confirmation) { // 확인 버튼을 클릭한 경우
            var theform = document.getElementById("update_form");
            theform.action = "userDelete_form";
            theform.submit();
        } else { // 취소 버튼을 클릭한 경우
            return false;
        }
    }
}

// 비밀번호 입력 후 맞으면 수정 페이지 넘김
function go_pwdCheck() {
      
   if (document.getElementById("pwd").value == "") {
      alert("비밀번호를 입력하세요.");
      document.getElementById("pwd").focus();
      return false;
   } else if(document.getElementById("pwd").value != document.getElementById("pwdCheck").value) {
      alert("정확한 비밀번호를 입력하세요.");
      document.getElementById("pwd").focus();
      return false;
   } else if(document.getElementById("pwd").value == document.getElementById("pwdCheck").value) {
      alert("수정페이지로 이동합니다.");
      var form = document.getElementById("update_form");
      form.action="pwdCheck";
      form.submit();
   }
}
//비밀번호 입력 후 맞으면 비밀번호 변경 페이지 넘김
function gopwdCheck() {
      
   if (document.getElementById("pwd").value == "") {
      alert("비밀번호를 입력하세요.");
      document.getElementById("pwd").focus();
      return false;
   } else if(document.getElementById("pwd").value != document.getElementById("pwdCheck").value) {
      alert("정확한 비밀번호를 입력하세요.");
      document.getElementById("pwd").focus();
      return false;
   } else if(document.getElementById("pwd").value == document.getElementById("pwdCheck").value) {
      alert("비밀번호 변경 페이지로 이동합니다.");
      var form = document.getElementById("update_form");
      form.action="gopwdCheck";
      form.submit();
   }
}
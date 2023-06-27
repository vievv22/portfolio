function go_view(numb) {
	var theForm = document.frm;
	var form = document.getElementById("frm");
	theForm.qseq.value = numb;
	theForm.action = "admin_qna_detail";
	theForm.submit();
}

function go_rep(numb) {
	var theForm = document.frm;
	var replyText = theForm.reply.value.trim(); // textarea의 값을 가져옵니다.

	if (replyText === "") {
		// 값이 빈칸인 경우 처리
		window.alert("답변 내용을 입력해주세요.");
		return false; // 함수 실행을 중단합니다.
	}

	theForm.action = "admin_qna_repsave";
	theForm.submit();
}
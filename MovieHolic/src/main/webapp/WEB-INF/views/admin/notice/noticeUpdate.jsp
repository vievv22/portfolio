<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/admin/noticeWrite.css" />

<body>
	<main class="page-content">
	<div class="container-fluid">
		<h1 align="center">공지사항 작성</h1>
	  	<hr>
	  	<br>
		<form id="formm" name="formm" method="post" action="notice_write">
			<fieldset align="center">

				<label>제목</label>
				<br> 
				<input type="text" name="title" value="${noticeVO.title }" size="63">
				<br>
				<br> 
				<label>내용</label>
				<br>
				<textarea rows="20" cols="65" name="content">${noticeVO.content }</textarea>
				<br>
				
			</fieldset>
			<br>
			<div id="buttons" align="center">
				<input type="submit" value="수정하기" class="submit" onclick="go_update()">
				<input type="reset" value="취소" class="submit"> 
				<input type="button" value="목록보기" class="submit" onclick="location.href='notice_list_admin'">
				<input type="hidden" name="numb" value="${noticeVO.numb }" />
			</div>
		</form>
	</div>
	</main>
	<script>
		function go_update() {
			if(confirm('수정하시겠습니까?')) {
				var form = document.getElementById("formm");
				form.action="notice_update_action";
				form.submit();
				alert("수정이 완료되었습니다!");
				
			} else {
				return;
			}
			
		}
	</script>
</body>
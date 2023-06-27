<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/admin/noticeViewadmin.css" />

	<main class="page-content">
	<div class="container-fluid">
		<h1 align="center">공지사항</h1>
		<hr>
		<br>
		<form id="formm" name="formm" method="post">



			<div class="noticetitle"  align="center">${noticeVO.title}</div>
			<br>

			<div align="center">
				<span>등록일</span>
				<span class="noticeregdate">
				<fmt:formatDate	value="${noticeVO.regdate}" type="date" />
				</span>
			</div>



			<hr class="hr">
			<br>
			<br>
			<p>${noticeVO.content}</p>
			<br>
			<br>
			<hr class="hr">
			
		</form>
		<div align="center">
				<input type="button" value="목록보기" class="submit" onclick="location.href='notice_list_admin'">
				<input type="button" value="수정" class="submit" onclick="go_update('${noticeVO.numb}')">
				<input type="button" value="삭제" class="submit" onclick="go_delete('${noticeVO.numb}')">
		</div>
	</div>
	</main>
	<script>
		function go_delete(numb) {
			if(confirm('정말 삭제하시겠습니까?')) {
				var form = document.getElementById("formm");
				form.action="notice_delete?numb=" + numb;
				form.submit();
			} else {
				return;
			}
		}
		
		function go_update(numb) {
			alert('수정 페이지로 이동합니다!');
			var form = document.getElementById("formm");
			form.action="notice_update?numb=" + numb;
			form.submit();
		}
	</script>

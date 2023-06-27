<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/admin/qnaDetail.css" />
<script src="admin/qna/qna.js"></script>

<main class="page-content">
<div class="container-fluid">

	<h1 align="center">Q&amp;A 게시글</h1>
	<hr  width="50%">
	<br>
	<form name="frm" method="post" id="formm">
		<div>
		<input type="hidden" name="numb" value="${qnaVO.numb}">
		<table class="tableall">
			<tr>
				<th width="165px">제목</th>
				<td width="390px">${qnaVO.title}</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><fmt:formatDate value="${qnaVO.regdate}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${qnaVO.content}</td>
			</tr>
		</table><br>
		<c:choose>
			<c:when test='${qnaVO.repyn=="n"}'>
				<table  style="text-align:center">

					<tr>
						<th width="30%">답변</th>
						<td width="70%"><textarea name="reply" rows="5" cols="50"></textarea></td>

					</tr>

				</table><br><hr width="50%"><br><br>
				<div align="center">
					<input type="button" class="btn" value="저장"
						onClick="go_rep('${qnaVO.numb}')"> 
						
					<input type="button" class="btn" value="목록" onclick="location.href='list_admin_qna'">
					<input type="button" value="삭제" class="btn" onclick="go_delete('${qnaVO.numb}')">
				</div>
			</c:when>
			<c:otherwise>
				<table  style="text-align:center">
					<tr>
						<th width="160px">답변</th>
						<td width="375px">${qnaVO.reply}</td>
					</tr>
				</table><br><br>
				<div align="center">
					<input type="button" class="btn" value="목록" onclick="location.href='list_admin_qna'">
					<input type="button" value="삭제" class="btn" onclick="go_delete('${qnaVO.numb}')">
				</div>
			</c:otherwise>
		</c:choose>
		</div>
	</form>


	</body>
	</html>
</div>
</main>
<script>
		function go_delete(numb) {
			if(confirm('정말 삭제하시겠습니까?')) {
				var form = document.getElementById("formm");
				form.action="qna_delete?numb=" + numb;
				form.submit();
			} else {
				return;
			}
		}
		
		
	</script>
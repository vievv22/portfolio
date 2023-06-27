<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>   

 <link rel="stylesheet" href="css/qna.css" />
<br><br><br>
<div class="container2" id="container2">

  	<h1 class="loginh1">1:1 고객 게시판</h1>
  
   	<h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
	<hr width="50%"><br>
	
    <form name="formm" method="post" id="formm">
	    <table>
	      <tr>
	        <th>제목</th>
	        <td>${qnaVO.title}</td> 
	      
	        <th>등록일</th>
	        <td> <fmt:formatDate value="${qnaVO.regdate}" type="date"/></td>
	      </tr>
	      <tr>
	        <th>질문내용</th>
	        <td colspan="3">${qnaVO.content} 
	      </tr>
	      <tr>
	        <th>답변 내용</th>
	        <td colspan="3">${qnaVO.reply}  
	      </tr>
	    </table>
   <br><br>
     <div>
   		<button type="button" class="submit" onclick="location.href='qna_list'">목록보기</button>
   		<button type="button" onclick="go_delete('${qnaVO.numb}')">삭제</button><br><br>
	</div>
    </form>
  </div>
  <script>
		function go_delete(numb) {
			if(confirm('정말 삭제하시겠습니까?')) {
				var form = document.getElementById("formm");
				form.action="qna_delete_member?numb=" + numb;
				form.submit();
			} else {
				return;
			}
		}
		
		
	</script>
<%@ include file="../footer.jsp" %>
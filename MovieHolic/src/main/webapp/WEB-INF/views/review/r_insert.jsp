<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.movie.biz.dto.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<script src="review/review.js"></script>
<meta charset="UTF-8">
<title>리뷰작성</title>
<style>
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 2em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

table {
	width: 490px;
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	margin-bottom: 20px;
}

table th, table td {
	padding-left: 20px;
	text-align: left;
	color: #525252;
}

table th {
	background-color: #F2F2F2;
}

.btn {
	padding: 13px 28px;
	margin-top: 30px;
	background: #eee;
	border: 0;
	font-size: 14px;
	color: #666;
	cursor: pointer;
}

h2 {
	margin-left: 160px;
	margin-top: 40px;
	color: #525252;
}

textarea {
	border-radius: 5px;
	border-color: #c9c9c9;
}
</style>
</head>
<body>
<%
	int movie_numb = Integer.parseInt(request.getParameter("movie_numb"));
	int ticketing_numb = Integer.parseInt(request.getParameter("ticketing_numb"));
	MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
	String user_id = loginUser.getId();
%>
<h2>리뷰를 작성해주세요 !!</h2>
	<form name="frm" id="myform" method="post">
	<input type="hidden" name="movie_numb" value="<%=movie_numb %>">
	<input type="hidden" name="ticketing_numb" value="<%=ticketing_numb %>">
	<input type="hidden" name="user_id" value="<%=user_id %>">
		<table id="r_insret" class="container">
			<tr>
				<th style="width:100px;">별점</th>
				<td>
					<fieldset>
					<input type="radio" name="stars" value="5" id="1" checked>
						<label for="1">★</label>
					<input type="radio" name="stars" value="4" id="2">
						<label for="2">★</label>
					<input type="radio" name="stasr" value="3" id="3">
						<label for="3">★</label>
					<input type="radio" name="stars" value="2" id="4">
						<label for="4">★</label>
					<input type="radio" name="stars" value="1" id="5">
						<label for="5">★</label>
					</fieldset>
				</td>	
			</tr>
			
			<tr>
				<th>한줄평</th>
				<td><textarea name="comments" id="comments" rows="6" cols="40"></textarea></td>
			</tr>
		</table>
		<input id="submitreview" class="btn" type="button" value="등록" style="margin-left:200px;">

	</form>
</body>
<script>
$("#submitreview").on("click", function() {
	if (document.getElementById("comments").value == "") {
		alert("한줄평을 입력하세요");
		document.getElementById("comments").focus();
		return false;
	} else {
		var theform = document.getElementById("myform");
		//theform.action = "reviewInsert";

		// AJAX 요청 수행
		$.ajax({
			url : "${pageContext.request.contextPath}/reviewInsert",
			type : "POST",
			data : $(theform).serialize(),
			success : function(data) {
				alert('리뷰 등록이 완료되었습니다!');
				window.close();
				window.opener.location.href = "mypage";
			},
			error : function(xhr, status, error) {
				console.error(xhr.responseText);
			}
		});
	}
});
</script>
</html>

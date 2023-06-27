<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/admin/theater.css" />
<script>
	history.pushState(null, null,
			"http://localhost:8081/movie/admin_theater_list_view");

	window.onpopstate = function(event) {
		history.go(1);
	};
</script>
<meta charset="UTF-8">
<title>스케줄 확인을 위한 극장 선택창</title>
</head>
<main class="page-content">
<div class="container-fluid">
	<h1>극장명</h1>
	<hr>
	<div class="theater-container"
		style="overflow-y: auto; max-height: 650px;">
		<table class="theater-table">
			<tbody>
				<c:forEach items="${theaterList}" var="theaterVO">
					<tr>
						<td><a class="theater-link"
							href="theater_schedule_list?theater_name=${theaterVO.name}"
							style="font-size: 16px; text-decoration: none;">${theaterVO.name}</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</main>
</div>

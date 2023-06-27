<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더 -->
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
<!-- 메인 -->
	<div id="bg">
		<div class="carousel">
			<ul class="slides">
				<input class="input-main" type="radio" name="radio-buttons" id="img-1" checked />
				<li class="slide-container">
					<div class="slide-image">
						<img
							src="https://caching2.lottecinema.co.kr/lotte_image/2023/FIRE/FIRE_1920774.jpg">
					</div>
					<div class="carousel-controls">
						<label for="img-4" class="prev-slide"> <span>&lsaquo;</span>
						</label> <label for="img-2" class="next-slide"> <span>&rsaquo;</span>
						</label>
					</div>
				</li>
				<input class="input-main" type="radio" name="radio-buttons" id="img-2" />
				<li class="slide-container">
					<div class="slide-image">
						<img
							src="https://caching2.lottecinema.co.kr/lotte_image/2023/RABANG/RABANG_1920774.png">
					</div>
					<div class="carousel-controls">
						<label for="img-1" class="prev-slide"> <span>&lsaquo;</span>
						</label> <label for="img-3" class="next-slide"> <span>&rsaquo;</span>
						</label>
					</div>
				</li>
								<input class="input-main" type="radio" name="radio-buttons" id="img-3" checked />
				<li class="slide-container">
					<div class="slide-image">
						<img
							src="https://caching2.lottecinema.co.kr/lotte_image/2023/BTS/BTS_1920774.jpg">
					</div>
					<div class="carousel-controls">
						<label for="img-3" class="prev-slide"> <span>&lsaquo;</span>
						</label> <label for="img-1" class="next-slide"> <span>&rsaquo;</span>
						</label>
					</div>
			</ul>
		</div>
	</div>
	<form id="movieListContainer"></form>
	
	<hr color="#dcdcdc">
	<div align="center">
	  <table class="notice-table">
	    <tr>
	      <td width="100px" style="border-right:1px solid #dcdcdc;">무비홀릭</td>
	      <c:choose>
		      <c:when test="${notice == 1 }">
			      <td width="50px" style="padding-left:25px;"><font color="red">[공지]</font> </td>
			      <td width="450px"><p style="font-weight:bold;"><a href="notice_view?numb=${noticeVO.numb }">${noticeVO.title}</a></p></td>
			      <c:set var="regdate" value="${noticeVO.regdate}" />
			      <td><fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd" /></td>
	      	      <td style="padding-left:40px;"><a href="notice_list">더 보기</a></td>
		      </c:when>
		      <c:otherwise>
		      	  <td width="540px" style="padding-left:25px; color:#969696;" >등록된 공지사항이 없습니다</td>
		      </c:otherwise>
	      </c:choose>
	    </tr>
	  </table>
	</div>
	<hr color="#dcdcdc" style="margin-bottom:100px;">

  <div class="lists">
    <div class="section"><a href="customer">
      <div class="icon-container">
        <i class="fas fa-headset"></i>
        <p>고객센터</p>
      </div>
      </a>
    </div>

    <div class="section"><a href="customer">
      <div class="icon-container">
        <i class="fas fa-question-circle"></i>
        <p>자주 묻는 질문</p>
      </div>
      </a>
    </div>

    <div class="section"><a href="qna_write_form">
      <div class="icon-container">
        <i class="fas fa-comments"></i>
        <p>1:1 문의</p>
      </div>
      </a>
    </div>

    <div class="section">
      <div class="icon-container">
        <i class="fas fa-users"></i>
        <p>단체/대관문의</p>
      </div>
    </div>

    <div class="section">
      <div class="icon-container">
        <i class="fas fa-search"></i>
        <p>분실물 문의/접수</p>
      </div>
    </div>

    <div class="section">
      <div class="icon-container">
        <i class="fas fa-user-secret"></i>
        <p>더 부티크 프라이빗</p>
      </div>
    </div>
  </div>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	  $(document).ready(function() {
	    $.ajax({
	      url: "/movie/getMovieList",
	      method: "GET",
	      success: function(response) {
	        $("#movieListContainer").html(response);
	      },
	    });
	  });
	</script>



<!-- 푸터 -->
<%@ include file="footer.jsp"%>




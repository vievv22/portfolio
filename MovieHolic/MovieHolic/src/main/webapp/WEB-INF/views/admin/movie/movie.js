function convertToStars(numberOfStars) {
    var starString = "";
    for (var i = 1; i <= 5; i++) {
        if (i <= numberOfStars) {
            starString += '<span class="star">&#9733;</span>';
        } else {
            starString += '<span class="star">&#9734;</span>';
        }
    }
    return starString;
}

$(document).ready(function() {
    var currentIndex = 0;
    var slides = $(".slideshow li");
    var totalSlides = slides.length;

    function showSlide(index) {
      slides.hide();
      slides.eq(index).show();
    }

    showSlide(currentIndex);

    $(".prev-button").click(function() {
      currentIndex = (currentIndex - 1 + totalSlides) % totalSlides;
      showSlide(currentIndex);
    });

    $(".next-button").click(function() {
      currentIndex = (currentIndex + 1) % totalSlides;
      showSlide(currentIndex);
    });
});

var reviews = document.getElementsByClassName("review-item");
var reviewCount = reviews.length;
var isOpen = false;

if (reviewCount > 5) {
  for (var i = 5; i < reviewCount; i++) {
    reviews[i].style.display = "none";
  }

  var arrow = document.createElement("span");
  arrow.className = "review-toggle";
  arrow.innerText = "▼ 더 많은 이야기 보기 ▼";
  arrow.style.marginLeft = "475px"; // 스타일 적용
  arrow.onclick = function() {
    isOpen = !isOpen;
    if (isOpen) {
      for (var i = 5; i < reviewCount; i++) {
        reviews[i].style.display = "block";
      }
      arrow.innerText = "▲ 이야기 그만 보기 ▲";
    } else {
      for (var i = 5; i < reviewCount; i++) {
        reviews[i].style.display = "none";
      }
      arrow.innerText = "▼ 더 많은 이야기 보기 ▼";
    }
  };

  document.getElementById("myform").appendChild(arrow);
}


//movie
function go_save() {
	if (document.getElementById("title").value == "") {
		alert("영화 제목을 입력하세요");
		document.getElementById("title").focus();
		return false;
	} else if (document.getElementById("story").value == "") {
		alert("줄거리를 입력하세요");
		document.getElementById("story").focus();
		return false;
	} else if (document.getElementById("director").value == "") {
		alert("감독을 입력하세요");
		document.getElementById("director").focus();
		return false;
	} else if (document.getElementById("caster").value == "") {
		alert("배우를 입력하세요");
		document.getElementById("caster").focus();
		return false;
	} else if (document.getElementById("poster_url").value == "") {
		alert("포스터를 등록해주세요");
		document.getElementById("poster_url").focus();
		return false;
	} else if (document.getElementById("opendate").value == "") {
		alert("개봉일을 입력하세요");
		document.getElementById("opendate").focus();
		return false;
	} else if (document.getElementById("playtime").value == "") {
		alert("러닝타임을 확인하세요");
		document.getElementById("playtime").focus();
		return false;
	} else if (document.getElementById("age").value == "") {
		alert("관람가능 나이를 입력하세요");
		document.getElementById("age").focus();
		return false;
	} else if (document.getElementById("nation").value == "") {
		alert("나라를 입력하세요");
		document.getElementById("nation").focus();
		return false;
	} else if (document.getElementById("trailer").value == "") {
		alert("트레일러를 입력하세요");
		document.getElementById("trailer").focus();
		return false;
	} else if (document.getElementById("stillcut").value == "") {
		alert("스틸컷을 등록해 주세요");
		document.getElementById("stillcut").focus();
		return false;
	} else {
		var theform = document.getElementById("movie_form");
		theform.enctype = "multipart/form-data";
		theform.action = "movieInsert";
		theform.submit();
	}

}// go_save

//목록가기
function go_list() {
	var theform = document.getElementById("detail_form");

	theform.action = "admin_movie_list";
	theform.submit();
}

//영화 수정폼 가기
function go_mod() {
	var theform = document.getElementById("detail_form");
	theform.method = "GET";
	theform.action = "admin_movie_update_form";
	theform.submit();
}

function removeTextarea(container) {
	container.parentNode.removeChild(container);
}

function addMoreTextarea() {
	var directorContainer = document.getElementById("directorContainer");
	var textarea = document.createElement("textarea");
	textarea.name = "caster";
	textarea.className = "form-ctrl";
	textarea.style.height = "30px";
	var div = document.createElement("div");
	div.className = "casterBox";
	div.appendChild(textarea);
	var button = document.createElement("button");
	button.type = "button";
	button.innerHTML = "-";
	button.className = "btn-caster";
	button.onclick = function() {
		removeTextarea(this.parentNode);
	};
	div.appendChild(button);
	directorContainer.appendChild(div);
}

function addMoreStillcut() {
	var container = document.getElementById("container");
	var inputFile = document.createElement("input");
	inputFile.id = "stillcut";
	inputFile.name = "stillcut_name";
	inputFile.type = "file";
	inputFile.multiple = true;
	inputFile.classList.add("form-ctrl");

	container.insertBefore(inputFile, container.lastElementChild); // 입력란을 버튼 위에 추가
	container.appendChild(document.getElementById("inputWrapper")); // inputWrapper를 제일 아래로 이동

	inputFile.click();
}

function removeStillcut(element, stillcut) {
	var container = document.getElementById("container");
	container.removeChild(element.parentNode);

	// 삭제된 stillcut 값을 서버로 전송
	var input = document.createElement("input");
	input.type = "hidden";
	input.name = "deletedStillcuts";
	input.value = stillcut;
	document.getElementById("update_form").appendChild(input);
}

function go_save2() {
	var theform = document.getElementById("update_form");
	theform.enctype = "multipart/form-data";
	theform.action = "movieUpdate";

	if (theform.checkValidity()) {
		theform.submit();
	} else {
		alert('필드를 입력해주세요!');
		return false;
	}

}// go_save2

var textareaIndex = (casterArray != null) ? casterArray.length : 0;
function removeTextarea2(container) {
	container.parentNode.removeChild(container);
}

function addMoreTextarea2() {
	var directorContainer = document.getElementById("directorContainer");
	var textarea = document.createElement("textarea");
	textarea.name = "caster";
	textarea.className = "form-ctrl";
	textarea.style.height = "30px";
	var div = document.createElement("div");
	div.className = "casterBox";
	div.appendChild(textarea);
	var button = document.createElement("button");
	button.type = "button";
	button.innerHTML = "-";
	button.className = "btn btn-caster";
	button.onclick = function() {
		removeTextarea(this.parentNode);
	};
	div.appendChild(button);
	directorContainer.appendChild(div);
}

var input = document.getElementById("opendate");
var today = new Date().toISOString().split("T")[0];
input.setAttribute("min", today);

function removeStillcut2(element, stillcut) {
	var container = element.closest(".stillcut-wrapper");
	container.parentNode.removeChild(container);

	// 삭제된 stillcut 값을 서버로 전송
	var input = document.createElement("input");
	input.type = "hidden";
	input.name = "deletedStillcuts";
	input.value = stillcut;
	document.getElementById("update_form").appendChild(input);
}

function addMoreStillcut2() {
	var container = document.getElementById("container");
	var div = document.createElement("div");
	div.classList.add("stillcut-wrapper");
	var input = document.createElement("input");
	input.type = "file";
	input.name = "stillcut_image";
	input.classList.add("form-ctrl");
	var button = document.createElement("button");
	button.type = "button";
	button.classList.add("btn-caster");
	button.innerHTML = "-";
	button.onclick = function() {
		container.removeChild(div);
	};
	div.appendChild(input);
	div.appendChild(button);
	container.appendChild(div);

	// 새로운 파일이 추가될 때마다 <br> 요소 추가
	var br = document.createElement("br");
	container.appendChild(br);
}

//영화 이름으로 검색
function go_search() {
	var theform = document.getElementById("mov_form");
	theform.action = "admin_movie_list";
	theform.submit();
}

//영화 등록화면 요청
function go_insert() {
	var theform = document.getElementById("mov_form");
	theform.method = "GET"
	theform.action = "movieInsertForm";
	theform.submit();
}

//관리자용 디테일 페이지
function go_detail(pageNum, rowsPerPage, numb) {
	var theform = document.getElementById("mov_form");
	var url = "admin_movie_detail?pageNum=" + pageNum + "&rowsPerPage="
			+ rowsPerPage + "&numb=" + numb;

	theform.action = url;
	theform.submit();
}

function go_adminPage() {
	var form = document.getElementById("mov_form");
	form.method = "GET";
	form.action = "adminPage";
	form.submit();
}
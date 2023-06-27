/**
 * 
 */

  function changeItemsPerPage(selectElement) {
  	  var selectedValue = selectElement.value;
  	  var id = document.getElementById("search-input").value;
  	  
  	  location.href = "get_all_ticketing_list?select=" + selectedValue + "&id=" + id;
  	}

  function searchSchedule() {
      var selectedValue = document.getElementById("items-per-page").value;
      var id = document.getElementById("search-input").value;

      // 검색 조건을 기반으로 페이지를 다시 로드하는 로직 작성
      location.href = "get_all_ticketing_list?select=" + selectedValue + "&id=" + id;
    }
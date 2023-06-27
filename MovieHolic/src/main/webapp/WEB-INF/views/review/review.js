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

function confirmDelete(numb) {
	if (confirm('삭제하시겠습니까?')) {
		window.location.href = 'deleteReview?numb=' + parseInt(numb);
	}
}


var timer;
function showtime() {
	// alert(today.getTime());
	var today = new Date();
	var day = "";
	switch (today.getDay()) {
	case 0:
		day = "일";
		break;
	case 1:
		day = "월";
		break;
	case 2:
		day = "화";
		break;
	case 3:
		day = "수";
		break;
	case 4:
		day = "목";
		break;
	case 5:
		day = "금";
		break;
	case 6:
		day = "토";
		break;
	}

	var ampm, hour, min, sec;
	if (today.getHours() < 12) {
		ampm = "am";
		hour = today.getHours();
	} else {
		ampm = "pm";
		hour = today.getHours() - 12;
	}

	if (hour < 10) {
		hour = "0" + hour;
	}

	if (today.getMinutes() < 10) {
		min = "0" + today.getMinutes();
	} else {
		min = today.getMinutes();
	}
	if (today.getSeconds() < 10) {
		sec = "0" + today.getSeconds();
	} else {
		sec = today.getSeconds();
	}

	var str = today.getFullYear() + "." + today.getMonth() + 1 + "."
			+ today.getDate() + "(" + day + ") " + ampm + " " + hour + ":"
			+ min + ":" + sec;
	// <input type="text" name="clock" id="clock"> 에 출력
	// 2019.01.03(목) pm 5:06:13

	timer = setTimeout(showtime, 1);
	document.getElementById('clock').value=str;
	//document.getElementsByName('clock').value = str;

	// window.setTimeout("showtime()",1000); // 옛날 방식
}// showtime end

function killtime() {
	clearTimeout(timer);
}// kill time end

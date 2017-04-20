
var insertStation = ''; // 전역변수로 역코드를 받는 부분
var getStation = ''; // 역코드 - > 역이름 DB get
var latitude = ''; // 위도 (x)
var longitude = ''; // 경도 (y)
/**
 * 
 */

//역 이름 팝업 띄우기 
function station_name_popup(stationCode) { // stationNamePopup
	var _x = event.clientX + document.body.scrollLeft; //마우스로 선택한곳의 x축(화면에서 좌측으로부터의 거리)를 얻는다. 
	var _y = event.clientY + document.body.scrollTop; //마우스로 선택한곳의 y축(화면에서 상단으로부터의 거리)를 얻는다. 
	var layer = document.getElementById("station_name_popup_layer");
	if (_x < 0)
		_x = 0; //마우스로 선택한 위치의 값이 -값이면 0으로 초기화. (화면은 0,0으로 시작한다.) 
	if (_y < 0)
		_y = 0; //마우스로 선택한 위치의 값이 -값이면 0으로 초기화. (화면은 0,0으로 시작한다.) 

	layer.style.left = _x + "px"; //레이어팝업의 좌측으로부터의 거리값을 마우스로 클릭한곳의 위치값으로 변경. 
	layer.style.top = _y + "px"; //레이어팝업의 상단으로부터의 거리값을 마우스로 클릭한곳의 위치값으로 변경. 
	layer.style.visibility = "visible";
	$('#station').attr('stationcode', stationCode);
	$('#startEnd').attr('stationcode', stationCode);

	insertStation = $('#station').attr('stationcode');
	
	// 역 코드로 이름 가져오기 
	$.ajax({
		url : 'StationCodeParseName',
		type : 'get',
		data : {
			stationCode : insertStation
		},
		dataType : 'json',
		success : function(item) {
			getStation = item.station_nm2;
			latitude = item.xpoint;
			longitude = item.ypoint;
			console.log(latitude);

		}
	})
}

// 역 이름 팝업 삭제
function station_name_down() { // stationNamediv 삭제 역할 
	var layer = document.getElementById("station_name_popup_layer");
	layer.style.visibility = 'hidden';
	$('#노선 circle').attr('fill', '#FFFFFF');
	$('#startPoint').html('');
	$('#endPoint').html('');
	scode = null;
}


//다음지도 부분인데 아직 작동 구현실패
function daummap() {
	var text = '';
	var strings = 'daumMap';

	text += '<script type="text/javascript">';
	text += 'var mapContainer = document.getElementById(' + strings + '),';
	text += '	mapOption = {';
	text += '		center : new daum.maps.LatLng(' + latitude + ',' + longitude + '),';
	text += '		level : 3';
	text += '	};';
	text += 'var map = new daum.maps.Map(mapContainer, mapOption);';
	text += '</script>';

	$('#daumMap').html(text);


}


//역 정보 팝업 띄우기 
function get_station_popup() {
	var _x = event.clientX + document.body.scrollLeft; //마우스로 선택한곳의 x축(화면에서 좌측으로부터의 거리)를 얻는다. 
	var _y = event.clientY + document.body.scrollTop; //마우스로 선택한곳의 y축(화면에서 상단으로부터의 거리)를 얻는다. 
	var layer = document.getElementById("station_info_popup_layer");


	if (_x < 0)
		_x = 0; //마우스로 선택한 위치의 값이 -값이면 0으로 초기화. (화면은 0,0으로 시작한다.) 
	if (_y < 0)
		_y = 0; //마우스로 선택한 위치의 값이 -값이면 0으로 초기화. (화면은 0,0으로 시작한다.) 

	layer.style.left = _x + "px"; //레이어팝업의 좌측으로부터의 거리값을 마우스로 클릭한곳의 위치값으로 변경. 
	layer.style.top = _y + "px"; //레이어팝업의 상단으로부터의 거리값을 마우스로 클릭한곳의 위치값으로 변경. 
	layer.style.visibility = "visible";



	stationinfo();

	$('#delete_popup').on('click', get_station_down);
	//팝업 삭제 링크 

	// 탭 전환을 위해서 자동으로 누르기(아직 동작하지 않음, 버그있음) 
	$('#firstTeb').attr('aria-expanded', 'true');

	$('#carNum1').mouseover(get_train_info); // 역열차의 좌석 정보
}

function get_station_down() { // 역 정보 팝업 삭제 
	var layer = document.getElementById('station_info_popup_layer');
	layer.style.visibility = 'hidden';
	station_name_down();
}

//======================여기까지는 팝업담당===========================//

//역열차의 좌석 정보를 롤오버로 구현하느 부분
function get_train_info() {
	var subwaynum = '2002'; // 열차번호
	var carnum = '1';// 열차량번호 가져오기
//	 $(this).attr('trainnum')
	$.ajax({
		url : 'realTimeTrainSeat',
		type : 'post',
		data : {
			subwaynum : subwaynum,
			carnum : carnum
		},
		dataType : 'json',
		success : function(datas) {
			var _x = event.clientX + document.body.scrollLeft; //마우스로 선택한곳의 x축(화면에서 좌측으로부터의 거리)를 얻는다. 
			var _y = event.clientY + document.body.scrollTop; //마우스로 선택한곳의 y축(화면에서 상단으로부터의 거리)를 얻는다. 
			var layer = document.getElementById("train_seat_popup");
			if (_x < 0)
				_x = 0; //마우스로 선택한 위치의 값이 -값이면 0으로 초기화. (화면은 0,0으로 시작한다.) 
			if (_y < 0)
				_y = 0; //마우스로 선택한 위치의 값이 -값이면 0으로 초기화. (화면은 0,0으로 시작한다.) 

			layer.style.left = _x + "px"; //레이어팝업의 좌측으로부터의 거리값을 마우스로 클릭한곳의 위치값으로 변경. 
			layer.style.top = _y + "px"; //레이어팝업의 상단으로부터의 거리값을 마우스로 클릭한곳의 위치값으로 변경. 
			layer.style.visibility = "visible";
			
			//arraylist 받아서 좌석당 돌리기
			$.each(datas, function(index,item) {
				var insert = item.elderyseat1 + item.elderyseat2 + item.elderyseat3
				$('#TrainSeat'+index).val(insert);
							
			})
		}
	})
}

// 실시간 열차
function realtimes() {
	$.ajax({
		url : 'realTime',
		type : 'post',
		data : {
			station : getStation
		},
		dataType : 'json',
		success : resultRealTime
	})
}

function resultRealTime(result) { // 실시간 지하철 상하행선 도착
	$.each(result.realtimeArrivalList, function(index, items) {

		$('.getStationName').text(items.statnNm);

		if (index == 0) {
			$('.upstation_real').text(items.arvlMsg2);
		}
		if (index == 1) {
			$('.downstation_real').text(items.arvlMsg2);
		}
		if (index == 2) {
			return false;
		}

	});


}
// 역 정보 
function stationinfo() {
	$('#exitTable').html(''); // 청소
	$('#map').html(''); // 청소
	$('#map').attr('style', ''); // 청소
	$.ajax({
		url : 'stationInfo',
		type : 'post',
		data : {
			station : insertStation // 역 코드 
		},
		dataType : 'json',
		success : stationinforesult // 역 정보 function
	});
}

//아두이노 센서에서 좌석과 혼잡도 테이블 가져오는 function
function subwaySensorGet() { // map 이름과 같다. 
	
	var subwayNum =  '2002'; // 2호선 2002열차 
	$.ajax({
		url : 'subwaySensorGet',
		type : 'post',
		data : {
			subwayNum : subwayNum
		},
		dataType : 'json',
		success : resultSubwaySensorGet
	});


}
// 아두이노 센서에서 좌석과 혼잡도 테이블 가져오는 function 결과
function resultSubwaySensorGet(datas) {
	var subwayNum =  '2002'; // 2호선 2002열차 
	$.each(datas, function(index, items) {
		var humanIndex = index + 1;
		var human = '<span class = "train'+index+'" trainNum = "'+index+'">';
		human += items.humanNum;
		human += '</span>';
		$('#carNum' + humanIndex).html(human);
	});
}


//역 정보 function, 맨 처음 보여지는 기능
function stationinforesult(item) {
	//중요: 팝업 테이블 채우는 곳 
	//환승역의 경우 정보를 더 채워야 함 
	realtimes(); // 실시간 정보 받기 
	subwaySensorGet();
	// map 형식으로 받는다, map 형식은 for을 할 필요가 없다.
	var text = '';

	var minw = 'Y'; // 민원시설의 경우 ''으로 나오는 경우가 있어서 이렇게 처리
	if (item.minw == '') {
		minw = 'N'; // 없는 데이터라면 N을 출력
	}

	var obs = ''; // 장애인시설
	var parking = ''; // 주차시설
	var bike = ''; // 자전거
	var minwon = ''; // 민원시설
	var sooyu = ''; // 수유실

	if (item.obstacle == 'Y') {
		obs = '장애인시설 ';

	}

	if (item.parking == 'Y') {

		parking = '주차장 ';

	}

	if (item.bicycle == 'Y') {

		bike = '자전거보관소 ';

	}

	if (item.minwon == 'Y') {

		minwon = '민원시설 ';

	}

	if (item.nurse == 'Y') {

		sooyu = '수유실 ';
	}
	var combini = obs + parking + bike + minwon + sooyu;
	// item.orignalStation

	//	텍스트 넣어주는 부분
	$('#station_name').text(item.stationname);
	$('#station_address').text(item.address);
	$('#station_phone').text(item.stationname);
	$('#station_combini').text(combini);
	$('#station_toilet').text(item.toilet);


	//	텍스트 넣어주는 부분
	$.ajax({
		url : 'exitInfo',
		type : 'post',
		data : {
			station : item.stationname
		},
		dataType : 'json',
		success : resultBusinfo
	})



	//	$('#stationinfo').on('click', stationinfo); // 역정보
	//	$('#stationtimetable').on('click', stationtimetable); // 시간표
	//	$('#stationlasttime').on('click', stationlasttime); // 역 첫차 막차
	//	$('#stationmapinfo').on('click', stationmapinfo); // 역 지도


}


// 버스결과 
function resultBusinfo(result) {
	var text = '';

	$.each(result, function(index, items) {
		text += '<table>';
		text += '<tr>';
		text += '<td width="70">' + items.exitNum + '번 출구</td>';
		text += '<td> 출구정보: ' + items.info + '</td>';
		text += '</tr>';
		text += '</table>';

	});

	$('#exitTable').html(text);

}


function removes() { // 역시간표 제거하기
	for (var stationTime = 5; stationTime <= 25; stationTime++) {
		var text = stationTime.toString();
		if (text.length == 1) {
			text = '0' + text;
		} else {

		}
		console.log(text)
		$('#timatbl' + text).html('');

	}
}

function stationtimetableNext() { // 역 시간표 (선택자)
	removes();
	var yoil = $('.timetableselect1').attr('yoil');
	var updown = $('.timetableselect1').attr('updown');
	console.log(yoil);
	console.log(updown);
	timeajax(yoil, updown);

}

function stationtimetableNextDown() { // 역 시간표 (선택자)
	removes();
	var yoil = $('.timetableselect2').attr('yoil');
	var updown = $('.timetableselect2').attr('updown');
	console.log(yoil);
	console.log(updown);
	timeajax(yoil, updown);

}

function stationtimetableNexts() { // 역 시간표 평일
	removes();
	var yoil = 1;
	var updown = 1;
	console.log(yoil);
	console.log(updown);
	timeajax(yoil, updown);
	$('.timetableselect1').attr('yoil', '1');
	$('.timetableselect2').attr('yoil', '1');

}
function stationtimetableNext2() { // 역 시간표 토요일
	removes();
	var yoil = 2;
	var updown = 1;
	console.log(yoil);
	console.log(updown);
	timeajax(yoil, updown);
	$('.timetableselect1').attr('yoil', '2');
	$('.timetableselect2').attr('yoil', '2');
}

function stationtimetableNext3() { // 역 시간표 일요일
	removes();
	var yoil = 3;
	var updown = 1;
	console.log(yoil);
	console.log(updown);
	timeajax(yoil, updown);

	$('.timetableselect1').attr('yoil', '3');
	$('.timetableselect2').attr('yoil', '3');
}

function timeajax(yoil, updown) { // 역 시간표
	$.ajax({
		url : 'stationTime',
		type : 'post',
		data : {
			station : insertStation,
			yoil : yoil,
			updown : updown
		},
		dataType : 'json',
		success : timetable
	});
}

function timetable(results) { // 역 시간표 
	$('#realtime').html('');
	// 		items.expressLine, items.startStsName, items.endStsName

	$.each(results, function(index, items) {

		var arriveTimes = items.arriveTimeUp; // String 날짜 
		var stationTime = arriveTimes.substr(0, 2); // 시간을 05로 자르는 String
		var min = arriveTimes.substr(3, 2); // 시간을 05로 자르는 String
		var tableTime = $('#timatbl' + stationTime).attr(
			'time' + stationTime);
		// td의 위치 부르는 부분
		if (tableTime == stationTime) { // 05 == 05

			var times = new Date('October 13, 2014 ' + arriveTimes);
			var tableTimes = $('#timatbl' + stationTime); // 객체 부르는 부분
			var e = $(tableTimes).html(); // 원래 있던 값 부름
			$(tableTimes).html(e + ' ' + min);

		}

	});

	// 요일과 상하행선 클릭시 실행하는 js

}


// 청소 HTML
function removehtml() {
	$('#exitTable').html(''); // 청소
	$('#realtime').html(''); // 청소
	$('#map').html(''); // 청소
	$('#map').attr('style', ''); // 청소
}


function stationlasttime() { // 역 첫차 막차
	removehtml();
	$.ajax({
		url : 'lastTime',
		type : 'post',
		data : {
			station : insertStation
		},
		dataType : 'json',
		success : resultlasttime
	})

}

function resultlasttime(item) { // 첫차 막차 (java단에서 2중 for로 계산 )

	$('#firstStation11').text(item.firstStation11);
	$('#firstTime11').text(item.firstTime11);
	$('#firstStation12').text(item.firstStation12);
	$('#firstTime12').text(item.firstTime12);
	$('#lastStation11').text(item.lastStation11);
	$('#lastTime11').text(item.lastTime11);
	$('#lastStation12').text(item.lastStation12);
	$('#lastTime12').text(item.lastTime12);

	$('#firstStation21').text(item.firstStation21);
	$('#firstTime21').text(item.firstTime21);
	$('#firstStation22').text(item.firstStation22);
	$('#firstTime22').text(item.firstTime22);
	$('#lastStation21').text(item.lastStation21);
	$('#lastTime21').text(item.lastTime21);
	$('#lastStation22').text(item.lastStation22);
	$('#lastTime22').text(item.lastTime22);


	$('#firstStation31').text(item.firstStation31);
	$('#firstTime31').text(item.firstTime31);
	$('#firstStation32').text(item.firstStation32);
	$('#firstTime32').text(item.firstTime32);
	$('#lastStation31').text(item.lastStation31);
	$('#lastTime31').text(item.lastTime31);
	$('#lastStation32').text(item.lastStation32);
	$('#lastTime32').text(item.lastTime32);


}
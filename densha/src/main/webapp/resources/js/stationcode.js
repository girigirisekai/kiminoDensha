
// 고정변수들, 건들지 말것. 
var insertStation = ''; // 전역변수로 최초 누를때 역코드를 받는 부분 (역코드)

var getStation = ''; // 역코드 - > 역이름 DB get
var latitude = ''; // 위도 (x)
var longitude = ''; // 경도 (y)
var subwayLine = ''; // 지하철 호선
var frcode = ''; // 역외코드는 실시간 열차의 역별 검출때 필요하다. 
var getCode = new Array(); // 역 코드(환승역의 경우 사용하기 때문에 필요하다.)
var cyber = ''; // 사이버 스테이션 
 
var subwayNum = '2002'; // 전철 번호 (탭기능을 위해서 전역변수로 받는다.)
// 현재 전철의 경우 실시간 전철기능과 연동되어야 하지만 프로젝트의 예시를 위해서
// 2002, 2003번 열차만 한다. 

var realTimeStation = '';

var timeInterval; // 실시간 좌석 setTime, clearInterval을 위해서 전역으로 한다.
// 출발역 도착역 사용 변수
var scode, code, ecode, ecode2, scodes, ecodes;
var xPoint, yPoint;
var startCode = '<path fill="#9E1205" d="M0,16.834c0,1.619,0.21,3.182,0.636,4.663c0,0,0.17,0.644,0.687,1.886c0.005,0.013,0.002,0.006,0,0 c0.002,0.006,0.005,0.013,0,0c1.472,3.515,5.557,12.03,15.489,26.555V50c0.008-0.011,0.014-0.021,0.021-0.031V0 C7.537,0,0,7.537,0,16.834z"></path>'
	  +'<path fill="#9E1205" d="M33.668,16.834C33.668,7.537,26.131,0,16.833,0v49.969c0.008,0.011,0.014,0.021,0.021,0.031v-0.063 c9.934-14.525,14.018-23.041,15.489-26.555c0.518-1.242,0.688-1.886,0.688-1.886C33.459,20.016,33.668,18.453,33.668,16.834z"></path>'
	  +'<path fill="#FFFFFF" d="M16.45,14.197c-1.849,0.859-3.228,0.494-3.762,0.283v-0.938h-1.917v17.75h1.917v-8.53 c0.535,0.211,1.914,0.576,3.762-0.283c0,0,2.69-1.493,6.446-0.555v-8.281C19.141,12.703,16.45,14.197,16.45,14.197z"></path>';
	  
var endCode = '<path fill="#1961BC" d="M0,16.834c0,1.619,0.21,3.182,0.636,4.663c0,0,0.17,0.644,0.687,1.886c0.005,0.013,0.002,0.006,0,0 c0.002,0.006,0.005,0.013,0,0c1.472,3.515,5.557,12.03,15.489,26.555V50c0.008-0.011,0.014-0.021,0.021-0.031V0 C7.537,0,0,7.537,0,16.834z"></path>'
	  +'<path fill="#1961BC" d="M33.668,16.834C33.668,7.537,26.131,0,16.833,0v49.969c0.008,0.011,0.014,0.021,0.021,0.031v-0.063 c9.934-14.525,14.018-23.041,15.489-26.555c0.518-1.242,0.688-1.886,0.688-1.886C33.459,20.016,33.668,18.453,33.668,16.834z"></path>'
	  +'<path fill="#FFFFFF" d="M16.45,14.197c-1.849,0.859-3.228,0.494-3.762,0.283v-0.938h-1.917v17.75h1.917v-8.53 c0.535,0.211,1.914,0.576,3.762-0.283c0,0,2.69-1.493,6.446-0.555v-8.281C19.141,12.703,16.45,14.197,16.45,14.197z"></path>';

//드래그 줌 변수
var svg;
$(window.document).on("contextmenu", function(event){return false;});	
  
		  
$(document).ready(function() { // 최초 시작점 
	
	 $('svg').mousedown(function(e) {
//			 console.log(e);
		// 1:좌클릭, 2:휠클릭, 3:우클릭
		if (e.which == 1) { // 일반 클릭
			
		} else if (e.which == 3) { // 우클릭
			station_name_down(); // 역 이름 팝업 div 삭제
			get_station_down(); // 역정보보기 div 삭제
			$(this)[0].oncontextmenu = function() { // 우클릭시 띄워치는 contextmenu 막기 
				return false; 
			}

		} 
	}); 
	$('#노선 circle').on('click', test1); 
	$('#station').on('click', get_station_popup);
	
	//드래그 줌 기능
	svg = new SVG($('#svg_1'));
	svg.init();
	$('#station_info_popup_layer').draggable();// 팝업창 드래그
	
	// 탭 부분 
    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").mouseover(function () { // 마우스 룰 오버시 실행 
    	subwayNum = $(this).attr('carnum'); // 번호 바꾸기
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
//        var activeTab = $(this).attr("rel");
//        $("#" + activeTab).fadeIn();
        $("#" + "tab1").fadeIn();
        
        subwaySensorGet();
    });

}); 
   



function pathTest1(){
	
	scode = code;
	 $.ajax({
		url : 'pars',
		type : 'get',
		data : {str: scode},
		dataType: 'text',
		success : function(abc){
			scodes = abc; // 역 이름
		}
	}); 
	$('#startEnd').off('click', pathTest1);
	$('#startPoint').attr('transform', 'translate('+(xPoint-17)+','+(yPoint-50)+')');
	$('#startPoint').html(startCode);
	
	
}

function pathTest2(){
	
	ecode = code;
		
	//2중 ajax, 
	 $.ajax({
		url : 'pars',
		type : 'get',
		data : {str: ecode},
		dataType: 'text',
		success : function(bcd){
			ecodes = bcd;
				$.ajax({
					url : 'path2',
					type : 'get',
					data : {start: scodes, end: ecodes},
					dataType : 'json',
					success : pathm 
				});
			
		}
	}); 
	
}

function pathm(list){ // 경로들의 역을 좌표에 찍어주는 부분
	
	$('#endPoint').attr('transform', 'translate('+(xPoint-17)+','+(yPoint-50)+')');
	$('#endPoint').html(endCode);
	$('#startEnd').off('click', pathTest2);
	$.each(list, function(index, item){ //경로가 modal에 들어가는 부분
		if(item.length > 4){
			  $('.modal').modal(); // modal 띄우기
			  var insertTitleModalPath = scodes +' <-> '+ecodes; 
			  
			  $('.modal-title').html('<img src = "./resources/image/infoicon/station.png" style="width:50px;height:50px;">'+insertTitleModalPath); // modal제목에 값 넣기 
			  var spendTimeAndETC = item.split(',');
		
			  
			  var spendTime = spendTimeAndETC[0].replace(' 걸리고','');
			 
			  
			  var ETCAndStopAndTrans = spendTimeAndETC[1].split('.');
			  var transStation = ETCAndStopAndTrans[0].replace('번 환승합니다',''); // 환승횟수
			  var stopStation = ETCAndStopAndTrans[1].replace('(','').replace('개역 지나감)','') // 정차횟수 
			  
			  console.log(ETCAndStopAndTrans);
			  console.log(spendTime);
			  console.log(transStation);
			  console.log(stopStation);
			  
			  $('.spendTime').html('<h6>'+spendTime +'</h6>'); // modal내용에 값 넣기 
			  $('.stopStation').html('<h6>'+ stopStation +'</h6>'); // modal내용에 값 넣기 
			  $('.transStation').html('<h6>'+transStation +'</h6>'); // modal내용에 값 넣기 
				 
		}else {
		$('#'+item).attr('fill', 'orange');
		}
	});
	scode = null;
	
}

function test1() { // 채우면서 데이터 보내는 역할

	$('#'+ecode2).attr('fill', '#FFFFFF');
	$('#'+scode).attr('fill', 'orange'); 
	if(scode == null){ // 처음 출발하는 역 
		$('#노선 circle').attr('fill', '#FFFFFF');
		$('#startPoint').html('');
		$('#endPoint').html('');
	}

	$(this).attr('fill', 'orange');
	
	xPoint = $(this).attr('cx');
	yPoint = $(this).attr('cy');
	
	var id = $(this).attr('id');
	station_name_popup(id);
	pathTest();
}

function pathTest(){  // 경로 설정시 버튼 이미지  변경
	
	code = $('#startEnd').attr('stationcode');
	if(scode == null || scode == code){
		$('#startEnd').attr('src', './resources/image/menu/start.png');
		$('#startEnd').val('출발역');
		$('#startEnd').on('click', pathTest1);
		
	}else {
		$('#startEnd').attr('src', './resources/image/menu/end.png');
		$('#startEnd').val('도착역');
		ecode2 = code;
		$('#startEnd').on('click', pathTest2);
		
	}
	
}


//역 이름: 팝업 띄우기 
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
	cyber = insertStation;

	// 역 코드로 역 이름 가져오기 
	$.ajax({
		url : 'StationCodeParseName', // subway
		type : 'get',
		data : {
			stationCode : insertStation // 역 코드 넣기 
		},
		dataType : 'json',
		success : function(item) {
			// ArrayList로 받는다. 
			// 환승역이 아닌 경우는 index는 0에서 끝나며
			// 환승역인 경우는 each를 돌린다.
			var insertLineInfo = ''; // html insert
			//ArrayList로 받는다. 
		
			$.each(item, function(index, items) {
				var i = index + 1; // 1234순
				getCode[index] = items.station_cd; // 역 코드들
				getStation = items.station_nm2; // 역 이름 받기
  
				if(item.length > 1){ // 환승역인 경우만 버튼을 생성해 줌
				var spl = "'" + items.line_num + "','" + items.station_cd + "','" + items.fr_code + "'";	
				insertLineInfo += '<li><a href ="javascript:nowLine(' + spl + ')" class="btn btn-default" style="width:505px;">' + items.line_num + '호선 </a></li>';
				
				$('.btn-group').css('display','block'); // display를 on
 				$('#stationNameId').text(getStation); // dropdown에 역이름 넣어주기 
 				$('#stationNamebar').empty(); // 기존 역 이름 비우기
 				
				}else if(item.length == 1 ){ // 일반역인 경우 
					$('#stationNamebar').show(); // 기존 역 이름 보이기
					$('.btn-group').css('display','none'); // display를 off
					$('#stationNamebar').text(getStation); // 기존 역 이름
				}
				cyber = items.cyber_st_code;
				latitude = items.xpoint_wgs; // x좌표 받기
				longitude = items.ypoint_wgs; // y 좌표 받기
				realTimeStation = cyber; // 사이버 코드는 역의 기본코드이기때문에 넣어준다. 

				if (index == 0) { // 맨 처음으로 보여지는 역을 위한  if문
					subwayLine = items.line_num; // linenum
					frcode = items.fr_code; // 역외코드 

				}


			});
			$('#stationDrop').html(insertLineInfo);
		}
	});

//	열차 인터벌
	timeInterval = setInterval(function() {
		subwaySensorGet();
	}, 5000);


}

function nowLine(nowline, nowcode, nowfrcode) { // line은 버튼의 호선을 받는다.

	subwayLine = nowline;
	insertStation = nowcode;
	frcode = nowfrcode;
	console.log(frcode);
	console.log(subwayLine);
	console.log(insertStation);
	stationlasttime(); // 막처 첫차 시간표 재생성
	stationtimetableNexts(); // 호선별 시간표 재생성
	realtimes(); // 새로 실시간 열차 부르기 

}

// 역 이름: 팝업 삭제
function station_name_down() { // stationNamediv 삭제 역할 
	var layer = document.getElementById("station_name_popup_layer");
	layer.style.visibility = 'hidden';
	$('#노선 circle').attr('fill', '#FFFFFF');
	$('#startPoint').html('');
	$('#endPoint').html('');
	scode = null;

	//탭 종료시 첫번 째 탭으로 이동~~~~~
	$('#firstTab').attr('aria-expanded', 'true');
	$('.tab-pane fade active in').addClass('tab-pane fade');
	$('.tab-pane fade active in').removeClass('tab-pane fade active in');
	$('.active').removeClass("active");
	$('#settingHelper').addClass("active");
	$('#stationInfoTab').addClass("tab-pane fade active in");
	clearInterval(timeInterval); 
}




//역 정보: 팝업 띄우기 
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

	stationinfo(); // 역 정보 ajax 실행

	$('#delete_popup').on('click', get_station_down);
	//팝업 삭제 링크 

	// 탭 전환을 위해서 자동으로 누르기(아직 동작하지 않음, 버그있음) 
	$('#firstTeb').attr('aria-expanded', 'true');


}

//역 정보: 팝업 삭제
function get_station_down() {
	// 추가로 tab 초기화 코드 추가
	//location.href = '#stationInfoTab';

	var layer = document.getElementById('station_info_popup_layer');
	layer.style.visibility = 'hidden';
	station_name_down(); // 이름 팝업도 삭제



}

// 열차량당 좌석: 아래의 기능들은 좌석에 대한 위치팝업


// 열차량당 좌석: 팝업on
function train_popup() {
	train_seat_popup.style.display = "block";
	var x = $(this).attr('trainnum');
	get_train_info(x);
}


//열차량당 좌석: 팝업off
function train_popupOut() {
	train_seat_popup.style.display = "none";

}

//======================여기까지는 팝업담당===========================//

//다음지도 부분
function daummap() {
	$('#map').html(''); // 청소
	setTimeout("daummap2()", 160);//시간 텀을 줘서 에러 해결


}

function daummap2() {
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨
		};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);


}



//// 좌석 상황 div 보여주는 부분
//function train_popup(opt) {
//	if (opt) {
//		train_seat_popup.style.display = "block";
//	} else {
//		train_seat_popup.style.display = "none";
//	}
//	get_train_info();
//}


//역열차의 좌석 정보를 롤오버로 구현하느 부분
function get_train_info(e) {
	
	//	var carnum = '2'; // 열차량번호 가져오기


	var carnum = e;
	//	var carnumss = $('#carNum1').attr('trainnum');
	console.log(carnum);
	
		$.ajax({
			url : 'realTimeTrainSeat',
			type : 'post',
			data : {
				subwaynum : subwayNum,
				carnum : carnum
			},
			dataType : 'json',
			success	: function (items) {
				//1 3
				//2 4
				var insert1 = ''; // 왼쪽 위
				var insert2 = ''; // 오른쪽 위
				var insert3 = ''; // 
				var insert4 = '';
				
				var insertTitle = subwaynum + '번호 열차의 ' + carnum + '량 열차 좌석정보';
				var seatoff = '<img src = "./resources/image/seat/seatoff.gif">';
				var seaton = '<img src = "./resources/image/seat/seaton.gif">';
				
				if (items.elderlySeat1 == 1) { // 사람이 있다면
					insert1 += seaton;
				} else if (items.elderlySeat1 == 0) { // 좌석에 사람이 없다면 
					insert1 += seatoff;
				} else if (items.elderlySeat1 == 9) { // 좌석이 없다면 
					
				}
				
				if (items.elderlySeat2 == 1) {
					insert1 += seaton;
				} else if (items.elderlySeat2 == 0) { // 좌석에 사람이 없다면 
					insert1 += seatoff;
				} else if (items.elderlySeat2 == null) { // 좌석에 사람이 없다면 
					
				}
				
				if (items.elderlySeat3 == 1) { //3
					insert1 += seaton;
					$('#trainSeat1').html(insert1);
				} else if (items.elderlySeat3 == 0) { // 좌석에 사람이 없다면 
					insert1 += seatoff;
					$('#trainSeat1').html(insert1);
				} else if (items.elderlySeat3 == null) { // 좌석에 사람이 없다면 
					
				}
				// 1 end
				
				if (items.elderlySeat4 == 1) {
					insert2 += seaton;
				} else if (items.elderlySeat4 == 0) { // 좌석에 사람이 없다면 
					insert2 += seatoff;
				} else if (items.elderlySeat4 == null) { // 좌석에 사람이 없다면 
					
				}
				
				if (items.elderlySeat5 == 1) {
					insert2 += seaton;
				} else if (items.elderlySeat5 == 0) { // 좌석에 사람이 없다면 
					insert2 += seatoff;
				} else if (items.elderlySeat5 == null) { // 좌석에 사람이 없다면 
					
				}
				
				if (items.elderlySeat6 == 1) {
					insert2 += seaton;
					$('#trainSeat3').html(insert2);
				} else if (items.elderlySeat6 == 0) { // 좌석에 사람이 없다면 
					insert2 += seatoff;
					$('#trainSeat3').html(insert2);
				} else if (items.elderlySeat6 == null) { // 좌석에 사람이 없다면 
					
				}
				// 1 end
				
				if (items.elderlySeat7 == 1) {
					insert3 += seaton;
				} else if (items.elderlySeat7 == 0) { // 좌석에 사람이 없다면 
					insert3 += seatoff;
				} else if (items.elderlySeat7 == null) { // 좌석에 사람이 없다면 
					
				}
				
				if (items.elderlySeat8 == 1) {
					insert3 += seaton;
				} else if (items.elderlySeat8 == 0) { // 좌석에 사람이 없다면 
					insert3 += seatoff;
				} else if (items.elderlySeat8 == null) { // 좌석에 사람이 없다면 
					
				}
				
				if (items.elderlySeat9 == 1) {
					insert3 += seaton;
					$('#trainSeat2').html(insert3);
				} else if (items.elderlySeat9 == 0) { // 좌석에 사람이 없다면 
					insert3 += seatoff;
					$('#trainSeat2').html(insert3);
				} else if (items.elderlySeat9 == null) { // 좌석에 사람이 없다면 
					
				}
				// 3 end
				
				if (items.elderlySeat10 == 1) {
					insert4 += seaton;
				} else if (items.elderlySeat10 == 0) { // 좌석에 사람이 없다면 
					insert4 += seatoff;
				} else if (items.elderlySeat10 == null) { // 좌석에 사람이 없다면 
					
				}
				
				if (items.elderlySeat11 == 1) {
					insert4 += seaton;
				} else if (items.elderlySeat11 == 0) { // 좌석에 사람이 없다면 
					insert4 += seatoff;
				} else if (items.elderlySeat11 == null) { // 좌석에 사람이 없다면 
					
				}
				if (items.elderlySeat12 == 1) {
					insert4 += seaton;
					$('#trainSeat4').html(insert4);
				} else if (items.elderlySeat12 == 0) { // 좌석에 사람이 없다면 
					insert4 += seatoff;
					$('#trainSeat4').html(insert4);
				} else if (items.elderlySeat12 == null) { // 좌석에 사람이 없다면 
					
				}
				
				
				$('#seatTitle').html(insertTitle);
				
			}
		});
		

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
		success : resultRealTime,
		error: function () {
			$('.getStationName').html('<strong>' + subwayLine + '호선 ' + getStation + '</strong>');
			// 역 이름을 넣어준다. 역 이름은 호선과 역 이름을 입력한다.
			realtimes();
	}
	});
}

function resultRealTime(result) { // 실시간 지하철 상하행선 도착
	var nowCode = '';
	$.each(result.realtimeArrivalList, function(index, items) {
		nowCode = items.statnId.substr(7, 3); // 역외코드 

		console.log(nowCode);

		if (nowCode == frcode) { 
			// 열차가 가진 번호가 역외코드와 같은 역인지 확인하여 찾는다.
			
			var ordkey = items.ordkey; // 열차의 순번이다. 
			/*2호선 외선의 순서는 01 02순이다. : 01001 02002 
			2호선 내선의 순서는 11 12순이다. : 11001 12002
			
			일반 역의 순서는 다음과 같다.
			상행 01 02 : 01001 02006
			하행 11 12 : 11001 12004
			앞의 두 글자를 substring으로 가져와서 비교를 해야 한다.
			*/
			var list = ordkey.substr(0, 2);
			$('.getStationName').html('<strong>' + subwayLine + '호선 ' + getStation + '</strong>');
			// 역 이름을 넣어준다. 역 이름은 호선과 역 이름을 입력한다.	
			
			if ( list== '01') { // 
				$('.upstation_real').text(items.arvlMsg2);
			}
			if (list == '11') {
				$('.downstation_real').text(items.arvlMsg2);
			}
			
			
			
		}

		lineGifChange(); // 백 패널의 이미지를 교체한다.
	});
}
// 역 정보 
function stationinfo() {
	$('#exitTable').html(''); // 청소
	$('#map').html(''); // 청소
	//$('#map').attr('style', ''); // 청소
	$.ajax({
		url : 'stationInfo',
		type : 'post',
		data : {
			station : cyber // 역 코드 
		},
		dataType : 'json',
		success : stationinforesult // 역 정보 function
	});
	
}

//아두이노 센서에서 좌석과 혼잡도 테이블 가져오는 function
function subwaySensorGet() { // map 이름과 같다. 

	$.ajax({
		
		url : 'subwaySensorGet',
		type : 'post',
		data : {
			subwayNum : subwayNum // 열차번호를 넣는다. 
		},
		dataType : 'json',
		success : resultSubwaySensorGet
	});
	
	

}
// 아두이노 센서에서 좌석과 혼잡도 테이블 가져오는 function 결과
function resultSubwaySensorGet(datas) {

	var carHuman = 0;

	var firstCar0 = '<img src ="./resources/image/subwayCar/subway_general.png">';
	var firstCar20 = '<img src ="./resources/image/subwayCar/subway_general_red20.png">';
	var firstCar40 = '<img src ="./resources/image/subwayCar/subway_general_red40.png">';
	var firstCar60 = '<img src ="./resources/image/subwayCar/subway_general_red60.png">';
	var firstCar80 = '<img src ="./resources/image/subwayCar/subway_general_red80.png">';
	var firstCar100 = '<img src ="./resources/image/subwayCar/subway_general_red100.png">';
	var firstCar120 = '<img src ="./resources/image/subwayCar/subway_general_red120.png">';

	var nextCar0 = '';
	var nextCar20 = '';
	var nextCar40 = '';
	var nextCar60 = '';
	var nextCar80 = '';
	var nextCar100 = '';
	var nextCar120 = '';

	
		$.each(datas, function(index, items) { // arraylist로 받아서 안에 있는 VO를 사용
			var humanIndex = index + 1; // 1234...\
			carHuman = Number(items.humanNum) / 160 * 100;
			// 한칸당 인원한계는 160명이 된다 그리고 100을곱한다. 이러면 62.5 가 나옴
			carHuman = Math.round(carHuman);
			// 소수점 반올림 62 
			var inserts = '<span class = "train' + humanIndex + '" trainNum = "' + humanIndex + '">';
			//		var inserts = '<span class = "train' + humanIndex + '" trainNum = "' + humanIndex
			//			+ '" onmouseover="train_popup(true)" onmouseout="train_popup(false)">';
			//		onmouseover="train_popup(true)" onmouseout="train_popupOut(false)"
			//		inserts += '<div style ="" class = "carColor'+humanIndex+'" num="'+humanIndex+'">';
			if (0 <= carHuman && carHuman < 20) {
				inserts += '<img src ="./resources/image/subwayCar/subway_general.png">';
			} else if (21 <= carHuman && carHuman < 40) {
				inserts += '<img src ="./resources/image/subwayCar/subway_general_red20.png">';
			} else if (41 <= carHuman && carHuman < 60) {
				inserts += '<img src ="./resources/image/subwayCar/subway_general_red40.png">';
			} else if (61 <= carHuman && carHuman < 80) {
				inserts += '<img src ="./resources/image/subwayCar/subway_general_red60.png">';
			} else if (81 <= carHuman && carHuman < 100) {
				inserts += '<img src ="./resources/image/subwayCar/subway_general_red80.png">';
			} else if (101 <= carHuman) {
				inserts += '<img src ="./resources/image/subwayCar/subway_general_red100.png">';
			}
			
			
			//		inserts += '</div>';
			inserts += '</span>';
			
			var insertVar = '';
			
			insertVar += items.humanNum + '명 <br>';
			insertVar += carHuman + '%';
			
			$('#carNum' + humanIndex).html(inserts); // carnum 1~10까지 html 자동으로 넣기
			$('#carNumVar' + humanIndex).html(insertVar); // %넣기
			
		});
		
		// 전철 룰 오버 시 좌석 div  부분
		$('.train1').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train2').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train3').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train4').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train5').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train6').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train7').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train8').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train9').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train10').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train11').mouseenter(train_popup).mouseleave(train_popupOut);
		$('.train12').mouseenter(train_popup).mouseleave(train_popupOut);
		
	
}


//역 정보 function, 맨 처음 보여지는 기능
function stationinforesult(item) {
	//중요: 팝업 테이블 채우는 곳 

	//역 이름 넣기 
	$('.getStationName').html('<strong>' + subwayLine + '호선 ' + getStation + '</strong>');
	$('.upstation_real').text(' ');
	$('.downstation_real').text(' ');
	
	subwaySensorGet(); // 센서 ajax 겟 
	lineGifChange();
	realtimes(); // 실시간 정보 받기 


	var minw = 'Y'; // 민원시설의 경우 ''으로 나오는 경우가 있어서 이렇게 처리
	if (item.muin == '' || item.muin == 'N') {
		minw = 'N'; // 없는 데이터라면 N을 출력
	}

	var obs = ''; // 장애인시설
	var parking = ''; // 주차시설
	var bike = ''; // 자전거
	var minwon = ''; // 민원시설
	var sooyu = ''; // 수유실
	var elevator = ''; // 엘레베이터
	
	var insertHtml = '';
	if (item.obstacle == 'Y') {
		insertHtml += '<img src = "./resources/image/infoicon/obe.png" style="width:30px;height:30px;">'; // 장애인시설  이미지
		insertHtml += '장애인시설 ';

	}

	if (item.parking == 'Y') {
		insertHtml += '<img src = "./resources/image/infoicon/park.png" style="width:30px;height:30px;">'; 
		insertHtml += '주차장 ';

	}

	if (item.bicycle == 'Y') {
		insertHtml +='<img src = "./resources/image/infoicon/bike.png" style="width:30px;height:30px;">'; // 장애인시설  이미지
		insertHtml +='자전거보관소 ';

	}

	if (minw == 'Y') {
		insertHtml +='<img src = "./resources/image/infoicon/minwon.png" style="width:30px;height:30px;">'; // 장애인시설  이미지
		insertHtml += '무인민원 ';

	}

	if (item.nurseing == "Y") {
		insertHtml +='<img src = "./resources/image/infoicon/sooyoo.png" style="width:30px;height:30px;">'; // 장애인시설  이미지
		insertHtml +='수유실 ';
	}
	
	if (item.elevator == 'Y') {
		insertHtml +='<img src = "./resources/image/infoicon/elevator.png" style="width:30px;height:30px;">'; // 장애인시설  이미지
		insertHtml +='엘리베이터 ';
	}
	
	if (item.ticket == 'Y') {
		insertHtml +='<img src = "./resources/image/infoicon/heros.gif" style="width:30px;height:30px;">'; // 장애인시설  이미지
		insertHtml +='티켓 ';
	}
	
	// item.orignalStation
	console.log(item);
	
	var stationIcon = '<img src = "./resources/image/infoicon/station.png" style="width:30px;height:30px;">';
	var telIcon = '<img src = "./resources/image/infoicon/tele.png" style="width:30px;height:30px;">';
	var addressIcon = '<img src = "./resources/image/infoicon/info2.png" style="width:30px;height:30px;">';
	var toiletIcon = '<img src = "./resources/image/infoicon/toilet.png" style="width:30px;height:30px;">'
	//	텍스트 넣어주는 부분
	$('#station_name').html(stationIcon + ' '+ item.station_nm + '  /  (영문명 : ' + item.station_nm_eng + ') '); // 역 이름 
	
	$('#station_address').html(addressIcon + ' '+ item.address); // 역 주소 
	$('#station_phone').html(telIcon + ' '+ item.tel); // 역 이름 
	$('#station_toilet').html(toiletIcon + ' '+ item.toilet); // 화장실 
	$('#stationConvenient').html(insertHtml); // 편의시설 삽입 코드 


	//	텍스트 넣어주는 부분
	$.ajax({
		url : 'exitInfo',
		type : 'post',
		data : {
			station : cyber //DB로 사이버코드를 쓴다.
		},
		dataType : 'json',
		success : resultBusinfo
	}) 



}

function lineGifChange() {
	//라인에 따른 백그라운드 역 실시간 시간판 교체
	if (subwayLine == '1') { // 호선
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName1.gif) no-repeat;');
	} else if (subwayLine == '2') {
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName2.gif) no-repeat;');
	} else if (subwayLine == '3') {
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName3.gif) no-repeat;');
	} else if (subwayLine == '4') {
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName4.gif) no-repeat;');
	} else if (subwayLine == '5') {
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName5.gif) no-repeat;');
	} else if (subwayLine == '6') {
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName6.gif) no-repeat;');
	} else if (subwayLine == '7') {
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName7.gif) no-repeat;');
	} else if (subwayLine == '8') {
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName8.gif) no-repeat;');
	} else if (subwayLine == '9') {
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName9.gif) no-repeat;');
	} else if (subwayLine == 'S') { // 신분당선
		$('.stationNames').attr('style', 'height: 84px;background: url(./resources/image/lineBack/subwayStationName9.gif) no-repeat;');
	}

}



// 버스결과 
function resultBusinfo(result) {
	var text = '';

	$.each(result, function(index, items) {
		text += '<table>';
		text += '<tr>';
		text += '<td width="70" class= "tbl_detail">' + items.exitNum + '번 출구</td>';
		text += '<td class= "tbl_detail">' + items.info + '</td>';
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

		$('#timatbl' + text).html('');

	}
}

function stationtimetableNext() { // 역 시간표 (선택자)
	removes();
	var yoil = $('.timetableselect1').attr('yoil');
	var updown = $('.timetableselect1').attr('updown');

	timeajax(yoil, updown);

}

function stationtimetableNextDown() { // 역 시간표 (선택자)
	removes();
	var yoil = $('.timetableselect2').attr('yoil');
	var updown = $('.timetableselect2').attr('updown');

	timeajax(yoil, updown);
	

}

function stationtimetableNexts() { // 역 시간표 최초 누름 
	removes();
	var yoil = 1;
	var updown = 1;
	
	timeajax(yoil, updown);
	$('.timetableselect1').attr('yoil', '1');
	$('.timetableselect2').attr('yoil', '1');
	radioRemove();

}
function stationtimetableNext2() { // 역 시간표 토요일
	removes();
	var yoil = 2;
	var updown = 1;

	timeajax(yoil, updown);
	$('.timetableselect1').attr('yoil', '2');
	$('.timetableselect2').attr('yoil', '2');
	radioRemove();
}

function stationtimetableNext3() { // 역 시간표 일요일
	removes();
	var yoil = 3;
	var updown = 1;

	timeajax(yoil, updown);

	$('.timetableselect1').attr('yoil', '3');
	$('.timetableselect2').attr('yoil', '3');
	radioRemove();
}

function radioRemove(){
	//$("input:radio[name='days']").removeAttr('checked');
	$('.timetableselect2').prop("checked", false);
	$('.timetableselect1').prop("checked", true);
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
	$('#realtime').html(''); // 청소
	$('#map').html(''); // 청소
}


function stationlasttime() { // 역 첫차 막차 
	// 여기서 부터 메뉴를 누르면 시작함
	removehtml();
	//	console.log(insertStation);
	$.ajax({
		url : 'lastTime',
		type : 'post',
		data : {
			stationCode : insertStation, // 역 코드  
			line : subwayLine // 호선 
		},
		dataType : 'json',
		success : resultlasttime
	})

}

function resultlasttime(item) { // 첫차 막차 (java단에서 2중 for로 계산 )

	$('#firstStation11').html(item.firstStation11);
	$('#firstTime11').html('<span style="color:#088A08;">'+ item.firstTime11+'<span>');
	$('#firstStation12').html(item.firstStation12);
	$('#firstTime12').html('<span style="color:#088A08;">'+ item.firstTime12+'<span>');
	$('#lastStation11').html(item.lastStation11);
	$('#lastTime11').html('<span style="color:#DF013A;">'+ item.lastTime11+'<span>');
	$('#lastStation12').html(item.lastStation12);
	$('#lastTime12').html('<span style="color:#DF013A;">'+ item.lastTime12+'<span>');

	$('#firstStation21').html(item.firstStation21);
	$('#firstTime21').html('<span style="color:#088A08;">'+ item.firstTime21+'<span>');
	$('#firstStation22').html(item.firstStation22);
	$('#firstTime22').html('<span style="color:#088A08;">'+ item.firstTime22+'<span>');
	$('#lastStation21').html(item.lastStation21);
	$('#lastTime21').html('<span style="color:#DF013A;">'+ item.lastTime21+'<span>');
	$('#lastStation22').html(item.lastStation22);
	$('#lastTime22').html('<span style="color:#DF013A;">'+ item.lastTime22+'<span>');


	$('#firstStation31').html(item.firstStation31);
	$('#firstTime31').html('<span style="color:#088A08;">'+ item.firstTime31+'<span>');
	$('#firstStation32').html(item.firstStation32);
	$('#firstTime32').html('<span style="color:#088A08;">'+ item.firstTime32+'<span>');
	$('#lastStation31').html(item.lastStation31);
	$('#lastTime31').html('<span style="color:#DF013A;">'+ item.lastTime31+'<span>');
	$('#lastStation32').html(item.lastStation32);
	$('#lastTime32').html('<span style="color:#DF013A;">'+ item.lastTime32+'<span>');


}

function pagePrint(Obj) { //인쇄하기 
	var W = Obj.offsetWidth; //screen.availWidth; 
	var H = Obj.offsetHeight; //screen.availHeight;

	var features = "menubar=no,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,resizable=yes,width=" + W + ",height=" + H + ",left=0,top=0";
	var PrintPage = window.open("about:blank", Obj.id, features);

	PrintPage.document.open();
	PrintPage.document.write("<html><head><title></title><style type='text/css'>body, tr, td, input, textarea { font-family:Tahoma; font-size:9pt; }</style>\n</head>\n<body>" + Obj.innerHTML + "\n</body></html>");
	PrintPage.document.close();

	PrintPage.document.title = document.domain;
	PrintPage.print(PrintPage.location.reload());
}
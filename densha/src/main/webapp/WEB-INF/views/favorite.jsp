<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨찾기</title>
<script src="resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/loginModule.css">

<style type="text/css">
body, html {
	background: url(./resources/image/back/back2.jpg) no-repeat center
		center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.first {
	overflow: hidden;
}

.clearfix:after {
	content: ".";
	/* the period is placed on the page as the last thing before the div closes */
	display: block;
	/* inline elements don't respond to the clear property */
	height: 0; /* ensure the period is not visible */
	clear: both; /* make the container clear the period */
	visibility: hidden; /* further ensures the period is not visible */
}

.clearfix {
	display: inline-block;
} /* a fix for IE Mac */
.clearfix {
	height: 1%;
}

.clearfix {
	display: block;
}

#add1 {
	width: 100px;
}

#searchStation {
	width: 200px;
}

td{
	text-align: center;
}

</style>

<script type="text/javascript">

	$(document).ready(function() {
		//검색 버튼 동작 실행 메소드 설정
		$('#searchStations').on('click', searchStation);
		//검색input태그의 id속성=searchStation, 엔터 키 누를 시 searchStation()메소드 실행
		$('#searchStation').keypress(function(event) {
			if (event.which == 13) {
				searchStation();
				return false;
			}
		});
		//새로운 즐겨찾기 추가 버튼 동작 실행 메소드 설정
		$('#newFavorite').on('click', newFavorite);
		//지하철의 센서 데이터 가져오기
		//subwaySensorGet();
		//현재 아이디의 즐겨찾기 목록 불러오기
		searchFavoriteList();
	});

	//현재아이디의 즐겨찾기 목록 불러오기 메소드
	function searchFavoriteList() {
		//alert('불러오기 실행');
		$.ajax({
			url : 'searchFavoriteList',
			type : 'post',
			dataType : 'json',
			success : function(data) {
				//alert('불러오기성공');
				printFavoriteStations(data);
			},
			error : function(data) {
				//alert('불러오기실패');
				printFavoriteStations(data);
			}
		});
	}

	// 	페이지 접속시 데이터를 model로 보낸후 
	// 	model에서 db에 있는데이터를 가져와서 스프라이트 하면 됩니다. 
	// 지하철 역 찾기 function, ajax로 옵션값을 바꿔줍니다 (동대문, 동대문문화역사역 같은 케이스)
	function searchStation() {
		var searchStationName = $('#searchStation').val(); // 역 이름 검색DB
		console.log(searchStationName);
		$.ajax({
			url : 'FavoriteStationName',
			type : 'post',
			dataType : 'text',
			data : {
				stationName : searchStationName
			},
			success : function(stationArray) {
				console.log(stationArray);
				var arrays = stationArray.split(',');
				var insertHtml = '';
				$.each(arrays, function(i, item) {
					insertHtml += '<option>'
					insertHtml += item;
					insertHtml += '</option>'
				})
				$('.form-control').html(insertHtml);
			}
		});
	}

	//새로운 역을 즐겨찾기 목록에 추가하기
	function newFavorite() {

		//alert('즐겨찾기 추가 실행');
		var stationName = $('.form-control option:selected').val(); // 선택된 이름
		$.ajax({
			url : 'newFavorite',
			type : 'post',
			data : {
				statioNameAndLine : stationName
			},
			dataType : 'json',
			success : function(data) {
				//alert("등록이 성공하였습니다.");
				printFavoriteStations(data);
				$('.form-control').html('');
				$('#searchStation').val('');

			}
		});
	}
	var stationIdcode = new Array();// 역 코드 array
	var stationIdName = new Array();// 역 이름 array
	var stationIdLine = new Array();// 역 라인 array
	var stationIdfrCode = new Array();// 역 외부코드 array
	//불러온 즐겨찾기 리스트 출력하기
	function printFavoriteStations(favoriteLists) {
		var str = '';
		str += '<div>';
		$.each(favoriteLists, function(index, item) { // 역의 갯수만큼 
			var lineColor = '';

			if (item.line == '1') {
				lineColor = '#0242AB';
			} else if (item.line == '2') {
				lineColor = '#16C62B';
			} else if (item.line == '3') {
				lineColor = '#F1602B';
			} else if (item.line == '4') {
				lineColor = '#0298E3';
			} else if (item.line == '5') {
				lineColor = '#8904B1';
			} else if (item.line == '6') {
				lineColor = '#985D33';
			} else if (item.line == '7') {
				lineColor = '#088A08';
			} else if (item.line == '8') {
				lineColor = '#E721A0';
			} else if (item.line == '9') {
				lineColor = '#A99704';
			} else if (item.line == 'S') { // 신분당선
				lineColor = '#C4273C';
			} else if (item.line == 'S') { // 분당선
				lineColor = '';
			} else if (item.line == '') { // 경의중앙선
				lineColor = '';
			}
			stationIdName[index] = item.favoriteName;
			stationIdcode[index] = item.stationCode;
			stationIdLine[index] = item.line;
			stationIdfrCode [index]= item.fcode;
			str += '<div id="' + item.stationCode + '"';
			if (index % 2 == 0 && index != 0) {
				str += ' style="clear: left; float: left; margin-right: 20px;  ">';
			} else { //1개일 때
				str += 'style="float: left; margin-right: 30px; " >';
			}

			str += '<div class="panel panel-default" style= "width: 520px;">';
			str += '<h3 class="col-lg-12 panel-heading" style=" background-color: ' + lineColor + '; margin-top: 0px;  font-size: 25px; font-weight: bold; color: white;">' + item.line + '호선 ' + item.favoriteName + '</h3>';
			str += '<div class="panel-body" style="height:300px; padding-top: 50px;"">';

			str += '<table>';
			str += '<tr>';
			str += '<td>';

			str += '<div class="panel-body">';
			str += '<div id="stationNames' + item.stationCode + '" style="width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName.gif) no-repeat; background-size:cover; margin: auto;">';

			str += '<div style="margin:auto; width : 500px;">';

			str += '<div id="upstation_real' + item.stationCode + '"';
			str += 'style="position: relative; right: -30px; top: 60px;"></div>';
			str += '<div id="getStationName' + item.stationCode + '"';
			str += 'style="position: relative; left: 205px;"></div>';
			str += '<div id="downstation_real' + item.stationCode + '"';
			str += 'style="position: relative; left: 360px; top: 15px;"></div>';
			str += '</div>';
			str += '</div>';
			str += '</div>';

			str += '</td>';

			str += '</tr>';
			str += '</table>';

			// 			혼잡도
			str += '<div style="padding-top:10px;">';
			str += '<table width="375; ">';
			str += '<td colspan="10"><center>혼잡도</center>';
			str += '<tr>';
			str += '<td>1호칸</td>';
			str += '<td>2호칸</td>';
			str += '<td>3호칸</td>';
			str += '<td>4호칸</td>';
			str += '<td>5호칸</td>';
			str += '<td>6호칸</td>';
			str += '<td>7호칸</td>';
			str += '<td>8호칸</td>';
			str += '<td>9호칸</td>';
			str += '<td>10호칸</td>';
			str += '</tr>';
			str += '<tr>';
			str += '<td id="carNum1' + item.stationCode + '"></td>';
			str += '<td id="carNum2' + item.stationCode + '"></td>';
			str += '<td id="carNum3' + item.stationCode + '"></td>';
			str += '<td id="carNum4' + item.stationCode + '"></td>';
			str += '<td id="carNum5' + item.stationCode + '"></td>';
			str += '<td id="carNum6' + item.stationCode + '"></td>';
			str += '<td id="carNum7' + item.stationCode + '"></td>';
			str += '<td id="carNum8' + item.stationCode + '"></td>';
			str += '<td id="carNum9' + item.stationCode + '"></td>';
			str += '<td id="carNum10' + item.stationCode + '"></td>';
			str += '</tr>';
			
			
			str += '<tr>';
			str += '<td colspan ="10">';
			
			
// 			조심히가세요
			
	str += '<div id="train_seat_popup'+item.stationCode+'"';
							str += 'style="position: absolute ;display: none; width: 530px; height: 300px; background: rgba(255, 255, 255, 0.7); z-index: 2; border-radius: 10px; border: 1px; border-color: #A9D0F5;">';
							str += '<div style="margin: 10px;">';
							str += '	<table>';

							str += '<tr>';
							str += '	<td colspan="3" width="400px"><img';
									str += '		src="./resources/image/menu/seat_info_bar.png"></td>';
							str += '</tr>';

							str += '<tr>';
							str += '	<td colspan="3" width="400px"><span id="seatTitle"';
													str += '		style="text-align: center; margin: auto;">열차 이름과 열차 량</span></td>';
							str += '</tr>';

							str += '<tr>';
							str += '	<td style="text-align: center;">앞 오른쪽 의자</td>';

							str += '	<td>';
							str += '&nbsp;';
							str += '</td>';
							str += '<td style="text-align: center;">뒤 오른쪽 의자</td>';
							str += '</tr>';

							str += '<tr>';
							str += '	<td><span id="trainSeat1' + item.stationCode + '"></span></td>';
							str += '	<td>';

							str += '	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
							str += '&nbsp;&nbsp;&nbsp;&nbsp;';
							str += '	</td>';
							str += '							<td><span id="trainSeat2' + item.stationCode + '"></span></td>';
							str += '		</tr>';

							str += '	<tr>';
							str += '	<td>';
							str += '		<p>&nbsp;</p>';
							str += '	</td>';

							str += '<td>';

							str += '</td>';
							str += '<td>';
							str += '	<p>&nbsp;</p>';
							str += '	</td>';
							str += '</tr>';

							str += '<tr>';
							str += '	<td style="text-align: center;">앞 왼쪽 의자</td>';
							str += '	<td>';
							str += ' &nbsp;';
							str += '</td>';
							str += '<td style="text-align: center;">뒤 왼쪽 의자</td>';
							str += '	</tr>';

							str += '		<tr>';
							str += '	<td><span id="trainSeat3' + item.stationCode + '"></span></td>';
							str += '	<td>';
							str += ' &nbsp;';
							str += '	</td>';
							str += '<td><span id="trainSeat4' + item.stationCode + '"></span></td>';
							str += '				</tr>';

							str += '	</table>';
							str += '	</div>';
							str += '	</div>';

							// 			조심히가세요

							str += '</td>';
							str += '</tr>';

							str += '<tr>';
							str += '<td id="carNumVar1' + item.stationCode + '" num = "1" class="carNumVar1"></td>';
							str += '<td id="carNumVar2' + item.stationCode + '" num = "2" class="carNumVar2"></td>';
							str += '<td id="carNumVar3' + item.stationCode + '" num = "3" class="carNumVar3"></td>';
							str += '<td id="carNumVar4' + item.stationCode + '" num = "4" class="carNumVar4"></td>';
							str += '<td id="carNumVar5' + item.stationCode + '" num = "5" class="carNumVar5"></td>';
							str += '<td id="carNumVar6' + item.stationCode + '" num = "6" class="carNumVar6"></td>';
							str += '<td id="carNumVar7' + item.stationCode + '" num = "7" class="carNumVar7"></td>';
							str += '<td id="carNumVar8' + item.stationCode + '" num = "8" class="carNumVar8"></td>';
							str += '<td id="carNumVar9' + item.stationCode + '" num = "9" class="carNumVar9"></td>';
							str += '<td id="carNumVar10' + item.stationCode + '" num = "10"  class="carNumVar10"></td>';
							str += '</tr>';
							str += '</td>';
							str += '</table>';
							str += '</div>';
							// 			혼잡도

							str += '</div>';

							str += '<div style="padding-left:215px; padding-bottom: 20px;">';
							str += '<input style="font-weight: bold;" type="button" class="btn btn-danger favoriteStations" atr1="' + item.id + '" atr2="' + item.favoriteName + '" atr3="' + item.stationCode + '"value="삭제하기" >';
							str += '</div>';
							str += '</div>';
							str += '</div>';

						});
		str += '</div>';
		$('#storedStations').html(str);
		$('.favoriteStations').on('click', deleteStation);
		subwaySensorGet();
		
		for(var i = 0; i<stationIdcode.length; i++){
		
			realtimes(stationIdName[i],stationIdcode[i],stationIdLine[i],stationIdfrCode[i], i);
		}
		
	}

	//지하철 센서 데이터 불러오기
	function subwaySensorGet() { // map 이름과 같다. 
		$.ajax({
			url : 'subwaySensorGet',
			type : 'post',
			data : {
				subwayNum : '2002' // 2호선 2002열차 
			},
			dataType : 'json',
			success : resultSubwaySensorGet
		});
	}

	//불러온 지하철 센서 데이터 결과를 출력하기
	function resultSubwaySensorGet(datas) { //10
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

		$.each(datas,function(index, items) { // arraylist로 받아서 안에 있는 VO를 사용

							var humanIndex = index + 1; // 1234...\
							carHuman = Number(items.humanNum) / 160 * 100;
							// 한칸당 인원한계는 160명이 된다 그리고 100을곱한다. 이러면 62.5 가 나옴
							carHuman = Math.round(carHuman);
							// 소수점 반올림 62 
							for (i = 0; i < stationIdcode.length; i++) {
								var inserts = '<span class = "train' + humanIndex + stationIdcode[i] + '" trainNum = "' + humanIndex + '" stationcode="'+stationIdcode[i]+'">';

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

								$('#carNum' + humanIndex + stationIdcode[i])
										.html(inserts); // carnum 1~10까지 html 자동으로 넣기
								$('#carNumVar' + humanIndex + stationIdcode[i])
										.html(insertVar); // %넣기

								$('.train' + humanIndex + stationIdcode[i])
										.mouseenter(train_popup).mouseleave(
												train_popupOut);
					
							}

						});

	}

	// 열차량당 좌석: 아래의 기능들은 좌석에 대한 위치팝업
	//var train_seat_popup = document.getElementById('train_seat_popup');

	// 열차량당 좌석: 팝업on
	function train_popup() {
		
		var trainnum = $(this).attr('trainnum');
		var getStationcode = $(this).attr('stationcode');
		
		$('#train_seat_popup'+getStationcode).css('display', 'block'); // 보이게 함 
		
		get_train_info(trainnum,getStationcode);

	}

	//열차량당 좌석: 팝업off
	function train_popupOut() {
		var getStationcode = $(this).attr('stationcode');
		$('#train_seat_popup'+getStationcode).css('display', 'none');
	

	}

	//역열차의 좌석 정보를 롤오버로 구현하느 부분
	function get_train_info(trainnum, InStationCode) {

		//	var carnum = '2'; // 열차량번호 가져오기

		var subwayNum = '2002';
		var carnum = trainnum;
		//	var carnumss = $('#carNum1').attr('trainnum');
		console.log(carnum);
		var index

		$
				.ajax({
					url : 'realTimeTrainSeat',
					type : 'post',
					data : {
						subwaynum : subwayNum,
						carnum : carnum
					},
					dataType : 'json',
					success : function(items) {
						//1 3
						//2 4
						var insert1 = ''; // 왼쪽 위
						var insert2 = ''; // 오른쪽 위
						var insert3 = ''; // 
						var insert4 = '';

						var insertTitle = subwayNum + '번호 열차의 ' + carnum
								+ '량 열차 좌석정보';
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
							
						} else if (items.elderlySeat3 == 0) { // 좌석에 사람이 없다면 
							insert1 += seatoff;
							
						} else if (items.elderlySeat3 == null) { // 좌석에 사람이 없다면 

						}
						
						$('#trainSeat1'+InStationCode).html(insert1);
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
						
						} else if (items.elderlySeat6 == 0) { // 좌석에 사람이 없다면 
							insert2 += seatoff;
						
						} else if (items.elderlySeat6 == null) { // 좌석에 사람이 없다면 

						}
						
						$('#trainSeat3'+InStationCode).html(insert2);
						// 3 end

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
							
						} else if (items.elderlySeat9 == 0) { // 좌석에 사람이 없다면 
							insert3 += seatoff;
						} else if (items.elderlySeat9 == null) { // 좌석에 사람이 없다면 

						}
							$('#trainSeat2'+InStationCode).html(insert3);
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
					
						} else if (items.elderlySeat12 == 0) { // 좌석에 사람이 없다면 
							insert4 += seatoff;
							
						} else if (items.elderlySeat12 == null) { // 좌석에 사람이 없다면 

						}
						$('#trainSeat4'+InStationCode).html(insert4);
						$('#seatTitle').html(insertTitle);

					}
				});

	}

	// 선택한 즐겨찾기 역 삭제
	function deleteStation() {
		//console.log('delete동작');
		//alert("삭제 실행");
		var id = $(this).attr('atr1');
		var stationName = $(this).attr('atr2');
		var stationCode = $(this).attr('atr3');
		//alert("삭제할 역정보: "+id+" / "+stationName+" / "+stationCode);
		$.ajax({
			url : 'deleteStation',
			type : 'post',
			data : {
				id : id,
				favoriteName : stationName,
				stationCode : stationCode
			},
			dataType : 'json',
			success : function(data) {
				//alert("삭제가 성공하였습니다.");
				printFavoriteStations(data);
			}
		});
	}

	//개인정보 수정 동작
	function modifyPersonInfo() {
		console.log('개인정보 수정 동작');
	}
	
	
	// 실시간 열차 
	var stationRealCode = new Array();
	var stationRealName = new Array();
	var stationRealLine = new Array();
	var stationRealFcode = new Array();
	function realtimes(fNames, code, subwayLine, fcode , i) {
		
		stationRealCode[i] = code;
		stationRealName[i] = fNames;
		stationRealLine[i]  =subwayLine ;
		stationRealFcode[i] = fcode;
		
		$.ajax({
			url : 'realTime',
			type : 'post',
			data : {
				station : fNames,
				index : i
			},
			dataType : 'json',
			success : resultRealTime,
			error: function () {
				
		}
		});
	}

	function resultRealTime(result) { // 실시간 지하철 상하행선 도착
		var nowCode = '';
	
		var resultjson = result.resultjson;
		var jsonFile = JSON.parse(resultjson);
	
		$.each(jsonFile.realtimeArrivalList, function(index, items) {
			nowCode = items.statnId.substr(7, 3); // 역외코드 

			//console.log(nowCode);
			//console.log(items.arvlMsg2);
			//console.log(stationRealFcode);
			if (nowCode == stationRealFcode[result.arraynum]) { 
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
				$('#getStationName'+stationRealCode[result.arraynum]).html('<strong>' + stationRealLine[result.arraynum] + '호선 ' + stationRealName[result.arraynum] + '</strong>');
				// 역 이름을 넣어준다. 역 이름은 호선과 역 이름을 입력한다.	
				
				if ( list== '01') { // 
					$('#upstation_real'+stationRealCode[result.arraynum]).text(items.arvlMsg2);
				}
				if (list == '11') {
					$('#downstation_real'+stationRealCode[result.arraynum]).text(items.arvlMsg2);
				}
				
				
				
			}

		});
		
		lineGifChange(stationRealCode[result.arraynum], stationRealLine[result.arraynum]); // 백 패널의 이미지를 교체한다.
	}
	
	function lineGifChange(code, line) {
		//라인에 따른 백그라운드 역 실시간 시간판 교체
		console.log("stationRealCode: "+code);
		if (line == '1') { // 호선
			$('#stationNames'+code).css('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName1.gif) no-repeat; background-size:96% 100%;');
		} else if (line == '2') {
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName2.gif) no-repeat; background-size:96% 100%;');
		} else if (line == '3') {
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName3.gif) no-repeat; background-size:96% 100%;');
		} else if (line == '4') {
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName4.gif) no-repeat; background-size:96% 100%;');
		} else if (line == '5') {
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName5.gif) no-repeat; background-size:96% 100%;');
		} else if (line == '6') {
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName6.gif) no-repeat; background-size:96% 100%;');
		} else if (line == '7') {
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName7.gif) no-repeat; background-size:96% 100%;');
		} else if (line == '8') {
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName8.gif) no-repeat; background-size:96% 100%;');
		} else if (line == '9') {
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName9.gif) no-repeat; background-size:96% 100%;');
		} else if (line == 'S') { // 신분당선
			$('#stationNames'+code).attr('style', 'width :480px;height: 84px;background: url(./resources/image/lineBack/subwayStationName9.gif) no-repeat; background-size:96% 100%;');
		}

	}
	
	
</script>

</head>
<body>
	<!--top header-->
	<jsp:include page="header.jsp" />
	<!--top header-->

	<!-- 디자인 바  -->
	<div class="progress" style="position: relative; top: -23px;">
		<div class="progress-bar progress-bar-success" style="width: 35%"></div>
		<div class="progress-bar progress-bar-warning" style="width: 20%"></div>
		<div class="progress-bar progress-bar-danger" style="width: 10%"></div>
	</div>
	<!-- 디자인 바  -->



	<!-- 	내부 div 창 하얀배경  -->

	<div
		style="margin: 50px; margin-bottom:200px; overflow: none; background: rgba(255, 255, 255, 0.85); border-radius: 30px;"
		class="first ">



		<div
			style="margin: 25px; padding-top: 20px; padding-bottom: 20px; float: left;">

			<!--메뉴바-->
			<jsp:include page="Member/menu.jsp" />
			<!--메뉴바-->

			<div style="width: 800px; float: left;">
				<div style="width: 45%; float: left;">
					<div class="jumbotron"
						style="background: rgba(255, 255, 255, 0); padding-top: 30px;">
						<h1>My Favorite</h1>
						<p style="font-weight: bolder;">자주 이용하는 역을 추가하세요.</p>
					</div>
				</div>

				<div
					style="width: 430px; float: left; margin-right: 10px; height: 350px; padding-bottom: 0px;"
					class="float">
					<div class="panel-body">

						<div class="form-group">

							<div class="col-lg-10"
								style="padding-top: 0px; padding-left: 0px; padding-right: 0px; width: 430px;"">
								<label for="inputEmail" class="col-lg-2 control-label" id="add1"
									style="padding-top: 10px; padding-left: 0px; padding-right: 0px; font-size: 15px; font-weight: bold;">추가할역</label>
								<div style="display: -webkit-inline-box;">
									<input type="text" class="form-control" id="searchStation"
										placeholder="역 이름을 입력해 주세요"> <input type="button"
										id="searchStations" class="btn btn-success"
										style="font-weight: bold;" value="검색하기">
								</div>
							</div>
							<div class="col-lg-10"
								style="padding-top: 5px; padding-left: 0px;">
								<!-- 검색한 역을 추가 (아름이 중복되거나 여러가지 경우가 있으므로 ) -->
								<br> <select multiple="" class="form-control"
									style="width: 380px;">

								</select>
								<!-- 검색한 역을 추가 (아름이 중복되거나 여러가지 경우가 있으므로 ) -->
							</div>


						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2"
								style="padding-top: 10px; padding-left: 60px;">
								<button type="reset" class="btn btn-default" id="newFavorite"
									style="font-weight: bold;">초기화</button>
								<a href="javascript:newFavorite()" class="btn btn-success"
									id="newFavorite" style="font-weight: bold;"> 등록하기</a>
							</div>
						</div>
					</div>
				</div>

				<!-- 이 부분은 개인정보에 대한 페이지 -->

				<!-- 등록한 즐겨찾기 부분이 출력되는 부분  -->



			</div>
		</div>
		
		
		
				<div style="float: left; padding-top: 0px; margin-left: 80px;">
					<div id="storedStations"></div>
				</div>
		
	</div>
	<!-- 등록한 즐겨찾기 부분이 출력되는 부분  -->

	</div>
	</div>
	</div>



	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
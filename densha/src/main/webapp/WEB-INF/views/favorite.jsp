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
	background: url(./resources/image/back/backapi.jpg) no-repeat center
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

	//불러온 즐겨찾기 리스트 출력하기
	function printFavoriteStations(favoriteLists) {
		var str = '';
		str += '<div>';
		$.each(favoriteLists, function(index, item) {
			var lineColor = '';
			console.log("으으아" + item.line);
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


			str += '<div id="' + item.stationCode + '"';
			if (index % 2 == 0 && index != 0) {
				str += ' style="clear: left; float: left; margin-right: 60px; width=2000px; ">';
			} else {
				str += 'style="float: left; margin-right: 60px; width=2000px;" >';
			}

			str += '<div class="panel panel-default">';
			str += '<h3 class="col-lg-12 panel-heading" style=" background-color: ' + lineColor + '; margin-top: 0px;  font-size: 25px; font-weight: bold; color: white;">' + item.line + '호선 ' + item.favoriteName + '</h3>';
			str += '<div class="panel-body" style="height:300px; padding-top: 50px;"">';

			str += '<table>';
			str += '<tr>';
			str += '<td>';

			str += '<div class="panel-body">';
			str += '<div class="stationNames" style="width : 500px;height: 84px;background: url(./resources/image/lineBack/subwayStationName.gif) no-repeat; margin: auto;">';
			
			str += '<div style="margin:auto; width : 500px;">';
			
			str += '<div class="upstation_real"';
			str += 'style="position: relative; right: -30px; top: 60px;"></div>';
			str += '<div class="getStationName"';
			str += 'style="position: relative; left: 205px;"></div>';
			str += '<div class="downstation_real"';
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
			str += '<td class="carNum1"></td>';
			str += '<td class="carNum2"></td>';
			str += '<td class="carNum3"></td>';
			str += '<td class="carNum4"></td>';
			str += '<td class="carNum5"></td>';
			str += '<td class="carNum6"></td>';
			str += '<td class="carNum7"></td>';
			str += '<td class="carNum8"></td>';
			str += '<td class="carNum9"></td>';
			str += '<td class="carNum10"></td>';
			str += '</tr>';
			str += '</td>';
			str += '</table>';
			str += '</div>';
// 			혼잡도


		

			str += '</div>';
			
			str += '<div style="padding-left:190px; padding-bottom: 20px;">';
			str += '<input style="font-weight: bold;" type="button" class="btn btn-danger favoriteStations" atr1="' + item.id + '" atr2="' + item.favoriteName + '" atr3="' + item.stationCode + '"value="삭제하기" >';
			str += '</div>';
			str += '</div>';
			str += '</div>';
		});
		str += '</div>';
		$('#storedStations').html(str);
		$('.favoriteStations').on('click', deleteStation);
		subwaySensorGet();
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
				
// 				insertVar += items.humanNum + '명 <br>';
// 				insertVar += carHuman + '%';
				console.log(inserts);
				$('#carNum' + humanIndex).html(inserts); // carnum 1~10까지 html 자동으로 넣기
// 				$('#carNumVar' + humanIndex).html(insertVar); // %넣기
				
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
		style="margin: 50px; overflow: auto; background: rgba(255, 255, 255, 0.85); border-radius: 30px;"
		class="first ">



		<div
			style="margin: 25px; padding-top: 20px; padding-bottom: 20px; float: left;">

			<!--메뉴바-->
			<jsp:include page="Member/menu.jsp" />
			<!--메뉴바-->

			<div style="width: 80%; float: left;">
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
				<div style="float: left; width: 950px; padding-top: 30px;">
					<div id="storedStations"></div>
				</div>
				<!-- 등록한 즐겨찾기 부분이 출력되는 부분  -->

			</div>
		</div>
	</div>
	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
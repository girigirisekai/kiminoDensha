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
	overflow : hidden;
}

</style>

<script type="text/javascript">
	
	$(document).ready(function() {
		//검색 버튼 동작 실행 메소드 설정
		$('#searchStations').on('click', searchStation);
		//검색input태그의 id속성=searchStation, 엔터 키 누를 시 searchStation()메소드 실행
		$('#searchStation').keypress(function(event){
			if(event.which==13){
				searchStation();
				return false;
			}
		});
		//새로운 즐겨찾기 추가 버튼 동작 실행 메소드 설정
		$('#newFavorite').on('click', newFavorite);
		//지하철의 센서 데이터 가져오기
		subwaySensorGet();
		//현재 아이디의 즐겨찾기 목록 불러오기
		searchFavoriteList();
	});
	
	//현재아이디의 즐겨찾기 목록 불러오기 메소드
	function searchFavoriteList(){
		//alert('불러오기 실행');
		$.ajax({
			url : 'searchFavoriteList',
			type : 'post',
			dataType : 'json',
			/* complete : function(data){
				console.log(data);
 				printFavoriteStations(data.responseJSON);
			} */
				
			success: function(data) {
				//alert('불러오기성공');
 				printFavoriteStations(data);
			},
			error: function(data) {
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
			success: function(data) {
				//alert("등록이 성공하였습니다.");
				printFavoriteStations(data);
			}
		});
	}
	
	//불러온 즐겨찾기 리스트 출력하기
	function printFavoriteStations(favoriteLists){
		//alert('리스트 출력 실행');
		var str='';
		$.each(favoriteLists, function(index, item){
			str+='<div id='+item.stationCode;
			str+='style="float: left; margin-right: 20px; width: 520px; height: 320px;">';
			str+='<div class="panel panel-default">';
			str+='<div class="panel-heading">';
			str+='<div class="col-lg-12">';
			str+='<h3>'+item.favoriteName+'</h3>';
			str+='</div>';				
			str+='</div>';
			str+='<div class="panel-body">';
			str+='<table>';
			str+='<tr>';				
			str+='<td>실시간 열차</td>';
			str+='</tr>';
			str+='<tr>';				
			str+='<td>열차 량 상황</td>';						
			str+='</tr>';
			str+='</table>';
			str+='<table>';
			str+='<tr>';			
			str+='<td>';			
			str+='<table>';					
			str+='<tr>';						
			str+='<td>실시간 열차</td>';							
			str+='</tr>';								
			str+='<tr>';							
			str+='<td><table width="450">';							
			str+='<td colspan="12"><center>혼잡도</center></td>';								
			str+='<tr>';										
			str+='<td>1호칸</td>';										
			str+='<td>2호칸</td>';
			str+='<td>3호칸</td>';
			str+='<td>4호칸</td>';
			str+='<td>5호칸</td>';
			str+='<td>6호칸</td>';
			str+='<td>7호칸</td>';
			str+='<td>8호칸</td>';
			str+='<td>9호칸</td>';
			str+='<td>10호칸</td>';
			str+='</tr>';
			str+='<tr>';										
			str+='<td id="carNum1"></td>';
			str+='<td id="carNum2"></td>';
			str+='<td id="carNum3"></td>';
			str+='<td id="carNum4"></td>';
			str+='<td id="carNum5"></td>';
			str+='<td id="carNum6"></td>';
			str+='<td id="carNum7"></td>';
			str+='<td id="carNum8"></td>';
			str+='<td id="carNum9"></td>';
			str+='<td id="carNum10"></td>';
			str+='</tr>';
			str+='</table>';										
			str+='</td>';												
			str+='</tr>';										
			str+='</table>';
			str+='</td>';											
			str+='</tr>';													
			str+='</table>';								
			str+='</div>';						
			str+='<input type="button" class="btn btn-danger favoriteStations"  atr1="'+item.id+'" atr2="'+item.favoriteName+'" atr3="'+item.stationCode+'" value="삭제하기"';	 					
			str+='</div>';		
			str+='</div>';
		});
		$('#storedStations').html(str); 
		$('.favoriteStations').on('click', deleteStation);
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
		$.each(datas, function(index, items) {
			var humanIndex = index + 1;
			var human = items.humanNum;
			console.log(human);
			$('#carNum' + humanIndex).text(human);
		});
	}

	// 선택한 즐겨찾기 역 삭제
	function deleteStation(){
		//console.log('delete동작');
		//alert("삭제 실행");
		var id=$(this).attr('atr1');
		var stationName=$(this).attr('atr2');
		var stationCode=$(this).attr('atr3');
		//alert("삭제할 역정보: "+id+" / "+stationName+" / "+stationCode);
		$.ajax({
			url : 'deleteStation',
			type : 'post',
			data : {
				id: id,
				favoriteName: stationName,
				stationCode: stationCode
				},
			dataType : 'json' ,
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

	<div style="margin: 50px; background: rgba(255, 255, 255, 0.85);"
		class="first">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">

			<div class="jumbotron" style=" background: rgba(255, 255, 255, 0);">
				<h1>My Favorite</h1>
				<p>자주 이용하는 역을 추가하세요.</p>
			</div>
			
			
			<!-- 이 부분은 개인정보에 대한 페이지 -->

			<div style="width: 500px; float: left; margin-right: 30px;"
				class="float">

				<div class="panel panel-warning ">
					<div class="panel-heading">
						<h3 class="panel-title">개인정보 페이지</h3>
					</div>
					<div class="panel-body ">


						<table>
							<tr>
								<td width="100">사진</td>
							</tr>
							<tr>
								<td>사진을 넣으세요</td>
							</tr>

						</table>

						<table>
							<tr>
								<td width="60">사용자</td>
								<td width="160">${loginId}</td>
							</tr>
							<tr>
								<td>현재 저정된 역 정보</td>
								<td><c:forEach items="${favoriteLists}" var="station">
						${station.favoriteName} 
						</c:forEach></td>
							</tr>

						</table>
						<a href="myaccount" class="btn btn-info">개인정보 수정하기</a>
					</div>
				</div>
			</div>




		

			<div class="panel panel-default"
				style="width: 550px; height: 320px; float: left;"  class = "float" >
				<div class="col-lg-12 ">
					<h3>역 추가하기</h3>
				</div>

				<div class="panel-body">

					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">추가할 역</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="searchStation"
								placeholder="역 이름을 입력해 주세요"> 
								<!--  <a href="javascript:searchStation()" class="btn btn-success">검색하기</a> -->
								<input type="button" id="searchStations" class="btn btn-success" value="검색하기">
						</div>
						<div class="col-lg-10">
							<!-- 검색한 역을 추가 (아름이 중복되거나 여러가지 경우가 있으므로 ) -->
							<br> <select multiple="" class="form-control">

							</select>
							<!-- 검색한 역을 추가 (아름이 중복되거나 여러가지 경우가 있으므로 ) -->
						</div>


					</div>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<button type="reset" class="btn btn-default" id="newFavorite">초기화</button>
							<a href="javascript:newFavorite()" class="btn btn-success"
								id="newFavorite"> 등록하기</a>
						</div>
					</div>
				</div>
			</div>
			<div id='storedStations'></div>
		</div>
	</div>

	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
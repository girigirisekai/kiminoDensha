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

.clearfix:after {
    content: ".";              /* the period is placed on the page as the last thing before the div closes */
    display: block;          /* inline elements don't respond to the clear property */ 
    height: 0;                  /* ensure the period is not visible */
    clear: both;               /* make the container clear the period */
    visibility: hidden;      /* further ensures the period is not visible */
}
 
.clearfix {display: inline-block;}   /* a fix for IE Mac */
 

.clearfix {height: 1%;}
.clearfix {display: block;}


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
		//subwaySensorGet();
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
				$('.form-control').html('');
				$('#searchStation').val('');
			}
		});
	}
	
	//불러온 즐겨찾기 리스트 출력하기
	function printFavoriteStations(favoriteLists){
		subwaySensorGet();
		//alert('리스트 출력 실행');
		
		
		
		var str='';
		str+='<div>';
		$.each(favoriteLists, function(index, item){
			
			str+='<div id="'+item.stationCode+'"';
		 	if(index%2==0 && index!=0){
				str+=' style="clear: left; float: left; margin-right: 60px; width=2000px; ">';	
			}
			else{
				str+='style="float: left; margin-right: 60px; width=2000px;" >';	
			} 
			
			str+=	'<div class="panel panel-default">';
 			str+=			'<h3 class="col-lg-12 panel-heading" style=" background-color: red; margin-top: 0px;  font-size: 25px; font-weight: bold; color: white;">'+item.favoriteName+'</h3>';				
			str+=		'<div class="panel-body" style="height:300px; padding-top: 100px;"">';
			str+=			'<table>';
			str+=				'<tr>';				
			str+=					'<td>실시간 열차</td>';
			str+=				'</tr>';
			str+=				'<tr>';				
			str+=					'<td>열차 량 상황</td>';						
			str+=				'</tr>';
			str+=			'</table>';
			str+=			'<table>';
			str+=				'<tr>';			
			str+=					'<td>';			
			str+=						'<table >';					
			str+=							'<tr>';						
			str+=								'<td>실시간 열차</td>';							
			str+=							'</tr>';								
			str+=							'<tr>';							
			str+=								'<td>';
			str+=								'<div style="padding-top:30px;">';
			str+=								'<table width="375; ">';	
			str+=									'<td colspan="10"><center>혼잡도</center>';								
			str+=									'<tr>';										
			str+=										'<td>1호칸</td>';										
			str+=										'<td>2호칸</td>';
			str+=										'<td>3호칸</td>';
			str+=										'<td>4호칸</td>';
			str+=										'<td>5호칸</td>';
			str+=										'<td>6호칸</td>';
			str+=										'<td>7호칸</td>';
			str+=										'<td>8호칸</td>';
			str+=										'<td>9호칸</td>';
			str+=										'<td>10호칸</td>';
			str+=									'</tr>';
			str+=									'<tr>';										
			str+=										'<td class="carNum1"></td>';
			str+=										'<td class="carNum2"></td>';
			str+=										'<td class="carNum3"></td>';
			str+=										'<td class="carNum4"></td>';
			str+=										'<td class="carNum5"></td>';
			str+=										'<td class="carNum6"></td>';
			str+=										'<td class="carNum7"></td>';
			str+=										'<td class="carNum8"></td>';
			str+=										'<td class="carNum9"></td>';
			str+=										'<td class="carNum10"></td>';
			str+=									'</tr>';
			str+=									'</td>';	
			str+=								'</table>';
			str+=								'</div>';
			str+=								'</td>';																			
			str+=							'</tr>';										
			str+=						'</table>';
			str+=					'</td>';											
			str+=				'</tr>';													
			str+=			'</table>';								
			str+=		'</div>';
			str+=		'<div style="padding-left:190px; padding-bottom: 20px;">';
			str+=			'<input style="font-weight: bold;" type="button" class="btn btn-danger favoriteStations" atr1="'+item.id+'" atr2="'+item.favoriteName+'" atr3="'+item.stationCode+'"value="삭제하기" >';	 					
			str+=		'</div>';
			str+=	'</div>';		
			str+='</div>';
		});
		str+='</div>';
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
			$('.carNum' + humanIndex).text(human);
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
<body >
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

	<div style="margin: 50px; overflow: auto; background: rgba(255, 255, 255, 0.85); border-radius: 30px;"
		class="first ">
		
		
		
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px; float: left; ">

	<!--메뉴바-->
	<jsp:include page="Member/menu.jsp" />
	<!--메뉴바-->

		<div style="width: 80%; float: left;">

			<div class="jumbotron" style=" background: rgba(255, 255, 255, 0); padding-top: 30px; ">
				<h1 >My Favorite</h1>
				<p style="font-weight: bolder;">자주 이용하는 역을 추가하세요.</p>
			</div>
			 
			
			<!-- 이 부분은 개인정보에 대한 페이지 -->

			<div style="float: left; height: 400px; width: 400px;  margin-right: 60px; padding-bottom: 100px;"
				class="float" >

				<div class="panel panel-warning" style=" height: 400px;">
					<div class="panel-heading">
						<h3 class="panel-title" style="padding-top: 10px; padding-bottom: 10px; font-size: 20px; font-weight: bold;">개인정보 페이지</h3>
					</div>
					<div class="panel-body">
						<table>
							<tr>
								<td width="60" style="padding-bottom: 30px; padding-top: 70px; padding-left: 30px; padding-right: 0px; text-align: center; font-weight: bold; font-size: 15px;">사용자</td>
								<td width="160" style="padding-bottom: 30px; padding-top: 70px; padding-left: 70px; padding-right: 0px; text-align: center; font-weight: bold; font-size: 20px;"><textarea>${loginId}</textarea></td>
							</tr>
							<tr >
								<td style="padding-bottom: 3px; padding-top: 40px; padding-left: 30px; padding-right: 0px; text-align: center; text-align: center; font-weight: bold; font-size: 15px;">저장된 역 정보</td>
								<td style="padding-bottom: 3px; padding-top: 40px; padding-left: 70px; padding-right: 0px; text-align: center; text-align: center; font-weight: bold; font-size: 20px;">
									<!-- 고쳐야됌  -->
									<c:forEach items="${favoriteLists}" var="station">
										${station.favoriteName}
									</c:forEach>
								</td>
							</tr>
						</table>					
					</div>
					<div style="padding-left: 180px; padding-top: 25px; padding-bottom: 10px; ">
						<a href="myaccount" class="btn btn-info" style="font-weight: bold;" >개인정보 수정</a>
					</div>
				</div>
				
			</div>


			<div class="panel panel-default "
				style="width: 380px; float: left; margin-right: 30px; height: 400px; padding-bottom: 100px; " class = "float" >
				<div class="panel-heading" style="background-color: green;">
					<h3 class="panel-title" style="padding-top: 10px; padding-bottom: 10px;  padding-left:0px; padding-right:10px;  color:white; font-size: 20px; font-weight: bold;">역 추가하기</h3>
				</div>

				<div class="panel-body">

					<div class="form-group" >
						<label for="inputEmail" class="col-lg-2 control-label" style="padding-top: 30px; padding-left: 0px; padding-right:10px; font-size: 15px; font-weight: bold;">추가할 역</label>
						<div class="col-lg-10" style="padding-top: 10px; padding-left: 0px; padding-right: 0px; ">
							<input type="text" class="form-control" id="searchStation" placeholder="역 이름을 입력해 주세요"> 
							<input type="button" id="searchStations" class="btn btn-success" style="font-weight: bold;" value="검색하기">
						</div>
						<div class="col-lg-10" style="padding-top: 5px; padding-left: 0px; " >
							<!-- 검색한 역을 추가 (아름이 중복되거나 여러가지 경우가 있으므로 ) -->
							<br> <select multiple="" class="form-control">

							</select>
							<!-- 검색한 역을 추가 (아름이 중복되거나 여러가지 경우가 있으므로 ) -->
						</div>


					</div>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2" style="padding-top: 60px; padding-left: 60px;" >
							<button type="reset" class="btn btn-default" id="newFavorite" style="font-weight: bold;" >초기화</button>
							<a href="javascript:newFavorite()" class="btn btn-success" id="newFavorite" style="font-weight: bold;" > 등록하기</a>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 등록한 즐겨찾기 부분이 출력되는 부분  -->
			<div style="float: left; width: 3000px; padding-top: 30px;">
				<div id="storedStations"></div>
			</div>
			
		</div>
	</div>
</div>
	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
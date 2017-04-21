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
<script type="text/javascript">

	$(document).ready(function() {

		$('#newFavorite').on('click', newFavorite);
		subwaySensorGet();
	});

	function nowStationsTrainInfo(){}
	
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

	// 새로운 역 더하기
	function newFavorite() {
		var stationName = $('.form-control option:selected').val(); // 선택된 이름

		$.ajax({
			url : 'newFavorite',
			type : 'post',
			dataType : 'text',
			data : {
				statioNameAndLine : stationName
			},
			success : function() {
				alert("등록이 성공하였습니다.");
			// 			 	이 부분은 나중에 modal로 교체하시길
			}
		});
	}
	
	function subwaySensorGet(){ // map 이름과 같다. 
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
	
	function resultSubwaySensorGet (datas){
		$.each(datas, function(index,items){
			var humanIndex = index+1;
			var human = items.humanNum;
			console.log(human);
			$('#carNum'+humanIndex).text(human);		
		});
	}

	// 역 삭제, DB 삭제와 동시에 역 동시 삭제 
	function deleteStation() {
		console.log('delete동작');

	}

	// 역 삭제, DB 삭제와 동시에 역 동시 삭제 
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
	<div class="progress" style="position: relative; top: -22px;">
		<div class="progress-bar progress-bar-success" style="width: 35%"></div>
		<div class="progress-bar progress-bar-warning" style="width: 20%"></div>
		<div class="progress-bar progress-bar-danger" style="width: 10%"></div>
	</div>
	<!-- 디자인 바  -->

	<!-- 이 부분은 개인정보에 대한 페이지 -->
	<div
		style="width: 500px; height: 400px; position: absolute; top: 80px; left: 2%;">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h3 class="panel-title">개인정보 페이지</h3>
			</div>
			<div class="panel-body">
				DB단에 연결해 주셈

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
				<a href="updateMember" class="btn btn-info">개인정보 수정하기</a>
			</div>
		</div>
	</div>
	<!-- 이 부분은 개인정보에 대한 페이지 -->

	<!-- 	새로운 역 저장 페이지  -->

	<div class="panel panel-default"
		style="width: 550px; height: 320px; position: absolute; top: 80px; left: 45%;">
		<div class="col-lg-12">
			<h3>역 추가하기</h3>
		</div>

		<div class="panel-body">

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">추가할 역</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="searchStation"
						placeholder="역 이름을 입력해 주세요"> <a
						href="javascript:searchStation()" class="btn btn-success">검색하기</a>
				</div>
				<div class="col-lg-10">
					<!-- 					검색한 역을 추가 (아름이 중복되거나 여러가지 경우가 있으므로 ) -->
					<br> <select multiple="" class="form-control">

					</select>
					<!-- 					검색한 역을 추가 (아름이 중복되거나 여러가지 경우가 있으므로 ) -->
				</div>


			</div>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="reset" class="btn btn-default" id="newFavorite">초기화</button>
					<a href="javascript:newFavorite()" class="btn btn-success"
						id="newFavorite"> 등록하기</a>
					<!-- 					<input type="button" class="btn btn-primary" id = "newFavorite">등록하기</button> -->
				</div>
			</div>
		</div>

	</div>
	<!-- 	새로운 역 저장 페이지  -->

	<!-- 		저장된 역 div로 보이기  -->
	<div style="padding: 20px; position: relative; top: 280px;">

		<c:forEach items="${favoriteLists}" var="station">

			<div class="panel panel-default" style="position: relative;">
				<div class="panel-heading">
					<div class="col-lg-12">
						<!-- 					역이름 -->
						<h3>${station.favoriteName}</h3>
					</div>
					<!-- 				(CSS로 색상을 해야 할수도 있음) -->
				</div>
				<div class="panel-body">

					<table>
						<tr>
							<td>

								<table>
									<tr>
										<td>실시간 열차</td>
									</tr>
									<tr>
										<td><table width="450">
												<td colspan="12"><center>혼잡도</center></td>
												<tr>
													<td>1호칸</td>
													<td>2호칸</td>
													<td>3호칸</td>
													<td>4호칸</td>
													<td>5호칸</td>
													<td>6호칸</td>
													<td>7호칸</td>
													<td>8호칸</td>
													<td>9호칸</td>
													<td>10호칸</td>
												</tr>
												<tr>
													<td id="carNum1"></td>
													<td id="carNum2"></td>
													<td id="carNum3"></td>
													<td id="carNum4"></td>
													<td id="carNum5"></td>
													<td id="carNum6"></td>
													<td id="carNum7"></td>
													<td id="carNum8"></td>
													<td id="carNum9"></td>
													<td id="carNum10"></td>

												</tr>
											</table></td>
									</tr>
								</table>

							</td>
							<td>

								<table>
									<tr>
										<td>실시간 열차</td>
									</tr>
									<tr>
										<td>열차 량 상황</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				<a href="javascript:deleteStation()" class="btn btn-danger">삭제하기</a>
			</div>
		</c:forEach>

	</div>

	<!-- 		저장된 역 div로 보이기  -->
	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
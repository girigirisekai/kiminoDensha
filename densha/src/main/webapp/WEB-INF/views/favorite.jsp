<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨찾기</title>
<script src="resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript">

	$(document).ready(function() {});
	
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
	
	// 역 삭제, DB 삭제와 동시에 역 동시 삭제 
	function deleteStation(){
		console.log('delete동작');
		
	}
	
	// 역 삭제, DB 삭제와 동시에 역 동시 삭제 
		function modifyPersonInfo(){
			console.log('개인정보 수정 동작');
			
		}
</script>
</head>
<body>
	<!--top header-->
	<header id="home">

<!-- 		<section class="top-nav hidden-xs"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<div class="top-left"> -->

<!-- 							<ul> -->
<!-- 								<li><a href="#"><i class="fa fa-facebook" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-twitter" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-linkedin" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-vk" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-instagram" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 							</ul> -->

<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="col-md-6"> -->
<!-- 						<div class="top-right"> -->
<!-- 							<p> -->
<!-- 								Location:<span>Main Street 2020, City 3000</span> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->

		<!--main-nav-->

		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">브랜드</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#home">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="join">회원가입</a></li>
        <li><a href="stationcode">지하철서비스</a></li>
        <li><a href="favorite">Favorite</a></li>
        	<li><a href="board">게시판</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">제공 서비스 안내<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#service">서비스</a></li>
            <li><a href="#portfolio">API제공 서비스</a></li>
<!--             <li><a href="#">Something else here</a></li> -->
<!--             <li class="divider"></li> -->
<!--             <li><a href="#">Separated link</a></li> -->
<!--             <li class="divider"></li> -->
<!--             <li><a href="#">One more separated link</a></li> -->
          </ul>
        </li>
      </ul>
<!--       <form class="navbar-form navbar-left" role="search"> -->
<!--         <div class="form-group"> -->
<!--           <input type="text" class="form-control" placeholder="Search"> -->
<!--         </div> -->
<!--         <button type="submit" class="btn btn-default">Submit</button> -->
<!--       </form> -->
       <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<div class="col-md-12">
<!-- 								Login via -->
<!-- 								<div class="social-buttons"> -->
<!-- 									<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a> -->
<!-- 									<a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a> -->
<!-- 								</div> -->
<!--                                 or -->
								 <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <label class="sr-only" for="exampleInputEmail2">ID를 입력해주세요</label>
											 <input type="text" class="form-control" id="loginId" name="loginId" placeholder="id" required>
										</div>
										<div class="form-group">
											 <label class="sr-only" for="exampleInputPassword2">Password</label>
											 <input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="Password" required>
                                             <div class="help-block text-right"><a href="forgotpassword">암호를 잊어버리셨나요?</a></div>
										</div>
										<div class="form-group">
											 <button type="submit" class="btn btn-primary btn-block">Login</button>
										</div>
<!-- 										<div class="checkbox"> -->
<!-- 											 <label> -->
<!-- 											 <input type="checkbox"> keep me logged-in -->
<!-- 											 </label> -->
										</div>
								 </form>
							</div>
							<div class="bottom text-center">
								새롭게 오셨나요? <a href="join"><b>Join Us</b></a>
							</div>
					 </div>
				</li> 
			</ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

	</header>
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
						<td width="60">이름</td>
						<td width="160"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td></td>
					</tr>
					<tr>
						<td>현재 저정된 역 정보</td>
						<td></td>
					</tr>

				</table>
				<a href="" class="btn btn-info">개인정보 수정하기</a>
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
						placeholder="역 이름을 입력해 주세요" > <a
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
					<!-- 						<button type="reset" class="btn btn-default">초기화</button> -->
					<button type="submit" class="btn btn-primary">등록하기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 	새로운 역 저장 페이지  -->

	<!-- 		저장된 역 div로 보이기  -->
	<div style="padding: 20px; position: relative; top: 280px;">
		<div class="panel panel-default" style="position: relative;">
			<div class="panel-heading">
				<div class="col-lg-12">
					<h3>역 이름 과 호선</h3>
				</div>
				(CSS로 색상을 해야 할수도 있음)
			</div>
			<div class="panel-body">역 정보 넣기</div>
			<a href="javascript:deleteStation()" class="btn btn-danger">삭제하기</a>
		</div>
		
		<div class="panel panel-default" style="position: relative;">
			<div class="panel-heading">
				<div class="col-lg-12">
					<h3>역 이름 과 호선</h3>
				</div>
				(CSS로 색상을 해야 할수도 있음)
			</div>
			<div class="panel-body">역 정보 넣기</div>
			<a href="javascript:deleteStation()" class="btn btn-danger">삭제하기</a>
		</div>

		

	</div>

	<!-- 		저장된 역 div로 보이기  -->
	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
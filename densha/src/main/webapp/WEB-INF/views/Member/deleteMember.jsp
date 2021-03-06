<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원탈퇴</title>
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/css/flexslider.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/style.css">
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="./resources/js/function.js"></script>
<script>

	$(document).ready(function() {
	$('#btDelete').on('click',DeleteFirst);
	});
	
	function DeleteFirst() {
		alert('어레?');
		var id1 = '${loginId}';
		var delete1 = $('#deleteText').val();
		alert(id1);
		alert(delete1);
		$.ajax({
			url : 'selectId1',
			type : 'post',
			data : {
				'id' : id1,
				'password' : delete1
			},
			dataType : 'json',
			success : function(ob) {
				deleteBt(ob);
			},
			error : function(e) {
				alert(JSON.stringify(e));
			}
		});
	}
	function deleteBt(resp) {
		var str = "";
		str += "2번째 비밀번호를 입력해 주세요<br>";
		str += resp.question + "<br>";
		str += "<input text='text' id='checkPw' name='checkPw'><br>";
		str += "<input type='button' id='deleteMemberBt' value='삭제완료'>";
		$('#checkDelete').html(str);
		$('#deleteMemberBt').on('click', DeleteMember);
	}
	function DeleteMember() {
		alert('버튼확인');
		var id = '${loginId}';
		var answer = $('#checkPw').val();
		alert('어레?');
		alert(id);
		alert(answer);
		$.ajax({
			url : 'deleteMember',
			type : 'post',
			data : {
				'id' : id,
				'answer' : answer
			},
			success : function(ob) {
				if (ob == 1) {
					alert('삭제완료');
				}
			}
		});
	}
</script>
</head>
<body>

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
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">브랜드</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#home">Home <span
								class="sr-only">(current)</span></a></li>
						<li><a href="join">회원가입</a></li>
						<li><a href="stationcode">지하철서비스</a></li>
						<li><a href="favorite">Favorite</a></li>
						<li><a href="board">게시판</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#service">서비스</a></li>
								<li><a href="#portfolio">API제공 서비스</a></li>
								<!--             <li><a href="#">Something else here</a></li> -->
								<!--             <li class="divider"></li> -->
								<!--             <li><a href="#">Separated link</a></li> -->
								<!--             <li class="divider"></li> -->
								<!--             <li><a href="#">One more separated link</a></li> -->
							</ul></li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
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
											<form class="form" role="form" method="post" action="login"
												accept-charset="UTF-8" id="login-nav">
												<div class="form-group">
													<label class="sr-only" for="exampleInputEmail2">Email
														address</label> <input type="email" class="form-control"
														id="loginId" placeholder="Email address" required>
												</div>
												<div class="form-group">
													<label class="sr-only" for="exampleInputPassword2">Password</label>
													<input type="password" class="form-control"
														id="loginPassword" placeholder="Password" required>
													<div class="help-block text-right">
														<a href="">Forget the password ?</a>
													</div>
												</div>
												<div class="form-group">
													<button type="submit" class="btn btn-primary btn-block">Sign
														in</button>
												</div>
												<div class="checkbox">
													<label> <input type="checkbox"> keep me
														logged-in
													</label>
												</div>
											</form>
										</div>
										<div class="bottom text-center">
											새롭게 오셨나요? <a href="join"><b>Join Us</b></a>
										</div>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>

	</header>
	<div class="page-header" id="banner">
		<div class="row">
			<div class="col-lg-8 col-md-7 col-sm-6">
				<h3>회원정보</h3>
				<p class="lead">회원 정보 관리</p>
			</div>

		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-4">
				<div class="list-group table-of-contents">
					<a class="list-group-item" href="updateMember">회원정보 수정</a> <a
						class="list-group-item" href="deleteMember">회원 탈퇴</a> <a
						class="list-group-item" href="stationMember">역 추가/수정하기</a>

				</div>
			</div>
		</div>
	</div>


	<div class="deleteFrom"
		style="position: absolute; top: 100px; left: 320px; width: 70%">
		<div class="alert alert-dismissible alert-info">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>회원탈퇴</strong> ${loginId}님 아쉽지만 다음에 만나요 ㅜㅜ.
		</div>
		
		
		<form class="form-horizontal" method="post">
  <fieldset>
    <legend>암호를 입력해 주세요</legend>
    
    <div class="form-group">
      <label for="textArea" class="col-lg-2 control-label">암호</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="1" id="deleteText" name="delete1"></textarea>
        <span class="help-block">암호를 입력하신 후 탈퇴하기 버튼을 눌러주세요 ㅜㅜ</span>
      </div>
    </div> 
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <input type="button" id="btDelete" name="btDelete" class="btn btn-danger" value="탈퇴하기 ㅠㅠ">
      </div>
    </div>
  </fieldset>
</form>

	</div>

	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
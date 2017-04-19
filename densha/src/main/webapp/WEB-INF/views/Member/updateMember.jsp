<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
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
$(document).ready(function(){
	$('#bt1').on('click',update);
});
function update(){
	alert('확인');
	var id = '${loginId}';
	var password = $('#password').val();
	var question = $('#question').val();
	var answer =$('#answer').val();
	
	 $.ajax({
		url:'updateMember',
		type:'post',
		data:{
			id:id,
			password:password,
			question:question,
			answer:answer
		},
		success : update1,
		error: function(e){
			alert(JSON.stringify(e));
		}
	});
	function update1(){
		alert('수정완료');
	} 
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
			<div class="col-lg-4 col-md-5 col-sm-6"></div>
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
		style="position: absolute; top: 100px; left: 320px; width: 70%;">
		<div class="alert alert-dismissible alert-success">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong><h3>회원정보 수정</h3></strong> 회원정보를 수정할 수 있습니다.
		</div>
		<p>회원 정보 수정은 잘 해주세요.</p>
		<p>
		<div style="margin: 20px">
		
		<form class="form-horizontal" method="post">
  <fieldset>
    <legend>회원정보 수정</legend>
    
    <div class="form-group" >
      <label for="textArea" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="1" id="deleteText" name="delete1"></textarea>
        <span class="help-block">아이디는 수정할 수 없습니다.</span>
      </div>
    </div> 
    
    <div class="form-group" >
      <label for="textArea" class="col-lg-2 control-label">아이디</label>
      <div class="col-lg-10">
        <textarea class="form-control" rows="1" id="deleteText" name="delete1"></textarea>
        <span class="help-block">아이디는 수정할 수 없습니다.</span>
      </div>
    </div> 
    
    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" id="btDelete" class="btn btn-danger">탈퇴하기 ㅜㅜ</button>
      </div>
    </div>
  </fieldset>
</form>
		
		
			<form action="joinMember" method="post">
				<table border="1">
					<tr>
						<td colspan="3">회원정보수정</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td colspan="2"><input type="text" id="id" name="id"
							value="${loginId}" readonly="readonly">
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="2"><input type="password" id="password"
							name="password"></td>
					</tr>
					<tr>
						<td>비밀번호찾기 답안</td>
						<td colspan="2"><select id="question" name="question">
								<option>선택하세요</option>
								<option value="태어난 고향은 어디입니까?">태어난 고향은 어디입니까?</option>
								<option value="졸업한 초등학교는 어디입니까?">졸업한 초등학교는 어디입니까?</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2">답 작성:<input type="text" id="answer"
							name="answer"></td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input type="submit" id="bt1"
							value="회원정보수정"> <input type="reset" value="초기화"></td>
					</tr>
				</table>
			</form>
		</div>
		</p>
	</div>


	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
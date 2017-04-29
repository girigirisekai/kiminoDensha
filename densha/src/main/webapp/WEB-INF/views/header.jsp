<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./resources/css/loginModule.css">
<title>header</title>
</head>
<body>

	<header id="home"> <!--main-nav--> <nav
		class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home">브랜드</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="home">Home <span
						class="sr-only">(current)</span></a></li>

				<li><a href="stationcode">지하철서비스</a></li>
				<!--         로그인 시  -->
				<c:if test="${loginId !=null}">
					<li><a href="myaccount">회원정보</a></li>
					<li><a href="favorite">Favorite</a></li>
				</c:if>
				<!--         로그인 시  -->


				<li><a href="board">게시판</a></li>
				<li><a href="api">API</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">제공
						서비스<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="home#service">서비스</a></li>
						<li><a href="home#portfolio">API제공 서비스</a></li>

					</ul></li>
			</ul>
	

			<c:if test="${loginId == null}">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
						<ul id="login-dp" class="dropdown-menu">
							<li>
								<div class="row">
									<div class="col-md-12">
									
										<form class="form" role="form" method="post" action="login"
											accept-charset="UTF-8" id="login-nav">
											<div class="form-group">
												<label class="sr-only" for="exampleInputEmail2">ID를
													입력해주세요</label> <input type="text" class="form-control" id="loginId"
													name="loginId" placeholder="id" required>
											</div>
											<div class="form-group">
												<label class="sr-only" for="exampleInputPassword2">Password</label>
												<input type="password" class="form-control"
													id="loginPassword" name="loginPassword"
													placeholder="Password" required>
												<div class="help-block text-right">
													<a href="forgotpassword">암호를 잊어버리셨나요?</a>
												</div>
											</div>
											<div class="form-group">


												<button type="submit" class="btn btn-primary btn-block">Login</button>





											</div>
										
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
		</c:if>
		<c:if test="${loginId != null}">

			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout">로그아웃</a></li>

			</ul>
		</c:if>
	</div>

	</nav> </header>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>API 제공 사이트</title>
<script src="resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head> 
<body>
<!--메뉴바   -->
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
				<li class="active"><a href="home">Home <span
						class="sr-only">(current)</span></a></li>
				<li><a href="join">회원가입</a></li>
				<li><a href="stationcode">지하철서비스</a></li>
				<li><a href="favorite">Favorite</a></li>
				<li><a href="board">게시판</a></li>
				<li class="Service"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="home#service">서비스</a></li>
						<li><a href="home#portfolio">API제공 서비스</a></li>
						<li><a href="home#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Link</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!--메뉴바   -->
	<div class="jumbotron">
		<h1>api를 제공</h1>
		<p> api 제공 설명</p>
		<p>
			<a class="btn btn-primary btn-lg">Learn more</a>
		</p>
	</div>

	<h3 id="progress-animated">샘플URL</h3>
	<div class="progress progress-striped active">
		<div class="progress-bar" style="width: 45%"></div>
	</div>
	<table>
		<tr>
			<td>샘플URL</td>
			<td>http://localhost:8888/js/api/</td>
		</tr>	
		<tr>
			<td>예제</td>
			<td></td>

		</tr>
	</table>
	
	<h3 id="progress-animated">요청인자</h3>
	<div class="progress progress-striped active">
		<div class="progress-bar" style="width: 45%"></div>
	</div>
	<table>
		<tr>
			<td>변수명</td>
			<td>타입</td>
			<td>변수설명</td>
			<td>값 설정 </td>
		</tr>	
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	
	<h3 id="progress-animated">출력값</h3>
	<div class="progress progress-striped active">
		<div class="progress-bar" style="width: 45%"></div>
	</div>
	<table>
		<tr>
			<td>변수명</td>
			<td>타입</td>
			<td>변수설명</td>
			<td>값 설정 </td>
		</tr>	
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	
	<h3 id="progress-animated">메시지 설명 </h3>
	<div class="progress progress-striped active">
		<div class="progress-bar" style="width: 45%"></div>
	</div>
	<table>
		<tr>
			<td>변수명</td>
			<td>타입</td>
			
		</tr>	
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
	
	
	
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>API 제공 사이트</title>
<script src="resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/loginModule.css">
</head> 
<body>
<!--top header-->
	<jsp:include page="header.jsp" />
	<!--top header-->
	<div style="margin: 40px;">
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
	
	</div>
	
<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
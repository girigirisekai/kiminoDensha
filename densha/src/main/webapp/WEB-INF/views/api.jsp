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
<style type="text/css">
body, html {
	background: url(./resources/image/back/backapi.jpg) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
</head>
<body>
	<!--top header-->
	<jsp:include page="header.jsp" />
	<!--top header--> 
	<div style="margin: 50px;  background: rgba(255, 255, 255, 0.85);"> 
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">
		
			<div class="jumbotron" style=" background: rgba(255, 255, 255, 0);">
				<h1>api Service</h1>
				<p>'너의 지하철은' api를 제공합니다.</p>
				<p>
					<a
						href="http://localhost:8888/densha/apiservice/json?subwaynum=2002"
						class="btn btn-primary btn-lg">샘플 링크 보기</a>
				</p>
			</div>

			<h3 id="progress-animated">샘플URL</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table> 
				<tr>
					<td>샘플URL</td>
				</tr>
				<tr>
					<td><a
						href="http://localhost:8888/densha/apiservice/json?subwaynum=2002">http://localhost:8888/densha/apiservice/json?subwaynum=2002</a></td>
				</tr>
				<tr>
					<td>${objJson}</td>
				</tr>
				<tr>
					<td>샘플URL</td>
				</tr>
				<tr>
					<td><a
						href="http://localhost:8888/densha/apiservice/xml?subwaynum=2002">http://localhost:8888/densha/apiservice/xml?subwaynum=2002</a></td>
				</tr>
				<tr>
					<td><xmp>${objXml}</xmp></td>

				</tr>
			</table>

			<h3 id="progress-animated">요청인자</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table>
				<tr>
					<td>주소</td>
					<td>http://localhost:8888/densha/apiservice?subwaynum=(열차번호)</td>
				</tr>
				<tr>
					<td>변수명</td>
					<td>열차번호</td>
				</tr>
				<tr>
					<td>타입</td>
					<td></td>

				</tr>
				<tr>
					<td>변수설명</td>
					<td></td>

				</tr>
				<tr>
					<td>값 설정</td>
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
					<td>값 설정</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>

			<h3 id="progress-animated">메시지 설명</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table>
				<tr>
					<td>변수명</td>
					<td>값설명</td>

				</tr>
				<tr>
					<td>subwayNum</td>
					<td>열차의 고유 번호입니다. 고유번호는 String 입니다.</td>
				</tr>

				<tr>
					<td>allhuman</td>
					<td>열차에 타고 있는 총인원입니다.</td>
				</tr>

				<tr>
					<td>item:elderlySeat1~12</td>
					<td>칸당 앉아있는지를 확인합니다. (1: 앉아있음, 0: 비어있음)</td>
				</tr>

				<tr>
					<td>humanNum</td>
					<td>량당 있는 사람의 수입니다.</td>
				</tr>

				<tr>
					<td>humanPercent</td>
					<td>량당 있는 사람의 160명이 초과하면 100%를 초과합니다</td>
				</tr>


			</table>

		</div>
		</div>
		

		<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
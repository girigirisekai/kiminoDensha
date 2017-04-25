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
.tbl_detail{
border-bottom:1px solid #ccc
}

.tableCenter{
width: 80%;
margin: auto;
}
</style>
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
	
	<div style="margin: 50px;  background: rgba(255, 255, 255, 0.85);"> 
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">
		
			<div class="jumbotron" style=" background: rgba(255, 255, 255, 0);">
				<h1>api Service</h1>
				<p>'너의 지하철은' api를 제공합니다</p>
			
				<p>
					<a
						href="http://localhost:8888/densha/apiservice/json?subwaynum=2002"
						class="btn btn-primary btn-lg">샘플 링크 보기(JSON)</a>
						<a
						href="http://localhost:8888/densha/apiservice/xml?subwaynum=2002"
						class="btn btn-primary btn-lg">샘플 링크 보기(XML)</a>
				</p>
			</div>

			<h3 id="progress-animated">샘플URL</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table  style="width: 80%; margin: auto;"> 
				<tr class= "tbl_detail">
					<td><h4>JSON 샘플URL</h4></td>
				</tr>
				<tr class= "tbl_detail">
					<td><a
						href="http://localhost:8888/densha/apiservice/json?subwaynum=2002">http://localhost:8888/densha/apiservice/json?subwaynum=2002</a></td>
				</tr>
				<tr class= "tbl_detail">
					<td style="word-break:break-all;">${objJson}</td>
				</tr>
				<tr class= "tbl_detail">
					<td><h4>XML 샘플URL</h4></td>
				</tr>
				<tr class= "tbl_detail">
					<td><a
						href="http://localhost:8888/densha/apiservice/xml?subwaynum=2002">http://localhost:8888/densha/apiservice/xml?subwaynum=2002</a></td>
				</tr>
				<tr class= "tbl_detail">
					<td style="word-break:break-all;">${objXml}</td> 

				</tr>
			</table>

			<h3 id="progress-animated">요청인자</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table class = "tableCenter">
				<tr class = "tbl_detail">
					<td><strong>주소</strong></td>
					<td colspan="2">http://localhost:8888/densha/apiservice?subwaynum=(열차번호)</td>
					
				</tr>
				<tr class = "tbl_detail">
					<td><strong>변수명</strong></td>
					<td><strong>타입</strong></td>
					<td><strong>변수설명</strong></td>
				</tr>
				
				<tr class = "tbl_detail">
					<td>SUBWAYNUM</td>
					<td>STRING(필수)</td>
					<td>열차 번호 </td>
				</tr>
				
			</table>

			<h3 id="progress-animated">출력값</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table  class = "tableCenter">
				<tr class = "tbl_detail">
					<td><h5>NO</h5></td>
					<td><h5>출력명</h5></td>
					<td><h5>출력설명</h5></td>
				</tr>
				<tr class = "tbl_detail">
					<td>공통</td>
					<td>SUBWAYNUM</td>
					<td>열차번호 (정상조회시 출력됨)</td>
				</tr>
				<tr class = "tbl_detail">
					<td>공통</td>
					<td>ALLHUMAN</td>
					<td>모든 열차의 사람 수 (예시참고)</td>
				</tr>
				<tr class = "tbl_detail">
					<td>공통</td>
					<td>ALLCAR</td>
					<td>모든 열차 수 (예시참고)</td>
				</tr>
				<tr class = "tbl_detail">
					<td>공통</td>
					<td>RESULT.MESSAGE</td>
					<td>요청결과 메시지 (예시참고)</td>
				</tr>
				<tr class = "tbl_detail">
					<td>1</td>
					<td>HUMANNUM</td>
					<td>요청결과 메시지 </td>
				</tr>
				<tr class = "tbl_detail">
					<td>2</td>
					<td>CARNUM</td>
					<td>열차 량 번호 </td>
				</tr>
				
				<tr class = "tbl_detail">
				
					<td colspan="3"> 
					<br>
					<center>
					<img src = "./resources/image/menu/seatinfo.png">
					</center>
						<br>
					</td>
					
					
				</tr>
				<tr class = "tbl_detail">
					<td>3</td>
					<td>ELDERLYSEAT1</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>4</td>
					<td>ELDERLYSEAT2</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>5</td>
					<td>ELDERLYSEAT3</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				
				<tr class = "tbl_detail">
					<td>6</td>
					<td>ELDERLYSEAT4</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>7</td>
					<td>ELDERLYSEAT5</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>8</td>
					<td>ELDERLYSEAT6</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>9</td>
					<td>ELDERLYSEAT7</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>10</td>
					<td>ELDERLYSEAT8</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>11</td>
					<td>ELDERLYSEAT9</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>12</td>
					<td>ELDERLYSEAT10</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>13</td>
					<td>ELDERLYSEAT11</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				<tr class = "tbl_detail">
					<td>14</td>
					<td>ELDERLYSEAT12</td>
					<td>노약좌석 번호 (상단의 사진으로 설명) </td>
				</tr>
				
			</table>

			<h3 id="progress-animated">메시지 설명</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table  class = "tableCenter">
				<tr class = "tbl_detail">
					<td> <h5>변수명</h5></td>
					<td><h5>값설명</h5></td>

				</tr>
				<tr class = "tbl_detail">
					<td>subwayNum</td>
					<td>열차의 고유 번호입니다. 고유번호는 String 입니다.</td>
				</tr>

				<tr class = "tbl_detail">
					<td>allhuman</td>
					<td>열차에 타고 있는 총인원입니다.</td>
				</tr>

				<tr class = "tbl_detail">
					<td>item:elderlySeat1~12</td>
					<td>칸당 앉아있는지를 확인합니다. (1: 앉아있음, 0: 비어있음)</td>
				</tr >

				<tr class = "tbl_detail">
					<td>humanNum</td>
					<td>량당 있는 사람의 수입니다.</td>
				</tr>

				<tr class = "tbl_detail">
					<td>humanPercent</td>
					<td>량당 있는 사람의 160명이 초과하면 100%를 초과합니다</td>
				</tr>


			</table>

		</div>
		</div>
		

		<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
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
	overflow: hidden;
}
</style>
</head>
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/css/flexslider.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/style.css">
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="./resources/js/function.js"></script>
<body>
	<!--top header-->
	<jsp:include page="../header.jsp" />
	<!--top header-->

<!-- 디자인 바  -->
		<div class="progress" style="position: relative; ">
			<div class="progress-bar progress-bar-success" style="width: 35%"></div>
			<div class="progress-bar progress-bar-warning" style="width: 20%"></div>
			<div class="progress-bar progress-bar-danger" style="width: 10%"></div>
		</div>
	<!-- 디자인 바  -->


	<div style="margin: 50px; background: rgba(255, 255, 255, 0.85); border-radius: 30px;"
		class="first">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">


			<!--메뉴바-->
			<jsp:include page="menu.jsp" />
			<!--메뉴바-->

			<div style="width: 80%; float: left;">
				<div class="jumbotron" style="background: rgba(255, 255, 255, 0); width: 95%; float: left; padding: 10px;">
					<h1>개인정보</h1>

					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">아이디</label>
						<div class="col-lg-10">${loginId}</div>
					</div>

					<a href="updateMember" class="btn btn-info">개인정보 수정</a>
				</div>

				<div style="width: 80%; float: left;"><p>최근 접속 기록</p>

				
				<table class="table table-striped table-hover " >
					<thead>
						<tr>
							<th>#</th>
							<th>날짜</th>
							<th>아이피주소</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${loginCheck3}" var="list">
							<tr>
								<td></td>
								<td>${list.recentLogin}</td>
								<td>${list.ipAddress}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<script src="./resources/js/bootstrap.min.js"></script>

</body>
</html>
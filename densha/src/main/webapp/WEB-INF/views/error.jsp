<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러페이지</title>
<script src="resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/loginModule.css">

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
	overflow : hidden;
}
</style>

<script type="text/javascript">

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

	<!-- 	내부 div 창 하얀배경  -->

	<div style="margin: 50px; background: rgba(255, 255, 255, 0.85);"
		class="first">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">

			<div class="jumbotron" style=" background: rgba(255, 255, 255, 0);">
				<h1>Error</h1>
				<p>없는 페이지는 들어가지 말아주세요</p>
				
			</div>
			
			

		</div>
	</div>





	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
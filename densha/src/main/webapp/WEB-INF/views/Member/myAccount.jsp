<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	overflow : hidden;
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

	<div style="margin: 50px; background: rgba(255, 255, 255, 0.85);"
		class="first">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">

			<div class="jumbotron" style=" background: rgba(255, 255, 255, 0);">
				<h1>개인정보</h1>
				
				 <div class="form-group" >
    			  <label for="textArea" class="col-lg-2 control-label">아이디</label>
   	 			 	<div class="col-lg-10">
     				   ${loginId}
   	  			 </div>
    			</div> 
				
				<a href="updateMember" class="btn btn-info">개인정보 수정</a>
			</div>
			
			<div>최근 접속 기록</div>
				<table >
					<tr>
						<td>날짜</td>
						<td>아이피주소</td>
					</tr>
				
			<c:forEach items="${loginCheck3}" var="list">
					<tr>
						<td>${list.recentLogin}</td>
						<td>${list.ipAddress}</td>
					</tr>
			</c:forEach>
				</table>


		</div>
	</div>
<script src="./resources/js/bootstrap.min.js"></script>

</body>
</html>
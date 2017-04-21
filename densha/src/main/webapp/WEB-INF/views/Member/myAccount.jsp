<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
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

<div class="page-header" id="banner">
        <div class="row">
          <div class="col-lg-8 col-md-7 col-sm-6">
            <h3>회원정보</h3>
            <p class="lead">회원 정보 관리</p>
          </div>
          <div class="col-lg-4 col-md-5 col-sm-6">
            
          </div>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-3 col-sm-4">
            <div class="list-group table-of-contents">
              <a class="list-group-item" href="updateMember">회원정보 수정</a>
              <a class="list-group-item" href="deleteMember">회원 탈퇴</a>
              <a class="list-group-item" href="stationMember">역 추가/수정하기</a>
             
            </div>
          </div>
        </div>
      </div>
<script src="./resources/js/bootstrap.min.js"></script>

</body>
</html>
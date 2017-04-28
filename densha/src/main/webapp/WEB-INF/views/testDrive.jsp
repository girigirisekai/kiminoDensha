<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨찾기</title>
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
	overflow: hidden;
}
</style>

<script type="text/javascript">
	$(document).ready(Function(){		
		exampleXML(); 
		exampleJSON();
	});
	
	function exampleXML(){ //xml
		var car = '2002'; // 열차 번호입니다. 이 부분은 id나 class로 받으시면 됩니다.
		 $.ajax({
			 url : 'exampleXML', // Controller의 주소 
				type : 'post', // post로 하는게 더 좋을 겁니다.
				data : {carnum: car}, // 열차 번호 
				dataType: 'json', 
				// ArrayList로 저장되었다면 Json으로 하시는게 편합니다. 
				// 제공한 VO를 이용한다면 아래의 형태로 부르면 됩니다.
				// 다른 VO를 이용한다면 지정된 변수명을 이용해서 부르면 됩니다.
				
				success : function(item){
					// 성공시 아래의 each를 돌리게 됩니다. 
					$.each(item, function(index, items) {
						var subwayNum = items.subwayNum; 
						var carNum = items.carNum; 
						var humanNum = items.humanNum; 
						var humanPercent = items.humanPercent; 
						var elderlySeat1 = items.elderlySeat1; 
						var elderlySeat2 = items.elderlySeat2; 
						var elderlySeat3 = items.elderlySeat3; 
						var elderlySeat4 = items.elderlySeat4; 
						var elderlySeat5 = items.elderlySeat5; 
						var elderlySeat6 = items.elderlySeat6; 
						var elderlySeat7 = items.elderlySeat7; 
						var elderlySeat8 = items.elderlySeat8; 
						var elderlySeat9 = items.elderlySeat9; 
						var elderlySeat10 = items.elderlySeat10; 
						var elderlySeat11 = items.elderlySeat11; 
						var elderlySeat12 = items.elderlySeat12; 
						//각 var로 받은것을 id나 class를 이용해서 지정을 하여 넣으주면 됩니다.
					});
				}	 
		 });
	}
	
	function exampleJSON(){ //xml
		var car = '2002'; // 열차 번호입니다. 이 부분은 id나 class로 받으시면 됩니다.
		 $.ajax({
			 url : 'exampleJSON', // Controller의 주소 
				type : 'post', // post로 하는게 더 좋을 겁니다.
				data : {carnum: car}, // 열차 번호 
				dataType: 'json', 
				
				success : function(item){
					// 성공시 아래의 each를 돌리게 됩니다. 
					$.each(item.item, function(index, items) {
						var subwayNum = items.subwayNum; 
						var carNum = items.carNum; 
						var humanNum = items.humanNum; 
						var humanPercent = items.humanPercent; 
						var elderlySeat1 = items.elderlySeat1; 
						var elderlySeat2 = items.elderlySeat2; 
						var elderlySeat3 = items.elderlySeat3; 
						var elderlySeat4 = items.elderlySeat4; 
						var elderlySeat5 = items.elderlySeat5; 
						var elderlySeat6 = items.elderlySeat6; 
						var elderlySeat7 = items.elderlySeat7; 
						var elderlySeat8 = items.elderlySeat8; 
						var elderlySeat9 = items.elderlySeat9; 
						var elderlySeat10 = items.elderlySeat10; 
						var elderlySeat11 = items.elderlySeat11; 
						var elderlySeat12 = items.elderlySeat12; 
						//각 var로 받은것을 id나 class를 이용해서 지정을 하여 넣으주면 됩니다.	
					}); 
				}	 
		 });
	}
	
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


			<c:forEach var="item" items="${carSeatList}">
			 ${item}
			</c:forEach>


		</div>
	</div>





	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
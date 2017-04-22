<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">

<script>
	window.onload = function(){
		CKEDITOR.replace("content");
	}
</script>

<script type="text/javascript">

$(document).ready(function(){
	$("#type").on('click',typeCheck);
})


	
function typeCheck(){
	
	var type = $('#type').val(); 
	if(type=='qna'){
		$("#secretpassword").html('<input type="password" name="secretpassword" id="secretpassword">');
	}else if(type='freeboard'){
		$("#secretpassword").html('');
	}
}	

	//글쓰기 버튼 눌렀을때
	function formCheck() {

		var id = $('#id').val(); //사용자 아이디
		var type = $('#type').val(); //글 타입('자유게시판', 'QnA게시판')
		var title = $('#title').val(); //글제목
		var content = $('#content').val(); //글내용

		if(type=='qna'){
			
			var secretpassword = prompt('비밀번호를 입력해주세요');
			$("#secretpassword").val(secretpassword);
			
		}
		
		
		
		//제목, 내용을 입력하지 않으면 경고 후 리턴
/* 		if (title.length == 0) { //제목
			alert('제목을 입력하세요.');
			return;
		}
		if (content.length == 0) { //글내용
			alert('내용을 입력해주세요.');
			return;
		} */

		/* $.ajax({
			url : 'insert' //글입력
			,type : 'POST',
			data : {
				id : id,
				type : type,
				title : title,
				content : content
			},
			success : function() {
				alert('저장되었습니다.');
			},
			error : function(e) {
				alert(JSON.stringify(e));
			}
		}); */
	}
</script>
</head>
<body>
<header id="home">

<!-- 		<section class="top-nav hidden-xs"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<div class="top-left"> -->

<!-- 							<ul> -->
<!-- 								<li><a href="#"><i class="fa fa-facebook" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-twitter" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-linkedin" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-vk" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-instagram" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 							</ul> -->

<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="col-md-6"> -->
<!-- 						<div class="top-right"> -->
<!-- 							<p> -->
<!-- 								Location:<span>Main Street 2020, City 3000</span> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->

		<!--main-nav-->

		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">브랜드</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#home">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="join">회원가입</a></li>
        <li><a href="stationcode">지하철서비스</a></li>
        <li><a href="favorite">Favorite</a></li>
        	<li><a href="board">게시판</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">제공 서비스 안내<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#service">서비스</a></li>
            <li><a href="#portfolio">API제공 서비스</a></li>
<!--             <li><a href="#">Something else here</a></li> -->
<!--             <li class="divider"></li> -->
<!--             <li><a href="#">Separated link</a></li> -->
<!--             <li class="divider"></li> -->
<!--             <li><a href="#">One more separated link</a></li> -->
          </ul>
        </li>
      </ul>
<!--       <form class="navbar-form navbar-left" role="search"> -->
<!--         <div class="form-group"> -->
<!--           <input type="text" class="form-control" placeholder="Search"> -->
<!--         </div> -->
<!--         <button type="submit" class="btn btn-default">Submit</button> -->
<!--       </form> -->
       <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<div class="col-md-12">
<!-- 								Login via -->
<!-- 								<div class="social-buttons"> -->
<!-- 									<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a> -->
<!-- 									<a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a> -->
<!-- 								</div> -->
<!--                                 or -->
								 <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <label class="sr-only" for="exampleInputEmail2">ID를 입력해주세요</label>
											 <input type="text" class="form-control" id="loginId" name="loginId" placeholder="id" required>
										</div>
										<div class="form-group">
											 <label class="sr-only" for="exampleInputPassword2">Password</label>
											 <input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="Password" required>
                                             <div class="help-block text-right"><a href="forgotpassword">암호를 잊어버리셨나요?</a></div>
										</div>
										<div class="form-group">
											 <button type="submit" class="btn btn-primary btn-block">Login</button>
										</div>
<!-- 										<div class="checkbox"> -->
<!-- 											 <label> -->
<!-- 											 <input type="checkbox"> keep me logged-in -->
<!-- 											 </label> -->
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
    </div>
  </div>
</nav>

	</header>
	<form action="write" method="post" id="writeform" enctype="multipart/form-data" onsubmit="return formCheck();">
		<table>
			<tr>
				<td>
					<select id="type" name="type">
						<option value="freeboard" selected>자유게시판</option>
						<option value="qna">건의&QnA</option>
					</select>
				</td>
				<td>
					<span id="secretpassword"></span>	
				</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="title" id="title"
					style="width: 99%;"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" id="content" style="width: 400px; height: 200px; resize: none;"></textarea></td>
				
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="upload" size="30" multiple="multiple"></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="저장">
				<th>
			</tr>
		</table>
	</form>


</body>
</html>
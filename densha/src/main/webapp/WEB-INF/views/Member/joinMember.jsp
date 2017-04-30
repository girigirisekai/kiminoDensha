<%@page import="ikuzo.kimi.densha.email.SendMail"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/css/flexslider.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/style.css">
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="./resources/js/function.js"></script>
<script>
	$(document).ready(function() {
		$('#id').on('keyup', selectId);
		$('#btCheckCode').on('click', CheckCode);
		$('#submit').on('click',join);
		$('#forgotpassword').on('click',findPassword);
		$('#btChange').on('click',ChangePassword);
	
	});
	//비밀번호 분실 시
	function findPassword(){
		$('#FindPassword').modal();
	}
	function ChangePassword(){
		var ChangeId = $('#ChangeId').val();
		$.ajax({
			url : 'findPassword',
			type : 'GET',
			data : {
				user : ChangeId
			},
			dataType : 'json',
			success : function(e){
				$('#FindPassword').modal('hide');
				$('#ChangePasswordCheck').modal();
			},
			error: function(e){
				alert(JSON.stringify(e));
			} 
		});
	}
	// 아이디 중복검사
	function selectId() {
		var checkId = $('#id').val();

		$.ajax({
			url : 'selectId',
			type : 'POST',
			data : {
				id : checkId
			},
			dataType : 'json',
			//success : output1,
			/* error: function(e){
				alert(JSON.stringify(e));
			} */
			complete : output1
		});
	}
	function output1(result) {
		//var check = result.id;
		console.log(result);
		var check = result.responseText;
		console.log(result.responseText);
		var str = "";
		if (check != "") {
			str = '중복된 아이디가 있습니다';
			$('#searchId').html(str);
		} else {
			str = '사용가능한 아이디입니다';
			$('#searchId').html(str);
		}
		    
			

	}
	// 아이디 중복검사 끝
	function CheckCode() {
		var id = $('#id').val();
		var password = $('#password').val();
		var question = $('#question').val();
		var answer = $('#answer').val();
		
		alert(id);
		 $.ajax({
			url : 'CheckCode',
			type : 'POST',
			data : {
				user : id,
				password : password,
				question : question,
				answer : answer
			},
			success : output2,
			error : function(e) {
				alert(JSON.stringify(e));
			}
		});
	}
	var tid;
	function output2(data) {
		alert('확인 전송');
		tid = setInterval('msg_time()',1000);
		$('#btCheckCode').attr('value','인증번호 확인');
		$('#btCheckCode').off();
		$('#btCheckCode').on('click', function(code){
			var code1 = data;
			var checkCode = $('#checkCode').val();
			if(code1 == checkCode){
				alert('인증번호가 일치합니다');
				clearInterval(tid);
				$('#ViewTimer').html('인증번호 확인 완료');
			$('#submit').on('click', submitBt);
			}else{
				alert('인증번호를 확인해주세요');
			};
		});
	}
	
		var SetTime = 300;		// 최초 설정 시간(기본 : 초)  300으로 바꾸면 5분으로 됨
		
	 function msg_time() {	// 1초씩 카운트
		m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";	
		var id = $('#id').val();
	 	var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
		SetTime--;					// 1초씩 감소
		if (SetTime < 0) {			// 시간이 종료 되었으면..
			clearInterval(tid);		// 타이머 해제
			alert("인증시간종료");
			codeDelete(id);
		}
		$('#ViewTimer').html(msg);	// div 영역에 보여줌 
	} 

	function codeDelete(id){
		var id = id;
		$.ajax({
			url:'codeDelete',
			type:'post',
			data:{id : id 
			},
			success : function cd(){
			alert('삭제성공');	
			},
			error : function(e) {
				alert(JSON.stringify(e));
			}
		});
	}
	
	function submitBt(){
		var id = $('#id').val();
		var password = $('#password').val();
		var question = $('#question').val();
		var answer = $('#answer').val();
		var checkCode = $('#checkCode').html();
		
		$.ajax({
			url :'joinMember',
			type :'POST',
			data :{
				id : id,
				password : password,
				question : question,
				answer : answer
			},
			success : output3,
			error : function(e) {
				alert(JSON.stringify(e));
			}
		});
	}
	function output3(){
		alert('회원가입 완료');
	}
	
	
</script>
<style type="text/css">
body, html {
	height: 100%;
	background-repeat: no-repeat;
	background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
}

.card-container.card {
	max-width: 350px;
	padding: 40px 40px;
}

.btn {
	font-weight: 700;
	height: 36px;
	-moz-user-select: none;
	-webkit-user-select: none;
	user-select: none;
	cursor: default;
}

/*
 * Card component
 */
.card {
	background-color: #F7F7F7;
	/* just in case there no content*/
	padding: 20px 25px 30px;
	margin: 0 auto 25px;
	margin-top: 50px;
	/* shadows and rounded borders */
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
	width: 96px;
	height: 96px;
	margin: 0 auto 10px;
	display: block;
	-moz-border-radius: 50%;
	-webkit-border-radius: 50%;
	border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	margin: 10px 0 0;
	min-height: 1em;
}

.reauth-email {
	display: block;
	color: #404040;
	line-height: 2;
	margin-bottom: 10px;
	font-size: 14px;
	text-align: center;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin #inputEmail, .form-signin #inputPassword {
	direction: ltr;
	height: 44px;
	font-size: 16px;
}

.form-signin input[type=email], .form-signin input[type=password],
	.form-signin input[type=text], .form-signin button {
	width: 100%;
	display: block;
	margin-bottom: 10px;
	z-index: 1;
	position: relative;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.form-signin .form-control:focus {
	border-color: rgb(104, 145, 162);
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgb(104, 145, 162);
}

.btn.btn-signin {
	/*background-color: #4d90fe; */
	background-color: rgb(104, 145, 162);
	/* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
	padding: 0px;
	font-weight: 700;
	font-size: 14px;
	height: 36px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: none;
	-o-transition: all 0.218s;
	-moz-transition: all 0.218s;
	-webkit-transition: all 0.218s;
	transition: all 0.218s;
}

.btn.btn-signin:hover, .btn.btn-signin:active, .btn.btn-signin:focus {
	background-color: rgb(12, 97, 33);
}

.forgot-password {
	color: rgb(104, 145, 162);
}

.forgot-password:hover, .forgot-password:active, .forgot-password:focus
	{
	color: rgb(12, 97, 33);
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		// DOM ready

		// Test data
		/*
		 * To test the script you should discomment the function
		 * testLocalStorageData and refresh the page. The function
		 * will load some test data and the loadProfile
		 * will do the changes in the UI
		 */
		// testLocalStorageData();
		// Load profile if it exits
		loadProfile();
	});

	/**
	 * Function that gets the data of the profile in case
	 * thar it has already saved in localstorage. Only the
	 * UI will be update in case that all data is available
	 *
	 * A not existing key in localstorage return null
	 *
	 */
	function getLocalProfile(callback) {
		var profileImgSrc = localStorage.getItem("PROFILE_IMG_SRC");
		var profileName = localStorage.getItem("PROFILE_NAME");
		var profileReAuthEmail = localStorage.getItem("PROFILE_REAUTH_EMAIL");

		if (profileName !== null
			&& profileReAuthEmail !== null
			&& profileImgSrc !== null) {
			callback(profileImgSrc, profileName, profileReAuthEmail);
		}
	}

	/**
	 * Main function that load the profile if exists
	 * in localstorage
	 */
	function loadProfile() {
		if (!supportsHTML5Storage()) {
			return false;
		}
		// we have to provide to the callback the basic
		// information to set the profile
		getLocalProfile(function(profileImgSrc, profileName, profileReAuthEmail) {
			//changes in the UI
			$("#profile-img").attr("src", profileImgSrc);
			$("#profile-name").html(profileName);
			$("#reauth-email").html(profileReAuthEmail);
			$("#inputEmail").hide();
			$("#remember").hide();
		});
	}

	/**
	 * function that checks if the browser supports HTML5
	 * local storage
	 *
	 * @returns {boolean}
	 */
	function supportsHTML5Storage() {
		try {
			return 'localStorage' in window && window['localStorage'] !== null;
		} catch (e) {
			return false;
		}
	}

	/**
	 * Test data. This data will be safe by the web app
	 * in the first successful login of a auth user.
	 * To Test the scripts, delete the localstorage data
	 * and comment this call.
	 *
	 * @returns {boolean}
	 */
	function testLocalStorageData() {
		if (!supportsHTML5Storage()) {
			return false;
		}
		localStorage.setItem("PROFILE_IMG_SRC", "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120");
		localStorage.setItem("PROFILE_NAME", "César Izquierdo Tello");
		localStorage.setItem("PROFILE_REAUTH_EMAIL", "oneaccount@gmail.com");
	}
</script>
</head>
<body>
	<!--top header-->
	<jsp:include page="../header.jsp" />
	<!--top header-->

	<!--
    you can substitue the span of reauth email for a input with the email and
    include the remember me checkbox
    -->
	<div class="container">
		<div class="card card-container">
			<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
			<img id="profile-img" class="profile-img-card"
				src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" />
			<p id="profile-name" class="profile-name-card"></p>
			<form class="form-signin" action="joinMember" method="post">
				<span id="reauth-email" class="reauth-email"></span> <input
					type="email" id="id" class="form-control" name="id"
					placeholder="Email address" required autofocus>
				<div id="searchId"></div>
				<input type="password" id="password" class="form-control"
					name="password" placeholder="Password" required> <select
					id="question" name="question">
					<option>선택하세요</option>
					<option value="태어난 고향은 어디입니까?">태어난 고향은 어디입니까?</option>
					<option value="졸업한 초등학교는 어디입니까?">졸업한 초등학교는 어디입니까?</option>
					<option value="졸업한 초등학교는 어디입니까?">보물 1호는 무엇입니까?</option>
				</select> <br>답 작성:<input type="text" id="answer" name="answer"
					class="form-control"> 인증코드 작성<input type="text"
					id="checkCode" name="checkCode" class="form-control"> <input
					type="button" id="btCheckCode" value="인증코드 전송" class="btn">
				<div id="ViewTimer"></div>
				<button class="btn btn-lg btn-primary btn-block btn-signin"
					type="submit">Sign in</button>
			</form>
			<!-- /form -->
			<a href="#" class="forgot-password" id="forgotpassword"> Forgot
				the password? </a>
		</div>
		
		<div class="modal" id="FindPassword">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div>
						<font size="3" style="color: green"><b>Kimino Densha</b></font>
					</div>
				</div>
				<div class="modal-body" align="center">
						<div><h3><font color="red">비밀번호 분실</font></h3><h5><font color="">(이메일로 임시 비밀번호가 전달 됩니다)</font></h5></div><br>
						<input type="text" id="ChangeId" name="ChangeId" placeholder="아이디를 입력해주세요">
						<input type="button" class="btn btn-default" id="btChange" name="btChange" value="보내기">
				</div>
				<div class="modal-footer" align="center">
				<button type="button" id="DeleteBt" class="btn btn-default"
					data-dismiss="modal">닫기</button>
					</div>
			</div>
		</div>
	</div>
	
	<div class="modal" id="ChangePasswordCheck">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<div>
						<font size="3" style="color: green"><b>Kimino Densha</b></font>
					</div>
				</div>
				<div class="modal-body" align="center">
						<div>임시 비밀번호 변경 하루 빨리 수정으로 돌아가서 비밀번호를 변경하세요!</div><br>
				</div>
				<div class="modal-footer" align="center">
				<button type="button" id="DeleteBt" class="btn btn-default"
					data-dismiss="modal">닫기</button>
					</div>
			</div>
		</div>
	</div>
		<!-- /card-container -->
	</div>
	<!-- /container -->

	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
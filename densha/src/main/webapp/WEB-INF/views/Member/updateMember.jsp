<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원정보 수정</title>
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
		$('#bt1').on('click', update);
	});
	function update() {
		var id = '${loginId}';
		var password = $('#password').val();
		var question = $('#question').val();
		var answer = $('#answer').val();

		$.ajax({
			url : 'updateMember',
			type : 'post',
			data : {
				'id' : id,
				'password' : password,
				'question' : question,
				'answer' : answer
			},
			success : update1,
			error : function(e) {
				alert(JSON.stringify(e));
			}
		});
		function update1() {
			$("#modalUpdate").modal();
		}
	}

	$(document).ready(function() {
		//비밀번호 확인버튼
		$('#btDelete').on('click', DeleteFirst);
	});
	function DeleteFirst() {
		var id1 = '${loginId}';
		var delete1 = $('#deleteText').val();
		$.ajax({
			url : 'selectId1',
			type : 'post',
			data : {
				'id' : id1,
				'password' : delete1
			},
			dataType : 'json',
			success : function(ob) {
				// deleteBt(ob); // modal 만들기 전 코드입니다.
				var question = ob.question;
				$("#secondQuestion").html(question);
				$("#modalDelete1").modal();
				$('#deleteMemberBt').on('click', DeleteMember);

			},
			error : function(e) {
				alert('비밀번호가 오류났습니다');
			}
		});
	}
	//modal 만들기 전 연결 코드입니다.
	/* function deleteBt(resp) {
		var str = "";
		str += "2번째 비밀번호를 입력해 주세요<br>";
		str += resp.question + "<br>";
		str += "<input text='text' id='checkPw' name='checkPw'><br>";
		str += "<input type='button' id='deleteMemberBt' value='삭제완료'>";
		$('#checkDelete').html(str);
	} */
	function DeleteMember() {
		var id = '${loginId}';
		var answer = $('#checkPw').val();
		$.ajax({
			url : 'deleteMember',
			type : 'post',
			data : {
				'id' : id,
				'answer' : answer
			},
			success : function(ob) {
				if (ob == 1) {
					//alert('삭제완료');
					$('#modalDelete1').modal('hide')
					$("#modalDelete").modal();
					$('#DeleteBt').on('click', DeleteBt);

				} else {
					alert('2차비밀번호에 오류가 났습니다.');
				}
			},
			error : function(e) {
				alert('2차비밀번호가 오류났습니다');
			}
		});
	}
	function DeleteBt() {
		location.href = "home";
	}
</script>
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

#modal1 {
	color: gray;
}
</style>
</head>
<body>
	<!--top header-->
	<jsp:include page="../header.jsp" />
	<!--top header-->

	<!-- 디자인 바  -->
	<div class="progress" style="position: relative; top: 0px;">
		<div class="progress-bar progress-bar-success" style="width: 35%"></div>
		<div class="progress-bar progress-bar-warning" style="width: 20%"></div>
		<div class="progress-bar progress-bar-danger" style="width: 10%"></div>
	</div>
	<!-- 디자인 바  -->


	<div
		style="margin: 50px; background: rgba(255, 255, 255, 0.85); border-radius: 30px;"
		class="first">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">


			<!--메뉴바-->
			<jsp:include page="menu.jsp" />
			<!--메뉴바-->


			<div style="width: 80%; float: left;">

				<!-- 	modifyForm -->
				<div class="modifyFrom" style="width: 95%; float: left;">
					<div class="alert alert-dismissible alert-success"
						style="clear: left;">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong><h3>회원정보 수정</h3></strong> 회원정보를 수정할 수 있습니다.
					</div>
					<p>회원 정보 수정은 잘 해주세요.</p>
					<p>
					<div style="margin: 20px">

						<form class="form-horizontal" method="post" action="updateMember">
							<fieldset>
								<legend>회원정보 수정</legend>

								<div class="form-group">
									<label for="textArea" class="col-lg-2 control-label">아이디</label>
									<div class="col-lg-10">
										<textarea class="form-control" rows="1" id="id" name="id"
											disabled="disabled"> ${loginId}</textarea>
										<span class="help-block">아이디는 수정할 수 없습니다.</span>
									</div>
								</div>

								<div class="form-group">
									<label for="textArea" class="col-lg-2 control-label">암호</label>
									<div class="col-lg-10">
										<input type="password" class="form-control"  id="password"
											name="password">
										<span class="help-block">암호는 수정이 가능합니다.</span>
									</div>
								</div>

								<div class="form-group">
									<label for="textArea" class="col-lg-2 control-label">비밀번호
										답안</label>
									<div class="col-lg-10">
										<select id="question" name="question">
											<option>선택하세요</option>
											<option value="태어난 고향은 어디입니까?">태어난 고향은 어디입니까?</option>
											<option value="졸업한 초등학교는 어디입니까?">졸업한 초등학교는 어디입니까?</option>
										</select> <span class="help-block">답 작성:<input type="text"
											id="answer" name="answer" class="form-control"></span>
									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-10 col-lg-offset-2">
										<button type="reset" class="btn btn-default">Cancel</button>
										<input type="button" class="btn btn-danger" id="bt1"
											value="수정하기">
									</div>
								</div>

								<div class="modal" id="modalUpdate">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<div>
													<font size="3" style="color: green"><b>Kimino
															Densha</b></font>
												</div>
											</div>
											<div class="modal-body" align="center">
												<font size="4"><p>수정완료 비밀번호를 까먹지 않도록 잘 기억해 두세요 !
														^^</p></font>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">닫기</button>
											</div>
											<div class="modal-footer" align="center"></div>
										</div>
									</div>
								</div>

							</fieldset>
						</form>

					</div>

				</div>
				<!-- 	modifyForm -->


				<!-- 	deleteForm -->


				<div class="deleteFrom" style="width: 95%; float: left;">
					<div class="alert alert-dismissible alert-info">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong>회원탈퇴</strong> ${loginId}님 아쉽지만 다음에 만나요 ㅜㅜ.
					</div>

					<form class="form-horizontal" method="post" action="deleteMember">

						<fieldset>
							<legend>암호를 입력해 주세요</legend>

							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">암호</label>
								<div class="col-lg-10">
									<textarea class="form-control" rows="1" id="deleteText"
										name="delete1"></textarea>
									<span class="help-block">암호를 입력하신 후 탈퇴하기 버튼을 눌러주세요 ㅜㅜ</span>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">Cancel</button>
									<input type="button" id="btDelete" class="btn btn-danger"
										value="탈퇴하기 ㅜㅜ">
								</div>
							</div>
						</fieldset>

						<div class="modal" id="modalDelete1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="ture">&times;</button>
										<h4 class="modal-title" id="modal1">2차 비밀번호를 눌러주세요.</h4>
									</div>

									<div class="form-group">
										<div class="col-lg-10">
											<div class="modal-body">
												<font size="4"> <span id="secondQuestion"></span>
												</font> <input type="password" class="form-control" id="checkPw"
													name='checkPw' placeholder="비밀번호 입력">
											</div>
										</div>


										<div align="center">
											<span class="input-group-btn"> <input type='button'
												class="btn btn-default" id='deleteMemberBt' value='삭제완료'>
											</span>
										</div>
									</div>

								</div>
							</div>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>

	<div class="modal" id="modalDelete">
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
					<font size="4">${loginId}님 아쉽지만 다음에 또 봐요 </font>

				</div>
				<div class="modal-footer" align="center">
				<button type="button" id="DeleteBt" class="btn btn-default"
					data-dismiss="modal">닫기</button>
					</div>
			</div>
		</div>
	</div>


	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
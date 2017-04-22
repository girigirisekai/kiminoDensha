<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<title></title>
<script type="text/javascript">

	function replyDelete(rnum, bnum) {

		if (confirm('삭제하시겠습니까?')) {
			location.href = 'replyDelete?replynum=' + rnum + '&boardnum='+ bnum;
		}
	}
	

	function replyUpdate(rnum, bnum, rtext){
		
		var text = prompt("수정할 내용을 입력해주세요", rtext);
		if(text!=null){
			location.href='replyUpdate?replynum='+rnum+'&boardnum='+bnum+'&text='+text;
		}
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
	<table>
		<tr>
			<th colspan="2"><p2> [ 게시판 글읽기 ] </p2></th>
		</tr>

		<tr>
			<th style="width: 100px;">작성자</th>
			<td style="width: 600px;">${board.id.replace("<", "&lt;").replace(">", "&gt;") }</td>
		</tr>

		<tr>
			<th>작성일</th>
			<td>${board.inputdate }</td>
		</tr>

		<tr>
			<th>조회수</th>
			<td>${board.hits }</td>
		</tr>

		<tr>
			<th>제목</th>
			<td>${board.title.replace("<", "&lt;").replace(">", "&gt;") }</td>
		</tr>

		<tr>
			<th>내용</th>
			<td>${board.content}</td>
		</tr>

		<tr>
			<th>파일첨부</th>
			<td><c:if test="${board.originalfile!=null }">
					<a href="download?boardnum=${board.boardnum }">
						${board.originalfile.replace("<", "&lt;").replace(">", "&gt;") }</a>

					<img src="download?boardnum=${board.boardnum }">
				</c:if></td>
		</tr>

		<tr>
			<th colspan="2"><c:if test="${board.id.equals(id) }">
					<a href="delete?boardnum=${board.boardnum }">삭제</a>
					<a href="update?boardnum=${board.boardnum }">수정</a>
				</c:if> <a href="list">목록보기</a></th>
		</tr>

		<tr>
			<th colspan="2">
				<form action="writeReply" method="post">
					<input type="hidden" name="boardnum" value="${board.boardnum }">
					리플내용 <input type="text" name="text" style="width: 400px;">
					<input type="submit" value="확인">
				</form>
			</th>
		</tr>


		<c:forEach var="i" items="${rlist}">
			<tr>
				<td>${i.id}</td>
				<td>${i.text}</td>
				<td><input type="button" value="수정" onclick="replyUpdate('${i.replynum}', '${i.boardnum}', '${i.text}')"></td>
				<td><input type="button" value="삭제" onclick="replyDelete('${i.replynum}', '${i.boardnum}')"></td>
			</tr>
		</c:forEach>


	</table>
</body>
</html>
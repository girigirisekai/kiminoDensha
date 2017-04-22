<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- Latest compiled and minified CSS -->
<style>
	body{
		
		
	}

	div #menu{
		padding:20px;
	}

	div #gesipan{
		padding:20px;
	}

	div{
		float:left;
	}
	
	ul li.nav{
		float:left; 
		height:100px;
		padding:20px;
	}


</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">

<script type="text/javascript">

function showmap(spot, num) { 
	console.log(spot);
	if(spot.style.visibility=="hidden") {
	   spot.style.visibility="visible";
	   aj(num);	
	   return false;
	 }
	 if(spot.style.visibility=="visible") {
	  spot.style.visibility="hidden";
	  return false;
	 }
	 console.log(spot);
}



function aj(num){
	$.ajax({
		url:'readReply',
		type:'GET',
		data:{boardnum : num},
		dataType:'json',
		 success: output
	})
	
}


function output(ob){
	
	var str='';
	//반복문
	$.each(ob, function(i, item) {
		str += item.id;
		str += item.text;
		str += '<br/>';
	$("#spot"+item.boardnum).html(str);
	})
	
	
}

function output2(ob){
	
	var str='';
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
<div id="container" style="width:100%;"> 
	
	<div id="menu" class="btn-group-vertical" style="width:10%x;">
			<a href="board?type=notice" class="btn btn-default">공지사항</a>
			<a href="board?type=qna" class="btn btn-default">건의&QnA</a>
			<a href="board?type=freeboard" class="btn btn-default">자유게시판</a>
	</div>
	<div  id="gesipan" style="width:80%;">
	<table class="table table-striped table-hover ">
		<thead>
		<!-- <tr>
			<td colspan="4" style="margin: auto; text-align: center; font-weight:bold;"><h1>${type}게시판</h1></td>
		</tr> -->
		<tr>
			<td colspan="4">전체글 : ${navi.totalRecordsCount} &nbsp;페이지 :
				${navi.currentPage}/${navi.totalPageCount}</td>
			<c:if test="${type=='qna' || type=='freeboard'}">		
				<td><input type="button" value="글쓰기" class="btn btn-default" onclick="location.href='write';" style="text-align:right;"></td>
			</c:if>
		</tr>
		<tr>	
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
		<thead>
		<tbody>
		<c:forEach items="${boardlist}" var="list">
			<tr>
				<td>${list.boardnum}</td>
				<td><a href="read?boardnum=${list.boardnum}"
					value="${list.boardnum}" id="boardnum">${list.title.replace("<", "&lt;") }</a>&nbsp;&nbsp;
					<a href="#"
					onclick="showmap(spot${list.boardnum}, ${list.boardnum});"
					class="dd" num="${list.boardnum }">${list.totalreply }</a>
					<div id="spot${list.boardnum}"
						style="position: absolute; left: 520px; top: 500px; visibility: hidden;">
						</div></td>
				<td>${list.id}</td>
				<td>${list.hits }</td>
				<td>${list.inputdate }</td>
			</tr>

		</c:forEach>

		<tr>
			<td colspan="5" class="info" style="text-align:center"><a
				href="javascript:formSubmit('${navi.currentPage-navi.pagePerGroup}')"><<</a>
				<a href="javascript:formSubmit('${navi.currentPage-1}')"></a> <c:forEach
					var="i" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<a href="javascript:formSubmit('${i}')">${i}</a>
				</c:forEach> <a href="javascript:formSubmit('${navi.currentPage+1}')">></a> <a
				href="javascript:formSubmit('${navi.currentPage+5}')">>></a></td>
		</tr>
		<tr>
			<form id="pagingForm" action="board" method="get">
				<input type="hidden" name="page" id="page" value="1" />
				<input type="hidden" name="type" value="${type }" />
				<td colspan="5" style="text-align:right">제목 : <input type="text" name="searchText"
					value="${searchText}" /> <input type="submit" value="검색">
				</td>
			</form>
		</tr>
		</tbody>
	</table>
</div>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</div>
</body>
</html>
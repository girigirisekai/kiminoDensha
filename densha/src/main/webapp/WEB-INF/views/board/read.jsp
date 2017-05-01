<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
	<script src="./resources/js/jquery-3.1.1.min.js"></script>
	<link rel="stylesheet" href="./resources/css/bootstrap.min2.css" type="text/css">
	<script src="./resources/js/bootstrap.min.js"></script>
	<style>

		fieldset {
			border:2px solid #999;
			border-left-style: none;
   			border-right-style: none;
    		border-bottom-style: none;
			/*border-radius:8px;*/
			padding-bottom: 20px;
		}
		
		div #menu {
			padding: 20px;
			float: left;
		}

		div #gesipan {
			padding: 20px;
			float: left;
		}
	
		ul li.nav {
			float: left;
			height: 100px;
			padding: 20px;
		}
	
		#writeButton {
			float: right;
		}
		
		#titleName th {
			text-align: center;
		}
		
		fieldset {
			border:2px solid #999;
			border-left-style: none;
	   		border-right-style: none;
	    	border-bottom-style: none;
			/*border-radius:8px;*/
			padding-bottom: 20px;
		}
		
		body, html {
			background: url(./resources/image/back/back3.jpg) no-repeat center center fixed;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
		}

		.first {
			overflow: hidden;
		}
	
		.passwordch{	
			display: inline-block;
			float:left;
			margin-right:4px;
		}		

		legend{
			font-size:  1.2em;
	    	font-weight:  bold;
		}	
		
		.widthAll {
			width: 80%;
			float: left;
		}
		.tbl_detail {
	border-bottom: 1px solid #ccc
}
	</style>
	<title>너의지하철 :</title>
	
	<script type="text/javascript">

		function replyDelete(rnum, bnum) {
			if (confirm('삭제하시겠습니까?')) {
				location.href = 'replyDelete?replynum=' + rnum + '&boardnum=' + bnum;
			}
		}


		function replyUpdate(rnum, bnum, rtext) {
			var text = prompt("수정할 내용을 입력해주세요", rtext);
			if (text != null) {
				location.href = 'replyUpdate?replynum=' + rnum + '&boardnum=' + bnum + '&text=' + text;
			}
		}
	</script>
</head>

<body>
	
	<!--top header-->
	<jsp:include page="../header.jsp" />
	<!--top header-->
	
			<!-- 디자인 바  -->
	<div class="progress" style="position: relative; top: -23px;">
		<div class="progress-bar progress-bar-success" style="width: 35%"></div>
		<div class="progress-bar progress-bar-warning" style="width: 20%"></div>
		<div class="progress-bar progress-bar-danger" style="width: 10%"></div>
	</div>
	<!-- 디자인 바  -->
	
	<div style="margin: 50px; background: rgba(255, 255, 255, 0.85); border-radius: 30px;" class="first">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">
			<div id="container" style="width: 100%;">
				<!-- 게시판 div -->
				<div style="width:15%;" id="menu">
					<fieldset>
						<legend align="center">게시판</legend>
							<div  class="btn-group-vertical" style="width:100%;">
								<a href="board?type=notice" class="btn btn-default">공지사항</a>
								<a href="board?type=qna" class="btn btn-default">건의&QnA</a>
								<a href="board?type=freeboard" class="btn btn-default">자유게시판</a>
							</div>
					</fieldset>
				</div>
				<!-- 게시판글읽기 div -->
				<div style="float: left; margin-bottom: 50px; width:70%; display:inline-block; padding-left:50px; margin:30px;">
					<table style="float:left; width:100%;"> 
						<tr  class = "tbl_detail"> 
							<th colspan="2"> <img src = "./resources/image/board/readBoard.gif"><p></th>
<!-- 							글 읽기 -->
						</tr>
						<tr >
							<th style="width: 80px;">작성자</th>
							<td >${board.id.replace("<", "&lt;").replace(">", "&gt;") }</td>
						</tr>
		
						<tr>
							<th>작성일</th>
							<td>${board.inputdate }</td>
						</tr>
	
						<tr class = "tbl_detail">
							<th>조회수</th>
							<td>${board.hits }</td>
						</tr>
	
						<tr  class = "tbl_detail">
							<th><h5>제목</h5></th>
							<td><h5>${board.title.replace("<", "&lt;").replace(">", "&gt;") }</h5></td>
						</tr>
	
						<tr class = "tbl_detail">
							<th>내용</th>
							<td><p></p>${board.content}</td>
						</tr>
	
						<tr>
							<th>파일첨부</th>
							<td>
							<p></p>
								<c:if test="${board.originalfile!=null }">
									<img src="download?boardnum=${board.boardnum }" width="600px">
									<br>
									<a href="download?boardnum=${board.boardnum }" class="btn btn-success">${board.originalfile.replace("<", "&lt;").replace(">", "&gt;") }</a>		
								</c:if>
							</td>
						</tr>
						<tr >
							<td colspan="2"><p></td>
						</tr>
						<tr  class = "tbl_detail">
							<td>
								
							</td>
							<td>
								
								<div style="position: relative; left:70%;">
								<c:if test="${board.id.equals(loginId) }">
									<a href="delete?boardnum=${board.boardnum }" class="btn btn-danger">삭제</a>
									
									<a href="update?boardnum=${board.boardnum }" class="btn btn-warning" >수정</a>
								</c:if> 
								<a href="board" style=" width: 100px;" class="btn btn-default" >목록보기</a>
								</div>	
							</td>
						</tr>
						<tr>
							<td><br/></td>
						</tr>
					</table>
					
					<form action="writeReply" method="post">
						<input type="hidden" name="boardnum" value="${board.boardnum}">
						<table style="width: 100%; ">	
							<tr>
								<td>리플내용 &nbsp;&nbsp;</td><td><input type="text" name="text" style="width: 400px;">&nbsp;&nbsp;<input type="submit" value="확인" class="btn btn-primary" />
								&nbsp;&nbsp;
							</tr>
						</table>
					</form>
					<!-- 리플 div -->
					<div style="margin-top:20px;">	
						<table style="width: 100%; ">
							<c:forEach var="i" items="${rlist}">
								<tr>
									<td width="20%">${i.id}</td>
									<td style="text-align:left;">${i.text}</td>
									<td><input type="button" value="수정" onclick="replyUpdate('${i.replynum}', '${i.boardnum}', '${i.text}')" class="btn">
									<input type="button" value="삭제" onclick="replyDelete('${i.replynum}', '${i.boardnum}')" class="btn"></td>
								</tr>
							</c:forEach>
						</table>
					</div>	
				</div>
			</div>
		</div>	
	</div>
</body>
</html>
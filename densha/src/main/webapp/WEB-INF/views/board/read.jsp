<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min2.css"
	type="text/css">
<script src="./resources/js/jquery-3.1.1.min.js"></script>
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
	
legend{
		font-size:  1.2em;
    	font-weight:  bold;
	}	

</style>
<title>너의지하철 :</title>
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


.widthAll {
	width: 80%;
	float: left;
}
</style>
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
	<div style="margin: 50px; background: rgba(255, 255, 255, 0.85); border-radius: 30px;" class="first">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">
			<!-- 	div -->
			
				<div style="width:100%">
					<!-- 게시판 div -->
					<div style="width:10%; display:inline-block; float: left; margin:10px;" id="menu" >
						<fieldset>
							<legend align="center">게시판</legend>
								<div  class="btn-group-vertical" style="width:10%x;">
									<a href="board?type=notice" class="btn btn-default">공지사항</a>
									<a href="board?type=qna" class="btn btn-default">건의&QnA</a>
									<a href="board?type=freeboard" class="btn btn-default">자유게시판</a>
								</div>
						</fieldset>
					</div>
					<!-- 게시판글읽기 div -->
					<div style="float: left; margin-bottom: 50px; width:80%; display:inline-block; padding-left:50px; margin:30px;">
						<table style="float:left; width:100%;"> 
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
		
										<img src="download?boardnum=${board.boardnum }" width="600px">
									</c:if></td>
							</tr>
							<tr>
								<td></td>
								<td>
									<a href="board" style="display:block;  text-align:left;">목록보기</a>
								</td>
							</tr>
						</table>
							<div>
									<c:if test="${board.id.equals(id) }">
										<a href="delete?boardnum=${board.boardnum }">삭제</a>
										<a href="update?boardnum=${board.boardnum }">수정</a>
									</c:if> 
							</div>
								<table width="100%;">	
										<form action="writeReply" method="post">
											<input type="hidden" name="boardnum" value="${board.boardnum}">
											<tr>
												<td>리플내용 &nbsp;&nbsp;</td><td><input type="text" name="text" style="width: 400px;">&nbsp;&nbsp;<input type="submit" value="확인" class="btn"></td>&nbsp;&nbsp;
											</tr>
										</form>
									</table>
						<!-- 리플 div -->
						<div style="margin-top:20px;">	
							<table width="100%;">
								<c:forEach var="i" items="${rlist}">
									<tr>
										<td width="20%">${i.id}</td>
										<td style="text-align:left;">${i.text}</td>
										<td><input type="button" value="수정"
											onclick="replyUpdate('${i.replynum}', '${i.boardnum}', '${i.text}')" class="btn">
										<input type="button" value="삭제"
											onclick="replyDelete('${i.replynum}', '${i.boardnum}')" class="btn"></td>
									</tr>
								</c:forEach>
							</table>
						</div>	
					</div>
				</div>

 
			
		</div>
</body>
</html>
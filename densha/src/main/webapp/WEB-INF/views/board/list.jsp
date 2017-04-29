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
body {
	
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

</style>
<link rel="stylesheet" href="./resources/css/bootstrap.min2.css"
	type="text/css">
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
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

.passwordch{
	display: inline-block;
	float:left;
	margin-right:4px;
}

legend{
		font-size:  1.2em;
    	font-weight:  bold;
	}	

</style>
<script type="text/javascript">

	$(document).ready(function() {

		$('.titleNames').on('click', readPasswordCheckStep1);
		$('#passwordCheckPopup').css('top', screen.height / 4);
		$('#passwordCheckPopup').css('left', screen.width / 2.5);

	});

	function readPasswordCheckStep1() {
		var boardnum = $(this).attr('boardnum');
		var type = $(this).attr('type');
		if (type == 'qna') {

			$('#checkType').val(type);
			$('#checkBoardnum').val(boardnum);
			$('#checkButton').on('click', readPasswordCheckStep2);
			$('#passwordCheckPopup').css('visibility', 'visible');
			//$("#passwordCheckPopup").click(function(){$(this).append(" <b>Appended text</b>.");
		    //});

		} else {

			location.href = 'read?boardnum=' + boardnum + '&type=' + type + '';

		}

	}

	function readPasswordCheckStep2() {
		$.ajax({
			url : 'passwordCheck',
			type : 'POST',
			data : $('#passwordCheckTable').serialize(), 
			dataType : 'json',
			success : readPasswordCheckStep3,
			error : function(e) {
				alert("비밀번호가 일치하지 않거나 작성자와 일치하지 않습니다.");
				$('#passwordCheckPopup').css('visibility', 'hidden');
				$('#checkPassword').val('');
				$('#checkButton').off('click', readPasswordCheckStep2);
			}
		});
	}

	function readPasswordCheckStep3(board) {
		var boardnum = $('#checkBoardnum').val();
		var type = $('#checkType').val();
		$('#checkButton').off('click', readPasswordCheckStep2);
		location.href = 'read?boardnum=' + boardnum + '&type=' + type + '';

	}


	function showmap(spot, num) {
		console.log(spot);
		if (spot.style.visibility == "hidden") {
			spot.style.visibility = "visible";
			aj(num);
			return false;
		}
		if (spot.style.visibility == "visible") {
			spot.style.visibility = "hidden";
			return false;
		}
		console.log(spot);
	}



	function aj(num) {
		$.ajax({
			url : 'readReply',
			type : 'GET',
			data : {
				boardnum : num
			},
			dataType : 'json',
			success : output
		})

	}


	function output(ob) {
		var str = '';
		//반복문
		$.each(ob, function(i, item) {
			str += item.id;
			str += item.text;
			str += '<br/>';
			$("#spot" + item.boardnum).html(str);
		})


	}

	function output2(ob) {
		var str = '';
	}
</script>
</head>
<body>
	<!--top header-->
	<jsp:include page="../header.jsp" />
	<!--top header-->
<div style="margin: 50px; background: rgba(255, 255, 255, 0.85); border-radius: 30px;"
		class="first">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">
		
	<div id="container" style="width: 100%;">
		<div style="width:15%;" id="menu">
			<fieldset>
				<legend align="center">게시판</legend>
					<div  class="btn-group-vertical" style="width:10%x;">
						<a href="board?type=notice" class="btn btn-default">공지사항</a>
						<a href="board?type=qna" class="btn btn-default">건의&QnA</a>
						<a href="board?type=freeboard" class="btn btn-default">자유게시판</a>
					</div>
			</fieldset>
		</div>
		<div id="gesipan" style="width: 80%;">
			<table class="table table-striped table-hover ">
				<thead>
		<!-- <tr>
		<td colspan="4" style="margin: auto; text-align: center; font-weight:bold;"><h1>${type}게시판</h1></td>
		</tr> -->
					<tr>
						<td colspan="4" height="55">전체글 : ${navi.totalRecordsCount}
							&nbsp;페이지 : ${navi.currentPage}/${navi.totalPageCount}</td>
						<td id="writeButton">
							<c:if test="${(type=='qna' || type=='freeboard') && loginId!=null}">
								<input type="button" value="글쓰기" class="btn btn-default" onclick="location.href='write?type=${type}';">
							</c:if>
						</td>
					</tr>
					<tr id="titleName">
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
							<td style="text-align: center">${list.boardnum}</td>
							<td style="text-align: center">
								<%-- <a href="read?boardnum=${list.boardnum}"
									value="${list.boardnum}" id="boardnum">
									${list.title.replace("<", "&lt;") }
								</a> --%> 
							<span class="titleNames" boardnum="${list.boardnum}" type="${type}"> ${list.title.replace("<", "&lt;") }</span> &nbsp;&nbsp; 
							<a href="#" onclick="showmap(spot${list.boardnum}, ${list.boardnum});" class="dd" num="${list.boardnum }">[${list.totalreply }]</a>
								<div id="spot${list.boardnum}" style="position: absolute; left: 520px; top: 500px; visibility: hidden;"></div>
							</td>
							<td style="text-align: center">${list.id}</td>
							<td style="text-align: center">${list.hits }</td>
							<td style="text-align: center">${list.inputdate }</td>
						</tr>

					</c:forEach>

					<tr>
						<td colspan="5" class="info" style="text-align: center"><a
							href="javascript:formSubmit('${navi.currentPage-navi.pagePerGroup}')">&lt;&lt;</a>
							<a href="javascript:formSubmit('${navi.currentPage-1}')">&lt;</a> 
							<c:forEach var="i" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
								<a href="javascript:formSubmit('${i}')">${i}</a>
							</c:forEach> <a href="javascript:formSubmit('${navi.currentPage+1}')">&gt;</a> 
							<a href="javascript:formSubmit('${navi.currentPage+5}')">&gt;&gt;</a></td>
					</tr>
					<tr>
						<form id="pagingForm" action="board" method="get">
							<input type="hidden" name="page" id="page" value="1" /> 
							<input type="hidden" name="type" value="${type }" />
							<td colspan="5" style="text-align: right">제목 &nbsp; <input type="text" size= "15" name="searchText" value="${searchText}" /> 
								&nbsp;&nbsp;<input type="submit" value="검색" class="btn btn-default">
							</td>
						</form>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- div -->
	</div>
	</div>
	
	<!-- 비밀번호 체크 관련 팝업 -->
	<div id="passwordCheckPopup"
		style="position: absolute; border-radius: 5px; padding:4px 4px 4px 4px; border: none; top: 0px; left: 0px; width: 205px; height: 38px; z-index: 1; visibility: hidden; background: #000000; background : rgba(0, 0, 0, 0.5);">

	<table>
		<form id = "passwordCheckTable">
			<tr>
				<td>
					<input type="hidden" name = "boardnum" id = "checkBoardnum">
					<input type="hidden" name = "type" id = "checkType">
					<div class="passwordch"><input type="password" size="7" name = "secretpassword" id = "checkPassword"></div>
					<div class="passwordch"><input type="button" class="btn" value="비밀번호 확인" id = "checkButton" ></div>
				<td>
			</tr>
		</form>
	</table>
	</div>
</body>
</html>
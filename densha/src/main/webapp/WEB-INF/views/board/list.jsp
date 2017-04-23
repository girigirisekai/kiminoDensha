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
		float:left;
	}

	div #gesipan{
		padding:20px;
		float:left;
	}
	
	
	 ul li.nav{
		float:left; 
		height:100px;
		padding:20px;
	} 
	
	#writeButton{
		float:right;
	}
	
	#titleName th{
		text-align: center;
	}
	

</style>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
	
		$('.titleNames').on('click', readPasswordCheck);
		
	});
	
	function readPasswordCheck(){
		
		var boardnum = $(this).attr('boardnum');
		var type = $(this).attr('type');
		if(type == 'qna'){
			var check = document.getElementById('passwordCheckPopup');
			check.style.visibility="visible";
			
		}else {
			
			location.href='read?boardnum='+boardnum+'';
			
		}
		
	}

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
	<!--top header-->
	<jsp:include page="../header.jsp" />
	<!--top header-->
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
			<td colspan="4" height="55">전체글 : ${navi.totalRecordsCount} &nbsp;페이지 :
				${navi.currentPage}/${navi.totalPageCount}</td>
			<td id = "writeButton">
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
				<td>${list.boardnum}</td>
				<td>
					<%-- <a href="read?boardnum=${list.boardnum}"
					value="${list.boardnum}" id="boardnum">
					${list.title.replace("<", "&lt;") }
					</a> --%>
					<span
					class="titleNames" boardnum = "${list.boardnum}" type = "${type}"
					>
					${list.title.replace("<", "&lt;") }
					</span>
					
					&nbsp;&nbsp;
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
</div>

	<!-- 비밀번호 체크 관련 팝업 -->
	<div id="passwordCheckPopup"
		style="position: absolute; border: none; top: 100px; left: 100px; width: 50px; height: 30px; z-index: 1; visibility: hidden; background-color: white;">

		팝업니다 팝업
			
			
	</div>
</body>
</html>
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
<script src="./resources/js/bootstrap.min.js"></script>

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

		/* if(type=='qna'){
			
			var secretpassword = prompt('비밀번호를 입력해주세요');
			$("#secretpassword").val(secretpassword);
			
		} */
		
		
		
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
	<!--top header-->
	<jsp:include page="../header.jsp" />
	<!--top header-->
	<form action="write" method="post" id="writeform" enctype="multipart/form-data" onsubmit="return formCheck();">
		<table>
			<tr>
				<td>
					<select id="type" name="type">
						<option value="freeboard" 
							<c:if test="${type=='freeboard'}">		
								selected
							</c:if>						
						>자유게시판</option>
						<option value="qna"
							<c:if test="${type=='qna'}">		
								selected
							</c:if>	
						>건의&QnA</option>
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
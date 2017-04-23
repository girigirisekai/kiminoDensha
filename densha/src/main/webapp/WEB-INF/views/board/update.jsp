<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" type="text/css">
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<title></title>
</head>
<body>
	<!--top header-->
	<jsp:include page="../header.jsp" />
	<!--top header-->
<form action="update" method="post" id="updateForm" enctype="multipart/form-data" onsubmit="return formCheck();">
	<table>
		<tr>
			<td>글제목</td>
			<td><input type="text" name="title" value="${board.title}"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" style="width:400px;height:200px;resize:none;">${board.content}</textarea></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<c:if test="${board.originalfile!=null}">
						기존파일: ${board.originalfile }<br />
				</c:if>	
				<input type="file" name="upload" size="30" multiple="multiple">
			</td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="저장"><th>	
		</tr>
	</table>

</form>
</body>
</html>
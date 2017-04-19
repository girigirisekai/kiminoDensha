<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그인</title>
<script src="resources/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<form action="login" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" id="loginId" name="loginId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="loginPassword"
					name="loginPassword"></td>
			</tr>
			<tr>
				<td><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	
	
	
	
	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
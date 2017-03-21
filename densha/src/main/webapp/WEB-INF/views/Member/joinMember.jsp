<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
<script src="../resources/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../resources/js/function.js"></script>
<script>
	$(document).ready(function() {
		$('#id').on('keyup', selectId);
	});
	// 아이디 중복검사
	function selectId() {
		var checkId = $('#id').val();
		$.ajax({
			url : 'selectId',
			type : 'POST',
			data : {
				id : checkId
			},
			dataType: 'json',
			//success : output1,
			/* error: function(e){
				alert(JSON.stringify(e));
			} */
			complete : output1
		});
	}
	function output1(result) {
	//var check = result.id;
	console.log(result);
	var check = result.responseText;
	console.log(result.responseText);
		var str="";
		if (check != "") {
			str = '중복된 아이디가 있습니다';
			$('#searchId').html(str);
		}else{
			str = '사용가능한 아이디입니다';
			$('#searchId').html(str);
		}
		
	}
	// 아이디 중복검사 끝
</script>

</head>
<body>
	<form action="joinMember" method="post">
		<table border="1">
			<tr>
				<td colspan="3">회원가입</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td colspan="2"><input type="text" id="id" name="id">
			</tr>
			<tr>
				<td><div id="searchId"></div></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="2"><input type="password" id="password"
					name="password"></td>
			</tr>
			<tr>
				<td>비밀번호찾기 답안</td>
				<td colspan="2"><select id="question" name="question">
						<option>선택하세요</option>
						<option value="태어난 고향은 어디입니까?">태어난 고향은 어디입니까?</option>
						<option value="졸업한 초등학교는 어디입니까?">졸업한 초등학교는 어디입니까?</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2">답 작성:<input type="text" id="answer"
					name="answer"></td>
			</tr>
			<tr>
				<td colspan="3">인증코드 작성<input type="text" id="checkCode"
					name="checkCode"></td>
			</tr>
			<tr>
				<td colspan="3">이곳은 시간이 들어가야한다<input type="button"
					id="btCheckCode" value="인증코드 전송"></td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit"
					value="회원가입"> <input type="reset" value="초기화"></td>
			</tr>
		</table>
	</form>
</body>
</html>
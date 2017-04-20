function join() {

	var id = $('#id').val();
	var password = $('#password').val();
	var question = $('#question').val();
	var answer = $('#answer').val();
	var checkCode = $('#checkCode').val();
	if (id == "") {
		alert('아이디가 빈공간이여서는 안됩니다');
		return false;
	}
	if (password.length < 6 || password.length > 16) {
		alert('비밀번호는 6 ~ 16 자리로 입력해주세요.');
		return false;
	}

	if (question == "선택하세요") {
		alert('문제를 선택하세요');
		return false;
	}
	if (answer == "") {
		alert('비밀번호 체크 답안이 빈공간이여서는 안됩니다');
		return false;
	}
	if (checkCode == "") {
		alert('인증번호를 입력해 주세요');
		return false;
	}
}

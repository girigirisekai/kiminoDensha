<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>마우스오버 레이어</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function view(opt) {
  if(opt) {
     spec1.style.display = "block";
  }
  else {
     spec1.style.display = "none";
  }
}
</script>

</HEAD>

<BODY>


	<a href="#" onmouseover="view(true)" onmouseout="view(false)"
		style="text-decoration: none">가나다라마바사</a>

	<div id="spec1" style="position: relative; display: none">마우스
		오버해보세요.</div>

</BODY>
</HTML>

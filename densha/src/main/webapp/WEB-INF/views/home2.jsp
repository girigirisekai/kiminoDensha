<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<script type="text/javascript">
var text ='';

text += '<table>';
text += '<tr>';
text += 	'<td>5시</td>';
text += 	'<td time05="05" id="timatbl05"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>6시</td>';
text += 	'<td time06="06" id="timatbl06"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>7시</td>';
	text += 	'<td time07="07" id="timatbl07"></td>';
	text += '</tr>';
text += '<tr>';
text += 	'<td>8시</td>';
	text += 	'<td time08="08" id="timatbl08"></td>';
	text += '</tr>';
	text += '<tr>';
	text += 	'<td>9시</td>';
	text += 	'<td time09="09" id="timatbl09"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>10시</td>';
	text += 	'<td time10="10" id="timatbl10"></td>';
	text += '</tr>';
	text += '<tr>';
	text += 	'<td>11시</td>';
	text += 	'<td time11="11" id="timatbl11"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>12시</td>';
text += 	'<td time12="12" id="timatbl12"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>1시</td>';
text += 	'<td time13="13" id="timatbl13"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>2시</td>';
text += 	'<td time14="14" id="timatbl14"></td>';
text += '</tr>';
text += ' <tr>';
text += 	'<td>3시</td>';
text += 	'<td time15="15" id="timatbl15"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>4시</td>';
text += 	'<td time16="16" id="timatbl16"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>5시</td>';
text += 	'<td time17="17" id="timatbl17"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>6시</td>';
text += 	'<td time18="18" id="timatbl18"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>7시</td>';
text += 	'<td time19="19" id="timatbl19"></td>';
text += '</tr>';
text += '<tr>';
text += 	'<td>8시</td>';
text += 	'<td time20="20" id="timatbl20"></td>';
text += '</tr>';

text += '<tr>';
text += 	'<td>9시</td>';
	text += 	'<td time21="21" id="timatbl21"></td>';
	text += '</tr>';

text += '<tr>';
text += 	'<td>10시</td>';
	text += 	'<td time22="22" id="timatbl22"></td>';
	text += '</tr>';

text += '<tr>';
text += 	'<td>11시</td>';
	text += 	'<td time23="23" id="timatbl23"></td>';
	text += '</tr>';

text += '<tr>';
text += 	'<td>12시</td>';
	text += 	'<td time24="24" id="timatbl24"></td>';
	text +=' </tr>';
text +='</table>';


</script>
<script>
	function sumtest() {
		location.href = "js1";

	}
	function sumtest2() {
		location.href = "js2";

	}
	function sumtest3() {
		location.href = "js3";

	}
	function sumtest4() {
		location.href = "js4";

	}
	function sumtest5() {
		location.href = "js5";

	}
</script>
</head>
<body>
	<h1>Hello world!</h1>

	<P>
		<a href="javascript:sumtest() "> 입력받은 수까지 </a>
	</P>
	<P>
		<a href="javascript:sumtest2() "> array </a>
	</P>
	<P>
		<a href="javascript:sumtest3() "> length </a>
	</P>
	<P>
		<a href="javascript:sumtest4() "> window </a>
	</P>
	<P>
		<a href="testDrive"> TestDrive </a>
	</P>
	<P>
		<a href="javascript:sumtest5() "> JS </a>
	</P>
	<P>
		<a href="js6 "> JS2 </a>
	</P>
	<P>
		<a href="take1 "> Jquery1 </a>
	</P>
	<P>
		<a href="take2 "> Jquery2 </a>
	</P>
	<P>
		<a href="take3 "> Jquery3 </a>
	</P>
	<P>
		<a href="ajax1 "> AJAX1 </a>
	</P>

	<P>
		<a href="ajax2 "> AJAX2 </a>
	</P>
	<P>
		<a href="comment "> 방명로옥 </a>
	</P>
	<P>
		<a href="account "> 계좌등록 </a>
	</P>
	<P>
		<a href="board2 "> 게시판 </a>
	</P>
	<P>
		<a href="test "> 테스트 </a>
	</P>
	<P>
		<a href="js_4 "> 테스트2 </a>
	</P>
	<P>
		<a href="lastTime "> lastTime </a>
	</P>
	<P>
		<a href="stationInfo "> stationInfo </a>
	</P>
	<P>
		<a href="stationTime "> stationTime </a>
	</P>
	<P>
		<a href="realTime "> realTime </a>
	</P>
	<P>
		<a href="path "> path </a>
	</P>
	
	<P>
		<a href=" exitInfo  "> exitInfo </a>
	</P>
<P>
		<a href=" businfo  "> businfo </a>
	</P>
	
	<P>
		<a href=" demo  "> demo </a>
	</P>

<P>
		<a href="  mapping   "> mapping </a>
	</P>
	
	<P>
		<a href="  mapping2   "> mapping2 </a>
	</P>
	
	<P>
		<a href="test2"> test2 </a>
	</P>
	<P>
		<a href="test3"> test3 </a>
	</P>
	
	<P>
		<a href="test4"> 2개의 경로값 좌표 받기 </a>
	</P>
	
	<P>
		<a href="stationcode"> 서울지하철 맵 </a>
	</P>
<P>
		<a href="tests"> tests </a>
	</P>
</body>
</html>

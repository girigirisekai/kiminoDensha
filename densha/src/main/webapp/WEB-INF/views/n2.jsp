<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>마우스오버 레이어</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>

<script type="text/javascript">
function abspos(e){
    this.x = e.clientX + (document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft);
    this.y = e.clientY + (document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop);
    return this;
}

function itemClick(e){
    var ex_obj = document.getElementById('lay');
    if(!e) e = window.Event;
    pos = abspos(e);
    ex_obj.style.left = pos.x+"px";
    ex_obj.style.top = (pos.y+10)+"px";
    ex_obj.style.display = ex_obj.style.display=='none'?'block':'none';
}

function itemClickOut(e){
    var ex_obj = document.getElementById('lay');
    ex_obj.style.display = 'none';
}
</script>

<style type="text/css">

.effect {
  display: inline-block;
  position: relative;
}
.effect:after {
  position: absolute;
  display: block;
  content: "";
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 255, 0, 0.1);
}
</style>


</HEAD>

<BODY>
	<div class="effect">
	<img src="./resources/image/img1.jpg" >
	</div>
	<div id="lay" style="position: absolute; display: none; background: rgba(255, 255, 255, 0.7);">내용이 어쩌고
		저쩌고</div>
	<span onmouseover="itemClick(event);" onmouseout="itemClickOut(event);" > 룰오버 </span>
	
	<p>
	
	<img src ="./resources/image/subwayCar/subway_general.png" class = "effect">
</BODY>
</HTML>

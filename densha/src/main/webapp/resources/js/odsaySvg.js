var startMarker,endMarker,selectMarker;

CID = 1000;

var SVG = function(element){
	
	var curDown = false, curYPos = 0, curXPos = 0,viewBoxAttr,svg,valX = 0 , valY = 0;
	
	var zoomRate    = 1.1;
	
	var defaultZoomLevel = 15;
	
	svg = $('#contents').find('svg')[0];
	
	
	switch (CID) {
	case 1000:
		svg.setAttribute('viewBox', 170+' '+ 60 +' '+5000+' '+4200);
		break;
	case 7000:
		svg.setAttribute('viewBox', 393+' '+ 227 +' '+1320+' '+1100);
		break;
	case 4000:
		svg.setAttribute('viewBox', 563+' '+ 265 +' '+1452+' '+1210);
		break;
	case 5000:
		svg.setAttribute('viewBox', 102+' '+ 279 +' '+1598+' '+1331);
		break;
	case 3000:
		svg.setAttribute('viewBox', 87+' '+ 23 +' '+2126+' '+1772);
		break;

	default:
		break;
	}
	
	viewBoxAttr = (svg.getAttribute('viewBox')).split(" ");
	
	var drawData = function(data){
		
		$('#svg_1').on('click',function(){
			if(selectMarker){
				selectMarker.remove();
			}
		});
		
		$.each(data, function(index, entry) {
			makeSVGtag(entry, element);
		});
	}
	
	var makeSVGtag = function(data, sel){
		
		$.each(data, function(k, e) {

			if (typeof k === 'number') {
				makeSVGtag(e, sel);
			} else {

				if (typeof e == 'object') {

					// svg 태그 생성
					var el = document.createElementNS('http://www.w3.org/2000/svg',k);
					
					var thisID,thisX,thisY;
					
					//생성된 태그에 해당 속성 추가
					$.each(e, function(key, entry) {

						if (key != 'childNode') {
							
							if(key == 'id'){
								thisID = entry;
							}
							
							if(k == 'circle'){
								
								if(key == 'cx'){
									thisX = entry;
								}
								if(key == 'cy'){
									thisY = entry;
								}
								
							}
							
							el.setAttribute(key, entry);
						}
					});

					//텍스트태그 일때 해당 값 세팅
					if (k == 'text') {
						$(el).html(e.value);
					}

					// circle 태그일때 클릭시 해당 id값
					if (k == 'circle') {
						
						$(el).on('contextmenu', function() {
							
							selectMarkerSVG(e.cx,e.cy,e.id);
							
						});
						
						$(el).off('click').on('click', function() {
							//selectMarkerSVG(e.cx,e.cy,e.id);
							//svgObj.setViewBox(thisX,thisY);
						});
					}

					//속성 추가된 svg태그 append
					//document.getElementById('svg_1').appendChild(el);
					sel.append($(el));
					
					// g태그일때 자식노드들 처리	시작 
					if (k == 'g') {
						if (e.childNode) {
							makeSVGtag(e.childNode, $(el));
						}
					}

				}

			}
		});
		
	}
	
	var zoomViaMouseWheel = function (mouseWheelEvent)
    {
		//console.log(mouseWheelEvent);
		//console.log(mouseWheelEvent.originalEvent.touches[0]);
		//console.log(mouseWheelEvent.originalEvent);
      if (mouseWheelEvent.deltaY == 1)
        zoom('zoomIn');
      else
        zoom('zoomOut');
        
      /* When the mouse is over the webpage, don't let the mouse wheel scroll the entire webpage: */
      mouseWheelEvent.cancelBubble = true;	
      return false;							
    }  
	
	
	var zoom = function(zoomType){
		/*
		viewBoxAttr[0] = x-(Number(viewBoxAttr[2])/2);
		viewBoxAttr[1] = y-(Number(viewBoxAttr[3])/3);
		*/
		var tempViewBoxWidth = parseFloat(viewBoxAttr[2]);
		var tempViewBoxHeight = parseFloat(viewBoxAttr[3]);
		
		viewBoxAttr[2] = parseFloat(viewBoxAttr[2]);		// Convert string "numeric" values to actual numeric values.
		viewBoxAttr[3] = parseFloat(viewBoxAttr[3]);
		  
		  if (zoomType == 'zoomIn')
		  {
			  if(defaultZoomLevel <31){
				  viewBoxAttr[2] /= zoomRate;	// Decrease the width and height attributes of the viewBox attribute to zoom in.
				  viewBoxAttr[3] /= zoomRate;	
				  //(viewBoxWidth - tempViewBoxWidth) / 2;
				  viewBoxAttr[0] -= (viewBoxAttr[2] - tempViewBoxWidth) / 2;
				  viewBoxAttr[1] -= (viewBoxAttr[3] - tempViewBoxHeight) / 2;
				  
				  setZoomSliderBar(defaultZoomLevel+1);
				  defaultZoomLevel ++;
				  
			  }
			  
			   
		  }
		  else if (zoomType == 'zoomOut')
		  {
			  
			  if(defaultZoomLevel > 0){
				  
				  viewBoxAttr[2] *= zoomRate;	// Increase the width and height attributes of the viewBox attribute to zoom out.
				  viewBoxAttr[3] *= zoomRate;	
				  
				  viewBoxAttr[0] -= (viewBoxAttr[2] - tempViewBoxWidth) / 2;
				  viewBoxAttr[1] -= (viewBoxAttr[3] - tempViewBoxHeight) / 2;
				  
				  setZoomSliderBar(defaultZoomLevel-1);
				  
				  defaultZoomLevel --;
				  
			  }
			   
		  }
		  else
		    alert("function zoom(zoomType) given invalid zoomType parameter.");
		  
		  svg.setAttribute('viewBox', viewBoxAttr.join(' '));
		
	}
	
	var svgObj = {
			
			reSetViewBox : function(){
				
				switch (CID) {
				case 1000:
					svg.setAttribute('viewBox', 170+' '+ 60 +' '+5000+' '+4200);
					break;
				case 7000:
					svg.setAttribute('viewBox', 393+' '+ 227 +' '+1320+' '+1100);
					break;
				case 4000:
					svg.setAttribute('viewBox', 563+' '+ 265 +' '+1452+' '+1210);
					break;
				case 5000:
					svg.setAttribute('viewBox', 102+' '+ 279 +' '+1598+' '+1331);
					break;
				case 3000:
					svg.setAttribute('viewBox', 87+' '+ 23 +' '+2126+' '+1772);
					break;

				default:
					break;
				}
				
			}
			
			,
			setViewBox : function(x,y){
				//console.log(x);
				//console.log(y);
				viewBoxAttr[0] = x-(Number(viewBoxAttr[2])/2);
				viewBoxAttr[1] = y-(Number(viewBoxAttr[3])/3);
				//console.log(viewBoxAttr[0]+' '+ viewBoxAttr[1] +' '+' '+viewBoxAttr[2]+' '+viewBoxAttr[3]);
				svg.setAttribute('viewBox', (x-(Number(viewBoxAttr[2])/2))+' '+ (y-(Number(viewBoxAttr[3])/3)) +' '+viewBoxAttr[2]+' '+viewBoxAttr[3]);
			},
			
			svgZoomIn : function(){
				 zoom('zoomIn');
			},
			svgZoomOut : function(){
				zoom('zoomOut');
			},
			init : function(){

				//drawData(svgData);
				svgObj.reSetViewBox();
				//svg.addEventListener('DOMMouseScroll', zoomViaMouseWheel, false);
				//svg.addEventListener('mousewheel', zoomViaMouseWheel, false);

				$(svg).on('mousewheel',zoomViaMouseWheel);
				
				$(svg).mousemove(function(m) {
					if (curDown === true) {
						
						valX =  Number(viewBoxAttr[0])+ (curXPos - m.clientX);
						valY =  Number(viewBoxAttr[1])+ (curYPos - m.clientY);
						
						svg.setAttribute('viewBox', valX+' '+ valY +' '+viewBoxAttr[2]+' '+viewBoxAttr[3]);
						
					}
				});

				$(svg).mousedown(function(m) {
					curDown = true;
					curYPos = m.clientY;
					curXPos = m.clientX;

				});

				$(svg).mouseup(function() {

					viewBoxAttr[0] = valX;
					viewBoxAttr[1] = valY;
					curDown = false;
				});
				
				
			}
	}
	
	return svgObj;
}


function setZoomSliderBar(zoomLevel){
	
	var val = 150-(zoomLevel*5);
	
	$('#zoom_slide sub').css("top",val+'px');
	
}

var getSubwayStationInfo = function(id,target){
	
	var result;
	var paramData = {};
	
	paramData.stationID = id;
	paramData.lang = lang;

	url = '/subway/subwayData';

	$.ajax({
		url:url,
		dataType: 'json',
		data: paramData,
		type: 'post',
		success: function(data) {
				
				result = data.result.stationName;
				
				target.val(result);
		}
	});
	
}

var startMarkerSVG = function(x,y,id){
	//changeCardMode(thisTapMode,'cardSearchMode');
	if(startMarker){
		startMarker.remove();
	}
	SID = id;
	var el = document.createElementNS('http://www.w3.org/2000/svg','g');
	el.setAttribute('id', 'startPoint');
	
	var transformValue = 'translate('+(Number(x)-17)+','+(Number(y)-50)+')';
	
	el.setAttribute('transform', transformValue);
	
	var path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
	path1.setAttribute('fill', '#B71103');
	path1.setAttribute('d', 'M0,16.834c0,1.619,0.21,3.182,0.636,4.663c0,0,0.17,0.644,0.687,1.886c0.005,0.013,0.002,0.006,0,0 c0.002,0.006,0.005,0.013,0,0c1.472,3.515,5.557,12.03,15.489,26.555V50c0.008-0.011,0.014-0.021,0.021-0.031V0 C7.537,0,0,7.537,0,16.834z');
	
	var path2 = document.createElementNS('http://www.w3.org/2000/svg','path');
	path2.setAttribute('fill', '#9E1205');
	path2.setAttribute('d', 'M33.667,16.834C33.667,7.537,26.13,0,16.833,0v49.969c0.008,0.011,0.014,0.021,0.021,0.031v-0.063 c9.934-14.525,14.018-23.041,15.488-26.555c0.518-1.242,0.688-1.886,0.688-1.886C33.458,20.016,33.667,18.453,33.667,16.834z');
	
	var path3 = document.createElementNS('http://www.w3.org/2000/svg','path');
	path3.setAttribute('fill', '#FFFFFF');
	path3.setAttribute('d', 'M16.603,28.229l-7.758-8.621C8.29,18.992,8.34,18.044,8.956,17.49c0.616-0.557,1.564-0.504,2.118,0.111 l5.592,6.213l5.957-6.245c0.571-0.601,1.521-0.622,2.121-0.05c0.6,0.571,0.622,1.521,0.05,2.12L16.603,28.229z');
		
	$(el).append(path1).append(path2).append(path3);
	
	startMarker = $(el);
	
	$('#svg_1').append(startMarker);
	
	var sName = getSubwayStationInfo(id,$('#startSubwayStation'));
	
	if(endMarker){
		getStationPath();
	}
	changeCardMode(thisTapMode,'firstPageMode');
}

var endMarkerSVG = function(x,y,id){
	//changeCardMode(thisTapMode,'cardSearchMode');
	if(endMarker){
		endMarker.remove();
	}
	EID = id;
	var el = document.createElementNS('http://www.w3.org/2000/svg','g');
	el.setAttribute('id', 'endPoint');
	
	var transformValue = 'translate('+(Number(x)-17)+','+(Number(y)-50)+')';
	
	el.setAttribute('transform', transformValue);
	
	var path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
	path1.setAttribute('fill', '#3080E7');
	path1.setAttribute('d', 'M0,16.834c0,1.619,0.21,3.182,0.636,4.663c0,0,0.17,0.644,0.687,1.886c0.005,0.013,0.002,0.006,0,0 c0.002,0.006,0.005,0.013,0,0c1.472,3.515,5.557,12.03,15.489,26.555V50c0.008-0.011,0.014-0.021,0.021-0.031V0 C7.537,0,0,7.537,0,16.834z');
	
	var path2 = document.createElementNS('http://www.w3.org/2000/svg','path');
	path2.setAttribute('fill', '#1961BC');
	path2.setAttribute('d', 'M33.668,16.834C33.668,7.537,26.131,0,16.833,0v49.969c0.008,0.011,0.014,0.021,0.021,0.031v-0.063 c9.934-14.525,14.018-23.041,15.489-26.555c0.518-1.242,0.688-1.886,0.688-1.886C33.459,20.016,33.668,18.453,33.668,16.834z');
	
	var path3 = document.createElementNS('http://www.w3.org/2000/svg','path');
	path3.setAttribute('fill', '#FFFFFF');
	path3.setAttribute('d', 'M16.45,14.197c-1.849,0.859-3.228,0.494-3.762,0.283v-0.938h-1.917v17.75h1.917v-8.53 c0.535,0.211,1.914,0.576,3.762-0.283c0,0,2.69-1.493,6.446-0.555v-8.281C19.141,12.703,16.45,14.197,16.45,14.197z');
	
	$(el).append(path1).append(path2).append(path3);
	
	endMarker = $(el);
	
	$('#svg_1').append(endMarker);
	var eName = getSubwayStationInfo(id,$('#endSubwayStation'));
	if(startMarker){
		getStationPath();
	}
	
	changeCardMode(thisTapMode,'firstPageMode');
	
}


var selectMarkerSVG = function(x,y,id){
	
	if(selectMarker){
		selectMarker.remove();
	}
	var el = document.createElementNS('http://www.w3.org/2000/svg','g');
	el.setAttribute('id', 'selectPoint');
	
	var transformValue = 'translate('+(Number(x)-17)+','+(Number(y)-50)+')';
	el.setAttribute('transform', transformValue);
	
	var g1 = document.createElementNS('http://www.w3.org/2000/svg','g');
	g1.setAttribute('id', 'basicPoint');
	
	
	var path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
	path1.setAttribute('fill', '#37B8D2');
	path1.setAttribute('d', 'M16.834,0C7.537,0,0,7.537,0,16.834c0,1.619,0.21,3.182,0.637,4.663c0,0,0.17,0.644,0.687,1.886 c1.472,3.515,5.557,12.03,15.489,26.555V50c0.008-0.011,0.014-0.021,0.021-0.031c0.008,0.011,0.014,0.021,0.021,0.031v-0.063 c9.934-14.525,14.018-23.041,15.488-26.555c0.518-1.242,0.688-1.886,0.688-1.886c0.428-1.481,0.637-3.044,0.637-4.663 C33.668,7.537,26.131,0,16.834,0z');
	
	var circle1 = document.createElementNS('http://www.w3.org/2000/svg','circle');
	circle1.setAttribute('fill', '#FFFFFF');
	circle1.setAttribute('cx', '16.834');
	circle1.setAttribute('cy', '16.209');
	circle1.setAttribute('r', '8.125');
	
	$(g1).append(path1).append(circle1);
	$(el).append(g1);
	
	
	var g2 = document.createElementNS('http://www.w3.org/2000/svg','g');
	g2.setAttribute('transform', 'translate(-18,50)');
	
	var sub_g1 = document.createElementNS('http://www.w3.org/2000/svg','g');
	
	var sub_path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
	sub_path1.setAttribute('fill', '#36B8D2');
	if(lang == 1){
		sub_path1.setAttribute('d', 'M82.031,2.968C82.031,1.329,80.702,0,79.064,0H2.967C1.329,0,0,1.329,0,2.968V24.16h82.031V2.968z');
	}else{
		sub_path1.setAttribute('d', 'M68.031,2.968C68.031,1.329,66.702,0,65.064,0H2.967C1.329,0,0,1.329,0,2.968V24.16h68.031V2.968z');
	}
	

	
	var sub_rect1 = document.createElementNS('http://www.w3.org/2000/svg','rect');
	sub_rect1.setAttribute('y', '24.16');
	sub_rect1.setAttribute('fill', '#14A4BF');
	if(lang == 1){
		sub_rect1.setAttribute('width', '82.032');
	}else{
		sub_rect1.setAttribute('width', '68.031');
	}
	
	sub_rect1.setAttribute('height', '1.047');
	
	$(sub_g1).append(sub_path1).append(sub_rect1);
	
	var sub_sub_path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
	sub_sub_path1.setAttribute('fill', '#FFFFFF');
	
	var sub_sub_path2 = document.createElementNS('http://www.w3.org/2000/svg','path');
	sub_sub_path2.setAttribute('fill', '#FFFFFF');
	
	switch (lang) {
	case 1:
		
		sub_sub_path1.setAttribute('d', 'M21.66,14.377c0,1.293-0.367,2.283-1.104,2.971c-0.735,0.688-1.798,1.031-3.188,1.031h-2.224v-7.853h2.466 c1.281,0,2.277,0.339,2.986,1.015C21.306,12.219,21.66,13.164,21.66,14.377z M19.931,14.42c0-1.686-0.745-2.529-2.234-2.529H16.81 v5.113h0.715C19.128,17.004,19.931,16.143,19.931,14.42z');
		sub_sub_path2.setAttribute('d', 'M25.546,18.486c-0.967,0-1.723-0.267-2.267-0.801c-0.544-0.533-0.816-1.289-0.816-2.266 c0-1.007,0.252-1.784,0.755-2.334s1.198-0.824,2.086-0.824c0.85,0,1.51,0.241,1.982,0.725s0.709,1.151,0.709,2.004v0.795h-3.873 c0.019,0.465,0.156,0.828,0.414,1.09s0.619,0.393,1.085,0.393c0.361,0,0.704-0.038,1.026-0.113s0.658-0.195,1.01-0.359v1.268 c-0.287,0.143-0.593,0.249-0.919,0.319C26.413,18.451,26.015,18.486,25.546,18.486z M25.316,13.427c-0.348,0-0.62,0.11-0.816,0.33 c-0.197,0.221-0.311,0.533-0.339,0.938h2.299c-0.007-0.404-0.112-0.717-0.317-0.938C25.939,13.537,25.663,13.427,25.316,13.427z');
		
		var en_sub_path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path1.setAttribute('fill', '#FFFFFF');
		en_sub_path1.setAttribute('d', 'M32.295,18.486c-0.705,0-1.259-0.256-1.659-0.768H30.55c0.057,0.501,0.086,0.791,0.086,0.869v2.434h-1.639 v-8.647h1.332l0.23,0.778h0.076c0.383-0.594,0.95-0.891,1.702-0.891c0.709,0,1.264,0.273,1.665,0.821s0.602,1.309,0.602,2.282 c0,0.642-0.094,1.198-0.282,1.671c-0.188,0.473-0.455,0.833-0.803,1.079C33.172,18.363,32.764,18.486,32.295,18.486z M31.812,13.572c-0.404,0-0.7,0.124-0.887,0.373c-0.186,0.249-0.282,0.659-0.289,1.232v0.178c0,0.645,0.096,1.105,0.287,1.385 s0.495,0.42,0.91,0.42c0.734,0,1.102-0.605,1.102-1.816c0-0.59-0.091-1.033-0.271-1.329C32.483,13.72,32.199,13.572,31.812,13.572 z');
		var en_sub_path2 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path2.setAttribute('fill', '#FFFFFF');
		en_sub_path2.setAttribute('d', 'M39.442,18.379l-0.317-0.816h-0.043c-0.275,0.348-0.559,0.588-0.851,0.723 c-0.292,0.134-0.673,0.201-1.142,0.201c-0.576,0-1.03-0.165-1.361-0.494s-0.497-0.799-0.497-1.407c0-0.638,0.223-1.107,0.669-1.41 c0.445-0.303,1.118-0.47,2.017-0.502l1.042-0.032v-0.264c0-0.608-0.312-0.912-0.935-0.912c-0.479,0-1.044,0.145-1.692,0.435 l-0.542-1.106c0.691-0.361,1.457-0.543,2.299-0.543c0.806,0,1.423,0.176,1.853,0.527c0.43,0.351,0.645,0.884,0.645,1.6v4.002 H39.442z M38.958,15.597l-0.634,0.021c-0.477,0.015-0.831,0.101-1.063,0.258s-0.35,0.397-0.35,0.72 c0,0.462,0.266,0.693,0.795,0.693c0.38,0,0.684-0.109,0.911-0.328s0.341-0.509,0.341-0.87V15.597z');
		var en_sub_path3 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path3.setAttribute('fill', '#FFFFFF');
		en_sub_path3.setAttribute('d', 'M45.294,12.262c0.222,0,0.406,0.016,0.553,0.048l-0.123,1.536c-0.133-0.036-0.294-0.054-0.483-0.054 c-0.522,0-0.93,0.134-1.222,0.403c-0.292,0.268-0.438,0.645-0.438,1.127v3.057h-1.639v-6.005h1.24l0.242,1.01h0.08 c0.187-0.337,0.438-0.607,0.755-0.813C44.578,12.364,44.922,12.262,45.294,12.262z');
		var en_sub_path4 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path4.setAttribute('fill', '#FFFFFF');
		en_sub_path4.setAttribute('d', 'M49.138,17.182c0.286,0,0.63-0.063,1.031-0.188v1.22c-0.408,0.182-0.91,0.273-1.504,0.273 c-0.656,0-1.133-0.166-1.432-0.497s-0.449-0.828-0.449-1.49v-2.896h-0.783v-0.692l0.902-0.548l0.473-1.268h1.047v1.278h1.682 v1.229h-1.682v2.896c0,0.232,0.065,0.404,0.196,0.516S48.923,17.182,49.138,17.182z');
		var en_sub_path5 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path5.setAttribute('fill', '#FFFFFF');
		en_sub_path5.setAttribute('d', 'M55.306,18.379l-0.221-0.768H55c-0.175,0.279-0.424,0.494-0.746,0.646s-0.689,0.229-1.102,0.229 c-0.705,0-1.236-0.188-1.595-0.566s-0.537-0.922-0.537-1.631v-3.915h1.638v3.507c0,0.434,0.077,0.759,0.231,0.976 s0.399,0.325,0.735,0.325c0.459,0,0.79-0.153,0.994-0.46c0.204-0.306,0.307-0.813,0.307-1.522v-2.825h1.638v6.005H55.306z');
		var en_sub_path6 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path6.setAttribute('fill', '#FFFFFF');
		en_sub_path6.setAttribute('d', 'M61.304,12.262c0.222,0,0.406,0.016,0.553,0.048l-0.123,1.536c-0.133-0.036-0.294-0.054-0.483-0.054 c-0.522,0-0.93,0.134-1.222,0.403c-0.292,0.268-0.438,0.645-0.438,1.127v3.057h-1.639v-6.005h1.24l0.242,1.01h0.08 c0.187-0.337,0.438-0.607,0.755-0.813C60.587,12.364,60.932,12.262,61.304,12.262z');
		var en_sub_path7 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path7.setAttribute('fill', '#FFFFFF');
		en_sub_path7.setAttribute('d', 'M65.228,18.486c-0.967,0-1.723-0.267-2.267-0.801c-0.544-0.533-0.816-1.289-0.816-2.266 c0-1.007,0.252-1.784,0.755-2.334s1.198-0.824,2.086-0.824c0.85,0,1.51,0.241,1.982,0.725s0.709,1.151,0.709,2.004v0.795h-3.873 c0.019,0.465,0.156,0.828,0.414,1.09s0.619,0.393,1.085,0.393c0.361,0,0.704-0.038,1.026-0.113s0.658-0.195,1.01-0.359v1.268 c-0.287,0.143-0.593,0.249-0.919,0.319C66.094,18.451,65.697,18.486,65.228,18.486z M64.998,13.427c-0.348,0-0.62,0.11-0.816,0.33 c-0.197,0.221-0.311,0.533-0.339,0.938h2.299c-0.007-0.404-0.112-0.717-0.317-0.938C65.621,13.537,65.344,13.427,64.998,13.427z');
		
		$(sub_g1).append(sub_sub_path1).append(sub_sub_path2).append(en_sub_path1).append(en_sub_path2).append(en_sub_path3).append(en_sub_path4).append(en_sub_path5).append(en_sub_path6).append(en_sub_path7).on('click',function(){
			selectMarker.remove();
			startMarkerSVG(x,y,id);
		});
		
		break;
	case 2:
		
		sub_sub_path1.setAttribute('d', 'M33.674,14.159v5.187h-1.205v-0.741h-7.422v0.767h-1.181v-5.212h1.181v3.303h3.026v-4.056h-3.729V9.023 h1.168v3.252h2.562V7.931h1.193v4.345h2.688V9.011h1.23v4.396h-3.918v4.056h3.202v-3.303H33.674z');
		sub_sub_path2.setAttribute('d', 'M43.396,13.28v1.658h2.838v1.079h-2.838v1.721c0,0.427,0.063,0.49,0.465,0.49h1.218 c0.364,0,0.428-0.252,0.478-1.495c0.264,0.188,0.729,0.39,1.042,0.452c-0.101,1.62-0.427,2.085-1.406,2.085H43.66 c-1.181,0-1.469-0.339-1.469-1.532v-1.721h-1.997c-0.238,1.332-1.029,2.587-3.403,3.403c-0.138-0.264-0.502-0.716-0.741-0.916 c1.935-0.641,2.676-1.545,2.939-2.487h-2.663v-1.079h2.801v-0.101V13.28h-1.218v-0.452c-0.565,0.415-1.168,0.778-1.783,1.055 c-0.139-0.264-0.478-0.678-0.703-0.879c0.815-0.339,1.619-0.854,2.335-1.481c-0.352-0.377-0.929-0.854-1.381-1.206l0.729-0.615 c0.452,0.302,1.017,0.741,1.381,1.093c0.39-0.439,0.729-0.93,1.005-1.432h-2.863V8.345h3.429l0.213-0.037l0.767,0.364 c-0.49,1.406-1.331,2.574-2.336,3.503h5.262c-1.093-1.079-1.959-2.461-2.55-4.006l1.03-0.301c0.201,0.515,0.439,1.004,0.729,1.481 c0.489-0.427,1.017-0.941,1.344-1.344l0.879,0.615c-0.54,0.516-1.181,1.067-1.721,1.47c0.214,0.289,0.452,0.564,0.69,0.829 c0.578-0.452,1.219-1.043,1.62-1.495l0.867,0.604c-0.553,0.527-1.244,1.079-1.834,1.507c0.653,0.552,1.382,1.004,2.173,1.318 c-0.264,0.226-0.628,0.69-0.804,1.005c-0.604-0.276-1.168-0.615-1.683-1.03v0.452H43.396z M42.191,13.28h-1.909v1.57v0.088h1.909 V13.28z');
		
		$(sub_g1).append(sub_sub_path1).append(sub_sub_path2).on('click',function(){
			selectMarker.remove();
			startMarkerSVG(x,y,id);
		});
		
		break;
	case 3:
		
		sub_sub_path1.setAttribute('d', 'M33.674,14.159v5.187h-1.205v-0.741h-7.422v0.767h-1.181v-5.212h1.181v3.303h3.026v-4.056h-3.729V9.023 h1.168v3.252h2.562V7.931h1.193v4.345h2.688V9.011h1.23v4.396h-3.918v4.056h3.202v-3.303H33.674z');
		sub_sub_path2.setAttribute('d', 'M45.782,13.218c-0.502,1.582-1.343,2.813-2.386,3.755c1.043,0.641,2.298,1.104,3.755,1.368 c-0.264,0.252-0.577,0.741-0.741,1.056c-1.557-0.327-2.862-0.892-3.955-1.671c-1.118,0.767-2.398,1.294-3.768,1.658 c-0.126-0.302-0.402-0.754-0.628-1.018c1.243-0.289,2.437-0.753,3.44-1.419c-0.64-0.603-1.18-1.306-1.632-2.097 c-0.867,1.431-2.022,2.611-3.592,3.541c-0.163-0.251-0.578-0.703-0.866-0.93c2.247-1.28,3.616-3.239,4.433-5.751h-1.695 c-0.729,0-1.193,0.088-1.306,0.238c-0.076-0.251-0.264-0.791-0.39-1.08c0.176-0.037,0.326-0.226,0.489-0.502 c0.139-0.251,0.628-1.243,0.842-2.211l1.23,0.214c-0.213,0.767-0.553,1.569-0.879,2.223h2.021c0.214-0.879,0.377-1.82,0.503-2.8 l1.293,0.2c-0.112,0.917-0.264,1.783-0.452,2.6h5.237l-0.013,1.118h-5.513c-0.126,0.401-0.264,0.816-0.415,1.192h3.969l0.226-0.05 L45.782,13.218z M40.596,14.034c0.464,0.866,1.067,1.607,1.82,2.235c0.716-0.615,1.318-1.356,1.746-2.235H40.596z M44.954,10.329 c-0.327-0.465-1.018-1.256-1.532-1.82l0.917-0.54c0.515,0.527,1.218,1.293,1.557,1.745L44.954,10.329z');
		
		$(sub_g1).append(sub_sub_path1).append(sub_sub_path2).on('click',function(){
			selectMarker.remove();
			startMarkerSVG(x,y,id);
		});
		
		break;

	default:
		
		sub_sub_path1.setAttribute('d', 'M28.864,13.908v0.879h3.203v2.638h-6.455v0.854h6.781v0.967h-8.063v-2.712H30.8v-0.791h-6.494v-0.955 h3.266v-0.879h-4.457v-0.967h10.234v0.967H28.864z M23.577,11.56c2.236-0.125,3.631-0.753,3.881-1.645h-3.34V8.948h3.453V7.956 h1.293v0.992h3.467v0.967h-3.354c0.252,0.892,1.658,1.52,3.869,1.645l-0.352,0.968c-2.01-0.139-3.566-0.691-4.283-1.646 c-0.715,0.954-2.248,1.507-4.258,1.646L23.577,11.56z');
		sub_sub_path2.setAttribute('d', 'M40.395,13.443h-5.352v-4.96h1.295v1.494h2.775V8.483h1.281V13.443z M37.481,18.229h6.404v1.017h-7.674 V16.27h6.016v-0.942h-6.039v-1.005h7.32v2.901h-6.027V18.229z M39.114,10.97h-2.775v1.444h2.775V10.97z M45.104,10.329v1.067 h-1.596v2.424h-1.293V8.006h1.293v2.323H45.104z');
		
		$(sub_g1).append(sub_sub_path1).append(sub_sub_path2).on('click',function(){
			selectMarker.remove();
			startMarkerSVG(x,y,id);
		});
		
		break;
	}
	
	$(g2).append(sub_g1);
	
	var sub_g2 = document.createElementNS('http://www.w3.org/2000/svg','g');
	
	var sub_rect2 = document.createElementNS('http://www.w3.org/2000/svg','rect');
	sub_rect2.setAttribute('y', '25.207');
	sub_rect2.setAttribute('fill', '#36B8D2');
	if(lang == 1){
		sub_rect2.setAttribute('width', '82.032');
	}else{
		sub_rect2.setAttribute('width', '68.031');
	}
	sub_rect2.setAttribute('height', '24.16');
	
	$(sub_g2).append(sub_rect2);
	
	var sub_rect3 = document.createElementNS('http://www.w3.org/2000/svg','rect');
	sub_rect3.setAttribute('y', '49.367');
	sub_rect3.setAttribute('fill', '#14A4BF');
	if(lang == 1){
		sub_rect3.setAttribute('width', '82.032');
	}else{
		sub_rect3.setAttribute('width', '68.031');
	}
	sub_rect3.setAttribute('height', '1.047');
	
	$(sub_g2).append(sub_rect3);
	
	var sub_sub_path3 = document.createElementNS('http://www.w3.org/2000/svg','path');
	
	sub_sub_path3.setAttribute('fill', '#FFFFFF');
	
	var sub_sub_path4 = document.createElementNS('http://www.w3.org/2000/svg','path');
	sub_sub_path4.setAttribute('fill', '#FFFFFF');
	
	
	switch (lang) {
	case 1:
		
		sub_sub_path3.setAttribute('d', 'M29.342,42.538l-0.57-1.869H25.91l-0.569,1.869h-1.794l2.771-7.885h2.036l2.781,7.885H29.342z M28.375,39.272c-0.527-1.693-0.823-2.651-0.89-2.874c-0.066-0.222-0.113-0.396-0.142-0.525c-0.119,0.458-0.457,1.591-1.016,3.399 H28.375z');
		sub_sub_path4.setAttribute('d', 'M35.017,36.42c0.222,0,0.406,0.017,0.554,0.049l-0.124,1.536c-0.133-0.036-0.294-0.054-0.483-0.054 c-0.522,0-0.93,0.135-1.222,0.402c-0.292,0.27-0.438,0.645-0.438,1.129v3.056h-1.638v-6.005h1.241l0.241,1.01h0.081 c0.186-0.337,0.438-0.607,0.754-0.813C34.3,36.523,34.645,36.42,35.017,36.42z');
		
		var en_sub_path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path1.setAttribute('fill', '#FFFFFF');
		en_sub_path1.setAttribute('d', 'M39.682,36.42c0.222,0,0.406,0.017,0.553,0.049l-0.123,1.536c-0.133-0.036-0.294-0.054-0.483-0.054 c-0.522,0-0.93,0.135-1.222,0.402c-0.292,0.27-0.438,0.645-0.438,1.129v3.056h-1.639v-6.005h1.24l0.242,1.01h0.08 c0.187-0.337,0.438-0.607,0.755-0.813C38.965,36.523,39.31,36.42,39.682,36.42z');
		var en_sub_path2 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path2.setAttribute('fill', '#FFFFFF');
		en_sub_path2.setAttribute('d', 'M40.926,34.98c0-0.533,0.297-0.8,0.891-0.8c0.595,0,0.893,0.267,0.893,0.8 c0,0.255-0.075,0.452-0.224,0.594s-0.371,0.213-0.669,0.213C41.223,35.787,40.926,35.518,40.926,34.98z M42.633,42.538h-1.638 v-6.005h1.638V42.538z');
		var en_sub_path3 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path3.setAttribute('fill', '#FFFFFF');
		en_sub_path3.setAttribute('d', 'M45.451,42.538l-2.288-6.005h1.713l1.16,3.422c0.119,0.372,0.195,0.782,0.231,1.229h0.043 c0.021-0.404,0.103-0.814,0.241-1.229l1.155-3.422h1.714l-2.289,6.005H45.451z');
		var en_sub_path4 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path4.setAttribute('fill', '#FFFFFF');
		en_sub_path4.setAttribute('d', 'M53.763,42.538l-0.317-0.816h-0.043c-0.275,0.348-0.559,0.588-0.851,0.723 c-0.292,0.134-0.673,0.201-1.142,0.201c-0.576,0-1.03-0.165-1.361-0.494s-0.497-0.799-0.497-1.407c0-0.638,0.223-1.107,0.669-1.41 c0.445-0.303,1.118-0.47,2.017-0.502L53.28,38.8v-0.263c0-0.609-0.312-0.914-0.935-0.914c-0.479,0-1.044,0.146-1.692,0.436 l-0.542-1.106c0.691-0.361,1.457-0.542,2.299-0.542c0.806,0,1.423,0.175,1.853,0.525c0.43,0.352,0.645,0.885,0.645,1.602v4.001 H53.763z M53.28,39.756l-0.634,0.021c-0.477,0.015-0.831,0.101-1.063,0.258s-0.35,0.397-0.35,0.72 c0,0.462,0.266,0.692,0.795,0.692c0.38,0,0.684-0.108,0.911-0.327s0.341-0.509,0.341-0.87V39.756z');
		var en_sub_path5 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path5.setAttribute('fill', '#FFFFFF');
		en_sub_path5.setAttribute('d', 'M57.901,42.538h-1.638v-8.357h1.638V42.538z');
		
		$(sub_g2).append(sub_sub_path3).append(sub_sub_path4).append(en_sub_path1).append(en_sub_path2).append(en_sub_path3).append(en_sub_path4).append(en_sub_path5).on('click',function(){
			selectMarker.remove();
			endMarkerSVG(x,y,id);
		});
		break;
	case 2:
		
		sub_sub_path3.setAttribute('d', 'M29.493,41.232l0.038,1.08c-2.286,0.326-4.709,0.652-6.38,0.879l-0.176-1.168 c0.754-0.075,1.708-0.188,2.75-0.314v-1.946H23.49v-1.042h2.235v-1.382h1.156v1.382h2.21v1.042h-2.21v1.796L29.493,41.232z M27.848,34.313c0.729,0.854,1.569,2.01,1.908,2.775l-0.916,0.54c-0.088-0.214-0.214-0.452-0.364-0.716 c-1.922,0.126-3.894,0.226-5.313,0.289l-0.088-1.105l1.13-0.037c0.289-0.679,0.565-1.508,0.767-2.211h-1.858v-1.042h6.366v1.042 h-3.189c-0.289,0.716-0.603,1.507-0.917,2.173c0.779-0.025,1.62-0.05,2.475-0.088c-0.276-0.402-0.578-0.804-0.867-1.155 L27.848,34.313z M31.087,40.44H29.97v-6.932h1.117V40.44z M34.001,32.341v9.707c0,0.716-0.151,1.068-0.603,1.269 c-0.44,0.176-1.219,0.214-2.248,0.214c-0.051-0.326-0.227-0.866-0.39-1.206c0.791,0.025,1.558,0.025,1.809,0.025 c0.213-0.013,0.289-0.075,0.289-0.302v-9.707H34.001z');
		sub_sub_path4.setAttribute('d', 'M39.641,37.465c-0.088,0.213-0.176,0.427-0.264,0.641h6.241v5.374h-1.218v-0.389h-4.848v0.414h-1.155 v-3.68c-0.603,0.88-1.318,1.633-2.097,2.211c-0.176-0.239-0.615-0.666-0.867-0.88c1.269-0.841,2.311-2.159,2.938-3.691h-2.511 v-0.93h4.822v-0.729h-3.667V34.94h3.667v-0.729h-4.258v-0.929h2.198c-0.164-0.314-0.402-0.679-0.641-0.955l1.029-0.352 c0.352,0.377,0.716,0.904,0.854,1.269l-0.101,0.038h3.014l-0.075-0.025c0.251-0.364,0.59-0.917,0.754-1.294l1.255,0.34 c-0.264,0.352-0.54,0.703-0.778,0.979h2.286v0.929h-4.346v0.729h3.742v0.866h-3.742v0.729h4.86v0.93H39.641z M39.553,38.972v0.615 h4.848v-0.615H39.553z M44.401,40.277h-4.848v0.628h4.848V40.277z M44.401,42.225v-0.641h-4.848v0.641H44.401z');
		
		$(sub_g2).append(sub_sub_path3).append(sub_sub_path4).on('click',function(){
			selectMarker.remove();
			endMarkerSVG(x,y,id);
		});
		break;
	case 3:
		
		sub_sub_path3.setAttribute('d', 'M29.493,41.232l0.038,1.08c-2.286,0.326-4.709,0.652-6.38,0.879l-0.176-1.168 c0.754-0.075,1.708-0.188,2.75-0.314v-1.946H23.49v-1.042h2.235v-1.382h1.156v1.382h2.21v1.042h-2.21v1.796L29.493,41.232z M27.848,34.313c0.729,0.854,1.569,2.01,1.908,2.775l-0.916,0.54c-0.088-0.214-0.214-0.452-0.364-0.716 c-1.922,0.126-3.894,0.226-5.313,0.289l-0.088-1.105l1.13-0.037c0.289-0.679,0.565-1.508,0.767-2.211h-1.858v-1.042h6.366v1.042 h-3.189c-0.289,0.716-0.603,1.507-0.917,2.173c0.779-0.025,1.62-0.05,2.475-0.088c-0.276-0.402-0.578-0.804-0.867-1.155 L27.848,34.313z M31.087,40.44H29.97v-6.932h1.117V40.44z M34.001,32.341v9.707c0,0.716-0.151,1.068-0.603,1.269 c-0.44,0.176-1.219,0.214-2.248,0.214c-0.051-0.326-0.227-0.866-0.39-1.206c0.791,0.025,1.558,0.025,1.809,0.025 c0.213-0.013,0.289-0.075,0.289-0.302v-9.707H34.001z');
		sub_sub_path4.setAttribute('d', 'M38.511,40.868c0.553,0.866,1.569,1.269,2.938,1.306c1.382,0.063,4.169,0.038,5.701-0.075 c-0.125,0.264-0.313,0.804-0.364,1.155c-1.406,0.075-3.943,0.101-5.337,0.05c-1.582-0.075-2.662-0.502-3.466-1.456 c-0.591,0.515-1.23,1.029-1.922,1.557l-0.577-1.168c0.577-0.352,1.256-0.828,1.871-1.293v-2.135H35.71v-1.08h2.801V40.868z M37.933,36.925c-0.427-0.503-1.368-1.155-2.147-1.558l0.767-0.753c0.766,0.364,1.721,0.979,2.185,1.469L37.933,36.925z M38.323,34.451c-0.414-0.503-1.293-1.168-2.034-1.607l0.791-0.716c0.741,0.389,1.646,1.017,2.06,1.52L38.323,34.451z M42.09,34.827c0.05-0.841,0.063-1.771,0.075-2.787h1.168c-0.013,0.991-0.038,1.921-0.088,2.787h3.517v1.105h-3.315 c0.489,2.248,1.507,3.805,3.566,4.496c-0.251,0.238-0.578,0.69-0.741,1.017c-1.796-0.703-2.825-1.984-3.44-3.83 c-0.465,1.695-1.382,2.989-3.215,3.868c-0.151-0.289-0.49-0.703-0.754-0.904c2.122-0.967,2.863-2.499,3.127-4.646h-3.014v-1.105 H42.09z');
		
		$(sub_g2).append(sub_sub_path3).append(sub_sub_path4).on('click',function(){
			selectMarker.remove();
			endMarkerSVG(x,y,id);
		});
		break;
		
	default:
		
		sub_sub_path3.setAttribute('d', 'M33.374,41.081v1.067H23.1v-1.067h4.471v-2.675h-3.215V33.02h7.762v1.042h-6.469v3.303h6.568v1.042h-3.354 v2.675H33.374z');
		sub_sub_path4.setAttribute('d', 'M40.733,38.683c-1.281-0.364-2.209-1.168-2.699-2.185c-0.516,1.117-1.457,1.983-2.789,2.398l-0.615-1.018 c1.746-0.527,2.727-1.858,2.727-3.265v-0.126h-2.387v-1.029h2.387v-1.356h1.305v1.356h2.373v1.029h-2.385v0.126 c0,1.306,0.967,2.562,2.699,3.063L40.733,38.683z M36.05,39.637h7.459v3.894h-1.293V40.68H36.05V39.637z M45.116,36.158h-1.607 v2.939h-1.293v-6.945h1.293v2.938h1.607V36.158z');
	
		$(sub_g2).append(sub_sub_path3).append(sub_sub_path4).on('click',function(){
			selectMarker.remove();
			endMarkerSVG(x,y,id);
		});
		
		break;
	}
	
	
	$(g2).append(sub_g2);
	
	var sub_g3 = document.createElementNS('http://www.w3.org/2000/svg','g');
	
	var sub_path3 = document.createElementNS('http://www.w3.org/2000/svg','path');
	sub_path3.setAttribute('fill', '#36B8D2');
	if(lang == 1){
		sub_path3.setAttribute('d', 'M0,72.652c0,1.639,1.329,2.968,2.967,2.968h76.098c1.638,0,2.967-1.329,2.967-2.968V50.414H0V72.652z');
	}else{
		sub_path3.setAttribute('d', 'M0,72.652c0,1.639,1.329,2.968,2.967,2.968h62.098c1.638,0,2.967-1.329,2.967-2.968V50.414H0V72.652z');
	}
	
	
	$(sub_g3).append(sub_path3)
	
	var sub_sub_path5 = document.createElementNS('http://www.w3.org/2000/svg','path');	
	sub_sub_path5.setAttribute('fill', '#FFFFFF');
	
	var sub_sub_path6 = document.createElementNS('http://www.w3.org/2000/svg','path');
	
	sub_sub_path6.setAttribute('fill', '#FFFFFF');
	
	switch (lang) {
	case 1:
		
		sub_sub_path5.setAttribute('d', 'M11.905,64.107c0,1.175-0.335,2.075-1.003,2.7c-0.67,0.625-1.636,0.938-2.898,0.938H5.982v-7.139h2.241 c1.165,0,2.07,0.308,2.715,0.923S11.905,63.004,11.905,64.107z M10.333,64.146c0-1.533-0.677-2.3-2.031-2.3H7.496v4.648h0.649 C9.603,66.495,10.333,65.712,10.333,64.146z');
		sub_sub_path6.setAttribute('d', 'M15.238,67.843c-0.879,0-1.565-0.242-2.061-0.728s-0.742-1.172-0.742-2.061 c0-0.915,0.229-1.622,0.686-2.121c0.458-0.5,1.09-0.75,1.897-0.75c0.771,0,1.372,0.22,1.802,0.659s0.645,1.047,0.645,1.821v0.723 h-3.521c0.017,0.423,0.142,0.754,0.376,0.991s0.563,0.356,0.986,0.356c0.329,0,0.64-0.034,0.933-0.103s0.599-0.178,0.918-0.327 v1.152c-0.261,0.13-0.539,0.227-0.835,0.291C16.026,67.811,15.665,67.843,15.238,67.843z M15.028,63.243 c-0.315,0-0.563,0.101-0.742,0.3c-0.179,0.201-0.281,0.484-0.308,0.853h2.09c-0.007-0.368-0.103-0.651-0.288-0.853 C15.594,63.344,15.343,63.243,15.028,63.243z');
		
		var en_sub_path1 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path1.setAttribute('fill', '#FFFFFF');
		en_sub_path1.setAttribute('d', 'M20.475,66.656c0.261,0,0.573-0.057,0.938-0.171v1.108c-0.371,0.166-0.827,0.249-1.367,0.249 c-0.596,0-1.029-0.15-1.302-0.452c-0.271-0.301-0.407-0.752-0.407-1.354v-2.632h-0.713v-0.63l0.82-0.498l0.43-1.152h0.952v1.162 h1.528v1.118h-1.528v2.632c0,0.212,0.06,0.368,0.178,0.469C20.123,66.605,20.28,66.656,20.475,66.656z');
		var en_sub_path2 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path2.setAttribute('fill', '#FFFFFF');
		en_sub_path2.setAttribute('d', 'M25.483,67.745l-0.288-0.742h-0.039c-0.251,0.315-0.509,0.534-0.773,0.657 c-0.266,0.121-0.611,0.183-1.038,0.183c-0.524,0-0.937-0.149-1.237-0.449c-0.302-0.3-0.452-0.726-0.452-1.279 c0-0.579,0.202-1.007,0.608-1.282c0.404-0.274,1.016-0.427,1.833-0.456l0.947-0.029v-0.239c0-0.554-0.283-0.83-0.85-0.83 c-0.437,0-0.949,0.132-1.538,0.396l-0.493-1.006c0.628-0.329,1.325-0.493,2.09-0.493c0.732,0,1.294,0.159,1.685,0.479 s0.586,0.804,0.586,1.455v3.638H25.483z M25.043,65.216l-0.576,0.02c-0.433,0.013-0.755,0.091-0.967,0.234 s-0.317,0.361-0.317,0.654c0,0.42,0.241,0.63,0.723,0.63c0.345,0,0.621-0.1,0.828-0.298c0.206-0.198,0.31-0.462,0.31-0.791V65.216 z');
		var en_sub_path3 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path3.setAttribute('fill', '#FFFFFF');
		en_sub_path3.setAttribute('d', 'M27.493,60.875c0-0.485,0.271-0.728,0.811-0.728s0.811,0.242,0.811,0.728c0,0.231-0.067,0.411-0.202,0.539 c-0.136,0.129-0.338,0.193-0.608,0.193C27.763,61.607,27.493,61.363,27.493,60.875z M29.045,67.745h-1.489v-5.459h1.489V67.745z');
		var en_sub_path4 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path4.setAttribute('fill', '#FFFFFF');
		en_sub_path4.setAttribute('d', 'M31.597,67.745h-1.489v-7.598h1.489V67.745z');
		var en_sub_path5 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path5.setAttribute('fill', '#FFFFFF');
		en_sub_path5.setAttribute('d', 'M36.468,66.124c0,0.56-0.194,0.986-0.584,1.279c-0.389,0.293-0.971,0.439-1.745,0.439 c-0.397,0-0.735-0.026-1.016-0.081c-0.28-0.053-0.542-0.132-0.786-0.236v-1.23c0.276,0.13,0.588,0.239,0.936,0.327 c0.346,0.088,0.651,0.132,0.915,0.132c0.54,0,0.811-0.156,0.811-0.469c0-0.117-0.036-0.213-0.107-0.285 c-0.071-0.074-0.195-0.156-0.371-0.25c-0.176-0.092-0.41-0.2-0.703-0.324c-0.42-0.176-0.729-0.339-0.925-0.488 c-0.197-0.149-0.341-0.321-0.43-0.516c-0.09-0.193-0.135-0.432-0.135-0.715c0-0.485,0.188-0.86,0.564-1.125 c0.375-0.266,0.908-0.398,1.599-0.398c0.657,0,1.297,0.144,1.919,0.43l-0.449,1.074c-0.273-0.117-0.529-0.213-0.767-0.288 s-0.48-0.112-0.728-0.112c-0.439,0-0.659,0.119-0.659,0.356c0,0.134,0.071,0.249,0.212,0.347c0.143,0.098,0.452,0.242,0.931,0.435 c0.427,0.173,0.739,0.334,0.938,0.483s0.345,0.322,0.439,0.518S36.468,65.854,36.468,66.124z');
		var en_sub_path6 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path6.setAttribute('fill', '#FFFFFF');
		en_sub_path6.setAttribute('d', 'M44.189,65.006c0,0.889-0.234,1.584-0.703,2.085s-1.121,0.752-1.958,0.752 c-0.524,0-0.986-0.114-1.387-0.345c-0.4-0.229-0.708-0.559-0.923-0.988s-0.322-0.931-0.322-1.504c0-0.892,0.232-1.585,0.698-2.08 s1.12-0.742,1.963-0.742c0.524,0,0.986,0.114,1.387,0.342s0.708,0.555,0.923,0.981S44.189,64.433,44.189,65.006z M40.415,65.006 c0,0.54,0.089,0.949,0.267,1.226c0.177,0.276,0.466,0.415,0.866,0.415c0.397,0,0.683-0.138,0.856-0.412 c0.175-0.275,0.262-0.685,0.262-1.229c0-0.54-0.088-0.945-0.264-1.216s-0.464-0.405-0.864-0.405c-0.397,0-0.684,0.135-0.859,0.402 C40.502,64.057,40.415,64.462,40.415,65.006z');
		var en_sub_path7 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path7.setAttribute('fill', '#FFFFFF');
		en_sub_path7.setAttribute('d', 'M47.937,63.404h-1.289v4.341h-1.489v-4.341h-0.82v-0.718l0.82-0.4v-0.4c0-0.622,0.153-1.076,0.459-1.362 s0.796-0.43,1.47-0.43c0.515,0,0.972,0.076,1.372,0.229l-0.381,1.094c-0.3-0.095-0.576-0.142-0.83-0.142 c-0.212,0-0.364,0.063-0.459,0.188c-0.095,0.126-0.142,0.286-0.142,0.481v0.342h1.289V63.404z');
		var en_sub_path8 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path8.setAttribute('fill', '#FFFFFF');
		en_sub_path8.setAttribute('d', 'M52.02,65.006v2.739h-1.514v-7.139h2.08c0.97,0,1.688,0.177,2.153,0.53 c0.466,0.353,0.698,0.889,0.698,1.608c0,0.42-0.115,0.794-0.347,1.12c-0.231,0.328-0.559,0.584-0.981,0.77l2.1,3.11h-1.68 l-1.704-2.739H52.02z M52.02,63.775h0.488c0.479,0,0.832-0.08,1.06-0.239s0.342-0.41,0.342-0.752c0-0.339-0.116-0.579-0.35-0.723 c-0.232-0.144-0.593-0.215-1.081-0.215H52.02V63.775z');
		var en_sub_path9 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path9.setAttribute('fill', '#FFFFFF');
		en_sub_path9.setAttribute('d', 'M61.452,65.006c0,0.889-0.234,1.584-0.703,2.085s-1.121,0.752-1.958,0.752 c-0.524,0-0.986-0.114-1.387-0.345c-0.4-0.229-0.708-0.559-0.923-0.988s-0.322-0.931-0.322-1.504c0-0.892,0.232-1.585,0.698-2.08 s1.12-0.742,1.963-0.742c0.524,0,0.986,0.114,1.387,0.342s0.708,0.555,0.923,0.981S61.452,64.433,61.452,65.006z M57.677,65.006 c0,0.54,0.089,0.949,0.266,1.226c0.178,0.276,0.467,0.415,0.867,0.415c0.397,0,0.683-0.138,0.857-0.412 c0.174-0.275,0.261-0.685,0.261-1.229c0-0.54-0.088-0.945-0.264-1.216s-0.464-0.405-0.864-0.405c-0.397,0-0.684,0.135-0.859,0.402 C57.765,64.057,57.677,64.462,57.677,65.006z');
		var en_sub_path10 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path10.setAttribute('fill', '#FFFFFF');
		en_sub_path10.setAttribute('d', 'M66.049,67.745l-0.2-0.698h-0.078c-0.159,0.254-0.386,0.45-0.679,0.588 c-0.293,0.139-0.627,0.208-1.001,0.208c-0.642,0-1.125-0.172-1.45-0.515c-0.325-0.344-0.488-0.838-0.488-1.482v-3.56h1.489v3.188 c0,0.394,0.07,0.689,0.21,0.887c0.14,0.196,0.363,0.295,0.669,0.295c0.417,0,0.718-0.139,0.903-0.418 c0.186-0.277,0.278-0.739,0.278-1.384v-2.568h1.489v5.459H66.049z');
		var en_sub_path11 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path11.setAttribute('fill', '#FFFFFF');
		en_sub_path11.setAttribute('d', 'M70.554,66.656c0.261,0,0.573-0.057,0.938-0.171v1.108c-0.371,0.166-0.827,0.249-1.367,0.249 c-0.596,0-1.029-0.15-1.301-0.452c-0.272-0.301-0.408-0.752-0.408-1.354v-2.632h-0.713v-0.63l0.82-0.498l0.43-1.152h0.952v1.162 h1.528v1.118h-1.528v2.632c0,0.212,0.06,0.368,0.179,0.469C70.202,66.605,70.359,66.656,70.554,66.656z');
		var en_sub_path12 = document.createElementNS('http://www.w3.org/2000/svg','path');
		en_sub_path12.setAttribute('fill', '#FFFFFF');
		en_sub_path12.setAttribute('d', 'M74.566,67.843c-0.879,0-1.565-0.242-2.061-0.728s-0.742-1.172-0.742-2.061 c0-0.915,0.229-1.622,0.686-2.121c0.458-0.5,1.09-0.75,1.897-0.75c0.771,0,1.372,0.22,1.802,0.659s0.645,1.047,0.645,1.821v0.723 h-3.521c0.017,0.423,0.142,0.754,0.376,0.991s0.563,0.356,0.986,0.356c0.329,0,0.64-0.034,0.933-0.103s0.599-0.178,0.918-0.327 v1.152c-0.261,0.13-0.539,0.227-0.835,0.291C75.354,67.811,74.993,67.843,74.566,67.843z M74.356,63.243 c-0.315,0-0.563,0.101-0.742,0.3c-0.179,0.201-0.281,0.484-0.308,0.853h2.09c-0.007-0.368-0.103-0.651-0.288-0.853 C74.922,63.344,74.671,63.243,74.356,63.243z');
		
		$(sub_g3).append(sub_sub_path5).append(sub_sub_path6).append(en_sub_path1).append(en_sub_path2).append(en_sub_path3).append(en_sub_path4).append(en_sub_path5).append(en_sub_path6).append(en_sub_path7).append(en_sub_path8).append(en_sub_path9).append(en_sub_path10).append(en_sub_path11).append(en_sub_path12).on('click',function(){
			selectMarker.remove();
			getStationInfo(id);	
		});
		break;
	case 2:
		
		sub_sub_path5.setAttribute('d', 'M27.76,60.21h-4.798v-0.929h4.798V60.21z M27.308,68.047h-2.775v0.527h-1.005v-4.22h3.78V68.047z M23.553,60.989h3.768v0.904h-3.768V60.989z M23.553,62.659h3.768v0.917h-3.768V62.659z M27.283,58.54h-3.68v-0.917h3.68V58.54z M24.533,65.296v1.809h1.758v-1.809H24.533z M34.542,65.748h-2.863v2.977h-1.143v-2.977h-2.914v-1.067h2.914v-1.557h-2.273v-1.055 h2.273v-1.444h-2.512V59.57h1.306c-0.163-0.578-0.489-1.356-0.841-1.96l0.941-0.339c0.401,0.653,0.804,1.507,0.941,2.085 l-0.527,0.214h2.524l-0.527-0.188c0.302-0.591,0.716-1.532,0.904-2.198l1.155,0.339c-0.364,0.716-0.741,1.495-1.067,2.048h1.52 v1.055h-2.675v1.444h2.398v1.055h-2.398v1.557h2.863V65.748z');
		sub_sub_path6.setAttribute('d', 'M37.105,64.556c-0.151,1.181-0.428,2.398-0.816,3.189c-0.201-0.126-0.653-0.339-0.892-0.427 c0.377-0.754,0.603-1.871,0.716-2.938L37.105,64.556z M46.686,58.176v10.285h-1.092v-0.565h-3.831v0.666h-1.055v-4.772 l-0.866,0.415c-0.063-0.252-0.163-0.553-0.289-0.88l-0.967,0.101v5.287h-1.042v-5.187c-0.703,0.075-1.369,0.139-1.946,0.188 l-0.151-1.042c0.289-0.013,0.628-0.038,0.992-0.063c0.214-0.265,0.427-0.553,0.653-0.867c-0.377-0.553-1.03-1.256-1.595-1.783 l0.564-0.778c0.113,0.101,0.227,0.201,0.352,0.313c0.39-0.716,0.804-1.619,1.043-2.298l1.042,0.402 c-0.452,0.854-0.979,1.833-1.432,2.536c0.238,0.251,0.452,0.503,0.615,0.729c0.503-0.754,0.967-1.545,1.294-2.197l0.979,0.464 c-0.691,1.08-1.595,2.374-2.411,3.403l1.595-0.112c-0.163-0.302-0.326-0.591-0.49-0.867l0.867-0.376 c0.477,0.74,0.967,1.683,1.192,2.373v-5.375H46.686z M39.754,64.329c0.339,0.767,0.678,1.759,0.816,2.398l-0.93,0.34 c-0.112-0.666-0.465-1.671-0.778-2.449L39.754,64.329z M41.763,59.269v3.189h1.356v-3.189H41.763z M41.763,66.815h1.356v-3.29 h-1.356V66.815z M45.594,59.269H44.15v3.189h1.444V59.269z M45.594,66.815v-3.29H44.15v3.29H45.594z');
		
		$(sub_g3).append(sub_sub_path5).append(sub_sub_path6).on('click',function(){
			selectMarker.remove();
			getStationInfo(id);	
		});
		break;
	case 3:
		
		sub_sub_path5.setAttribute('d', 'M27.044,65.359c0.088,0.301,0.276,0.766,0.401,0.992c-2.084,1.632-2.437,1.934-2.637,2.21 c-0.113-0.238-0.415-0.653-0.615-0.829c0.251-0.213,0.603-0.641,0.603-1.269v-4.257H23V61.09h2.926v5.11L27.044,65.359z M25.713,60.122c-0.402-0.527-1.269-1.344-1.959-1.921l0.74-0.754c0.679,0.553,1.582,1.307,2.01,1.821L25.713,60.122z M34.416,65.812h-2.938v2.913h-1.181v-2.913h-3.089v-1.08h3.089v-1.532h-2.411v-1.055h2.411v-1.507h-2.8V59.57h1.619 c-0.176-0.54-0.577-1.332-0.979-1.935l1.043-0.377c0.414,0.616,0.866,1.407,1.055,1.959L29.33,59.57h2.298 c0.377-0.704,0.804-1.658,1.043-2.399l1.192,0.377c-0.313,0.69-0.69,1.419-1.017,2.022h1.331v1.067h-2.7v1.507h2.311v1.055h-2.311 v1.532h2.938V65.812z');
		sub_sub_path6.setAttribute('d', 'M38.712,61.09c0.238-0.353,0.489-0.704,0.703-1.068l0.954,0.641c-0.829,1.193-1.783,2.374-2.763,3.341 l2.474-0.339c-0.024,0.301,0.013,0.74,0.025,0.992c-3.416,0.552-3.905,0.665-4.207,0.828c-0.063-0.226-0.226-0.766-0.364-1.067 c0.302-0.063,0.615-0.339,1.03-0.753c0.251-0.227,0.778-0.804,1.356-1.532c-1.558,0.176-1.884,0.251-2.098,0.352 c-0.05-0.251-0.238-0.816-0.39-1.13c0.264-0.051,0.49-0.327,0.804-0.741c0.302-0.414,1.281-1.972,1.847-3.466l1.143,0.489 c-0.603,1.256-1.382,2.55-2.173,3.592L38.712,61.09z M35.522,66.941c1.144-0.176,2.889-0.49,4.571-0.778l0.063,1.042 c-1.569,0.314-3.215,0.615-4.445,0.866L35.522,66.941z M46.686,57.824v10.599h-1.117v-0.652h-4.081v0.753H40.42V57.824H46.686z M41.488,59.005v3.353h1.507v-3.353H41.488z M41.488,66.678h1.507v-3.24h-1.507V66.678z M45.569,59.005h-1.507v3.353h1.507V59.005 z M45.569,66.678v-3.24h-1.507v3.24H45.569z');
		
		$(sub_g3).append(sub_sub_path5).append(sub_sub_path6).on('click',function(){
			selectMarker.remove();
			getStationInfo(id);	
		});
		break;

	default:
		
		sub_sub_path5.setAttribute('d', 'M29.016,63.576c-1.219-0.439-2.123-1.307-2.6-2.374c-0.504,1.23-1.432,2.211-2.738,2.688l-0.691-1.029 c1.783-0.615,2.75-2.16,2.75-3.793V57.95h1.307v1.218c0,1.457,0.967,2.838,2.65,3.391L29.016,63.576z M32.079,66.577 c0,1.344-1.432,2.135-3.779,2.135c-2.336,0-3.779-0.791-3.779-2.135c0-1.331,1.443-2.122,3.779-2.122 C30.647,64.455,32.079,65.246,32.079,66.577z M30.8,66.577c0-0.703-0.918-1.105-2.5-1.105s-2.498,0.402-2.498,1.105 c0,0.729,0.916,1.118,2.498,1.118S30.8,67.306,30.8,66.577z M33.561,60.173v1.067h-1.607v2.938h-1.293v-6.819h1.293v2.813H33.561z');
		sub_sub_path6.setAttribute('d', 'M38.134,60.398c0,1.834,0.691,3.755,2.211,4.71l-0.729,1.004c-1.029-0.628-1.709-1.732-2.098-3.001 c-0.402,1.394-1.143,2.587-2.234,3.252l-0.791-0.979c1.607-0.954,2.385-2.988,2.385-4.922v-2.048h1.256V60.398z M40.796,57.586 h1.219v10.599h-1.219v-5.789h-1.67v-1.055h1.67V57.586z M44.337,57.372v11.34h-1.23v-11.34H44.337z');
		
		$(sub_g3).append(sub_sub_path5).append(sub_sub_path6).on('click',function(){
			selectMarker.remove();
			getStationInfo(id);	
		});
		break;
	}
	
	
	$(g2).append(sub_g3);
	
	$(el).append(g2);
	
	selectMarker = $(el);
	
	$('#svg_1').append(selectMarker);
	
}


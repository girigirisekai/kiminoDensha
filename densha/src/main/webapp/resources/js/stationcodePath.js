/**
 * 이 파일은 경로를 연산하는 파일
 */

	

function pathm(list){ // 경로들의 역을 좌표에 찍어주는 부분
		
		$('#endPoint').attr('transform', 'translate('+(xPoint-17)+','+(yPoint-50)+')');
		$('#endPoint').html(endCode);
		$('#startEnd').off('click', pathTest2);
		$.each(list, function(index, item){
			if(item.length > 4){
				alert(item);	
			}else {
			$('#'+item).attr('fill', 'orange');
			}
		});
		scode = null;
		
	}
	
	
	
	function pathTest1(){ // 
		
		scode = code;
		 $.ajax({
			url : 'pars',
			type : 'get',
			data : {str: scode},
			dataType: 'text',
			success : function(abc){
				scodes = abc;
				
			}
		}); 
		$('#startEnd').off('click', pathTest1);
		$('#startPoint').attr('transform', 'translate('+(xPoint-17)+','+(yPoint-50)+')');
		$('#startPoint').html(startCode);
		
	}
	
	function pathTest2(){
		ecode = code;
		
		 $.ajax({
			url : 'pars',
			type : 'get',
			data : {str: ecode},
			dataType: 'text',
			success : function(bcd){
				ecodes = bcd;
					$.ajax({
						url : 'path2',
						type : 'get',
						data : {start: scodes, end: ecodes},
						dataType : 'json',
						success : pathm
					});
				
			}
		}); 
		
		
		
	}
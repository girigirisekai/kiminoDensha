<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>API 제공</title>
<script src="resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/loginModule.css">
<style type="text/css">
body, html {
	background: url(./resources/image/back/backapi.jpg) no-repeat center
		center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.tbl_detail {
	border-bottom: 1px solid #ccc
}

.tableCenter {
	width: 80%;
	margin: auto;
}
</style>
<script type="text/javascript">

	function resultGo() {
		var car = $('#carnum').val();

		$.ajax({
			url : 'example',
			type : 'post',
			data : {
				carnum : car
			},
			dataType : 'text',
			success : function(resultTest) {
				$('#result').html(resultTest);
			}
		});
	}
</script>
</head>
<body>
	<!--top header-->
	<jsp:include page="header.jsp" />
	<!--top header-->
	<!-- 디자인 바  -->
	<div class="progress" style="position: relative; top: -23px;">
		<div class="progress-bar progress-bar-success" style="width: 35%"></div>
		<div class="progress-bar progress-bar-warning" style="width: 20%"></div>
		<div class="progress-bar progress-bar-danger" style="width: 10%"></div>
	</div>
	<!-- 디자인 바  -->

<!-- 	주 내용, 여기서부터 div틀 임  -->
	<div style="margin: 50px; background: rgba(255, 255, 255, 0.85); border-radius: 30px">
		<div style="margin: 25px; padding-top: 20px; padding-bottom: 20px;">

			<div class="jumbotron" style="background: rgba(255, 255, 255, 0);">
				<h1>api Service</h1>
				<p>'너의 지하철은' api를 제공합니다</p>

				<p>
					<a
						href="http://localhost:8888/densha/apiservice/json?subwaynum=2002"
						class="btn btn-primary btn-lg">샘플 링크 보기(JSON)</a> <a
						href="http://localhost:8888/densha/apiservice/xml?subwaynum=2002"
						class="btn btn-primary btn-lg">샘플 링크 보기(XML)</a>
				</p>
			</div>

			<h3 id="progress-animated">샘플URL</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table style="width: 80%; margin: auto;">
				<tr class="tbl_detail">
					<td><h4>JSON 샘플URL</h4></td>
				</tr>
				<tr class="tbl_detail">
					<td><a
						href="http://localhost:8888/densha/apiservice/json?subwaynum=2002">http://localhost:8888/densha/apiservice/json?subwaynum=2002</a></td>
				</tr>
				<tr class="tbl_detail">
					<td style="word-break: break-all;">${objJson}</td>
				</tr>
				<tr class="tbl_detail">
					<td><h4>XML 샘플URL</h4></td>
				</tr>
				<tr class="tbl_detail">
					<td><a
						href="http://localhost:8888/densha/apiservice/xml?subwaynum=2002">http://localhost:8888/densha/apiservice/xml?subwaynum=2002</a></td>
				</tr>
				<tr class="tbl_detail">
					<td style="word-break: break-all;">${objXml}</td>

				</tr>
			</table>

			<h3 id="progress-animated">샘플 예시 실행</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 72%"></div>
			</div>
			<table class="tableCenter">
				<tr class="tbl_detail">
					<td>

						<h6>열차 번호를 입력하세요:</h6> <input type="text" id="carnum"
						style="width: 90%;"> <input type="button" id="apiSubmit"
						value="입력" onclick="resultGo()">
					</td>

				</tr>
				<tr class="tbl_detail">
					<td><pre id="result" style="overflow: auto; height: 400px;">
					
					</pre></td>

				</tr>



			</table>

			<h3 id="progress-animated">요청인자</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table class="tableCenter">
				<tr class="tbl_detail">
					<td><strong>주소</strong></td>
					<td colspan="2">http://localhost:8888/densha/apiservice?subwaynum=(열차번호)</td>

				</tr>
				<tr class="tbl_detail">
					<td><strong>변수명</strong></td>
					<td><strong>타입</strong></td>
					<td><strong>변수설명</strong></td>
				</tr>

				<tr class="tbl_detail">
					<td>SUBWAYNUM</td>
					<td>STRING(필수)</td>
					<td>열차 번호</td>
				</tr>

			</table>

			<h3 id="progress-animated">출력값</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table class="tableCenter">
				<tr class="tbl_detail">
					<td><h5>NO</h5></td>
					<td><h5>출력명</h5></td>
					<td><h5>출력설명</h5></td>
				</tr>
				<tr class="tbl_detail">
					<td>공통</td>
					<td>SUBWAYNUM</td>
					<td>열차번호 (정상조회시 출력됨)</td>
				</tr>
				<tr class="tbl_detail">
					<td>공통</td>
					<td>ALLHUMAN</td>
					<td>모든 열차의 사람 수 (예시참고)</td>
				</tr>
				<tr class="tbl_detail">
					<td>공통</td>
					<td>ALLCAR</td>
					<td>모든 열차 수 (예시참고)</td>
				</tr>
				<tr class="tbl_detail">
					<td>공통</td>
					<td>RESULT.MESSAGE</td>
					<td>요청결과 메시지 (예시참고)</td>
				</tr>
				<tr class="tbl_detail">
					<td>1</td>
					<td>SUBWAYNUM</td>
					<td>열차 번호</td>
				</tr>
			
				<tr class="tbl_detail">
					<td>2</td>
					<td>CARNUM</td>
					<td>열차 량 번호</td>
				</tr>
					<tr class="tbl_detail">
				
					<td>3</td>
					<td>HUMANNUM</td>
					<td>한 량에 타고 있는 사람 수 </td>
				</tr>
				<tr class="tbl_detail">
					<td>4</td>
					<td>humanPercent</td>
					<td>한 량에 타고 있는 사람의 수를 한계수치(160명)로 나눈 퍼센트</td>
				</tr>

				<tr class="tbl_detail">

					<td colspan="3"><br>
						<center>
							<img src="./resources/image/menu/seatinfo.png">
						</center> <br></td>


				</tr>
				<tr class="tbl_detail">
					<td>5</td>
					<td>ELDERLYSEAT1</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>6</td>
					<td>ELDERLYSEAT2</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>7</td>
					<td>ELDERLYSEAT3</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>

				<tr class="tbl_detail">
					<td>8</td>
					<td>ELDERLYSEAT4</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>9</td>
					<td>ELDERLYSEAT5</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>10</td>
					<td>ELDERLYSEAT6</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>11</td>
					<td>ELDERLYSEAT7</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>12</td>
					<td>ELDERLYSEAT8</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>13</td>
					<td>ELDERLYSEAT9</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>14</td>
					<td>ELDERLYSEAT10</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>15</td>
					<td>ELDERLYSEAT11</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>
				<tr class="tbl_detail">
					<td>16</td>
					<td>ELDERLYSEAT12</td>
					<td>노약좌석 번호 (상단의 사진으로 설명)</td>
				</tr>

			</table>

			<h3 id="progress-animated">메시지 설명</h3>
			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 45%"></div>
			</div>
			<table class="tableCenter">
				<tr class="tbl_detail">
					<td>
						<h5>변수명</h5>
					</td>
					<td><h5>값설명</h5></td>

				</tr>
				
				<tr class="tbl_detail">
					<td>subwayNum</td>
					<td>열차의 고유 번호입니다. 고유번호는 String 입니다.</td>
				</tr>
				<tr class="tbl_detail">
					<td>carNum</td>
					<td>열차의 량 번호입니다. 호선마다 열차의 량이 다릅니다.</td>
				</tr>

				<tr class="tbl_detail">
					<td>allhuman</td>
					<td>열차에 타고 있는 총인원입니다.</td>
				</tr>

				<tr class="tbl_detail">
					<td>item:elderlySeat1~12</td>
					<td>칸당 앉아있는지를 확인합니다. (1: 앉아있음, 0: 비어있음, 9: 좌석이 존재하지 않음)</td>
				</tr>

				<tr class="tbl_detail">
					<td>humanNum</td>
					<td>량당 있는 사람의 수입니다.</td>
				</tr>

				<tr class="tbl_detail">
					<td>humanPercent</td>
					<td>량당 있는 사람의 퍼센트, 160명이 초과하면 100%를 초과하여 표시합니다.<br>
						표시된 숫자는 퍼센트의 숫자를 표시하며, 소수점 1자리에서 반올림합니다.<br>
						Example : '26%'인 경우 '26'을 표시 
					</td>
				</tr>


			</table>

			<h3 id="progress-animated">개발자 예시코드</h3>

			<div class="progress progress-striped active">
				<div class="progress-bar" style="width: 72%"></div>
			</div>

			<ul class="nav nav-tabs" style="width: 84%; margin: auto;">
				<li class="active"><a href="#xmljava" data-toggle="tab">XML
						- JAVA</a></li>
				<li><a href="#jsonjava" data-toggle="tab">JSON - JAVA</a></li>
				<li><a href="#vokata" data-toggle="tab">vo 형태</a></li>

			</ul>
			
			<div id="myTabContent" class="tab-content" style="width: 84%; margin: auto;">
				<div class="tab-pane fade active in" id="xmljava">
					<div style="overflow: auto; width: 100%;">

						<pre style="margin: 0; line-height: 125%"> 
								

<span style="color: #0000aa">import</span> java.net.HttpURLConnection;
<span style="color: #0000aa">import</span> java.net.URL;
<span style="color: #0000aa">import</span> java.util.ArrayList;
<span style="color: #0000aa">import</span> java.util.List;

<span style="color: #0000aa">import</span> org.jdom.Document;
<span style="color: #0000aa">import</span> org.jdom.Element;
<span style="color: #0000aa">import</span> org.jdom.input.SAXBuilder;

<span style="color: #0000aa">public</span> <span style="color: #0000aa">class</span> realSeatAndHuman {

	<span style="color: #0000aa">public</span> ArrayList&lt;SeatAndHuman&gt; getSeatAndHuman(<span
								style="color: #00aaaa">String</span> carNum) <span
								style="color: #0000aa">throws</span> Exception {
		<span style="color: #aaaaaa; font-style: italic">// 열차 넘버를 받아서 열차의 전체 인원과 각 량당 인원과 노약자석의 좌석의 상황</span>
		<span style="color: #aaaaaa; font-style: italic">// XML 형식을 parsing하는 형태.</span>

		System.out.println(carNum);

		<span style="color: #00aaaa">String</span> link = <span
								style="color: #aa5500">&quot;http://localhost:8888/densha/apiservice/xml?subwaynum=&quot;</span>;
		<span style="color: #00aaaa">String</span> insertCarnum = carNum; <span
								style="color: #aaaaaa; font-style: italic">// 역코드</span>

		<span style="color: #00aaaa">String</span> addrResult = link + insertCarnum;

		System.out.println(addrResult);

		URL url = <span style="color: #0000aa">new</span> URL(addrResult.toString());

		ArrayList&lt;SeatAndHuman&gt; alist = <span style="color: #0000aa">new</span> ArrayList&lt;&gt;(); <span
								style="color: #aaaaaa; font-style: italic">// ArrayList 으로 전송한다.</span>

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod(<span style="color: #aa5500">&quot;GET&quot;</span>); <span
								style="color: #aaaaaa; font-style: italic">// GET으로 보내줍니다.</span>
		<span style="color: #0000aa">if</span> (conn.getResponseCode() &gt;= <span
								style="color: #009999">500</span>) { <span
								style="color: #aaaaaa; font-style: italic">// 에러団 처리</span>

			<span style="color: #aaaaaa; font-style: italic">// 실패라고 처리 후</span>
			<span style="color: #0000aa">return</span> <span
								style="color: #0000aa">null</span>; <span
								style="color: #aaaaaa; font-style: italic">// java団에서 null 처리 부탁</span>

		} <span style="color: #0000aa">else</span> { <span
								style="color: #aaaaaa; font-style: italic">// 정상 실행시 200</span>

			<span style="color: #0000aa">try</span> {

				SAXBuilder builder = <span style="color: #0000aa">new</span> SAXBuilder();
				<span style="color: #aaaaaa; font-style: italic">// url에 xml이 있는경우</span>
				Document jdomdoc = builder.build(url);

				Element root = jdomdoc.getRootElement();
				<span style="color: #aaaaaa; font-style: italic">// root는 데이터 전체를 받는다.</span>
				<span style="color: #aaaaaa; font-style: italic">// 이중 row를 여러 개체임으로 children을 쓴다.</span>

				<span style="color: #aaaaaa; font-style: italic">// 차량의 번호와 차량의 전체인원수</span>
				<span style="color: #00aaaa">String</span> subNum = root.getChild(<span
								style="color: #aa5500">&quot;SUBWAYNUM&quot;</span>).getValue();
				<span style="color: #00aaaa">String</span> allh = root.getChild(<span
								style="color: #aa5500">&quot;ALLHUMAN&quot;</span>).getValue();

				List&lt;Element&gt; list = root.getChildren(<span
								style="color: #aa5500">&quot;row&quot;</span>);
				<span style="color: #aaaaaa; font-style: italic">// row의 값들을 리스트로 받는다.</span>

				<span style="color: #0000aa">for</span> (<span
								style="color: #0000aa">int</span> i = <span
								style="color: #009999">0</span>; i &lt; list.size(); i++) {
					Element rows = list.get(i);
					<span style="color: #aaaaaa; font-style: italic">// 도착시간 급행선 출발지하철 역 도착 지하철 역</span>
					<span style="color: #00aaaa">String</span> subwaynums = rows.getChild(<span
								style="color: #aa5500">&quot;SUBWAYNUM&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> carNums = rows.getChild(<span
								style="color: #aa5500">&quot;CARNUM&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> human = rows.getChild(<span
								style="color: #aa5500">&quot;HUMANNUM&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat1 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT1&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat2 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT2&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat3 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT3&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat4 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT4&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat5 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT5&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat6 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT6&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat7 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT7&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat8 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT8&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat9 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT9&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat10 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT10&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat11 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT11&quot;</span>).getValue();
					<span style="color: #00aaaa">String</span> elderlySeat12 = rows.getChild(<span
								style="color: #aa5500">&quot;ELDERLYSEAT12&quot;</span>).getValue();
					SeatAndHuman vo = <span style="color: #0000aa">new</span> SeatAndHuman(subwaynums, carNums, human, elderlySeat1, elderlySeat2,
							elderlySeat3, elderlySeat4, elderlySeat5, elderlySeat6, elderlySeat7, elderlySeat8,
							elderlySeat9, elderlySeat10, elderlySeat11, elderlySeat12);
					alist.add(vo); <span style="color: #aaaaaa; font-style: italic">// 저장</span>
				}
			} <span style="color: #0000aa">catch</span> (Exception e) {
				e.printStackTrace();
			}
			<span style="color: #0000aa">return</span> alist; <span
								style="color: #aaaaaa; font-style: italic">// 정보 반환</span>
		}

	}

}

							</pre>


					</div>
				</div>
				
				
<!-- 				jsonjava -->
				<div class="tab-pane fade" id="jsonjava">
					<p>
				
					<div style="overflow: auto; width: auto;">
						<pre style="margin: 0; line-height: 125%">

<span style="color: #000080; font-weight: bold">import</span> java.io.BufferedInputStream;
<span style="color: #000080; font-weight: bold">import</span> java.net.HttpURLConnection;
<span style="color: #000080; font-weight: bold">import</span> java.net.URL;


<span style="color: #000080; font-weight: bold">public</span> <span
								style="color: #000080; font-weight: bold">class</span> realSeatAndHumanJson {
		
	<span style="color: #000080; font-weight: bold">public</span> String getSeatAndHuman(String carNum) <span
								style="color: #000080; font-weight: bold">throws</span> Exception {

		String link = <span style="color: #0000FF">&quot;http://localhost:8888/densha/apiservice/json?subwaynum=&quot;</span>;
		String insertCarnum = carNum; <span
								style="color: #008800; font-style: italic">// 역코드</span>

		<span style="color: #008800; font-style: italic">// 한국어 UTF 엔코딩으로 변경하기 위한 団 (%20 단어 형태)</span>
		
		String addrResult = link + insertCarnum;
		<span style="color: #008800; font-style: italic">// 링크 생성</span>
		System.<span style="color: #FF0000">out</span>.<span
								style="color: #FF0000">println</span>(addrResult);
		URL url = <span style="color: #000080; font-weight: bold">new</span> URL(addrResult.<span
								style="color: #FF0000">toString</span>());

		HttpURLConnection conn = (HttpURLConnection) url.<span
								style="color: #FF0000">openConnection</span>();
		conn.<span style="color: #FF0000">setRequestMethod</span>(<span
								style="color: #0000FF">&quot;GET&quot;</span>); <span
								style="color: #008800; font-style: italic">// GET형식으로 보내야 합니다.</span>
		System.<span style="color: #FF0000">out</span>.<span
								style="color: #FF0000">println</span>(conn.<span
								style="color: #FF0000">getResponseCode</span>());
		
		<span style="color: #000080; font-weight: bold">if</span> (conn.<span
								style="color: #FF0000">getResponseCode</span>() &gt;= <span
								style="color: #0000FF">500</span>) {
			<span style="color: #000080; font-weight: bold">return</span> <span
								style="color: #000080; font-weight: bold">null</span>;

		} <span style="color: #000080; font-weight: bold">else</span> { <span
								style="color: #008800; font-style: italic">// 정상 실행시 200</span>

			BufferedInputStream reader = <span
								style="color: #000080; font-weight: bold">new</span> BufferedInputStream(url.<span
								style="color: #FF0000">openStream</span>());
			StringBuffer buffer = <span style="color: #000080; font-weight: bold">new</span> StringBuffer();
			<span style="color: #000080; font-weight: bold">int</span> i;
			<span style="color: #000080; font-weight: bold">byte</span>[] b = <span
								style="color: #000080; font-weight: bold">new</span> <span
								style="color: #000080; font-weight: bold">byte</span>[<span
								style="color: #0000FF">4096</span>];
			<span style="color: #000080; font-weight: bold">while</span> ((i = reader.<span
								style="color: #FF0000">read</span>(b)) != -<span
								style="color: #0000FF">1</span>) {
				buffer.<span style="color: #FF0000">append</span>(<span
								style="color: #000080; font-weight: bold">new</span> String(b, <span
								style="color: #0000FF">0</span>, i));
			}
			<span style="color: #000080; font-weight: bold">return</span> buffer.<span
								style="color: #FF0000">toString</span>(); <span
								style="color: #008800; font-style: italic">// String으로 보내기 json jsp단 처리 </span>
		}

	}


}
</pre>
					</div>

				</div>
				
<div class="tab-pane fade" id="vokata">
   <!-- HTML generated using hilite.me --><div style="overflow:auto;width:auto;"><pre style="margin: 0; line-height: 125%">

<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">class</span> SeatAndHuman {

	<span style="color: #000080; font-weight: bold">private</span> String subwayNum; <span style="color: #008800; font-style: italic">// 지하철번호</span>
	<span style="color: #000080; font-weight: bold">private</span> String carNum; <span style="color: #008800; font-style: italic">// 칸번호</span>
	<span style="color: #000080; font-weight: bold">private</span> String humanNum; <span style="color: #008800; font-style: italic">// 사람수</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat1;<span style="color: #008800; font-style: italic">// 노약자석1</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat2;<span style="color: #008800; font-style: italic">// 노약자석2</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat3;<span style="color: #008800; font-style: italic">// 노약자석3</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat4;<span style="color: #008800; font-style: italic">// 노약자석4</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat5;<span style="color: #008800; font-style: italic">// 노약자석5</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat6;<span style="color: #008800; font-style: italic">// 노약자석6</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat7;<span style="color: #008800; font-style: italic">// 노약자석7</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat8;<span style="color: #008800; font-style: italic">// 노약자석8</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat9;<span style="color: #008800; font-style: italic">// 노약자석9</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat10;<span style="color: #008800; font-style: italic">// 노약자석10</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat11;<span style="color: #008800; font-style: italic">// 노약자석11</span>
	<span style="color: #000080; font-weight: bold">private</span> String elderlySeat12;<span style="color: #008800; font-style: italic">// 노약자석12</span>

	<span style="color: #008800; font-style: italic">// 생성자</span>
	<span style="color: #000080; font-weight: bold">public</span> SeatAndHuman() {
		<span style="color: #000080; font-weight: bold">super</span>();
	}

	<span style="color: #000080; font-weight: bold">public</span> SeatAndHuman(String subwayNum, String carNum, String humanNum, String elderlySeat1, String elderlySeat2,
			String elderlySeat3, String elderlySeat4, String elderlySeat5, String elderlySeat6, String elderlySeat7,
			String elderlySeat8, String elderlySeat9, String elderlySeat10, String elderlySeat11,
			String elderlySeat12) {
		<span style="color: #000080; font-weight: bold">super</span>();
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">subwayNum</span> = subwayNum;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">carNum</span> = carNum;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">humanNum</span> = humanNum;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat1</span> = elderlySeat1;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat2</span> = elderlySeat2;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat3</span> = elderlySeat3;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat4</span> = elderlySeat4;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat5</span> = elderlySeat5;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat6</span> = elderlySeat6;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat7</span> = elderlySeat7;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat8</span> = elderlySeat8;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat9</span> = elderlySeat9;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat10</span> = elderlySeat10;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat11</span> = elderlySeat11;
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat12</span> = elderlySeat12;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getSubwayNum() {
		<span style="color: #000080; font-weight: bold">return</span> subwayNum;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setSubwayNum(String subwayNum) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">subwayNum</span> = subwayNum;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getCarNum() {
		<span style="color: #000080; font-weight: bold">return</span> carNum;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setCarNum(String carNum) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">carNum</span> = carNum;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getHumanNum() {
		<span style="color: #000080; font-weight: bold">return</span> humanNum;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setHumanNum(String humanNum) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">humanNum</span> = humanNum;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat1() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat1;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat1(String elderlySeat1) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat1</span> = elderlySeat1;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat2() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat2;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat2(String elderlySeat2) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat2</span> = elderlySeat2;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat3() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat3;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat3(String elderlySeat3) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat3</span> = elderlySeat3;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat4() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat4;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat4(String elderlySeat4) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat4</span> = elderlySeat4;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat5() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat5;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat5(String elderlySeat5) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat5</span> = elderlySeat5;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat6() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat6;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat6(String elderlySeat6) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat6</span> = elderlySeat6;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat7() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat7;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat7(String elderlySeat7) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat7</span> = elderlySeat7;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat8() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat8;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat8(String elderlySeat8) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat8</span> = elderlySeat8;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat9() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat9;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat9(String elderlySeat9) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat9</span> = elderlySeat9;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat10() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat10;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat10(String elderlySeat10) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat10</span> = elderlySeat10;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat11() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat11;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat11(String elderlySeat11) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat11</span> = elderlySeat11;
	}

	<span style="color: #000080; font-weight: bold">public</span> String getElderlySeat12() {
		<span style="color: #000080; font-weight: bold">return</span> elderlySeat12;
	}

	<span style="color: #000080; font-weight: bold">public</span> <span style="color: #000080; font-weight: bold">void</span> setElderlySeat12(String elderlySeat12) {
		<span style="color: #000080; font-weight: bold">this</span>.<span style="color: #FF0000">elderlySeat12</span> = elderlySeat12;
	}

	@Override
	<span style="color: #000080; font-weight: bold">public</span> String toString() {
		<span style="color: #000080; font-weight: bold">return</span> <span style="color: #0000FF">&quot;Subway [subwayNum=&quot;</span> + subwayNum + <span style="color: #0000FF">&quot;, carNum=&quot;</span> + carNum + <span style="color: #0000FF">&quot;, humanNum=&quot;</span> + humanNum + <span style="color: #0000FF">&quot;, elderlySeat1=&quot;</span>
				+ elderlySeat1 + <span style="color: #0000FF">&quot;, elderlySeat2=&quot;</span> + elderlySeat2 + <span style="color: #0000FF">&quot;, elderlySeat3=&quot;</span> + elderlySeat3 + <span style="color: #0000FF">&quot;, elderlySeat4=&quot;</span>
				+ elderlySeat4 + <span style="color: #0000FF">&quot;, elderlySeat5=&quot;</span> + elderlySeat5 + <span style="color: #0000FF">&quot;, elderlySeat6=&quot;</span> + elderlySeat6 + <span style="color: #0000FF">&quot;, elderlySeat7=&quot;</span>
				+ elderlySeat7 + <span style="color: #0000FF">&quot;, elderlySeat8=&quot;</span> + elderlySeat8 + <span style="color: #0000FF">&quot;, elderlySeat9=&quot;</span> + elderlySeat9
				+ <span style="color: #0000FF">&quot;, elderlySeat10=&quot;</span> + elderlySeat10 + <span style="color: #0000FF">&quot;, elderlySeat11=&quot;</span> + elderlySeat11 + <span style="color: #0000FF">&quot;, elderlySeat12=&quot;</span>
				+ elderlySeat12 + <span style="color: #0000FF">&quot;]&quot;</span>;
	}

}
</pre></div>

  </div>
				

			</div>

		</div>
	</div>


	<script src="./resources/js/bootstrap.min.js"></script>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script src="./resources/js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway"
	rel="stylesheet">
<link rel="stylesheet" href="./resources/css/flexslider.css">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/loginModule.css">
<link rel="stylesheet" href="./resources/css/home.css">
<title>너의 지하철 : 지하철 맵</title>
<meta name="description"
	content="Free Bootstrap Theme by BootstrapMade.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">

</head>
<body id="top" data-spy="scroll">
	<!--top header-->
	<jsp:include page="header.jsp" />
	<!--top header-->

	<!--slider-->
<!-- 	<div id="slider" class="flexslider"> -->

<!-- 		<ul class="slides"> -->
<!-- 			<li> -->
<!-- 								<div class="embed-responsive embed-responsive-16by9"> 					<iframe class="embed-responsive-item" -->
<!-- 										src="https://www.youtube.com/embed/a1XuwtF7OJY?autoplay=1&playlist=XLkSQKCEKeE&loop=1&autohide=1&controls=0&showinfo=0&fs=0&rel=0" -->
<!-- 										frameborder="0" allowfullscreen></iframe> 				</div> -->
<!-- 				<img src="./resources/images/slider/slider1.jpg"> -->
<!-- 				<div class="caption"> -->
<!-- 					<h2 style="color: white;">지금 서울을 가지세요</h2> -->
<!-- 					<h2> -->
<!-- 						<span>체험하세요</span> -->
<!-- 					</h2> -->
<!-- 					<p>이 좋은걸 모르셨다구요? 지금 서울을 가자세요!</p> -->
<!-- 					<button class="btn">Read More</button> -->
<!-- 				</div> -->
<!-- 			</li> -->
<!-- 			<li><img src="./resources/images/slider/slider2.jpg"> -->

<!-- 				<div class="caption"> -->
<!-- 					<h2> -->
<!-- 						<span>yet another slide</span> -->
<!-- 					</h2> -->
<!-- 					<h2> -->
<!-- 						<span>html theme</span> -->
<!-- 					</h2> -->
<!-- 					<p>Lorem Ipsum is simply dummy text of the printing and -->
<!-- 						typesetting industry.</p> -->
<!-- 					<button class="btn">Read More</button> -->
<!-- 				</div></li> -->
<!-- 			<li><img src="./resources/images/slider/slider3.jpg"> -->

<!-- 				<div class="caption"> -->
<!-- 					<h2> -->
<!-- 						<span>one more slide</span> -->
<!-- 					</h2> -->
<!-- 					<h2> -->
<!-- 						<span>html theme</span> -->
<!-- 					</h2> -->
<!-- 					<p>Lorem Ipsum is simply dummy text of the printing and -->
<!-- 						typesetting industry.</p> -->
<!-- 					<button class="btn">Read More</button> -->
<!-- 				</div></li> -->
<!-- 		</ul> -->

<!-- 	</div> -->


<div class="carousel fade-carousel slide" data-ride="carousel" data-interval="5000" id="bs-carousel">
  <!-- Overlay -->
<!--   <div class="overlay"></div> -->

  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
    <li data-target="#bs-carousel" data-slide-to="1"></li>
    <li data-target="#bs-carousel" data-slide-to="2"></li>
  </ol>
  
  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item slides active">
      <div class="slide-1"></div>
      <div class="hero">
        <hgroup>
            <h1>너의 지하철</h1>        
            <h3 style="color: #E6E6E6;">지금 서울을 가지세요</h3>
        </hgroup>
        <button class="btn btn-hero btn-lg" role="button" style="width: 300px;" onclick="location.href='#service';">더 자세한 정보 보기</button>
      </div>
    </div>
    <div class="item slides">
      <div class="slide-2"></div>
      <div class="hero">        
        <hgroup>
            <h1>체험하세요!</h1>        
            <h3 style="color: #E6E6E6;">Example 서비스를 제공하고 있습니다.</h3>
        </hgroup>       
        <button class="btn btn-hero btn-lg" role="button" style="width: 300px;" onclick="location.href='stationcode';">바로가기</button>
      </div>
    </div>
    <div class="item slides">
      <div class="slide-3"></div>
      <div class="hero">        
        <hgroup>
            <h1>API를 이용하세요!</h1>        
            <h3 style="color: #E6E6E6;">개발자용 api를 제공하고 있습니다.</h3>
        </hgroup>
        <button class="btn btn-hero btn-lg" role="button"  style="width: 300px;" onclick="location.href='api';">api 이용하기</button>
      </div>
    </div>
  </div> 
</div>

	<!--about-->
	<div id="about">

		<div class="container">
			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<div class="about-heading">
						<h2>이 서비스는...</h2>
						<p>이 서비스는 지하철 정보 제공 서비스와 실시간 좌석, 그리고 지하철 칸을 제공하고 있습니다.</p>
					</div>
				</div>
			</div>
		</div>

		<!--about wrapper left-->
		<div class="container">

			<div class="row">
				<div class="col-xs-12 hidden-sm col-md-5">

					<div class="about-left">
						<img src="./resources/images/about/about1.jpg" alt="">
					</div>

				</div>

				<!--about wrapper right-->
				<div class="col-xs-12 col-md-7">
					<div class="about-right">
						<div class="about-right-heading">
							<h1>이 서비스의 특징</h1>
						</div>

						<div class="about-right-boot">
							<div class="about-right-wrapper">
								<a href="#"><h3>너의 지하철은 다릅니다.</h3></a>
								<p>열차의 전체 인원수와 열차의 칸당 인원수</p>
								<p>그리고 열차의 노약좌석에 앉아있는 사람을 알수있습니다.</p>
							</div>
						</div>

						<div class="about-right-best">
							<div class="about-right-wrapper">
								<a href="#"><h3>API를 사용하고 싶은가요?</h3></a>
								<p>너의 지하철은 API를 제공하고 있습니다.</p>
							</div>
						</div>

						<div class="about-right-support">
							<div class="about-right-wrapper">
								<a href="#"><h3>지하철 서비스도 제공</h3></a>
								<p>지하철 지도로 테스트를 해 보세요!</p>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

	<!--about bg-->


	<!--service-->
	<div id="service">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-6 col-md-offset-3">
					<div class="service-heading">
						<h2>너의 지하철 service</h2>
						<p>
							저희의 서비스는 지하철 지도의 제공과 지하철 차량의 총인원, 그리고 칸당 인원과 노약좌석의 상황을 제공합니다. 또한
							<strong>api</strong>도 제공을 합니다. 자세한 것은 API 페이지를 참조해 주세요
						</p>
					</div>
				</div>
			</div>
		</div>

		<!--services wrapper-->
		<section class="services-style-one">
			<div class="outer-box clearfix">

				<div class="services-column">
					<div class="content-outer">
						<div class="row clearfix">

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-briefcase" aria-hidden="true"></i>
									</div>
									<h4>api</h4>
									<div class="text">강력한 API를 제공하며 좌석의 상황과 열차의 인원을 알수 있습니다.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-bar-chart" aria-hidden="true"></i>
									</div>
									<h4>No Flash</h4>
									<div class="text">svg를 이용한 HTML5 대응으로 다음과 네이버 지도와 다르게
										플래시를 사용하지 않습니다.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-trophy" aria-hidden="true"></i>
									</div>
									<h4>즐겨찾기 기능</h4>
									<div class="text">즐겨찾기 기능이 있어 어느 역이든 추가가 가능합니다.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-bullhorn" aria-hidden="true"></i>
									</div>
									<h4>가벼운 회원정보</h4>
									<div class="text">회원정보의 내용은 오직 메일! 회원정보는 중국에 팔지 않습니다.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-lightbulb-o" aria-hidden="true"></i>
									</div>
									<h4>아우이노 활용</h4>
									<div class="text">아두이노를 활용한 임베다드로, pc를 이용하지 않아 전력소모와 크기에서
										우수한 성능을 가지고 있습니다.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-money" aria-hidden="true"></i>
									</div>
									<h4>기능은 추가됩니다!</h4>
									<div class="text">앱으로도 출시될 것이며 기능은 추가될 것입니다!</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!--Content Column-->
				<div class="content-column clearfix">
					<div class="content-box">
						<div class="inner-box">
							<!--Section Title-->
							<div class="sec-title aligned-right">
								<h2>
									체험해 <span>보세요</span>
								</h2>
							</div>
							<div class="text">지도 서비스로 참고가 가능합니다.</div>

							<button class="btn" onclick="location.href='stationcode';">체험하러
								가기</button>
						</div>
					</div>
				</div>


			</div>
		</section>



		<!--service gapping-->
		<div class="service-footer hidden-xs">
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<div class="service-footer-left">
							<h3>
								API가 <span>필요</span> 하세요?
							</h3>
							<p>지금 API를 써보세요!</p>
						</div>
					</div>

					<div class="col-md-5">
						<div class="service-footer-right">
							<button class="btn" onclick="location.href='api';">API</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--portfolio-->
	<div id="portfolio">
		<div class="container">
			<div class="row">

				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<div class="portfolio-heading">
						<h2>API를 제공합니다!</h2>
						<p>저희 서비스는 API를 제공하고 있습니다. 지금 서울을 가지세요!</p>
					</div>
				</div>

			</div>
		</div>

		<div class="portfolio-thumbnail">
			<div class="container-fluid">
				<div class="row">

					<div class="col-xs-6 col-sm-3 col-md-3">
						<div class="item">
							<img src="./resources/images/portfolio/portfolio1.jpg" alt="">
							<div class="caption">
								<i class="fa fa-search" aria-hidden="true"></i>
								<p>lorem ipsum amet</p>
							</div>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3">
						<div class="item">
							<img src="./resources/images/portfolio/portfolio2.jpg" alt="">
							<div class="caption">
								<i class="fa fa-search" aria-hidden="true"></i>
								<p>lorem ipsum amet</p>
							</div>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3">
						<div class="item">
							<img src="./resources/images/portfolio/portfolio3.jpg" alt="">
							<div class="caption">
								<i class="fa fa-search" aria-hidden="true"></i>
								<p>lorem ipsum amet</p>
							</div>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3">
						<div class="item">
							<img src="./resources/images/portfolio/portfolio4.jpg" alt="">
							<div class="caption">
								<i class="fa fa-search" aria-hidden="true"></i>
								<p>lorem ipsum amet</p>
							</div>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3">
						<div class="item">
							<img src="./resources/images/portfolio/portfolio5.jpg" alt="">
							<div class="caption">
								<i class="fa fa-search" aria-hidden="true"></i>
								<p>what you see</p>
							</div>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3">
						<div class="item">
							<img src="./resources/images/portfolio/portfolio6.jpg" alt="">
							<div class="caption">
								<i class="fa fa-search" aria-hidden="true"></i>
								<p>lorem ipsum amet</p>
							</div>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3">
						<div class="item">
							<img src="./resources/images/portfolio/portfolio7.jpg" alt="">
							<div class="caption">
								<i class="fa fa-search" aria-hidden="true"></i>
								<p>lorem ipsum amet</p>
							</div>
						</div>
					</div>

					<div class="col-xs-6 col-sm-3 col-md-3">
						<div class="item">
							<img src="./resources/images/portfolio/portfolio8.jpg" alt="">
							<div class="caption">
								<i class="fa fa-search" aria-hidden="true"></i>
								<p>lorem ipsum amet</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!--contact form-->
<!-- 	<div id="get-touch"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div -->
<!-- 					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3"> -->
<!-- 					<div class="get-touch-heading"> -->
<!-- 						<h2>메일을 남겨주세요!</h2> -->
<!-- 						<p>남긴 메일은 서비스에 반영됩니다</p> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="content"> -->
<!-- 				<div class="row"> -->
<!-- 					<div id="sendmessage">Your message has been sent. Thank you!</div> -->
<!-- 					<div id="errormessage"></div> -->

<!-- 					<form action="" method="post" role="form" class="form contactForm"> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<input type="text" name="name" class="form-control" id="name" -->
<!-- 									placeholder="Your Name" data-rule="minlen:4" -->
<!-- 									data-msg="Please enter at least 4 chars" /> -->
<!-- 								<div class="validation"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<input type="email" class="form-control" name="email" id="email" -->
<!-- 									placeholder="Your Email" data-rule="email" -->
<!-- 									data-msg="Please enter a valid email" /> -->
<!-- 								<div class="validation"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-4"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<input type="text" class="form-control" name="subject" -->
<!-- 									id="subject" placeholder="Subject" data-rule="minlen:4" -->
<!-- 									data-msg="Please enter at least 8 chars of subject" /> -->
<!-- 								<div class="validation"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-md-12"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<textarea class="form-control" name="message" rows="5" -->
<!-- 									data-rule="required" data-msg="Please write something for us" -->
<!-- 									placeholder="Message"></textarea> -->
<!-- 								<div class="validation"></div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="submit"> -->
<!-- 							<button class="btn btn-default" type="submit">Send Now</button> -->
<!-- 						</div> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->


	<!--contact-->
	<!-- 	<div id="contact"> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row"> -->
	<!-- 				<div -->
	<!-- 					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3"> -->
	<!-- 					<div class="contact-heading"> -->
	<!-- 						<h2>contact</h2> -->
	<!-- 						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. -->
	<!-- 							Praesent metus magna,malesuada porta elementum vitae.</p> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->

	<!-- 		<div id="google-map" data-latitude="40.713732" -->
	<!-- 			data-longitude="-74.0092704"></div> -->

	<!-- 	</div> -->


	<!--client-->
	<div id="client">
		<div class="container">
			<div class="row">

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s1.jpg" alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s2.jpg" alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s3.jpg" alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s4.jpg" alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s5.jpg" alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s6.jpg" alt="">
				</div>
				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s7.jpg" alt="">
				</div>
				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s8.png" alt="">
				</div>
				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/image/company/s9.png" alt="">
				</div>

			</div>
		</div>
	</div>

	<!--footer-->
	<div id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="footer-heading">
						<h3>
							<span>about</span> us
						</h3>
						<p>'너의 지하철'은 32기 SCIT마스터 2차 역량 프로젝트의 일환으로 만들어졌습니다.</p>
						<p>이 프로젝트는 비영리, 비상업 목적으로서 프로젝트의 완성을 위해서 사용될 것입니다. IoT와 웹을 연동하는
							프로젝트로 프로젝트의 조원은 장성길, 이민호, 전누리, 안병호, 조재용입니다.</p>
					</div>
				</div>

<!-- 				<div class="col-md-4"> -->
<!-- 					<div class="footer-heading"> -->
<!-- 						<h3> -->
<!-- 							<span>latest</span> news -->
<!-- 						</h3> -->
<!-- 						<ul> -->
<!-- 							<li><a href="#">Trends don't matter, but techniques do</a></li> -->
<!-- 							<li><a href="#">Trends don't matter, but techniques do</a></li> -->
<!-- 							<li><a href="#">Trends don't matter, but techniques do</a></li> -->
<!-- 							<li><a href="#">Trends don't matter, but techniques do</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-md-4"> -->
<!-- 					<div class="footer-heading"> -->
<!-- 						<h3> -->
<!-- 							<span>follow</span> us on instagram -->
<!-- 						</h3> -->
<!-- 						<div class="insta"> -->
<!-- 							<ul> -->
<!-- 								<img src="./resources/images/footer/footer1.jpg" alt=""> -->
<!-- 								<img src="./resources/images/footer/footer2.jpg" alt=""> -->
<!-- 								<img src="./resources/images/footer/footer3.jpg" alt=""> -->
<!-- 								<img src="./resources/images/footer/footer4.jpg" alt=""> -->
<!-- 								<img src="./resources/images/footer/footer5.jpg" alt=""> -->
<!-- 								<img src="./resources/images/footer/footer6.jpg" alt=""> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

			</div>
		</div>
	</div>

	<!--bottom footer-->
	<div id="bottom-footer" class="hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="footer-left">
						&copy; 너의지하철 . All rights reserved
						<div class="credits">

							Designed by <a href="http://localhost:8888/densha/">너의 지하철</a>
						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="footer-right">
						<ul class="list-unstyled list-inline pull-right">
							<li><a href="home">Home</a></li>
							<li><a href="stationcode">지하철지도</a></li>
							<li><a href="home#service">Service</a></li>
							<li><a href="home#api">api</a></li>
							<li><a href="join">가입하기</a></li>
							<c:if test="${loginId !=null}">
								<li><a href="favorite">Favorite</a></li>
								<li><a href="myAccount">내정보</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 	로그인 성공  -->
	<c:if test="${loginCheck == 1}">

		<script>
	$(document).ready(function(){
	        $(".modal").modal();
	});
	</script>

		<div class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">로그인 이 성공하였습니다.</h4>
					</div>
					<div class="modal-body">
						<p>로그인 이 성공하였습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
					</div>
				</div>
			</div>
		</div>

	</c:if>


	<!-- 	로그인실패 -->
	<c:if test="${loginCheck == 0}">

		<script>
	$(document).ready(function(){
	        $(".modal").modal();
	});
	</script>

		<div class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">로그인이 실패하였습니다.</h4>
					</div>
					<div class="modal-body">
						<p>로그인 실패하였습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
					</div>
				</div>
			</div>
		</div>

	</c:if>

	<!-- 	가입완료  -->
	<c:if test="${joinCheck == 1}">

		<script>
	$(document).ready(function(){
	        $(".modal").modal();
	});
	</script>
	
		<div class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">가입이 성공하였습니다.</h4>
					</div>
					<div class="modal-body">
						<p>가입이 성공하였습니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						<!--         <button type="button" class="btn btn-primary">Save changes</button> -->
					</div>
				</div>
			</div>
		</div>

	</c:if>


	<!-- jQuery -->
	<script src="./resources/js/jquery.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.flexslider.js"></script>
	<script src="./resources/js/jquery.inview.js"></script>
	<script src="https://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="./resources/js/script.js"></script>

</body>
</html>

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
<title>너의 지하철 </title>
<meta name="description"
	content="Free Bootstrap Theme by BootstrapMade.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
<style type="text/css">
iframe {
	width: 100%;
	​ height: auto;
}
  
#login-dp{
    min-width: 250px;
    padding: 14px 14px 0;
    overflow:hidden;
    background-color:rgba(255,255,255,.8);
}
#login-dp .help-block{
    font-size:12px    
}
#login-dp .bottom{
    background-color:rgba(255,255,255,.8);
    border-top:1px solid #ddd;
    clear:both;
    padding:14px;
}
#login-dp .social-buttons{
    margin:12px 0    
}
#login-dp .social-buttons a{
    width: 49%;
}
#login-dp .form-group {
    margin-bottom: 10px;
}
.btn-fb{
    color: #fff;
    background-color:#3b5998;
}
.btn-fb:hover{
    color: #fff;
    background-color:#496ebc 
}
.btn-tw{
    color: #fff;
    background-color:#55acee;
}
.btn-tw:hover{
    color: #fff;
    background-color:#59b5fa;
}
@media(max-width:768px){
    #login-dp{
        background-color: inherit;
        color: #fff;
    }
    #login-dp .bottom{
        background-color: inherit;
        border-top:0 none;
    }
}

</style>
</head>
<body id="top" data-spy="scroll">
	<!--top header-->
	<header id="home">

<!-- 		<section class="top-nav hidden-xs"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-6"> -->
<!-- 						<div class="top-left"> -->

<!-- 							<ul> -->
<!-- 								<li><a href="#"><i class="fa fa-facebook" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-twitter" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-linkedin" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-vk" aria-hidden="true"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-instagram" -->
<!-- 										aria-hidden="true"></i></a></li> -->
<!-- 							</ul> -->

<!-- 						</div> -->
<!-- 					</div> -->

<!-- 					<div class="col-md-6"> -->
<!-- 						<div class="top-right"> -->
<!-- 							<p> -->
<!-- 								Location:<span>Main Street 2020, City 3000</span> -->
<!-- 							</p> -->
<!-- 						</div> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->

		<!--main-nav-->

		<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">브랜드</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#home">Home <span class="sr-only">(current)</span></a></li>

        <li><a href="stationcode">지하철서비스</a></li>
<!--         로그인 시  -->
        <c:if test="${loginId !=null}"> 
        <li><a href="favorite">Favorite</a></li>
         </c:if>
         <!--         로그인 시  -->

        	<li><a href="board">게시판</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">제공 서비스 안내<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#service">서비스</a></li>
            <li><a href="#portfolio">API제공 서비스</a></li>
<!--             <li><a href="#">Something else here</a></li> -->
<!--             <li class="divider"></li> -->
<!--             <li><a href="#">Separated link</a></li> -->
<!--             <li class="divider"></li> -->
<!--             <li><a href="#">One more separated link</a></li> -->
          </ul>
        </li>
      </ul>
<!--       <form class="navbar-form navbar-left" role="search"> -->
<!--         <div class="form-group"> -->
<!--           <input type="text" class="form-control" placeholder="Search"> -->
<!--         </div> -->
<!--         <button type="submit" class="btn btn-default">Submit</button> -->
<!--       </form> -->
	
	<c:if test="${loginId == null}">
       <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Login</b> <span class="caret"></span></a>
			<ul id="login-dp" class="dropdown-menu">
				<li>
					 <div class="row">
							<div class="col-md-12">
<!-- 								Login via -->
<!-- 								<div class="social-buttons"> -->
<!-- 									<a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a> -->
<!-- 									<a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a> -->
<!-- 								</div> -->
<!--                                 or -->
								 <form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
										<div class="form-group">
											 <label class="sr-only" for="exampleInputEmail2">ID를 입력해주세요</label>
											 <input type="text" class="form-control" id="loginId" name="loginId" placeholder="id" required>
										</div>
										<div class="form-group">
											 <label class="sr-only" for="exampleInputPassword2">Password</label>
											 <input type="password" class="form-control" id="loginPassword" name="loginPassword" placeholder="Password" required>
                                             <div class="help-block text-right"><a href="forgotpassword">암호를 잊어버리셨나요?</a></div>
										</div>
										<div class="form-group">
										
											
											 <button type="submit" class="btn btn-primary btn-block">Login</button>
											
											 
											
											 
											 
										</div>
<!-- 										<div class="checkbox"> -->
<!-- 											 <label> -->
<!-- 											 <input type="checkbox"> keep me logged-in -->
<!-- 											 </label> -->
										</div>
								 </form>
							</div>
							<div class="bottom text-center">
								새롭게 오셨나요? <a href="join"><b>Join Us</b></a>
							</div>
					 </div>
				</li>
			</ul>
        </li>
      </ul>
      </c:if>
      <c:if test="${loginId != null}">
    
      <ul class="nav navbar-nav navbar-right">
     	 <li><a href="logout">로그아웃</a></li>
      
       	</ul>
      </c:if>
    </div>
  </div>
</nav>

	</header>

	<!--slider-->
	<div id="slider" class="flexslider">

		<ul class="slides">
			<li>
<!-- 				<div class="embed-responsive embed-responsive-16by9"> -->
<!-- 					<iframe class="embed-responsive-item" -->
<!-- 						src="https://www.youtube.com/embed/a1XuwtF7OJY?autoplay=1&playlist=XLkSQKCEKeE&loop=1&autohide=1&controls=0&showinfo=0&fs=0&rel=0" -->
<!-- 						frameborder="0" allowfullscreen></iframe> -->

<!-- 				</div> -->
			<img src="./resources/images/slider/slider1.jpg">
				<div class="caption">
					<h2>
						<span>지금 서울을 가지세요</span>
					</h2> 
					<h2>
						<span>체험하세요</span>
					</h2>
					<p>이 좋은걸 모르셨다구요?
					지금 서울을 가자세요!</p>
					<button class="btn">Read More</button>
				</div>
			</li>
			<li><img src="./resources/images/slider/slider2.jpg">

				<div class="caption">
					<h2>
						<span>yet another slide</span>
					</h2>
					<h2>
						<span>html theme</span>
					</h2>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry.</p>
					<button class="btn">Read More</button>
				</div></li>
			<li><img src="./resources/images/slider/slider3.jpg">

				<div class="caption">
					<h2>
						<span>one more slide</span>
					</h2>
					<h2>
						<span>html theme</span>
					</h2>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry.</p>
					<button class="btn">Read More</button>
				</div></li>
		</ul>

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
								<p>아무튼 다름 </p>
							</div>
						</div>

						<div class="about-right-best">
							<div class="about-right-wrapper">
								<a href="#"><h3>비둘기야 먹자 999999</h3></a>
								<p>MSG는 한국어로 맛있쪙</p>
							</div>
						</div>

						<div class="about-right-support">
							<div class="about-right-wrapper">
								<a href="#"><h3>가정이 무너지고 사회가 무너지고</h3></a>
								<p>이러한 현실속에~</p>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

	<!--about bg-->
<!-- 	<div id="about-bg"> -->

<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->

<!-- 				<div class="about-bg-heading"> -->
<!-- 					<h1>sucessfull stats about us</h1> -->
<!-- 					<p>what we have achieved so far</p> -->
<!-- 				</div> -->

<!-- 				<div class=" col-xs-12 col-md-3"> -->
<!-- 					<div class="about-bg-wrapper"> -->
<!-- 						<span class="count"><h1> -->
<!-- 								<span class="border">32</span>15 -->
<!-- 							</h1></span> -->
<!-- 						<p>happy client</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-xs-12 col-md-3"> -->
<!-- 					<div class="about-bg-wrapper"> -->
<!-- 						<span class="count"><h1>2217</h1></span> -->
<!-- 						<p>projects</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-xs-12 col-md-3"> -->
<!-- 					<div class="about-bg-wrapper"> -->
<!-- 						<span class="count"><h1>1522</h1></span> -->
<!-- 						<p>branches</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-xs-12 col-md-3"> -->
<!-- 					<div class="about-bg-wrapper"> -->
<!-- 						<span class="count"><h1>3151</h1></span> -->
<!-- 						<p>expert team</p> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 			</div> -->
<!-- 		</div> -->

<!-- 		<div class="cover"></div> -->

<!-- 	</div> -->

	<!--service-->
	<div id="service">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-6 col-md-offset-3">
					<div class="service-heading">
						<h2>service</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Praesent metus magna,malesuada porta elementum vitae.</p>
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
									<h4>FINANCIAL PLANNING</h4>
									<div class="text">Leverage agile frameworks to provide a
										robust synopsis for high level overviews.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-bar-chart" aria-hidden="true"></i>
									</div>
									<h4>BUSINESS PLANNING</h4>
									<div class="text">Leverage agile frameworks to provide a
										robust synopsis for high level overviews.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-trophy" aria-hidden="true"></i>
									</div>
									<h4>WORK &amp; REDUNDANCY</h4>
									<div class="text">Leverage agile frameworks to provide a
										robust synopsis for high level overviews.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-bullhorn" aria-hidden="true"></i>
									</div>
									<h4>MORTGAGE ADVISOR</h4>
									<div class="text">Leverage agile frameworks to provide a
										robust synopsis for high level overviews.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-lightbulb-o" aria-hidden="true"></i>
									</div>
									<h4>RETIREMENT PLANNING</h4>
									<div class="text">Leverage agile frameworks to provide a
										robust synopsis for high level overviews.</div>
								</div>
							</div>

							<div class="service-block col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="inner-box">
									<div class="icon-box">
										<i class="fa fa-money" aria-hidden="true"></i>
									</div>
									<h4>SAVING AND INVESTING</h4>
									<div class="text">Leverage agile frameworks to provide a
										robust synopsis for high level overviews.</div>
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
									Our Serv<span>ces</span>
								</h2>
							</div>
							<div class="text">우리의 서비스는 다음과 같습니다.</div>

							<button class="btn">learn more</button>
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
								Need to <span>Consult with us</span> ? Book an appointment
							</h3>
							<p>The Brady Bunch the Brady Bunch that's the way we all
								became the Brady Bunch</p>
						</div>
					</div>

					<div class="col-md-5">
						<div class="service-footer-right">
							<button class="btn">book now</button>
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
	<div id="get-touch">
		<div class="container">
			<div class="row">
				<div
					class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
					<div class="get-touch-heading">
						<h2>메일을 남겨주세요!</h2>
						<p>남긴 메일은 서비스에 반영됩니다</p>
					</div>
				</div>
			</div>

			<div class="content">
				<div class="row">
					<div id="sendmessage">Your message has been sent. Thank you!</div>
					<div id="errormessage"></div>

					<form action="" method="post" role="form" class="form contactForm">
						<div class="col-md-4">
							<div class="form-group">
								<input type="text" name="name" class="form-control" id="name"
									placeholder="Your Name" data-rule="minlen:4"
									data-msg="Please enter at least 4 chars" />
								<div class="validation"></div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<input type="email" class="form-control" name="email" id="email"
									placeholder="Your Email" data-rule="email"
									data-msg="Please enter a valid email" />
								<div class="validation"></div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="Subject" data-rule="minlen:4"
									data-msg="Please enter at least 8 chars of subject" />
								<div class="validation"></div>
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
								<textarea class="form-control" name="message" rows="5"
									data-rule="required" data-msg="Please write something for us"
									placeholder="Message"></textarea>
								<div class="validation"></div>
							</div>
						</div>
						<div class="submit">
							<button class="btn btn-default" type="submit">Send Now</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


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
					<span></span><img src="./resources/images/client/client1.png"
						alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/images/client/client2.png"
						alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/images/client/client3.png"
						alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/images/client/client4.png"
						alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/images/client/client5.png"
						alt="">
				</div>

				<div class="col-sm-4 col-md-2">
					<span></span><img src="./resources/images/client/client6.png"
						alt="">
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
						<p>To explore strange new worlds to seek out new life and new
							civilizations to boldly go where no man has gone before. It's
							time to play the music.</p>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.</p>
					</div>
				</div>

				<div class="col-md-4">
					<div class="footer-heading">
						<h3>
							<span>latest</span> news
						</h3>
						<ul>
							<li><a href="#">Trends don't matter, but techniques do</a></li>
							<li><a href="#">Trends don't matter, but techniques do</a></li>
							<li><a href="#">Trends don't matter, but techniques do</a></li>
							<li><a href="#">Trends don't matter, but techniques do</a></li>
						</ul>
					</div>
				</div>

				<div class="col-md-4">
					<div class="footer-heading">
						<h3>
							<span>follow</span> us on instagram
						</h3>
						<div class="insta">
							<ul>
								<img src="./resources/images/footer/footer1.jpg" alt="">
								<img src="./resources/images/footer/footer2.jpg" alt="">
								<img src="./resources/images/footer/footer3.jpg" alt="">
								<img src="./resources/images/footer/footer4.jpg" alt="">
								<img src="./resources/images/footer/footer5.jpg" alt="">
								<img src="./resources/images/footer/footer6.jpg" alt="">
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!--bottom footer-->
	<div id="bottom-footer" class="hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="footer-left">
						&copy; MyBix Theme. All rights reserved
						<div class="credits">
							<!-- 
                                    All the links in the footer should remain intact. 
                                    You can delete the links only if you purchased the pro version.
                                    Licensing information: https://bootstrapmade.com/license/
                                    Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyBiz
                                -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="footer-right">
						<ul class="list-unstyled list-inline pull-right">
							<li><a href="#home">Home</a></li>
							<li><a href="#about">About</a></li>
							<li><a href="#service">Service</a></li>
							<li><a href="#portfolo">Portfolio</a></li>
							<li><a href="#contact">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- jQuery -->
	<script src="./resources/js/jquery.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/jquery.flexslider.js"></script>
	<script src="./resources/js/jquery.inview.js"></script>
	<script src="https://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="./resources/js/script.js"></script>

</body>
</html>

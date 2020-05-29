<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
.carousel-inner img {
	width: 100%;
}

* {
	margin: 0px;
	padding: 0px;
}

ul {
	list-style: none;
}

a {
	text-decoration: none;
}

img {
	border: none;
	vertical-align: top;
}

.listCarousel {
	width: 1300px;
	margin: 0 auto;
	background-color: white;
	position: relative;
}

.listCarousel .view {
	width: 1200px;
	margin: 0 auto;
	background-color: white;
	overflow: hidden;
}

.listCarousel .view .list {
	width: 3600px;
	margin-left: -1200px;
}

.listCarousel .view .list:after {
	content: "";
	display: block;
	clear: both;
}

.listCarousel .view .list>li {
	float: left;
}

.listCarousel .view .list>li ul:after {
	content: "";
	display: block;
	clear: both;
}

.listCarousel .view .list>li ul li {
	float: left;
	width: 370px;
	height: 450px;
}

.listCarousel .view .list>li ul li.a1 {
	background-color: pink;
	margin-left: 0;
	margin-right: 45px;
}

.listCarousel .view .list>li ul li.a2 {
	background-color: lightblue;
	margin-left: 0;
	margin-right: 45px;
}

.listCarousel .view .list>li ul li.a3 {
	background-color: lightblue;
	margin-left: 0;
	margin-right: 0px;
}

.listCarousel .view .list>li ul li.a4 {
	background-color: lightblue;
	margin-left: 0;
	margin-right: 45px;
}

.listCarousel .view .list>li ul li.a5 {
	background-color: lightblue;
	margin-left: 0;
	margin-right: 45px;
}

.listCarousel .view .list>li ul li.a6 {
	background-color: lightblue;
	margin-left: 0;
	margin-right: 0px;
}

.listCarousel .view .list>li ul li.a7 {
	background-color: lightblue;
	margin-left: 0;
	margin-right: 45px;
}

.listCarousel .view .list>li ul li.a8 {
	background-color: lightblue;
	margin-left: 0;
	margin-right: 45px;
}

.listCarousel .view .list>li ul li.a9 {
	background-color: lightblue;
	margin-left: 0;
	margin-right: 0px;
}

.list {
	width: 370px;
	height: 300px;
	display: inline-block;
	/* border:1px solid black; */
	box-sizing: border-box;
}

.lists img {
	width: 370px;
	height: 200px;
}

.lists h4 {
	margin: 0px;
}

.dday {
	float: right;
}

.dday>img {
	width: 17px;
	height: 17px;
	vertical-align: text-bottom;
}

.maker {
	color: darkgray;
	font-weight: 800;
	font-size: 13px;
}

.icon {
	float: right;
	margin-top: 20px;

}

.title {
	font-size: 25px;
	font-weight: 900;
	height: 45px;
}
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp" />
	<br>
	<br>
	<div class="content">
		<div>
			<!-- 메인 이미지 슬라이더 -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ul>

				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="resources/images/mainimage03.jpg" width="1200px"
							height="400px">
					</div>
					<div class="carousel-item">
						<img src="resources/images/mainimage02.jpg" width="1200px"
							height="400px">
					</div>
					<div class="carousel-item">
						<img src="resources/images/mainimage01.jpg" width="1200px"
							height="400px">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#myCarousel"
					data-slide="prev"> <span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#myCarousel"
					data-slide="next"> <span class="carousel-control-next-icon"></span>
				</a>
			</div>
			<br> <br>
			<!--주목할 만한 프로젝트 슬라이더 -->
			<div class="listCarousel">
				<div class="view">
					<div class="title">
						주목할만한 프로젝트 
						<span class="prev icon"><img src="resources/images/arrow_right16.png"></span> 
						<span class="prev icon">　　</span> 
						<span class="next icon"><img src="resources/images/arrow_left16.png"></span>
					</div>
					<ul class="list">
						<li>
							<ul>
								<li class="a1">
									<div class="lists">
										<div>
											<img src="resources/images/20200428142303454_55552.jpg">
										</div>
										<div>
											<h4>
												<b>활용도 100% 액티비티 파우치와 0%마진 마스크파우치</b>
											</h4>
										</div>
										<div class="maker">카테고리명 | 메이커명</div>
										<div>
											<progress value="150" max="100"></progress>
										</div>
										<div>
											<span>900% 4,502,000원</span><span class="dday"><img
												src="images/time.png"> 26일 남음</span>
										</div>
									</div>
								</li>
								<li class="a2"><a href="#">메뉴2</a></li>
								<li class="a3"><a href="#">메뉴3</a></li>
							</ul>
						</li>
						<li>
							<ul>
								<li class="a4"><a href="#">메뉴4</a></li>
								<li class="a5"><a href="#">메뉴5</a></li>
								<li class="a6"><a href="#">메뉴6</a></li>
							</ul>
						</li>
						<li>
							<ul>
								<li class="a7"><a href="#">메뉴7</a></li>
								<li class="a8"><a href="#">메뉴8</a></li>
								<li class="a9"><a href="#">메뉴9</a></li>
							</ul>
						</li>
					</ul>
				</div>

			</div>

			<!-- 인기프로젝트 -->




		</div>
	</div>
	<script>
  $(document).ready(function(){
    
    $('.prev').click(function(){
        $('.list').stop().animate({'margin-left':'-2400px'},function(){
            $('.list>li').eq(0).appendTo('.list');
            $('.list').css({'margin-left':'-1200px'});
        });
    });
    $('.next').click(function(){
        $('.list').stop().animate({'margin-left':'0px'},function(){
            $('.list>li').eq(2).prependTo('.list');
            $('.list').css({'margin-left':'-1200px'});
        });
    });
 });
</script>


	<jsp:include page="common/footer.jsp" />
	
	

</body>
</html>
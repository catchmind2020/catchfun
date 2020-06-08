<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지_메인</title>
<style>
/* 메뉴바 영역 */
.header-area {
	width: 1200px;
	margin-left: 40px;
	color: gray;
	padding-top: 10px;
	margin-top: 20px;
	margin-bottom: 10px;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto;
}

/* 메뉴 */
.header {
	display: table-cell; /* width:200px; */
	padding-right: 40px;
	height: 35px;
	text-align: center;
	vertical-align: bottom;
	font-size: 25px;
	font-weight: 900;
	color: black;
}

/* 검색바 */
#header_searchbar {
	margin-left: 1400px;
	margin-top: 10px;
	position: absolute;
	height: 50px;
	width: 5px;
	transform: translate(-50%, -50%);
	position: absolute;
}

#header_searchbar.on {
	-webkit-animation-name: in-out;
	animation-name: in-out;
	-webkit-animation-duration: 0.7s;
	animation-duration: 0.7s;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-iteration-count: 1;
	animation-iteration-count: 1;
	float: right;
}

/*돋보기 */
input {
	box-sizing: border-box;
	width: 30px; /*돋보기동글이 크기*/
	height: 30px; /*돋보기동글이 크기*/
	border: 4px solid #28d7d7;
	border-radius: 50%;
	background: none;
	color: #fff;
	font-size: 16px;
	font-weight: 400;
	font-family: Roboto;
	outline: 0;
	-webkit-transition: width 0.4s ease-in-out, border-radius 0.8s
		ease-in-out, padding 0.2s;
	transition: width 0.4s ease-in-out, border-radius 0.8s ease-in-out,
		padding 0.2s;
	-webkit-transition-delay: 0.4s;
	transition-delay: 0.4s;
	-webkit-transform: translate(-100%, -50%);
	-ms-transform: translate(-100%, -50%);
	transform: translate(-100%, -50%);
}

.search {
	background: none;
	position: absolute;
	top: 0; /* !!!!!!!!!!!!!!!!*/
	left: 0; /* !!!!!!!!!!!!!!!!*/
	height: 30px; /* 돋보기바 위치설정*/
	width: 30px; /* 돋보기바 위치설정*/
	padding: 0;
	border-radius: 100%;
	outline: 0;
	border: 0;
	color: inherit;
	cursor: pointer;
	-webkit-transition: 0.2s ease-in-out;
	transition: 0.2s ease-in-out;
	-webkit-transform: translate(-100%, -50%);
	-ms-transform: translate(-100%, -50%);
	transform: translate(-100%, -50%);
}

.search:before {
	content: "";
	position: absolute;
	width: 10px; /* 돋보기바 크기설정(얇고굵은)*/
	height: 4px; /* 돋보기바 크기설정(얇고굵은)*/
	background-color: #28d7d7;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	margin-top: 12px; /* 돋보기바 위치설정*/
	margin-left: 8px; /* 돋보기바 위치설정*/
	-webkit-transition: 0.2s ease-in-out;
	transition: 0.2s ease-in-out;
	float: right;
}

.close {
	-webkit-transition: 0.4s ease-in-out;
	transition: 0.4s ease-in-out;
	-webkit-transition-delay: 0.4s;
	transition-delay: 0.4s;
}

.close:before { /*   \   */
	content: "";
	position: absolute;
	width: 20px; /**/
	height: 4px;
	margin-top: -1px;
	margin-left: -13px;
	background-color: black;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	-webkit-transition: 0.2s ease-in-out;
	transition: 0.2s ease-in-out;
	float: right;
}

.close:after { /*   /   */
	content: "";
	position: absolute;
	width: 20px; /**/
	height: 4px;
	background-color: black;
	margin-top: -1px;
	margin-left: -13px;
	cursor: pointer;
	-webkit-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	transform: rotate(-45deg);
	float: right;
}

.square {
	box-sizing: border-box;
	padding: 0 40px 0 10px;
	width: 200px;
	height: 30px; /*크기 */
	border: 3px solid #28d7d7;
	border-radius: 0;
	background: none;
	color: black;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 400;
	outline: 0;
	-webkit-transition: width 0.4s ease-in-out, border-radius 0.4s
		ease-in-out, padding 0.2s;
	transition: width 0.4s ease-in-out, border-radius 0.4s ease-in-out,
		padding 0.2s;
	-webkit-transition-delay: 0.4s, 0s, 0.4s;
	transition-delay: 0.4s, 0s, 0.4s;
	-webkit-transform: translate(-100%, -50%);
	-ms-transform: translate(-100%, -50%);
	transform: translate(-100%, -50%);
}

/* 로그인 부분*/
.login {
	position: relative;
	bottom: -6px;
	display: table-cell;
	font-size: 15px;
	color: gray;
	padding-left: 220px;
	padding-right: 0px;
}

.wrap {
	width: 1000px;
	height: 1000px;
	margin: auto;
	text-align: center;
	font-size: 30px;
	color: black;
}

.wrap>#header {
	width: 100%;
	height: 5%;
	margin-bottom: 60px;
}

.wrap>#content {
	width: 100%;
	height: 70%;
}

.wrap>#content>#content_1 {
	width: 100%;
	height: 25%;
	border: 0.05px solid grey;
	margin-bottom: 10px;
}

.wrap>#content>#content_2 {
	width: 100%;
	height: 75%;
	font-size: 15px;
	background-color: rgb(243, 242, 242);
}

.wrap>#content>#content_1>table {
	width: 40%;
	height: 100%;
	padding: 20px;
	font-size: 15px;
}

.wrap>#footer {
	width: 100%;
	height: 20%;
}
</style>
<!-- wrap>#content>#content_2>.w3-row2{width:100%; height:100%; overflow: scroll;} -->
</head>
<body>
	<div class="wrap">
		<div id="header">

			<div class="header-area">
				<div class="header">
					<img src="images/catchfun_logo.png">
				</div>
				<div class="header">카테고리</div>
				<div class="header">오픈예정</div>
				<div class="header">프로젝트오픈</div>
				<div class="header">공지</div>
				<div class="header"></div>
				<div class="header login">
					<img src="images/bellicon32.png">&nbsp;&nbsp;&nbsp;&nbsp; <img
						src="images/usericon32.png">
				</div>
			</div>



			<script>
				function expand() {
					$(".search").toggleClass("close");
					$(".input").toggleClass("square");
					if ($('.search').hasClass('close')) {
						$('input').focus();
					} else {
						$('input').blur();
					}
				}
				$('button').on('click', expand);
			</script>
		</div>

		<div id="content">
			<div id="content_1">
				<table>
					<tr>
						<td style="font-size: 40px;"><strong>김한경님</strong></td>
						<td style="font-size: 20px;">참여한펀딩</td>
						<td></td>
					</tr>
					<tr>
						<td style="font-size: 13px; color: gray;">개인회원</td>
						<td style="font-size: 25px;">1회</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<button class="w3-btn w3-white w3-border w3-round-large">프로필변경</button>
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>

			<div id="content_2">
				<div class="w3-container">


					<div class="w3-row">
						<a href="javascript:void(0)" onclick="openCity(event, 'Invest');">
							<div
								class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">참여한펀딩</div>
						</a> <a href="javascript:void(0)" onclick="openCity(event, 'wish');">
							<div
								class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">찜한펀딩</div>
						</a> <a href="javascript:void(0)" onclick="openCity(event, 'create');">
							<div
								class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">만든펀딩</div>
						</a>
					</div>

					<div id="Invest" class="w3-container city" style="display: none">
						<h2>참여한펀딩</h2>

					</div>

					<div id="wish" class="w3-container city" style="display: none">
						<h2>찜한펀딩</h2>

					</div>

					<div id="create" class="w3-container city" style="display: none">
						<h2>만든펀딩</h2>
					</div>
				</div>

				<script>
					function openCity(evt, cityName) {
						var i, x, tablinks;
						x = document.getElementsByClassName("city");
						for (i = 0; i < x.length; i++) {
							x[i].style.display = "none";
						}
						tablinks = document.getElementsByClassName("tablink");
						for (i = 0; i < x.length; i++) {
							tablinks[i].className = tablinks[i].className
									.replace(" w3-border-cyan", "");
						}
						document.getElementById(cityName).style.display = "block";
						evt.currentTarget.firstElementChild.className += " w3-border-cyan";
					}
				</script>
			</div>
		</div>

	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
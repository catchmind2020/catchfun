<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CATCHFUN</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
	position:relative;
}

/* 메뉴 */
.header {
	display: table-cell;
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
	margin-left: 1050px;
	margin-top: 7px; /* 위치설정 이거*/
	position: absolute;
	height: 50px;
	width: 5px;
	transform: translate(-50%, -50%);
	position: absolute;
}
#header_searchbar.on {
	-webkit-animation-name: in-out; animation-name: in-out; -webkit-animation-duration: 0.7s;
	animation-duration: 0.7s; -webkit-animation-timing-function: linear; animation-timing-function: linear;
	-webkit-animation-iteration-count: 1; animation-iteration-count: 1;

}
/*돋보기 */
.input {
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
.login { position: relative; display: table-cell; font-size: 15px;
	color: gray; padding-left: 190px; padding-right: 0px; }
.header>img{margin-bottom:7px;}
.loginnext{bottom:-6px;}
</style>

</head>

<body>
	
	<div class="header-area">

		<div class="header header-img">
			<img src="resources/images/catchfun_logo.png">
		</div>
		<div class="header">카테고리</div>
		<div class="header">오픈예정</div>
		<div class="header">프로젝트오픈</div>
		<div class="header">공지</div>
		<div class="header"></div>
		<div class="header"></div>
		
		
		<!-- 로그인 전 -->
		<div class="header login">
			 <a href="loginGo.me">로그인 ｜</a>
		     <a href="enrollForm.me">회원가입</a>
		</div> 
		
		<!-- 로그인 후 -->
<!-- 	<div class="header login  header-img loginnext">
			<img src="resources/images/bellicon32.png">&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="resources/images/usericon32.png">
		</div> 
		
	 -->
	
		<!-- 검색바 애니메이션 -->
		<form id="header_searchbar">
			<input type="text" name="input" class="input" id="search-input">
			<button type="reset" class="search" id="search-btn"></button>
		</form>
		
	</div>

	<!-- 검색바 스크립트 -->
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


</body>
</html>
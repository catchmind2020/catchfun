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

/* 폰트 초기화*/
body, input, textarea, select, button, table {
	font-family: 'Nanum Gothic', 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕',
		'dotum', '돋움', sans-serif;
	color: #222;
	font-size: 18px;
	line-height: 1.5;
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
/*회원정보수정페이지*/
#enrollmodify {
	width: 1000px;
	height: 670px;
	margin-top: 65px;
	margin: 0 auto;
}

#ul {
	font-size: 15px;
	width: 800px;
	margin: 0 auto;
	text-align: left;
	margin-top: 45px
}

#ul li {
	color: #303030;
	font-size: 20px;
}

table {
	border-top: 0.3px solid black;
	border-bottom: 0.3px solid black;
	height: 500px;
	width: 1000px;
	margin: 0 auto;
	padding-left: 140px;
	padding-right: 80px;
	padding-top: 60px;
	padding-bottom: 60px;
	background-color: rgb(243, 242, 242);
}

/* input박스*/
.btnenroll {
	width: 140px;
	height: 55px;
	font-size: 20px;
	color: white;
	background-color: rgb(46, 45, 45);
	border-radius: 5px;
}

.btnenroll2 {
	width: 260px;
	height: 60px;
	font-size: 20px;
	color: white;
	background-color: rgb(46, 45, 45);
	border-radius: 5px;
}

.btnenroll3 {
	width: 140px;
	height: 55px;
	font-size: 20px;
	color: white;
	background-color: rgb(46, 45, 45);
	margin-top: 40px;
	border-radius: 5px;
}

h4 {
	padding: 20px;
}

h6 {
	color: rgb(65, 64, 64);
}

/*회원정보수정 input박스*/ /**/
.correct {
	width: 400px;
	height: 55px;
}

/*생년월일input*/
.correct2 {
	width: 255px;
	height: 55px;
}

/*전화번호input*/
.correct3 {
	width: 266px;
	height: 55px;
}

/* input */
#userid, #username, #birthday, #email, #password, #address1, #address2 {
	width: 400px;
	height: 55px;
	margin-top: 15px;
	margin-bottom: 15px;
}

/*우편번호*/
#addressnum {
	width: 240px;
	height: 55px;
	margin-top: 15px;
	margin-right: 10px;
	margin-bottom: 15px;
}

/* 인증번호발송 Button */
.btn1 {
	background: rgb(224, 224, 224);
	color: black;
	width: 140px;
	height: 55px;
	font-size: 20px;
}

.btn1:hover {
	background: #fff;
	color: #000;
}

/* 인증완료 Button*/
.btnenroll {
	width: 140px;
	height: 55px;
	font-size: 20px;
	color: white;
	background-color: rgb(46, 45, 45);
	margin: 0 auto;
	margin-top: 40px;
}

/* 수정완료 Button */
.btn_1 {
	width: 300px;
	height: 55px;
	font-size: 20px;
	color: white;
	background-color: #3ee0e0;
	margin-top: 40px;
	margin-bottom: 70px;
	margin-bottom: 130px;
	border-radius: 5px;
}

/* 이메일 input*/
#email {
	width: 400px;
	height: 55px;
}

/* firstnumber input*/
#firstnumber {
	margin-top: 15px;
	width: 120px;
	height: 55px;
}

/* 전화번호 input*/
#number1 {
	margin-top: 15px;
	width: 265px;
	height: 55px;
}

/* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */

/* input */
#userid, #email, #password {
	width: 400px;
	height: 55px;
	margin-bottom: 15px; /**/
	margin-right: 10px;
	font-size: 20px;
}

#username {
	width: 400px;
	height: 55px;
}

/* 인증번호발송 Button */
.btn1 {
	background: rgb(224, 224, 224);
	color: black;
	width: 140px;
	height: 55px;
	font-size: 20px;
}

.btn1:hover {
	background: #fff;
	color: #000;
}

#addressBtn {
	width: 140px;
	height: 55px;
	background: #9999;
	color: white;
}

/* 인증완료 Button*/
.btnenroll {
	width: 140px;
	height: 55px;
	font-size: 20px;
	color: white;
	background-color: rgb(46, 45, 45);
	margin: 0 auto;
	margin-top: 40px;
}

/* 비밀번호찾기 Button */
.password_search {
	width: 265px;
	height: 60px;
	font-size: 20px;
	color: white;
	background-color: rgb(243, 242, 242);
	margin-top: 40px;
	margin-bottom: 70px;
}

thead>tr>th {
	width: 300px;
	height: 93px;
}

tbody {
	margin: 0 auto;
	font-size: 20px;
}

/* 인증번호입력 input*/
#verification {
	width: 400px;
	height: 55px;
}

ul.im1 {
	list-style-type: disc;
	list-style-image: url( "images/marker.png" );
	font-size: 20px;
}

ul.im2 {
	list-style-image: url( "images/marker.png" );
	font-size: 20px;
}

li {
	text-align: left;
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
	height: 10%;
	margin-bottom: 10px;
}

.wrap>#content>#content_2>table {
	width: 100%;
	height: 80%;
	font-size: 15px;
	background-color: rgb(243, 242, 242);
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
		</div>
		<div id="content">
			<div id="content_1"></div>

			<div id="content_2">
				<div class="container">
					<div id="modify">
						<P style="text-align: left;">회원정보변경</P>
						<table>
							<thead>
								<ul class=im1>
									<tr>
										<td style="font-size: 20px;">아 이 디</td>
										<td style="text-align: left;"><input type="text"
											id="userid" placeholder="kkk@naver.com" disabled></td>
										<td style="width: 280px;"></td>
									</tr>
							</thead>
							<tbody>
								<tr>
									<td style="font-size: 20px; width: 250px;">이 름</td>
									<td style="text-align: left; width: 550px align:center"><input
										type="text" id="username" placeholder="이름(실명으로 입력해주세요)."
										disabled></td>
									<td style="font-size: 16px; width: 200px;"></td>
								</tr>
								<tr>
									<td style="font-size: 20px;">비 밀 번 호</td>
									<td style="text-align: left;"><input type="password"
										id="password" placeholder=" 비밀번호는 6~16자 영문 대소문자, 숫자, 특수문자"></td>
									<td
										style="font-size: 15px; color: rgb(131, 2, 2); text-align: left;"></td>
								</tr>
								<tr>
									<td style="font-size: 20px;">비밀번호확인</td>
									<td style="text-align: left;"><input type="password"
										id="password" placeholder="비밀번호 확인"></td>
									<td
										style="font-size: 15px; color: rgb(131, 2, 2); text-align: left;"></td>
								</tr>
								<tr>
									<td></td>
									<td style="font-size: 10px; text-align: left">* 비밀번호가 일치하지
										않을시 회원정보변경이 불가합니다.</td>
									<td></td>
								</tr>
								<tr>
									<td style="font-size: 20px;">이 메 일</td>
									<td style="text-align: left;"><input type="text"
										id="email" placeholder="이메일"></td>
									<td></td>
								</tr>

								<tr>
									<td style="font-size: 20px;">생 년 월 일</td>
									<td style="text-align: left;" colspan="1"><input
										type="number" id="birthday" type="birthday"
										placeholder="생년월일8자리(ex)19940610" disabled>
									<td></td>
								</tr>
								<tr>
									<td style="font-size: 20px;">휴대폰번호</td>
									<td style="text-align: left;" colspan="1"><select
										id="firstnumber" style="width: 120px; height: 55px;">
											<option value="010" selected>010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="019">019</option>
									</select> <input type="number" id="number1" type="number1"
										placeholder="111-2222"></td>
									<td></td>
								</tr>
								<tr>
									<td style="font-size: 20px;">주소</td>
									<td style="text-align: left;" colspan="1"><input
										type="number" id="addressnum" type="addressnum"
										placeholder="우편번호">
									<button id="addressBtn">검색</button></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td style="text-align: left;"><input type="text"
										id="address1" placeholder="기본주소"></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td style="text-align: left;"><input type="text"
										id="address2" placeholder="상세주소"></td>
									<td></td>
								</tr>
								</ul>
							</tbody>
						</table>
						<p style="font-size: 20px; text-align: left; color: red;">
							<a href="#"><u>회원탈퇴</u></a>
						</p>
						<!-- 2_1. (정보입력)본인인증 및 회원가입 버튼-->
						<button type="button" class="btn_1" id="btn_1">수정완료</button>
					</div>
				</div>
			</div>
			<div id="footer"></div>

		</div>
</body>
</html>
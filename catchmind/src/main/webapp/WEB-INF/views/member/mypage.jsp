<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지_메인</title>
<style>

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
<jsp:include page="../common/menubar.jsp" />
	<div class="wrap">
		<div id="header">

			



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
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
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->

<!-- alertifyJS 라이브러리 -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
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
/* margin-left: 1050px; 1920 1080 */
/* margin-left: 1700px; qhd */
#header_searchbar {
	margin-left:-20px;
	margin-top: 37px; /* 위치설정 이거*/
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
	color: gray; padding-left: 160px; padding-right: 0px; }
a { text-decoration:none !important; color:black;} 
a:hover { text-decoration:none !important; color:black; }

/* 아이유 전용 스타일 */

.dropbtn {
  background-color: white;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown a:hover {background-color: #ddd;}


.show {display: block;}

/* */


.dropdown>.dropdown-content>table{width:200px; height:250px; padding-top: 15px; padding-left:5px; } 

.button4 {
  background-color: white;
  color: black;
  border: 2px solid #e7e7e7;
}

.button4:hover {background-color: #e7e7e7;}

.header-img{cursor: pointer;}

.vertical-container {
  height: 100px;
  display: -webkit-flex;
  display:         flex;
  -webkit-align-items: center;
          align-items: center;
  -webkit-justify-content: center;
          justify-content: center;
}
 
/* div{border:1px solid black;} */

</style>

</head>

<body>

	<c:if test="${ !empty msg }">
		<script>
			alertify.alert("${msg}");	// 회원가입 성공,실패
		</script>
		<c:remove var="msg" scope="session" />
	</c:if>
	
	<script>
		$(".ajs-header").text("");
	</script>
	
	<div class="header-area vertical-container">

		<div style="margin-right:40px;">
			<a href="${ pageContext.servletContext.contextPath }"><img src="resources/images/catchfun_logo.png"></a>
		</div>
		<div class="header"><a href="category.mu">카테고리</a></div>
		<div class="header"><a href="comingsoon.mu">오픈예정</a></div>
		<div class="header">프로젝트오픈</div>
		<div class="header">공지</div>
		<div class="header"></div>
		<div class="header"></div>
		
		<c:choose>
			<c:when test="${!empty loginUser}">
				<!-- 로그인 후 -->
		 		<div class="header login  header-img loginnext">
		 		
					<div class="dropdown" style="z-index: 1000">
  						<button onclick="myFunction()" class="dropbtn">
							<img src="<%=request.getContextPath() %>/resources/images/bellicon32.png">&nbsp;&nbsp;&nbsp;&nbsp;
  							<img class="dropbtn1" src="<%=request.getContextPath() %>/resources/images/usericon32.png">
  						</button>
  							<div id="myDropdown" class="dropdown-content">
					      	<table style="text-align: center;">
					          <tr>
					              <td style="font-size:20px;"><b>${loginUser.userName}님</b></td>
					              <td rowspan="2"><a href="#"><img src="<%=request.getContextPath() %>/resources/images/home2.png" style="width:30px; height:30px;"><br>마이홈</a></td>
					          </tr>
					          <tr>
					            <td><button class="button button4" onclick="location.href='mypageModify.me'">정보변경</button></td>
					            <td></td>
					        </tr>
					        <tr style=border:0.05px solid grey;>
					            <td rowspan="1" style="width: 100px;"><a href="#"><img src="<%=request.getContextPath() %>/resources/images/ss2.png" style="width:30px; height:30px;"><br>참여펀딩</a></td>
					            <td rowspan="1" style="width: 100px;"><a href="#"><img src="<%=request.getContextPath() %>/resources/images/bulb1.png" style="width:30px; height:30px;"><br>찜한펀딩</a></td>
					        </tr>
					        <tr>
					            <td rowspan="1" style="width: 100px;"><a href="projectList.pa"><img src="<%=request.getContextPath() %>/resources/images/ss3.png" style="width:30px; height:30px;"><br>개설펀딩</a></td>
					            <td rowspan="1" style="width: 100px;"><a href="#"><img src="<%=request.getContextPath() %>/resources/images/point.png" style="width:40px; height:40px;"><br>포인트조회</a></td>
					        </tr>
					        <tr>
					            <td rowspan="1" style="width: 100px;"><a href="messageRest.me?userNo=${ loginUser.userNo }&currentPage=1"><img src="<%=request.getContextPath() %>/resources/images/message2.png" style="width:30px; height:30px;"><br>메세지</a></td><!-- <a href="sellerMessageRest.me?counseling=${ loginUser.userNo }&currentPage=1"> <img src="<%=request.getContextPath() %>/resources/images/message2.png" style="width:30px; height:30px;"><br>메세지</a></td>-->
					            <td rowspan="1" style="width: 100px;"><a href="#"><img src="<%=request.getContextPath() %>/resources/images/sp1.png" style="width:30px; height:30px;"><br>1:1문의</a></td>
					        </tr>
					      
					        <tr>
					            <td colspan="2"><button class="button button4" style="width:200px; height:30px;" onclick="location.href='logout.me'">로그아웃</button></td>
					        </tr>
					      </table>
					    </div>
					  </div>
					</div>
				
			</c:when>
			<c:otherwise>
	 			
				<!-- 로그인 전 -->
				<div class="login">
					 <!-- 검색바 애니메이션 -->
					<form id="header_searchbar">
						<input type="text" name="input" class="input" id="search-input">
						<button type="reset" class="search" id="search-btn"></button>
					</form>
					
					<a href="loginGo.me">로그인 ｜</a>
				    <a href="memberEnrollForm.me">회원가입</a>
				</div>
				
			</c:otherwise>
		</c:choose>
	</div>
	
	<!-- <div class="test">
		검색바 애니메이션
		<form id="header_searchbar">
			<input type="text" name="input" class="input" id="search-input">
			<button type="reset" class="search" id="search-btn"></button>
		</form>
	</div> -->
		
	


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
	
	<!-- 사이드메뉴바 스크립트 -->
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn1')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
	


</body>
</html>
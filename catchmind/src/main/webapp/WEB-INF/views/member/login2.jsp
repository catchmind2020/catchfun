<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
.wrap {
	width: 1000px;
	height: 700px;
	margin: auto;
	text-align: center;
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

.wrap>#footer {
	width: 100%;
	height: 20%;
}

#loginForm {
	margin: 0 auto;
	border: 3px solid #f1f1f1;
	width: 400px;
	height: 400px;
}

#userId,#userPwd {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.loginbtn {
	background-color: #28d7d7;
	color: white;
	padding: 14px 20px;
	margin: 15px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: rgb(134, 122, 122);
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

span.uname {
	float: right;
	padding-top: 16px;
}

@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}

</style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<div class="wrap">


		<h1 style="margin-top: 150px;">로그인</h1>

		<form id="loginForm" action="login.me" method="post">

			<div id="content">
				<div class="container">
					<label for="uname"><b>아이디</b></label> <input type="text"
						placeholder="Enter Username" id="userId" name="userId" required>

					<label for="psw"><b>비밀번호</b></label> <input type="password"
						placeholder="Enter Password" id="userPwd" name="userPwd" required>

					<div class="container" style="background-color: #f1f1f1">
						<label> <input type="checkbox" 
							name="remember" id="idSaveCheck">아이디 저장하기
						</label> <span class="psw"><a href="idpwdFind.me">/비밀번호찾기</a></span> <span
							class="uname"><a href="idpwdFind.me">아이디찾기</a></span>
					</div>

					<button class="loginbtn" type="submit">Login</button>

					<center>
						아직계정이 없나요? &nbsp;
						<button type="button" class="cancelbtn loginbtn">회원가입</button>
					</center>
		</form>
	</div>
	
	<script>
		$(".cancelbtn").click(function(){
			location.href="memberEnrollForm.me";
		});
		
		
		// 로그인 저장 시작 //
		$(document).ready(function(){
			 
		    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var key = getCookie("key");
		    $("#userId").val(key); 
		     
		    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		     
		    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
		            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("key");
		        }
		    });
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
		        }
		    });
		});
		
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		// 로그인 저장 끝 //
	</script>

</body>

</html>
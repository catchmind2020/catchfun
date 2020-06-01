<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지_메인</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
/* 폰트 초기화*/
body, input, textarea, select, button, table {
	font-family: 'Nanum Gothic', 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕',
		'dotum', '돋움', sans-serif;
	color: #222;
	font-size: 18px;
	line-height: 1.5;
}

/* 아이디찾기완료, 비밀번호찾기완료 CSS페이지*/
.tabcontent {
	margin-right: 305px;
	margin-left: 305px;
}

table {
	width: 600px;
	height: 340px;
	padding-top: 60px;
	padding-left: 300px;
	padding-right: 300px;
	margin: 0 auto;
	margin-top: 18px;
}
/*아이디표시 input*/
#userid {
	width: 600px;
	height: 60px;
	margin-bottom: 15px;
}

/* 아이디발송요청 Buttom*/
.userid_request {
	width: 600px;
	height: 60px;
	margin-top: 25px;
	margin-bottom: 150px;
	background-color: rgb(224, 224, 224);
	color: rgb(63, 62, 62);
	font-size: 18px;
}

/* 임시비밀번호 재발급 Button*/
.password2 {
	width: 600px;
	height: 60px;
	font-size: 20px;
	color: black;
	background-color: rgb(224, 224, 224);
	margin: 0 auto;
	margin-top: 25px;
	margin-bottom: 10px;
}

input[type=text], input[type=password], input[type=email], input[type=number], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

button[type=submit] {
	width: 100%;
	background-color: #28d7d7;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[type=submit]:hover {
	background-color: #188080;
}

#del_postcode{
	width: 73%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
/*우편번호찾기 버튼*/
#btn_del{
	font-family: 'Nanum Gothic', 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕', 'dotum', '돋움', sans-serif;
	color: #222;
	font-size: 18px;
	line-height: 1.5;
	width: 135px;
	height: 50px;
}

#email_btn {
	background-color: #e7e7e7;;
	color: black;
	border: 2px solid #e7e7e7;
	width: 540px;
	height: 40px;
}

#email_btn:hover {
	background-color: white;
}

.wrap {
	width: 1000px;
	height: 1200px;
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
					<img src="<%=request.getContextPath() %>/resources/images/catchfun_logo.png">
				</div>
				<div class="header">카테고리</div>
				<div class="header">오픈예정</div>
				<div class="header">프로젝트오픈</div>
				<div class="header">공지</div>
				<div class="header"></div>
				<div class="header login">
					<img src="<%=request.getContextPath() %>/resources/images/bellicon32.png">&nbsp;&nbsp;&nbsp;&nbsp; <img
						src="<%=request.getContextPath() %>/resources/images/usericon32.png">
				</div>
			</div>
		</div>

		<div id="content">
			<div id="content_2">

				<form action="insert.me" method="post" onsubmit="">
					<table>
						<tr>
							<td style="font-size: 40px;"><strong>회원가입</strong></td>
							<td></td>
						</tr>
						<tr>
							<td colsapn="2" style="font-size: 20px;">
								<div class="form-check" style="text-align: left;">
									<input type="checkbox" id="agree" name="agree" value="agree">
									<label for="agree"><b>전체동의</b><br></label>
									<p style="font-size: 15px;">와디즈 서비스 이용약관(필수), 개인정보 수집ᆞ이용동의(필수), 마케팅정보 수집동의(선택)</p>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group" style="text-align: left;">
									<input type="email" id="userId" name="userId" placeholder="이메일" required>
									<label for="email"><p style="text-align: left;">위
											이메일로 인증번호가 발송됩니다.</p></label>
									<button id="email_btn">인증</button>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><input type="text" id="userName" name="userName" placeholder="이름" required>
							</td>
						</tr>
						<tr>
							<td><input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" required></td>
						</tr>
						<tr>
							<td><input type="password" id="userPwd2" name="userPwd2" placeholder="비밀번호확인" required></td>
						</tr>
						<tr>
							<td><input type="text" id="phone" name="phone" placeholder="전화번호 '-'포함 입력" ></td>
						</tr>
						<tr>
							<td><input type="text" id="del_postcode" name="addressNum" placeholder="우편번호" readonly>
							<input type="button" id="btn_del" onclick="del_execDaumPostcode()" value="우편번호 찾기" style="background-color:gray; color:white;" readonly></td>
						<tr>
		                     <td style="width:200px; padding-top:0">
		                     <input type="text" id="del_address" name="address" placeholder="주소" style="width:380px;" readonly>											
							 <input type="text" id="del_extraAddress" name="address3" placeholder="참고항목" style="width:150px;" readonly>
		                    </td>
	                   </tr>
	                   <tr>
	                     <td style="width:200px; padding-top:0">
	                     <input type="text" id="del_detailAddress"  name="address4" placeholder="상세주소" style="width:540px;"> <!-- 사용자가 직접 입력하는 칸  -->
	                     </td>
	                  </tr>
					  <tr>
						<td><button type="submit" value="완료">완료</button></td>
					</tr>
					</table>
				</div>
			</div>
		</div>
	<script>
    function del_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("del_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("del_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('del_postcode').value = data.zonecode;
                document.getElementById("del_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("del_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>
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


.dropdown>.dropdown-content>table{width:200px; height:250px; padding-top: 5px; padding-left:5px; } 


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

#table {
	border-top: 0.3px solid black;
	border-bottom: 0.3px solid black;
	height: 500px;
	width: 1000px;
	margin: 0 auto;
	padding-left: 140px;
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
#userId, #userName, #birthday, #email, #password, #del_detailAddress {
	width: 400px;
	height: 55px;
	margin-top: 15px;
	margin-bottom: 15px;
}

/*주소*/ 
#del_address {
 	width: 200px;
	height: 55px;
	margin-top: 15px;
	margin-bottom: 15px;
}

#userId, #userName{
	background-color:#d6d6d6;;
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
#firstnumber, #del_postcode, #del_extraAddress {
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

.wrap {
	width: 1000px;
	height: 1000px;
	margin: auto;
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
<jsp:include page="../common/menubar.jsp" />
	<div class="wrap">
		
		<div id="content">
			<div id="content_1"></div>
			<div id="content_2">
				<div class="container">
					<div id="modify">
						<form action="update.me" method="post" onsubmit="">
						<P style="text-align: left;">회원정보변경</P>
						<table id="table">
							<thead>
								<ul class=im1>
									<tr>
										<td style="font-size: 20px;">아 이 디</td>
										<td style="text-align: left;"><input type="text" class="form-control" id="userId" name="userId" value="${loginUser.userId}" readonly></td>
										<td style="width: 280px;"></td>
									</tr>
							</thead>
							<tbody>
								<tr>
									<td style="font-size: 20px; width: 250px;">이 름</td>
									<td style="text-align: left; width: 550px align:center"><input type="text" class="form-control" id="userName" name="userName" value="${loginUser.userName}" readonly></td>
									<td style="font-size: 16px; width: 200px;"></td>
								</tr>
<!-- 								<tr>
									<td style="font-size: 20px;">비 밀 번 호</td>
									<td style="text-align: left;"><input type="password" id="password" placeholder=" 비밀번호는 6~16자 영문 대소문자, 숫자, 특수문자"></td>
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
								</tr> -->
								<tr>
									<td style="font-size: 20px;">이 메 일</td>
									<td style="text-align: left;"><input type="text" id="email" placeholder="이메일"></td>
									<td></td>
								</tr>
								<!--
								<tr>
									<td style="font-size: 20px;">생 년 월 일</td>
									<td style="text-align: left;" colspan="1"><input type="text" class="form-control" id="birthday" name="birthday" placeholder="생년월일8자리"></td>
									<td></td>
								</tr>
								  -->
								<tr>
									<td style="font-size: 20px;">휴대폰번호</td>
									<td style="text-align: left;" colspan="1">
									<select id="firstnumber" style="width: 120px; height: 55px;">
											<option value="010" selected>010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="019">019</option>
									</select> <input type="text" id="number1" type="number1" placeholder="전화번호'-'빼고 입력"></td>
									<td></td>
								</tr>
								<tr>
									<td style="font-size: 20px;">주소</td>
									<td style="text-align: left;" colspan="1"><input type="text" id="del_postcode" name="addressNum" placeholder="우편번호" readonly>
									<button type="button" onclick="postcode()" style="background-color:gray; color:white; height:55px;">우편번호 찾기 </button></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
								 	<td style="text-align: left;" colspan="1"><input type="text" id="del_address" name="address" placeholder="주소"readonly>
								 	<input type="text" id="del_extraAddress" name="address3" placeholder="참고항목" style="width:150px;" readonly></td>
								</tr>
								<tr>
									<td></td>
									<td style="text-align: left;" colspan="1"><input type="text" id="del_detailAddress" name="address4" placeholder="상세주소" style="width:400px;"> <!-- 사용자가 직접 입력하는 칸  --></td>
									<td></td>
								</tr>
								</ul>
							</tbody>
						</table>
						<p style="font-size: 20px; text-align: left; color: red;">
							<a href="membershipDelete.me"><u>회원탈퇴</u></a>
						</p>
						<!-- 2_1. (정보입력)본인인증 및 회원가입 버튼-->
						<center><button type="submit" class="btn_1" id="btn_1" value="완료">수정완료</button><center>
				
					</div>
				</div>
			</div>
		</div>
		
	<script>
	
    function postcode() {
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
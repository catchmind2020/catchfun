<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지_메인</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

				<form id="enrollForm" action="insert.me" method="post" onsubmit="">
					<table>
						<tr>
							<td style="font-size: 40px;"><strong>회원가입</strong></td>
							<td></td>
						</tr>
						<tr>
							<td colsapn="2" style="font-size: 20px;">
								<div class="form-check" style="text-align: left;">
									<input type="checkbox" id="ex_rd" name="ex_rd" value="agree">
									<label for="ex_rd"><b>전체동의</b><br></label>
									<p style="font-size: 15px;">와디즈 서비스 이용약관(필수), 개인정보 수집ᆞ이용동의(필수), 마케팅정보 수집동의(선택)</p>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group" style="text-align: left;">
									<input type="email" id="userId" name="userId" placeholder="이메일" required>
									 <div id="checkResult" style="display:none; font-size:0.8em"></div>
									<label for="email"><p style="text-align: left;">위 이메일로 인증번호가 발송됩니다.</p></label>
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
							 <input type="text" id="del_extraAddress" name="addressReference" placeholder="참고항목" style="width:150px;" readonly>
		                    </td>
	                   </tr>
	                   <tr>
	                     <td style="width:200px; padding-top:0">
	                     <input type="text" id="del_detailAddress"  name="addressDetail" placeholder="상세주소" style="width:540px;"> <!-- 사용자가 직접 입력하는 칸  -->
	                     </td>
	                  </tr>
					  <tr>
						<td><button type="submit" id="enrollBtn" onclick="next();">완료</button></td>
					</tr>
					</table>
					</form>
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
 <script>
    $("#enrollBtn").click(function(){
            // 유효성 검사할 각각의 "input 요소"들 변수에 받아두기
            var id = document.getElementById("userId");
            var pwd1 = document.getElementById("userPwd");
            var pwd2 = document.getElementById("userPwd2");
            var name = document.getElementById("userName");


            // 1) 이름 검사
            //    한글로만 2글자 이상
            regExp = /^[가-힣]{2,}$/; 
            if(!regExp.test(name.value)){
                alert("유효한 이름을 입력하세요");
                name.value = "";
                name.focus();
                return false;               
            }
            
            // 2) 생년월일검사
            //    숫자!!로만 8글자 이상, 8글자 이하
            regExp = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
            if(!regExp.test(birth.value)){
                alert("유효한 생년월일을 입력하세요");
                birth.value = "";
                birth.focus();
                return false;               
            }
           
            
            // 3) 전화번호검사
            //    숫자!!로만 7글자 이상, 8글자 이하
            regExp = /^[0-9]{7,8}$/; 
            if(!regExp.test(veri.value)){
                alert("유효한 전화번호를 입력하세요");
                veri.value = "";
                veri.focus();
                return false;               
            }

            // 4) 아이디 검사
            // 영문자 또는 숫자 포함해서 총 4~12자로 입력 (단, 첫글자는 반드시 영문자로)
              var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
               if (!emailRegExp.test(id.value)) {
                   alert("아이디를 이메일형식으로 적어주세요!");
                   form.id.value = "";
                   form.id.focus();
                   return false;
                }            
            
          
            // 5_1) 비밀번호 검사
            //    특수문자(!@#$%^&*) 또는 영문자 또는 숫자 포함 총 8자~15자
            regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
            if(!regExp.test(pwd1.value)){
                alert("유효한 비밀번호를 입력하세요!!");
                pwd1.value="";
                pwd1.focus();
                return false;
            }
			
            // 5_2) 비밀번호 일치 확인
            // 비밀번호값과 비밀번호 확인값이 일치하는지 검사
            if(pwd1.value != pwd2.value){
                alert("동일한 비밀번호 확인값을 입력하세요!!");
                pwd2.value = "";
                pwd1.focus();
                return false;
            }

             
             $("#enrollBtn").removeAttr("disabled");
			//$("#defaultOpen3").click();	// 다음페이지로 이동

       	 });
 </script>
 <script> /*본인인증 및 회원가입버튼 클릭시*/
    	function next(){
            if($("input:checkbox[id='ex_rd']").is(":checked") == true ) { // 약관동의에 체크 되었을 경우
            	//$("#first_agree_btn").click(function(){ // '모두동의'버튼 클릭시
					//$("#defaultOpen2").click();	// 다음페이지로 이동
				//});
            }else{//체크 안되었을 경우
                alert("약관동의에 체크해주세요.");
            }
        }
 </script>

    <script>
    	// 아이디 중복체크를 아직 안하는 경우  : 메세지 보여지지 않음 버튼 비활성
    	// 아이디 중복체크 후 사용불가능한 아이디일 경우 : "중복아이디 존재 사용불가능" 메세지 보여짐, 버튼 비활성화 
    	// 아이디 중복체크 후 사용가능한 아이디일 경우 : "사용 가능하나 아이디임" 메세지 보여짐, 버튼 활성화
    	
    	    	function idCheckValidate(num){
    		
    		if(num == 1){	// 아이디 중복체크를 아직 안하는 경우 : 메세지 보여지지 않음 버튼 비활성화
    			
    			$("#checkResult").hide();
    			$("#enrollBtn").attr("disabled", true);
    			
    		}else if(num == 2){
    			
    			$("#checkResult").css("color", "red").text("중복된 아이디가 존재합니다. 사용이 불가능합니다.");
    			$("#checkResult").show();
    			$("enrollBtn").attr("disabled", true);
    			
    		}else{ // 아이디 중복체크 후 사용가능한 아이디일 경우 : "사용 가능하나 아이디임" 메세지 보여짐, 버튼 활성화
    			
    			$("#checkResult").css("color", "green").text("사용가능한 아이디입니다.");
    			$("#checkResult").show();
    			$("#enrollBtn").removeAttr("disabled");
    			
    		}
    	}

   	$(function(){
            
            // 이벤트 걸고자 하는 input 요소 변수에 기록해놓기
            
            var $idInput = $("#enrollForm input[name=userId]");
            
            $idInput.keyup(function(){
          	 
          	  //console.log($idInput.val());
  			  if($idInput.val().length >= 5){ // 적어도 아이디가 5글자 이상되었을 때 본격적으로 중복체크
  				  
  				  $.ajax({
  					  url:"idCheck.me",
  					  data:{userId:$idInput.val()},
  					  success:function(status){
  						  
  						  if(status == "fail"){ // 중복된 아이디 존재 == 사용불가
  							  idCheckValidate(2);
  						  }else{ // 중복된 아이디 없음 == 사용가능 
  							  idCheckValidate(3);
  						  }
  						  
  					  },error:function(){
  						  console.log("아이디 중복체크용 ajax 통신 실패");
  					  }
  				  })
  				  
  			  }else{ // 중복체크x = 버튼 비활성화   
  				idCheckValidate(1);  
  			  }
          	  
            });
         });
    	
    	
    </script>
</body>
</html>
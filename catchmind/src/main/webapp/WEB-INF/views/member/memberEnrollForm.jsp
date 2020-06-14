<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<style>

/* 폰트 초기화*/
body, input, textarea, select, button, table {
	color: #222;
	font-size: 18px;
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
	width: 300px;
	height: 60px;
	margin-bottom: 15px;
}

/*certified*/
#certified {
	width: 300px;
	height: 60px;
	margin-bottom: 15px;
}


#userId, #certified, #userName, #repwd1, #repwd, #phone, #del_postcod,
#del_address, #del_extraAddress, #del_detailAddress, select {
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

#email_btn, #email_btn1 {
	background-color: #e7e7e7;;
	color: black;
	border: 2px solid #e7e7e7;
	width: 230px; /*540px;*/
	height: 60px;
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
/* 회원가입 버튼 css */

</style>
<!-- wrap>#content>#content_2>.w3-row2{width:100%; height:100%; overflow: scroll;} -->
</head>
<body>

<jsp:include page="../common/menubar.jsp" />
	<div class="wrap">
		
		

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
									<p style="font-size: 15px;">서비스 이용약관(필수), 개인정보 수집ᆞ이용동의(필수), 마케팅정보 수집동의(선택)</p>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="form-group" style="text-align: left;">
									<!-- <form action="auth.do" method="post"> -->
										<input type="email" id="userId" name="userId" placeholder="이메일" required style="width: 300px;">
										<button type="button" class="btn btn-info" id="email_btn1">발송</button>
										 <div id="checkResult" style="display:none; font-size:0.8em"></div>
										<label for="email"><p style="text-align: left;">위 이메일로 인증번호가 발송됩니다.</p></label>
									
									<%-- <form action="join_injeung.do${dice}" method="post"> --%>
										<input type="text" id="certified" name="certified" placeholder="인증번호입력" style="width: 300px;"> 
										<button type="button" class="btn btn-info" id="email_btn">인증</button>
									</div>
									<input type="hidden" path="random" id="random" value="${random}" />
								</td>
						<%-- 			<form action="join_injeung.do${dice}" method="post">
										<input type="text" id="certified" name="certified" placeholder="인증번호입력" required style="width: 300px;"> 
										<button id="email_btn">인증</button>
									</form> --%>
							</td>
							<td></td>
						</tr>
						
						<tr>
							<td><input type="text" id="userName" name="userName" placeholder="이름" required>
							</td>
						</tr>
						<tr>
							<td><input type="password" placeholder="Enter Password" name="userPwd" class="pass" id="repwd1" oninput="checkPwd()" required></td>
						</tr>
						<tr>
							<td><input type="password"  placeholder="Repeat Password" name="psw-repeat" class="pass" id="repwd" oninput="checkPwd()" required>
								<div id="checkResult1" style="display:none; font-size:0.8em"></div></td>
						</tr>
						<tr>
							<td><input type="text" id="phone" name="phone" placeholder="전화번호 '-'빼고입력" oninput="signupCheck()" required></td>
						</tr>
						<tr>
							<td><input type="text" id="del_postcode" name="addressNum" placeholder="우편번호" oninput="signupCheck()" required readonly>
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
						<td><button type="submit" id="enrollBtn" class="enrollBtn" onclick="return next();" >완료</button></td>
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
    /* $("#enrollBtn").click(function(){
            

             //$("#enrollBtn").removeAttr("disabled");
             //$("#enrollBtn").submit();
			//$("#defaultOpen3").click();	// 다음페이지로 이동

       	 }); */
 </script>
 <script> /*본인인증 및 회원가입버튼 클릭시*/
    	function next(){
            if($("input:checkbox[id='ex_rd']").is(":checked") == true ) { // 약관동의에 체크 되었을 경우
            	//$("#enrollBtn").attr("disabled", false); // 활성화
            	//$("#first_agree_btn").click(function(){ // '모두동의'버튼 클릭시
					//$("#defaultOpen2").click();	// 다음페이지로 이동
				//});
            }else{//체크 안되었을 경우
                alert("약관동의에 체크해주세요.");
                //$("#enrollBtn").attr("disabled", true); // 비활성화
                return false;
            }
            
         // 유효성 검사할 각각의 "input 요소"들 변수에 받아두기
            var id = document.getElementById("userId");
            var rpwd1 = document.getElementById("repwd1");
            var rpwd = document.getElementById("repwd");
            var name = document.getElementById("userName");
            var veri = document.getElementById("phone"); // 전화번호

            // 1) 이름 검사
            //    한글로만 2글자 이상
            regExp = /^[가-힣]{2,}$/; 
            if(!regExp.test(name.value)){
                alert("유효한 이름을 입력하세요");
                name.value = "";
                name.focus();
                return false;               
            }
            
         // 5_1) 비밀번호 검사
            //    특수문자(!@#$%^&*) 또는 영문자 또는 숫자 포함 총 8자~15자
            regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
            if(!regExp.test(rpwd1.value)){
                alert("유효한 비밀번호를 입력하세요!!");
                rpwd1.value="";
                rpwd1.focus();
                return false;
            }
			
            // 5_2) 비밀번호 일치 확인
            // 비밀번호값과 비밀번호 확인값이 일치하는지 검사
            if(rpwd1.value != rpwd.value){
                alert("동일한 비밀번호 확인값을 입력하세요!!");
                rpwd.value = "";
                rpwd1.focus();
                return false;
            }
           
          /*   
            // 3) 전화번호검사
            //    숫자!!로만 7글자 이상, 8글자 이하
            regExp = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g
            if(!regExp.test(veri.value)){
                alert("유효한 전화번호를 입력하세요");
                veri.value = "";
                veri.focus();
                return false;
            }
             */

            // 4) 아이디 검사(이메일형식)
            // 영문자 또는 숫자 포함해서 총 4~12자로 입력 (단, 첫글자는 반드시 영문자로)
              var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
               if (!emailRegExp.test(id.value)) {
                   alert("아이디를 이메일형식으로 적어주세요!");
                   form.id.value = "";
                   form.id.focus();
                   return false;
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
    			$("enrollBtn").attr("disabled", false);
    			
    		}
    	}

   	$(function(){  // 이벤트 걸고자 하는 input 요소 변수에 기록해놓기
           
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

   //재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
    function checkPwd() {
        var inputed = $('.pass').val();
        var reinputed = $('#repwd').val();
        if(reinputed=="" && (inputed != reinputed || inputed == reinputed)){ // null이면서 같지않을시
            $(".enrollBtn").prop("disabled", true);
            $(".enrollBtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE"); // 빨강
        }
        else if (inputed == reinputed) {
            $("#repwd").css("background-color", "#B0F6AC");
            //$("#enrollBtn").removeAttr("disabled"); // enrollBt버튼의 disabled 속성제거
            
            //pwdCheck = 1;
            if($("#repwd1").val() == $("#repwd").val()) {
                $(".enrollBtn").prop("disabled", false);
                $(".enrollBtn").css("background-color", "#4CAF50"); // 파랑
                
            }
            
        } else if (inputed != reinputed) { 
            pwdCheck = 0;
            $(".enrollBtn").prop("disabled", true);
            $(".enrollBtn").css("background-color", "#aaaaaa");
            $("#repwd").css("background-color", "#FFCECE"); // 빨강
           
        }
    }
    </script>
    <script> // ajax로 이메일발송과 인증함수!!
    
      $(function(){
    	/* 이메일 인증 버튼 클릭시 발생하는 이벤트  */
    	$(document).on("click", "#email_btn1", function(){
    		
    		/* 이메일 중복 체크 후 메일 발송! 비동기처리 */
    		$.ajax({
    			type:"post",
    			url : "createEmailCheck.do",
    			data :{ userId: $("#userId").val()},
    			
    			//data: "userId="+encodeURIComponent($('#userId').val()),
    			/*  encodeURIComponent
    			예를들어, http: a.com?name=egoing&job=programmer 에서 &job=programmer
    			중 '&'는 하나의 파라미터가 끝나고 다음 파라미터가 온다는 의미이다.
    			그런데 다음과 같이 job의 값에 &가 포함된다면 시스템은 job의 값을 제대로 인식할수 없게 된다.  */
    			
    			success : function(data){
    				if(data != "fail"){
    					alert("사용가능한 이메일입니다. 인증번호가 발송되었습니다.");
    				}else{
    					alert("이메일 발송 실패!");
    				}
    			},
    			error: function(){
    				alert("에러가 발생했습니다.");
    				return false;
    			}

    		})
    	})  
    	
    	/* 이메일 인증번호 입력 후, 인증버튼 클릭 이벤트 !!! */
    	$(document).on("click", "#email_btn", function(){
    		
    		//var certifi = document.getElementById("certified");
    		console.log(${random});
    		$.ajax({
    			
    			type:"post",
    			url:"emailAuth.do",
    			data:{authCode:$("#certified").val(), random:${random}},
    			success:function(data){
    				
    				console.log(data);
    				
	    			if(data=="complete"){
	    				alert("인증이 완료되었습니다.");
	    			}else if(data == "false"){
	    				alert("인증번호를 잘못 입력하셨습니다.")
	    			}
    			},
    			
    			error:function(){
    				alert("에러가 발생했습니다.");
    			}
    		});
    	});
     });
    
   </script>
   
<!--    <script> /* "인증번호 완료" 버튼 클릭시 -> ramdom키와 사용자입력키(identify)와 비교 */
    	 function check(){
    			 var authCode = data;
                var certifi = document.getElementById("certified");
                
                
    			/* var username = $("#userName").val();
    			var Birthday = $("#birthday").val();
    		
    			var firstnumber = $("#firstnumber").val();
    			var phonenum = $("#verification").val();
    			var UserId = $("#userId").val();
    			var UserPwd = $("#userPwd1").val();
    			var email = $("#email").val(); */
    			
    			console.log(username);
    			
    			if(randomKey != certifi.value){
                	alert("인증에 실패하였습니다.");
                	randomKey = "";
                	certifi.focus();
                	return false;
              	}else{
              		alert("인증 성공하였습니다.");
    				//$("#defaultOpen4").removeAttr("disabled").click();
              		
    				/* $("#userName2").val(username);
    				$("#birthday2").val(Birthday);
    				$("#firstnumber2").val(firstnumber);
    				$("#verification2").val(phonenum);
    				$("#userId2").val(UserId);
    				$("#userPwd12").val(UserPwd);
    				$("#email2").val(email);
    				
    				$("#enroll_final").submit();
    				 */
              	
              	}
       	 	}
    -->
    

    
 
</body>
</html>
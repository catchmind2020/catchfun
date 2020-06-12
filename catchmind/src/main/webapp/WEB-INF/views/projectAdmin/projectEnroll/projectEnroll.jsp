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

<jsp:include page="../../common/menubar.jsp" />
	<div class="wrap">
		

		<div id="content">
			<div id="content_2">

				<form id="enrollForm" action="insertProject.pa" method="post" onsubmit="">
					<table>
						<tr>
							<td style="font-size: 40px;"><strong>프로젝트 등록하기</strong></td>
							<td></td>
						</tr>
						<tr>
							<td colsapn="2" style="font-size: 20px;">
								
									<p style="font-size: 20px;">프로젝트 제목을 입력해주세요</p>
								
							</td>
						</tr>
					
						
						<tr>
							<td><input type="text" id="projectName" name="projectName" placeholder="이름"  style="width:540px;"required>
							</td>
						</tr>
					
	                 
					  <tr>
						<td><button type="submit" id="enrollBtn" class="enrollBtn" >완료</button></td>
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
    	
 </script>

  <script>
    	// 아이디 중복체크를 아직 안하는 경우  : 메세지 보여지지 않음 버튼 비활성
    	// 아이디 중복체크 후 사용불가능한 아이디일 경우 : "중복아이디 존재 사용불가능" 메세지 보여짐, 버튼 비활성화 
    	// 아이디 중복체크 후 사용가능한 아이디일 경우 : "사용 가능하나 아이디임" 메세지 보여짐, 버튼 활성화
    	
    	 

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
 
</body>
</html>
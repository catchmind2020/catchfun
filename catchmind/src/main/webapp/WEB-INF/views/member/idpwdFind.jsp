<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
/* 폰트 초기화*/
body, input, textarea, select, button, table {
    font-family: 'Nanum Gothic',  'Noto Sans KR', 'Malgun Gothic','맑은 고딕', 'dotum','돋움',sans-serif; 
    color: #222; font-size: 18px; line-height: 1.5;} 
   

.tabcontent{
    margin-right: 305px;
    margin-left: 305px;
}

table {
    width: 600px;
    height: 340px;
    padding-top:60px;
    padding-left:300px;
    padding-right:300px; 
    margin:0 auto;
    margin-top: 18px;
}

    <style>


/* 아이디발송요청 Buttom*/
.userid_request{
    width:600px;
    height:60px;
    margin-top: 25px;
    margin-bottom: 150px;
    background-color:rgb(224, 224, 224);
    color:rgb(63, 62, 62);
    font-size: 18px;
}

/* 임시비밀번호 재발급 Button*/
.password2{
    width:600px;
    height:60px;
    font-size:20px;
    color:black;
    background-color: rgb(224, 224, 224);
    margin:0 auto;
    margin-top: 25px;
    margin-bottom: 10px;
} 
/* input[type=text],input[type=password],input[type=email], select { */
#email, select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #28d7d7;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #188080;
}

#email_btn{
width: 400px;
height: 40px;
}

input[type=submit] {
  width: 100%;
  background-color: #28d7d7;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #188080;
}

#email_btn{
width: 400px;
height: 40px;
}

#email_btn {
  background-color: #e7e7e7;;
  color: black;
  border: 2px solid #e7e7e7;
}

#email_btn:hover {background-color:white; }

    .wrap{width:1000px; height:1000px; margin:auto; 
        text-align: center; font-size: 30px; color: black;}
    .wrap>#header{width:100%; height:5%; margin-bottom:60px;}
    .wrap>#content{width:100%; height:70%;}
    .wrap>#content>#content_1{width:100%; height:10%;margin-bottom:10px;}
    .wrap>#content>#content_2>table{width:100%; height:80%; font-size:15px; background-color: rgb(243, 242, 242);}
    .wrap>#footer{width:100%; height:20%;}

    </style>
#id_table{margin-top: 100px;}

    .wrap{width:1000px; height:1000px; margin:auto; 
        text-align: center; font-size: 30px; color: black;}
    .wrap>#header{width:100%; height:5%; margin-bottom:60px;}
    .wrap>#content{width:100%; height:70%;}
    .wrap>#content>#content_1{width:100%; height:25%;}
    .wrap>#content>#content_2{width:100%; height:75%; font-size:15px; background-color: rgb(243, 242, 242);}
    .wrap>#content>#content_1>table{width:40%; height:100%; padding:20px; font-size:15px;}
    .wrap>#footer{width:100%; height:20%;}
    </style>
     <!-- wrap>#content>#content_2>.w3-row2{width:100%; height:100%; overflow: scroll;} -->
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
    <div class="wrap">
        
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

        <div id="content">
            <div id="content_1">
                <table id="table1">
                    <tr>
                       <!--  <td style="font-size:30px; text-align: left;"><strong>아이디∙비밀번호 찾기</strong></td> -->
                        <td style="font-size:30px; text-align: left;"><strong>아이디∙비밀번호 찾기</strong></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colsapn="2" style="font-size:20px; text-align: left;">
                         
                        </td>
                    </tr>
                </table>
            </div>

            <div id="content_2">
              <div class="w3-container">
                <div class="w3-row">
                  <a href="javascript:void(0)" onclick="openCity(event, 'idfind');">
                    <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">아이디찾기</div>
                  </a>
                  <a href="javascript:void(0)" onclick="openCity(event, 'passwordfind');">
                    <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">비밀번호찾기</div>
                  </a>
                </div>
                <div id="idfind" class="w3-container city" style="display:none">
                   <center>
                    <table id="id_table">
                    <tr>
                        <td>
                            <form action="#">
                            <form action="pwdFind.me">
                            	<div id="idfind1" style="width:300px;">
		                            <label for="email">
		                                <p style="text-align:left;">
			                                	<h4>가입정보로 확인</h4><br>
													* 기존 가입 회원정보에 휴대전화번호가 등록 되어있지 않았을 경우, <br>
													아이디 찾기 서비스에 제한이 있을 수 있습니다. <br>
		                                </p></label>
		                              <input type="text" id="userName1" name="userName" placeholder="이름">
		                              <input type="text" id="phone1" name="phone" placeholder="휴대폰번호'-'없이 입력">
	                            	  <input type="submit" value="완료">
	                        	</td>
                        	</div>
                    	 </tr>
                    	</table>
                    </center>
                    	</tr>
                    </center>
                   </table>
                </div>
              
                <div id="passwordfind" class="w3-container city" style="display:none">
                  <center>
                    <table id="id_table">
                    <tr>
                        <td>
                            <form action="pwdFind2.me">
                            	<div id="passwordfind1" style="width:300px;">
                            		<input type="text" id="userId2" name="userId" placeholder="아이디">
		                            <input type="text" id="userName2" name="userName" placeholder="이름">
		                            <input type="text" id="phone2" name="phone" placeholder="전화번호 '-'포함 입력" required>
		                            <input id="pwdBtn1" type="button" value="발송">
		                            <label for="email">
		                                <p style="text-align:left;">
							                                    회원가입한 아이디를 입력하시면. <br>
							                                    이메일로 인증번호를 발송해드립니다. <br>
		                                </p></label>
		                            <input type="text" id="certi" name="certi" placeholder="인증번호입력">
		                            <input id="pwdBtn2" type="submit" value="인증확인">
	                           </div>
	                           </form>
                        	</td>
                         <td>
                        </td>
                        
                        <td>
                        </td>
                    </tr>
                    </center>
                   </table>
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
                      tablinks[i].className = tablinks[i].className.replace(" w3-border-cyan", "");
                    }
                    document.getElementById(cityName).style.display = "block";
                    evt.currentTarget.firstElementChild.className += " w3-border-cyan";
                  }
                  </script>         
                  <script>
                 	$(function(){  // 이벤트 걸고자 하는 input 요소 변수에 기록해놓기
                        
                       // var $idInput = $("#enrollForm input[name=userId]");
                        $("#pwdBtn1").click(function(){
                        	
        				// 1. 중복복검사(중복있을경우 성공)	
        				$.ajax({
        					url:"pwdFind.me",
        					data:{userId:$("#userId2").val(), userName:$("#userName2").val(), phone:$("#phone2").val()},
        					type:"post", 
        					success:function(result){	// 1 또는 0
        						
        						if(result != 0){		// DB에 조회
        							
        							if(confirm("회원정보가 조회되었습니다.")){
        								
        								// 아이디 더이상 수정이 불가하게끔
        								$("#email").attr("readonly", "true");	// 이메일이 조회되면
        								
        								/// 인증번호 발송 버튼이 활성화 !!!
        								//$("#numCheck").removeAttr("disabled");
        					
        							}else{
        								$("#email").forcus();
        								
        							}
        							
        						}else {					// DB에 조회되지않는 정보
        							alert("회원 정보가 존재하지 않습니다."); 
        							email.focus();
        						}
        					
        						},error:function(){
        							console.log("ajax통신 실패!!");
        						}
        				
        				});
        				
        			});
                        
                    $("#pwdBtn2").click(function(){
                    	
        				// 1. 중복검사(중복있을경우 성공)	
        				$.ajax({
        					url:"pwdFind2.me",
        					data:{certi:$("#certi").val(),userId:$("#userId2").val(), userName:$("#userName2").val(), phone:$("#phone2").val()},
        					type:"post", 
        					success:function(result){	// 1 또는 0
        						
        						if(result = "success"){		// DB에 조회
        							
        							if(confirm("회원정보가 조회되었습니다.")){
        								
        								location.href="passwordChange.me";
        					
        							}else{
        								$("#email").forcus();
        								
        							}
        							
        						}else {					// DB에 조회되지않는 정보
        							alert("회원 정보가 존재하지 않습니다."); 
        						}
        						},error:function(){
        							
        							console.log("ajax통신 실패!!");
        						}
        				
        				});
        				
        			});
        			
        		});
        	</script>

                  
                  
            </div>
        </div>

        <div id="footer"></div>

    </div>
</body>
</html>
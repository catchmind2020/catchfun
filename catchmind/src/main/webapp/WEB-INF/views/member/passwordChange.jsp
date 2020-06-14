<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>마이페이지_메인</title>
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
input[type=text],input[type=password],input[type=email], select {
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
     <!-- wrap>#content>#content_2>.w3-row2{width:100%; height:100%; overflow: scroll;} -->
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
    <div class="wrap">

        <div id="content">
            <div id="content_2">
                
                
                
                <table>
              	<form id="enrollForm" action="updatePwd.me" method="post" onsubmit="">
                    <tr>
                        <td style="font-size:25px; text-align: left;"><strong>비밀번호변경</strong></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colsapn="2" style="font-size:20px;">
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" id="pass1" name="pass1" placeholder="현재비밀번호">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" id="pass2" name="pass2" placeholder="현재비밀번호확인">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" id="pass3" name="changePwd" placeholder="새로운비밀번호">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" onclick="return next();" value="완료">
                        </td>
                    </tr>
					</form>
                </table>
            </div>
           </div>
        </div>
    </div>
    
    <script>
    function next(){   	
      var pass1 = document.getElementById("pass1");
      var pass2 = document.getElementById("pass2");
      var changePwd = document.getElementById("changePwd");	
      // 5_1) 비밀번호 검사
      //    특수문자(!@#$%^&*) 또는 영문자 또는 숫자 포함 총 8자~15자
      regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
      if(!regExp.test(pass1.value)){
          alert("유효한 비밀번호를 입력하세요!!");
          pass1.value="";
          pass1.focus();
          return false;
      }
	
      regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
      if(!regExp.test(pass3.value)){
          alert("유효한 비밀번호를 입력하세요!!");
          pass3.value="";
          pass3.focus();
          return false;
      }
      // 5_2) 비밀번호 일치 확인
      // 비밀번호값과 비밀번호 확인값이 일치하는지 검사
      if(pass1.value != pass2.value){
          alert("동일한 비밀번호 확인값을 입력하세요!!");
          pass1.value = "";
          pass2.focus();
          return false;
      }
     }
    </script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>
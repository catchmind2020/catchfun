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
                    <tr>
                        <td style="font-size:25px; text-align: left;"><strong>비밀번호설정</strong></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colsapn="2" style="font-size:20px;">
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form action="/action_page.php">
                            <input type="email" id="email" name="email" placeholder="이메일">
                            <label for="email"><p style="text-align:left;">위 이메일로 인증번호가 발송됩니다.</p></label>
                            <button id="email_btn">인증</button>
                        </td>
                        <td>
                            
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
                            <input type="password" id="pass3" name="pass3" placeholder="새로운비밀번호">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" value="완료">
                        </td>
                    </tr>

                </table>
            </div>
           </div>
        </div>

    </div>
</body>
</html>
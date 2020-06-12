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
   
/* 아이디찾기완료, 비밀번호찾기완료 CSS페이지*/

.tabcontent{
    margin-right: 305px;
    margin-left: 305px;
}

/*테이블*/
#table2 {
    width: 600px;
    height: 340px;
    padding-top:20px;
    padding-left:50px;
    padding-right:100px; 
    margin:0 auto;
    margin-top: 18px;
}

#table1 {
    width: 600px;
    height: 340px;
    padding-top:20px;
    padding-left:10px;
    padding-right:100px; 
    margin:0 auto;
    margin-top: 18px;
}
/*아이디표시 input*/
#userid {
    width:600px;
    height:60px;
    margin-bottom: 15px;
}



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


    .wrap{width:1000px; height:1000px; margin:auto; 
        text-align: center; font-size: 30px; color: black;}
    .wrap>#header{width:100%; height:5%; margin-bottom:60px;}
    .wrap>#content{width:100%; height:70%; }
    .wrap>#content>#content_1{width:100%; height:10%;margin-bottom:10px;}
    .wrap>#content>#content_2>table{width:100%; height:80%; font-size:15px;}
    .wrap>#content>#content_2>#table2{ background-color: rgb(243, 242, 242); }
    .wrap>#footer{width:100%; height:20%;}

    </style>
     <!-- wrap>#content>#content_2>.w3-row2{width:100%; height:100%; overflow: scroll;} -->
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
    <div class="wrap">

        <div id="content">
            <div id="content_2">
                
                <table id="table1">
                    <tr>
                        <td style="font-size:40px; text-align: left;"><strong>포인트조회</strong></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colsapn="2" style="font-size:20px; text-align: left;">
                            포인트 적립, 사용내역입니다.
                        </td>
                    </tr>
                </table>
                <table id="table2" style="border:0.5px solid gray; margin-bottom: 50px;">
                    <tr>
                        <td style="text-align:left; font-size: 20px; width:100px;">
                            현재 사용 가능 포인트
                        </td>
                        <td> 
                            <p style="text-align:left; color: blue; font-size: 20px;"><b>7,000P</b></p>
                        </td>
                    </tr>
                    
                    <tr>
                        <td ></td>
                    </tr>
                    <tr>
                        <td style="text-align:left; font-size: 20px; width:300px; height: 80px; font-color:gray;">
                            3월 구매 포인트
                        </td>
                        <td style="text-align:right; font-size: 20px;">
                            3000P 적립
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left; font-size: 20px; width:300px; height: 80px; font-color:gray;">
                            2월 구매 포인트
                        </td>
                        <td style="text-align:right; font-size: 20px;">
                            2000P 적립
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:left; font-size: 20px; width:300px; height: 80px; font-color:gray;">
                            2월신규 회원가입 이벤트
                        </td>
                        <td style="text-align:right; font-size: 20px;">
                            2000P 적립
                        </td>
                    </tr>
                </table>
            </div>
            
            <p style="font-size:13px; text-align: left;">
                포인트 이용안내<br>
                1. 적립하신 포인트는 리워드 펀딩 참여시 결제금액에서 차감 사용할 수 있습니다.<br>
                2. 1 Point 당 1 원과 동일한 가치로 사용할 수 있습니다.<br>
                3. 유효기간 내 사용하지 않은 잔여 포인트는 유효기간 종료일의 익일에 소멸됩니다.
            
            </p>

        </div>


    </div>
</body>
</html>
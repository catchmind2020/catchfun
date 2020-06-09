<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <title>Document</title>
</head>
<style>
    #outer{
        margin: auto;
        width: 700px;
        text-align: center;
    }
    #project_title{padding: 30px;}
    /* 상단 현재 단계 표시 */
    #tab1, #tab2, #tab3{
        width: 100px;
        font-size: 15px;
        font-weight: 1000; 
        padding-bottom: 10px;
        margin:auto;
        text-align:center;
    }
    #tab1, #tab2{border-bottom: 5px solid rgb(31, 205, 211);}
    #tab3{border-bottom: 5px solid rgb(202, 202, 202);}

    .rewardCheckbox{
        width: 600px;
        height: auto;
        /* background-color: rgb(237, 237, 238); */
        padding-left: 50px;
        padding-right: 50px;
        padding-top: 30px;
        padding-bottom: 30px;
        border: 1px solid rgb(202, 202, 202);
        margin:auto;
        margin-top: 10px;
        text-align: left;
        font-size: 16px;
    }
    .rewardCheckbox span{
        float : right;
        font-size: 17px;
    }
    .rewardCheckbox>div{
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #payArea{
        width: 700px;
        height: auto;
        background-color: rgb(235, 235, 235);
        padding-left: 50px;
        padding-right: 50px;
        padding-top: 20px;
        padding-bottom: 20px;
        text-align: left;
        vertical-align: top;
        box-sizing: border-box;
        margin-left: 3px;
    }
    #payArea td{
        border-bottom: 1px dotted gray;
        border-collapse: collapse;
        padding-bottom: 10px;
        padding-top: 10px;
        font-size: 15px;
    }
    #payArea th{
        padding-bottom: 10px;
        padding-top: 10px;
        font-size: 15px;
    }
    .payContent{
        /* float: right; */
        text-align: right;
    }
    #payAddress{
        width: 700px;
        height: auto;
        border: 1px solid rgb(202, 202, 202);
        padding-left: 50px;
        padding-right: 50px;
        padding-top: 30px;
        padding-bottom: 30px;
        font-size: 15px;
        text-align: left;
        margin-left: 3px;
    }
    #payAddress td{
        vertical-align: top;
        padding-bottom: 10px;
        padding-top: 10px;
        /* border-bottom: 1px dotted gray; */
    }
    #payAddress input{
        width: 400px;
        height: 20px;
        border-radius: 2px;
        border: 1px solid gray;
    }
    #next_btn{
        width: 150px;
        height: 50px;
        font-size: 15px;
        background-color:  rgb(31, 205, 211);
        border-radius: 5px;
        color: white;
        border: 1px solid rgb(31, 205, 211);
    }
    #cancel_btn{
        width: 150px;
        height: 50px;
        font-size: 15px;
        background-color:  rgb(190, 190, 190);
        border-radius: 5px;
        color: white;
        border: 1px solid rgb(202, 202, 202);
    }
    .btn{
        height: 30px;
        background-color:  rgb(190, 190, 190);
        border-radius: 2px;
        border: 1px solid rgb(202, 202, 202);
        color: white;
    }
</style>
<body>
    
    <jsp:include page="../common/menubar.jsp"/>
    
    <div id="outer">
        <table id="rewardArea">

            <thead>
                <tr>
                    <th colspan="3" id="project_title"><h1>독도야 간밤에 잘 잤느냐, 독도프로젝트</h1></th>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right; padding-bottom:40px">by 온프로젝트</td>
                </tr>
                <tr>
                    <td id="tab1">1. 리워드금액설정</td>
                    <td id="tab2">2. 참여하기</td>
                    <td id="tab3">3. 참여완료</td>
                </tr>
                
            </thead>
            
            <tbody>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="rewardCheckbox" style="margin-top:50px">
                            <div><b>독도이음팔찌 RedBlue 1개 + BlueRed 1개 </b><span>13,000원 (수량 1개)</span></div>
                            <hr>
                            <div><b>희망머그컵 1개 </b><span>10,000원 (수량 1개)</span></div>
                            <hr>
                            <div>배송비<span>3,000원</span></div>
                        </div>         
                    </td>
                </tr>
                <tr>
                    <td colspan="3"> 
                        <div class="rewardCheckbox">
                            후원금 <span>10,000원</span>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <br>

        <table id="payArea">
            <tr>
                <td>펀딩금액</td>
                <td class="payContent">23,000월</td>
            </tr>
            <tr>
                <td>후원금</td>
                <td class="payContent">10,000원</td>
            </tr>
            <tr>
                <td>배송비</td>
                <td class="payContent">3,000원</td>
            </tr>
            <tr>
                <td>포인트 사용</td>
                <td class="payContent">
                    <input type="number" style="width:120px;" step="1000"><br>
                    <input type="checkbox" ><span style="font-size: 12px;">모든 포인트 사용</span>
                </td>
            </tr>
            <tr>
                <th>최종결제금액</th>
                <th class="payContent" style="font-size: 20px; color:rgb(31, 205, 211)">36,000원</th>
            </tr>
        </table>
        <br><br>

        <div style="text-align: left; margin-bottom: 10px;">
            <b style="font-size: 20px;">리워드 배송지</b>
        </div>
        
        <!-- <h2 style="text-align: left;">리워드 배송지</h2> -->
        <table id="payAddress">
            <tr>
                <td width="200px">이름</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td width="200px">휴대폰 번호</td>
                <td><input type="text"></td>
            </tr>
            <tr>
                <td width="200px">주소</td>
                <td><button class="btn">우편번호 검색</button><br><input type="text"></td>
            </tr>
            <tr>
                <td width="200px">배송시 요청사항 (선택)</td>
                <td><textarea cols="55" rows="3"style="resize: none;"></textarea></td>
            </tr>
        </table>



        <br>
        <button type="submit" id="next_btn">결제하기</button>
        <button type="reset" id="cancel_btn">취소</button>
    </div>
    <br><br><br><br><br><br>

</body>
</html>
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
    #rewardArea{
        width: 700px;
        height: auto;
        border: 1px solid rgb(202, 202, 202);
        text-align: left;
        padding-left: 50px;
        padding-right: 50px;
        padding-top: 30px;
        padding-bottom: 30px;
        font-size: 15px;
    }
    #rewardArea td{
        padding-bottom: 10px;
    }
    .resultContent{
        text-align: right;
    }
    #payArea span{
        float : right;
        font-size: 17px;
    }
    #payArea div{
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
        /* margin-left: 3px; */
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
            
            <h1>펀딩 완료</h1>

            <thead id="resultArea">
                <tr>
                    <td colspan="2" style="font-size: 12px;">리워드/악세사리</td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <b style="font-size: 17px;">독도야 간밤에 잘 잤느냐, 독도프로젝트</b>
                            <p></p>
                        </div>         
                    </td>
                    <td class="resultContent">by 온프로젝트</td>
                </tr>
            </thead>    
            <tbody>
                <tr>
                    <td> 
                        펀딩번호
                    </td>
                    <td class="resultContent">121212</td>
                </tr>
                <tr>
                    <td>펀딩 날짜</td>
                    <td class="resultContent">2020.05.28 03:13</td>
                </tr>
                <tr>
                    <td>펀딩 마감일</td>
                    <td class="resultContent">2020.06.01</td>
                </tr>
                <tr>
                    <td>펀딩 상태</td>
                    <td class="resultContent" style="font-size: 20px; color:rgb(31, 205, 211)">결제예약</td>
                </tr>
                <tr>
                    <td colspan="2"><button class="btn" style="width: 100%;">결제 예약 취소</button></td>
                </tr>
            </tbody>

        </table>
        <br>

        <table id="payArea">
            <tr>
                <td colspan="2">
                    <div><b>독도이음팔찌 RedBlue 1개 + BlueRed 1개 </b><span>13,000원 (수량 1개)</span></div>
                    <div><b>희망머그컵 1개 </b><span>10,000원 (수량 1개)</span></div>
                </td>
            </tr>
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
                <td>포인트</td>
                <td class="payContent">-0원</td>
            </tr>
            <tr>
                <th>최종결제금액</th>
                <th class="payContent" style="font-size: 20px; color:rgb(31, 205, 211)">36,000원</th>
            </tr>
        </table>
        
        <br><br>


        <div style="text-align: left; margin-bottom: 10px;">
            <b style="font-size: 20px; ">결제 정보</b>&nbsp;&nbsp;&nbsp;<button class="btn">결제 정보 변경</button>
        </div>
        

        <table id="payAddress">
            <tr>
                <td width="200px">결제방식</td>
                <td>신용(체크)카드</td>
            </tr>
            <tr>
                <td width="200px">카드번호</td>
                <td>************1111</td>
            </tr>
        </table>
        <br><br>


        <div style="text-align: left; margin-bottom: 10px;">
            <b style="font-size: 20px; ">리워드 배송지</b>&nbsp;&nbsp;&nbsp;<button class="btn">리워드 배송지 변경</button>
        </div>

        <table id="payAddress">
            <tr>
                <td width="200px">이름</td>
                <td>안지혜</td>
            </tr>
            <tr>
                <td width="200px">휴대폰 번호</td>
                <td>010-1111-2222</td>
            </tr>
            <tr>
                <td width="200px">주소</td>
                <td>서울시 서초구 우면동 동양고속아파트</td>
            </tr>
            <tr>
                <td width="200px">배송시 요청사항 (선택)</td>
                <td>배송 전 전화 부탁드립니다.</td>
            </tr>
            <!-- <tr>
                <td colspan="2"><button class="btn" style="width: 100%;">리워드 배송지 변경</button></td>
            </tr> -->
        </table>



        <br>
        <button type="submit" id="next_btn">나의 펀딩 목록으로</button>
    </div>
    <br><br><br><br><br><br>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        text-align: center;
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
    #tab1{border-bottom: 5px solid rgb(31, 205, 211);}
    #tab2, #tab3{border-bottom: 5px solid rgb(202, 202, 202);}

    .rewardCheckbox{
        width: 600px;
        height: 160px;
        /* background-color: rgb(237, 237, 238); */
        padding: 50px;
        border: 1px solid rgb(31, 205, 211);
        margin:auto;
        margin-top: 10px;
        text-align: left;
    }
    .reward_money{
        font-size: 22px;
        color: black;
    }
    .reward_name{
        font-size: 17px;
    }
    .reward_sum{
        border: 1px solid rgb(31, 205, 211);
        background-color: rgb(31, 205, 211);
        width: 50px; 
        height: 25px; 
        padding: 2px;
        text-align: center;
        border-radius: 3px;
        color: white;
        font-size: 14px;
    }
    .bonus{
        width: 600px;
        height: 160px;
        padding: 20px;
        margin:auto;
    }

    .checkbox{
        width: 20px;
        height: 20px;
        border-radius: 100px;
    }
    #reward_finalSum{
        text-align: center;
        font-size: 20px;
        padding: 30px;
        border-top: 1px solid gray;
    }
    #next_btn{
        width: 150px;
        height: 50px;
        font-size: 15px;
        background-color:  rgb(31, 205, 211);
        border-radius: 5px;
        color: white;
        border: 1px solid rgb(31, 205, 211);
        cursor: pointer;
    }

    .reward_amount{
        font-size: 15px;
        text-align: right;
        /* align: right; */
    }

</style>
<body>
    
	<jsp:include page="../common/menubar.jsp"/>
	<br><br>
	<hr>
	<br>
	
    <div id="outer">
    
    	<form action="booking.pay" method="POST"> 
    	
        <table id="rewardArea">

            <thead>
                <tr>
                    <th colspan="3" id="project_title"><h1>${ p.projectName }</h1></th>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:right; padding-bottom:40px">by ${ m.makerName }</td>
                </tr>
                <tr>
                    <td id="tab1">1. 리워드금액설정</td>
                    <td id="tab2">2. 참여하기</td>
                    <td id="tab3">3. 참여완료</td>
                </tr>
                
            </thead>
            
            <tbody>
            
            
	            <!-- for문 -->
	            <c:forEach items="${ rlist }" var ="r">	            
		            <tr>
	                    <td colspan="3">
	                        <div class="rewardCheckbox" style="margin-top:50px">
	                            <b class="reward_money">
	                                <input type="checkbox" name="project" value="reward1" class="checkbox">
	                                <fmt:formatNumber value="${ r.rewardCost }" pattern="#,###" />원 펀딩 &nbsp;
	                                <span class="reward_amount">수량 : <input type="number" value="1" style="width: 40px; height: 20px;"></span> <!-- 수량 -->
	                            <hr></b>
	                            <p class="reward_name">${ r.rewardTitle }<br></p>
	                            <p>${ r.rewardContent }<br></p>
	                            <button class="reward_sum">${ r.rewardFundingCount }명</button> 참여하였습니다. (전체수량  ${ r.rewardRemainingQuantity }개남음)
	                        </div>         
	                    </td>
	                </tr> 
	            </c:forEach>
	            
 
               <!--  <tr>
                    <td colspan="3">
                        <div class="rewardCheckbox" style="margin-top:50px">
                            <b class="reward_money">
                                <input type="checkbox" name="project" value="reward1" class="checkbox">
                                13,000원 펀딩 &nbsp;
                                <span class="reward_amount">수량 : <input type="number" value="1" style="width: 40px; height: 20px;"></span> 수량
                            <hr></b>
                            <p class="reward_name">독도이음팔찌 RedBlue 1개 + BlueRed 1개<br></p>
                            <p>배송 예정일 : 2020년 6월 4일부터<br></p>
                            <button class="reward_sum">100명</button> 참여하였습니다. (전체수량 10개남음)
                        </div>         
                    </td>
                </tr>
                <tr>
                    <td colspan="3"> 
                        <div class="rewardCheckbox">
                            <b class="reward_money">
                                <input type="checkbox" name="project" value="reward1" class="checkbox">
                                30,000원 펀딩 &nbsp;
                                <span class="reward_amount">수량 : <input type="number" value="1" style="width: 40px; height: 20px;"></span> 수량
                            <hr></b>
                            <p class="reward_name">희망머그컵 1개<br></p>
                            <p>발송예정일 : 2020년 6월29일부터<br></p>
                            <button class="reward_sum">100명</button> 참여하였습니다. (전체수량 10개남음)
                

                            <div class="input-group number-spinner">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus">-</span></button>
                                </span>
                                <input type="text" class="form-control text-center" value="1" style="width:30px;" >
                                <span class="input-group-btn">
                                    <button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus">+</span></button>
                                </span>
                            </div>

                        </div>
                    </td>
                </tr> -->


                <tr class="bonus">
                    <td>
                        <b>후원금 더하기<br>(선택)</b>
                    </td>
                    <td colspan="2">
                        <p style="width:450px; text-align:left; font-size: 14px;">
                                                               후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?<br><br>
                            <input type="number" style="width:120px; height: 30px;" step="1000"> 원을 추가로 후원합니다.
                        </p>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" ><div id="reward_finalSum">선택한 리워드 총 4개이며 참여금액 <b id="sum">109,000</b>원 입니다.</div></td>
                </tr>
                
            </tbody>
        </table>
        <button type="submit" id="next_btn" >다음단계</button>
        </form>
        

    </div>
    <br><br><br><br><br><br>

	<script>
	
	    $(document).on('click', '.number-spinner button', function () {    
	        var btn = $(this),
	            oldValue = btn.closest('.number-spinner').find('input').val().trim(),
	            newVal = 0;
	        
	        if (btn.attr('data-dir') == 'up') {
	            newVal = parseInt(oldValue) + 1;
	        } else {
	            if (oldValue > 1) {
	                newVal = parseInt(oldValue) - 1;
	            } else {
	                newVal = 1;
	            }
	        }
	        btn.closest('.number-spinner').find('input').val(newVal);
	    });
	
	</script>

</body>
</html>
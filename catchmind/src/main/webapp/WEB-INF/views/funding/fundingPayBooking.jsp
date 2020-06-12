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
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <title>Document</title>
</head>q
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
        cursor: pointer;
    }
    #cancel_btn{
        width: 150px;
        height: 50px;
        font-size: 15px;
        background-color:  rgb(190, 190, 190);
        border-radius: 5px;
        color: white;
        border: 1px solid rgb(202, 202, 202);
        cursor: pointer;
    }
    .btn{
        height: 30px;
        background-color:  rgb(190, 190, 190);
        border-radius: 2px;
        border: 1px solid rgb(202, 202, 202);
        color: white;
        cursor: pointer;
    }
    #addressBtn{
        height: 30px;
        background-color:  rgb(190, 190, 190);
        border-radius: 2px;
        border: 1px solid rgb(202, 202, 202);
        color: white;
    }
</style>
<body>
    
    <jsp:include page="../common/menubar.jsp"/>
	<br><br>
	<hr>
	<br>
    
    <div id="outer">
    
   <%--  <form action="dopay.pay?pno=${p.projectNumber}" method="post">  --%>
    
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
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <div class="rewardCheckbox" style="margin-top:50px">
                        
                        	<c:forEach items="${ flList }" var ="fl">
                        		<div><b>${ fl.fundingTitle2 } (${ fl.fundingProduct })</b><span><fmt:formatNumber value="${ fl.fundingCost }" pattern="#,###" />원 (수량 ${ fl.fundingQuantity }개)</span></div>
                            	<hr>
                        	</c:forEach>
                        	
                            <!-- <div><b>독도이음팔찌 RedBlue 1개 + BlueRed 1개 </b><span>13,000원 (수량 1개)</span></div>
                            <hr>
                            <div><b>희망머그컵 1개 </b><span>10,000원 (수량 1개)</span></div>
                            <hr> -->
                            
                            <div>배송비<span>3,000원</span></div>
                            
                        </div>         
                    </td>
                </tr>
                <tr>
                    <td colspan="3"> 
                        <div class="rewardCheckbox">
                            	후원금 <span><fmt:formatNumber value="${ spon }" pattern="#,###" />원</span>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <br>
        
        
		<form id="resultForm" action="dopay.pay?pno=${p.projectNumber}" method="post">
		
		
        <table id="payArea">
            <tr>
                <td>펀딩금액</td>
                <td class="payContent"><fmt:formatNumber value="${ sum }" pattern="#,###" />원</td>
            </tr>
            <tr>
                <td>배송비</td>
                <td class="payContent">3,000원</td>
            </tr>
            <tr>
                <td>후원금</td>
                <td class="payContent"><fmt:formatNumber value="${ spon }" pattern="#,###" />원</td>
            </tr>
            <tr>
                <td>포인트 사용</td>
                <td class="payContent">
                    <input type="number" style="width:120px; height: 30px; font-size: 15px;" step="1000" min="0" max=
	                    <c:choose>
			                <c:when test="${ loginUser.point > sum + spon + 3000 }">           
		                    	"${ sum + spon + 3000 }"
		                    </c:when>
		                    <c:otherwise>
		                    	"${ loginUser.point }"
		                    </c:otherwise>
	                    </c:choose>
                     value="0" id="pointArea" name="usePoint"><br>
                    <input type="checkbox" id="allPoint"><span style="font-size: 12px;">모든 포인트 사용</span>
                </td>
            </tr>
            <tr>
                <th>최종결제금액</th>
                <th class="payContent" style="font-size: 20px; color:rgb(31, 205, 211)"><b id="finalSum">0</b>원</th>
            </tr>
        </table>
        <br><br>


		<!-- 배송지 -->
        <div style="text-align: left; margin-bottom: 10px;">
            <b style="font-size: 20px;">리워드 배송지</b>&nbsp;&nbsp;<input type="button" id="addressBtn" onclick="location.href='mypageModify.me'" value="배송지 변경">
        </div>
        
        <!-- <h2 style="text-align: left;">리워드 배송지</h2> -->
        <table id="payAddress">
            <tr>
                <td width="200px">이름</td>
                <%-- <td><input type="text" value="${ loginUser.userName }"></td> --%>
                <td><b>${ loginUser.userName }</b></td>
            </tr>
            <tr>
                <td width="200px">휴대폰 번호</td>
                <%-- <td><input type="text" value="${ loginUser.phone }"></td> --%>
                <td><b>${ loginUser.phone }</b></td>
            </tr>
            <tr>
                <td width="200px">주소</td>
                <%-- <td><button class="btn">우편번호 검색</button><br><input type="text" value="${ loginUser.address }"></td> --%>
            	<td><b>${ loginUser.address }</b></td>
            </tr>
            <tr>
                <td width="200px">배송시 요청사항<br>(선택)</td>
                <td><textarea cols="50" rows="3" style="resize: none; font-size:15px;" id="ship_memo" name="shipMemo"></textarea></td>
            </tr>
        </table>

        <br>
        
        
        
        	<!-- 결제 테이블에서 쓸 정보-->
			<input hidden id="payNo" name="paymentMethod" value="">
			<%-- <input hidden name="userId" value= "${ loginUser.userId }">
			<input hidden name="payName" value="${ loginUser.userName }">
			<input hidden name="payEmail" value="${ loginUser.email }">
			<input hidden name="payPhone" value="${ loginUser.phone }"> --%>
			<input hidden name="finalSum" value="0" id="fs">
	 		<%-- <input hidden name="pno" value="${ p.projectNumber }"> --%>
		    <input type="hidden" id="sum" value=${ sum }> 
		    <input type="hidden" id="spon" value=${ spon }>
		    <input type="hidden" name="currentPoint" id="point" value=${ loginUser.point }> 
		    
		    
	        <!-- <button type="submit" id="next_btn">결제하기</button> -->
	        <button type="button" id="next_btn">결제하기</button>
	        <button type="reset" id="cancel_btn">취소</button>
        </form>
        
        <!-- </form> -->
    </div>
    <br><br><br><br><br><br>
   


<script>

	$(function(){ 
	
				
		var sum = parseInt($("#sum").val()); 		// 총액
		var spon = parseInt($("#spon").val()); 	 	// 후원금
		var fSum = sum + spon + 3000;				// 총액 + 후원금 + 배송비
		var finalSum = 0;							// 최종 결제액
		var point = parseInt($("#point").val());	// 보유 포인트
		
		// 사용할 포인트
		//console.log(finalSum);
		$("#finalSum").text(fSum);
		$("#fs").val(fSum);
				
		// 포인트 input 숫자에 따라 결제총합 변경
		$("#pointArea").bind('click keyup', function(){
			
			$("#allPoint").prop("checked", false); // 체크박스 해지
			var usePoint = $("#pointArea").val();
			
			finalSum = fSum - usePoint;
			$("#finalSum").text(finalSum);
			$("#fs").val(finalSum);
		});
				
		// 체크박스 클릭시, 모든 포인트 사용
		$("#allPoint").click(function(){
			
 			if($(this).is(":checked")){ 
 				
	 				// 포인트 사용시 조건 (결제금액 < 포인트 --> max 포인트 = 결제금액)
	 				if(point > fSum){
	 					
	 					point = fSum;
	 					//$("#pointArea").attr("max" , fSum); 
	 				}
	 				
	 				finalSum = fSum - point;
				 	$("#pointArea").val(point);
				 	$("#finalSum").text(finalSum);
				 	$("#fs").val(finalSum);
				 	
				$("#pointArea").bind('click keyup', function(){
					
					if($("#pointArea").val() == fSum){
				 		$("#allPoint").prop("checked", true);
					}else{
						$("#allPoint").attr("checked", false);
					}
			 	});
			 	
			}else{
				
				finalSum = fSum;
				$("#pointArea").val(0);
				$("#finalSum").text(finalSum);
				$("#fs").val(finalSum);
			} 			 
		});
		
	
	});

    
 
 	// 결제 api
	var IMP = window.IMP;
	IMP.init('imp76288443'); 
	
	$('#next_btn').click(function(){
		
		IMP.request_pay({
	   	    pg : 'inicis', // version 1.1.0부터 지원.				// 결제방식
	   	    pay_method : 'card',								// 결제수단
	   	    merchant_uid : 'merchant_' + new Date().getTime(),  // 상점 거래 ID
	   	    name : '${ p.projectName }',						// 주문명 // order 테이블에 들어갈 주문명 혹은 주문 번호
	   	    amount : 100,										// 결제금액
	   	    buyer_email : '${ loginUser.email }',				// 구매자 email
	   	    buyer_name : '${ loginUser.userName }',				// 구매자 이름
	   	    buyer_tel : '${ loginUser.phone}',					// 구매자 전화번호
	   	    buyer_addr : '${ loginUser.address}',				// 구매자 주소
	   	    buyer_postcode : '${ loginUser.addressNum }',		// 구매자 우편번호
	   	    m_redirect_url : 'dopay.pay'  						// 결제 완료 후 보낼 컨트롤러의 메소드명
	   	    
   	}, function(rsp) {
   		
   	    if ( rsp.success ) {	// 성공시
   	        var msg = '결제가 완료되었습니다.';
   	        msg += ' (고유ID : ' + rsp.imp_uid + ")";
   	        //msg += ' 상점 거래ID : ' + rsp.merchant_uid;
   	        //msg += ' 결제 금액 : ' + rsp.paid_amount;
   	        //msg += ' 카드 승인번호 : ' + rsp.apply_num;
   	        
   	        $('#payNo').val(rsp.imp_uid);
   	        //$('#reserveNo').val('R-' +  rsp.imp_uid);
   	        
   	        $("#resultForm").submit(); // 결제가 완료되면 윈도우를 킨 곳에 값을 리턴하고 현재 창을 닫음 
   	        
   	    } else {	// 실패시 
   	        var msg = '결제에 실패하였습니다.';
   	        msg += '에러내용 : ' + rsp.error_msg;
   	    }
   	    	alert(msg);
   		});
	});

	
/* 	//리셋버튼   
   $('#reset').click(function(){
       $('.lavel').removeClass('clickseat');
       $("#seat").html("");
       $("#price").html("");
   });


   // 결제방식선택 폼체인지
   $('input:radio[name=payment]').click(function(){ 
       if($(this).val() == "creditcard"){
           $(".detail").children().removeClass("displayOn");
           $("#creditcard").addClass("displayOn");
       } else if($(this).val() == "bankbook"){
           $(".detail").children().removeClass("displayOn");
           $("#bankbook").addClass("displayOn");
       } else if($(this).val() == "kakao"){
           $(".detail").children().removeClass("displayOn");
           $("#kakao").addClass("displayOn");
       }
   }); */

</script>


</body>
</html>
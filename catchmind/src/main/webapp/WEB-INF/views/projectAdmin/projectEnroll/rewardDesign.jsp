<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%--회원전체조회 화면 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script
    src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>

 .area{
 
	            width: 300px;
	            height: 100px;
	            font-size: 50px;
	            color: black;
	             background-color: white;
	          border: 1px solid black;
	           position: absolute;
  }
       
  .question{
	font-size: 30px;
    color: blue;
   }
   
  .questiontext{
	width: 700px;
	height: 100px;
   }
   .grey{
	font-size: 15px;
    color: grey;
   }
   .answer{
	font-size: 22px;
    color: green;
   }
   .black{
	color: black; 
	font-size: 15px;
   }
     .blackmodal{
	color: black; 
	font-size: 18px;
   }
    .outer{
	min-width: 800px;
   }
   
   .blacktool{
     /* vertical-align: middle; */
   width: 700px;
	height: 120px;
	  background-color: white;
	          border: 1px solid black;
	          	font-size: 15px;
    color: black;
   }
   
</style>

  <link href="<%=request.getContextPath()%>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="<%=request.getContextPath()%>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
</head>

<body>
<!-- <div  style="position: fixed";> -->
		<div  style="position: fixed";>
	<%@ include file="../common/menubarIm.jsp"%>
	</div>
	
	<div class="outer">
	
			<div style=" height: 700px ; margin-left: 270px;">
			<br>
			

			<h1 class="h3 text-gray-900 mb-4">리워드설계</h1>
			
					<h1 class="black">서포터에게 제공할 리워드 내용을 입력하세요. 서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터<br> 서포터의 보다 빠른 펀딩을 유도할 수 있는 얼리버드 리워드까지 다양한 리워드를 구성하세요.</h1>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">리워드 설계 조건</h6>
					</div>
					<div class="card-body" >
											<p>1.리워드 추가하기<br>
											2.아이템 추가하기<br>
											
											</p>
					</div>
				</div>
	


				<br>
				<div class="btns">
					<button type="button" class="btn btn-success btn-user btn-block" style="width: 120px;" id="rewardPlus" >+ 추가하기</button>
				</div>
				
                <form action="insertReward.pa" method="post" id="rinfo" style="display: none">
                	<br>
                	<h3>1단계.리워드 등록</h3>
                	
                	<table style= "margin-top:6px;">
						
				
						<tr>
							<td class="blackmodal" height="50px">리워드명</td>
							<td><input class="blackmodal"  type="text" name="rewardTitle" id="rewardTitle" required></td>
							
						</tr>

						<tr>
							<td class="blackmodal"  height="50px">리워드설명</td>
							<td><textarea  name="rewardContent" id="rewardContent" style="height: 200px; width: 200px;  " required></textarea></td>
							
						</tr>
			
						<tr>
							<td class="blackmodal" width="300px" height="50px">금액</td>
							<td><input type="text" name="rewardCost" id="rewardCost" placeholder="숫자만" required></td>
						
						</tr>
					
						<tr>
							<td  class="blackmodal" height="50px">제한수량</td>
							<td><input class="blackmodal"  type="text" name="rewardRemainingQuantity" placeholder="수량입력"></td>
					
						</tr>
							<tr>
							<td class="blackmodal"  height="50px">배송비</td>
							<td><input  class="blackmodal" type="text" name="rewarDeliveryCost" required></td>
						
						</tr>
						<tr>
							<td  class="blackmodal" height="50px">리워드등록</td>
							<td> <button type="submit" class="btn btn-primary" id="itembutton">리워드등록</button></td>
					
						</tr>
						</table>
					</form>	


				<form action="insertOptin.pa" method="post" id="oinfo" style="display: none">
					<table style= "margin-top:6px;">
						<tr>
							<td  class="blackmodal" width="300px" height="50px">아이템선택</td>
							<td>
							<select name="category"  id="category">
					            <option value="">아이템선택</option>    
					            
					              <c:forEach items="${ list }" var="i">                       
				         		 
										<!-- 현재 쿼리스트링 받은 지역명이랑 총 지점리스트에서 지역명이렁 동일한 값들만 뽑아냄  -->
										<option value="${ i.itemNo }" >${ i.itemName }</option>		 
									
							 </c:forEach>	
							 </select>	
							</td>
						</tr>
						<tr>
							<td  class="blackmodal" height="50px">아이템등록갯수</td>
							<td><input class="blackmodal"  type="text" name="itemQuantity" placeholder="수량입력"></td>
					
						</tr>
						<tr>
							<td  class="blackmodal" height="50px">아이템등록하기</td>
							<td> <button type="button" class="btn btn-primary" id="itembutton">아이템추가</button></td>
					
						</tr>
					</table>
				</form>
				

				<br>
				
			<div class="row" style="width: 100%; ">	
				<c:forEach items="${ rlist }" var="r">
				
	                	<div class="card mb-5" style="width: 320px;  margin-left: 1%;">
							<div class="card-header py-3">
						
							<h6 class="m-0 font-weight-bold text-primary" style="font-size: 22px;">${ r.rewardCost }원</h6>
							<h1 class="black text-right">
							남은수량 :${ r.rewardRemainingQuantity }개
							</h1>
							</div>
							
							<div class="card-body py-1"  >
							<h1 class="black" style="font-size: 20px;">
							${ r.rewardTitle }
							</h1>
							<h1 class="black" style="line-height:150%">
							${ r.rewardContent }<br>
							배송비:${ r.rewarDeliveryCost }
							</h1>
							
							<c:forEach items="${ optionlist }" var="op">
									<c:if test="${op.rewardNo eq r.rewardNo}">
								  	  <%-- ${op.rewardNo} <br> --%>
									${op.itemName}  &nbsp;  ${op.itemQuantity}개<br>
								  </c:if>
					
							</c:forEach>
								
							</div>
							
						<div class="row">
						&nbsp;&nbsp;
							<form action="<%=contextPath%>/rewardDesign2.pa" method="post">
								<input type="hidden" name="rewardNo" value="${ r.rewardNo }">
								<input type="hidden" name="rewardTitle" value="${ r.rewardTitle }">
								<div class="col-auto text-left">
			                     <button type="submit"  class="btn btn-success ">+아이템추가</button>
			                    </div>
							</form>	  
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<form action="<%=contextPath%>/deleteReward.pa" method="post">
								<input type="hidden" name="rewardNo" value="${ r.rewardNo }">
									<div class="col-auto text-right">
			                     <button type="submit"  class="btn btn-danger ">삭제</button>
			                    	</div>
							</form>	
						</div>
						</div>                   
	                  <br> 
                    </c:forEach>
				
			  </div> 
					
					
					
				<div class="btns">
					<button class="btn btn-primary btn-user btn-block" style="width: 200px;" >저장하기</button>
				</div>
			</div>

		
		


	 
                   

				</div>
             
    
	<script>
	
	$(function(){ 
	    $("#rewardPlus").on('click',function(){
 
	    	$("#rinfo").toggle();
	    });
	});
	  
	
	$(function(){ 
	    $("#optionButton").on('click',function(){
 
	    	$("#oinfo").toggle();
	    });
	});
	  
	 
	
</script>
  
</body>
</html>
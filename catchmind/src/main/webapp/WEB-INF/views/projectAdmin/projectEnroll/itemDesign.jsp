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
			<h1 class="h3 text-gray-900 mb-4">아이템설계</h1>
			
					<h1 class="black">서포터에게 제공할 아이템 내용을 입력하세요. 서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터<br> 서포터의 보다 빠른 펀딩을 유도할 수 있는 얼리버드 아이템까지 다양한 아이템 구성하세요.</h1>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">리워드 설계 조건</h6>
					</div>
					<div class="card-body" >
						<p>판매할 아이템을 등록해주세요
					</div>
				</div>

				<br>
				
				<div class="btns">
					<button type="button" class="btn btn-success btn-user btn-block" style="width: 120px;" id="modal_show" >+ 추가하기</button>
				</div>
				
				<br>
			<div class="row" style="width: 100%; ">	
				<c:forEach items="${ ilist }" var="i">
				
	                	<div class="card mb-5" style="width: 320px;  margin-left: 1%;">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">${ i.itemName }</h6>
							</div>
							<div class="card-body py-1"  >
								<h1 class="black"><br>
							${ i.itemContent }</h1>
							</div>
							  
		                    
							<form action="<%=contextPath%>/deleteItem.pa" method="post">
								<input type="hidden" name="itemNo" value="${ i.itemNo }">
									<div class="col-auto text-right">
			                     <button type="submit"  class="btn btn-danger ">삭제</button>
			                    </div>
							</form>	
					
						</div>                   
	                  <br> 
                    </c:forEach>
				
			  </div>  
				
				<a href="<%=contextPath%>/home.pa">
								<button type="button" class="btn btn-primary">홈으로</button>
							</a>
				
				
				
			</div>

		
		
<form action="insertItem.pa" method="post">
		  <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">아이템 추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                
                
                	<table style= "margin-top:6px;">
							<tr>
							<td class="blackmodal" width="400px" height="50px">아이템</td>
							<td><input type="text" name="itemName" id="itemName" required></td>
						
						</tr>
				
						<tr>
							<td class="blackmodal">아이템설명</td>
							<td><textarea  name="itemContent" id="itemContent" style="height: 200px; width: 200px;  " required></textarea></td>
							
						</tr>

						
					</table>

					</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">아이템추가</button>
                   <!--  <button type="button" class="btn btn-primary" id="close_modal">다른 방식으로 모달 닫기</button> -->
                </div>
            </div>
        </div>
    </div>
</form>


	 
                   

				</div>
             
    
	<script>
	function checkAll(){
		if($("#th_checkAll").is(':checked')){
			$("input[name=uNo]").prop("checked",true);
			
		}else{
			$("input[name=uNo]").prop("checked",false);
		}
	}
	
	
	  $(document).ready(function() {
          $("#modal_show").click(function() {
              $("#exampleModal").modal("show");
          });

          $("#close_modal").click(function() {
              $("#exampleModal").modal("hide");
          });
      });

	  $(document).ready(function() {
          $("#modal_show2").click(function() {
              $("#exampleModal2").modal("show");
          });

          $("#close_modal2").click(function() {
              $("#exampleModal2").modal("hide");
          });
      });
	  
	  
	  
	 
	
</script>
  
</body>
</html>
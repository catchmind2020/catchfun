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
    .black{
	color: black; 
	font-size: 15px;
   }
   .cardsize{
 width: 700px;
	height: 100px;
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
		<div  style="position: fixed";>
	<%@ include file="../common/menubarIm.jsp"%>
	</div>
	
	<div class="outer">
		<form style="margin-left: 270px;" action="basicinsert.pa" method="post">
			<div style=" height: 700px;">
				<br>
				<h1 class="h3 text-gray-900 mb-4">펀딩 준비</h1>
				<h1 style="color: black; font-size: 15px;">본격적으로 펀딩을 오픈하기 위해 프로젝트에 대한 6가지 메뉴의 필수항목을 작성하세요.</h1>
				
				
				
	  		<div class="cardsize card mb-4 py-3 border-left-primary" >
                      <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
  					${projectBasicNo}    ${ projectBasic.check2}
                      <div class="h5 mb-0 font-weight-bold text-gray-800">기본요건</div>
                    </div>
                    
                    
               
                    
                    <c:choose>
                      <c:when test="${ !empty projectBasic }">
	                    <div class="col-auto">
	                    	<a  href="<%= contextPath %>/basicSelect.pa">
	                      <button type="button" class="btn btn-primary">수정하기</button>
	                    	</a>
	                    </div>
	                  </c:when>
	                   <c:otherwise>
	                    
	                    <div class="col-auto" >
	                    ${projectBbasicNo}
	                     <a  href="<%= contextPath %>/basic.pa">
	                    	<button type="button" class="btn btn-primary"  >작성하기</button>
	                    </a>
	                    </div>
	
	                    </c:otherwise>
	                 </c:choose>
                  </div>
              </div>
 			</div>
 			<br>
 				<div class="cardsize card mb-4 py-3 border-left-primary" >
                      <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
  
                      <div class="h5 mb-0 font-weight-bold text-gray-800">기본정보/스토리</div>
                    </div>
                    
                    <div class="col-auto">
                     <button type="button" class="btn btn-primary">작성하기</button>
                    </div>
                  </div>
              </div>
 			</div>
 			<br>
 				<div class="cardsize card mb-4 py-3 border-left-primary" >
                      <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2" >
                      <div class="h5 mb-0 font-weight-bold text-gray-800">아이템/리워드설계</div>
                    </div>
                    <div class="col-auto">
                     <button type="button" class="btn btn-primary">작성하기</button>
                    </div>
                  </div>
              </div>
 			</div>
 			<br>
 				<div class="cardsize card mb-4 py-3 border-left-primary" >
                      <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
  
                      <div class="h5 mb-0 font-weight-bold text-gray-800">메이커정보</div>
                    </div>
                    <div class="col-auto">
                     <button type="button" class="btn btn-primary">작성하기</button>
                    </div>
                  </div>
              </div>
 			</div>
			<br>
         <div class="btns">
					<button type="submit" class="btn btn-primary btn-user btn-block"
						style="width: 200px;">제출하기</button>
				</div>
				
				

			</div>

		</form>
	</div>
	<script>

$(function(){
     $(".q1_type").on('click',function(){
         var area1 = $('input:radio[id="agree"]').is(":checked");  
         if(area1==true){
            $("#area1").css("display", "block");
            } else{ 
           	$("#area1").css("display", "none");
            }
     });
 });
$(function(){
    $(".q2_type").on('click',function(){
        var area2 = $('input:radio[id="agree3"]').is(":checked");  
        var area3 = $('input:radio[id="agree4"]').is(":checked");  
        var area4 = $('input:radio[id="agree5"]').is(":checked");  
        var area5 = $('input:radio[id="agree6"]').is(":checked");  
        var area6 = $('input:radio[id="agree7"]').is(":checked");  
        if(area2==true){
           $("#area2").css("display", "block");
           } else{ 
          	$("#area2").css("display", "none");
           }
        
        if(area3==true){
            $("#area3").css("display", "block");
            } else{ 
           	$("#area3").css("display", "none");
            }
        if(area4==true){
            $("#area4").css("display", "block");
            } else{ 
           	$("#area4").css("display", "none");
            }
        if(area5==true){
            $("#area5").css("display", "block");
            } else{ 
           	$("#area5").css("display", "none");
            }
        if(area6==true){
            $("#area6").css("display", "block");
            } else{ 
           	$("#area6").css("display", "none");
            }
    });
});

	
	
	
	
	
	
</script>
  
</body>
</html>
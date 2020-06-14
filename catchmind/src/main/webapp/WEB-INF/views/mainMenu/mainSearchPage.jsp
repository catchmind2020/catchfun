<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<style>
	.btn{border:0px;}
</style>
<style>
.box {
	width: 70px;
	height: 70px;
	border-radius: 70%;
	overflow: hidden;
	margin: 20px;
}

.profile:hover {
	border: 1px solid white;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.list {
	width: 370px;
	height: 300px;
	display: inline-block;
	box-sizing: border-box; 
	border-collapse: collapse;
	margin-left:0px;
	float:left; 	/*div 간격없애기*/
	margin-bottom:70px;
}

.list img {
	width: 370px;
	height: 200px;
	margin:0px;
}

.list h4 {
	margin: 0px;
}

progress { width: 370px; height: 10px; background-color: #2ed5d5; }
progress::-webkit-progress-bar { background-color: lightgray;}
progress::-webkit-progress-value { background-color: #2ed5d5; }

.dday { float: right; }
.dday>img { width: 17px; height: 17px; vertical-align: text-bottom; }

.maker {
	color: darkgray;
	font-weight: 800;
	font-size: 13px;
}

.content {
	width: 1200px;
	font-size: 15px;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto;
	
}

.list:nth-child(3n+1), .list:nth-child(3n+2){ margin-right: 45px; margin-left:0px; }
.list:nth-child(3n) { margin-right: 0px; margin-left:0px; back-ground:orange;}
.categoryList { box-sizing: border-box;  border-collapse: collapse; }
.orderSelect{ float:right; }
.list:hover {cursor:pointer; background-color:#F4FFFE; }

select {
width: 120px;
height:50px;
padding: 8px;
font-size:15px;
font-family: inherit;
background: url('https://t1.daumcdn.net/cfile/tistory/99761B495C84AA8716') no-repeat 95% 50%;
border-radius: 0px;
border: 0px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
}

select::-ms-expand { display: none; }
select:focus { outline:none; }

</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<br>
	<br><br><br>
		<div style="height: 20px;"></div>
		<div class="content">
			<!--  -->
			<div><h2><b>${ keyword }</b>&nbsp;&nbsp;<b style="color:gray; font-size:23px;">검색 결과 </b></h2></div>
			<input type="hidden" value="${keyword}" id="keyword">
			<hr style="border: solid 1px #2ed5d5;">
			<!-- list -->
			<form>
				<div class="categoryList">
				<br>
				   				 
   				<div id="lists" class="stList">

				</div>
				<div id="busStopList" class="stList">

				</div>
				
				
				</div>
			</form>

		</div>


	

 <script>
    $(document).ready(function(){
		
		
		var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
		var keyword = $("#keyword").val();

		$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
			mainSearchAjax(page);
		    page++;
		}); 
		 
		$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		     if($(window).scrollTop() >= $(document).height() - $(window).height()){
		    	 mainSearchAjax(page);
		           page++;   
		     } 
		});
		 
		function mainSearchAjax(page){
		 
		    $.ajax({
		        type : 'POST',  
		        dataType : 'json', 
		        data : {"page" : page , "keyword":keyword},
		        url : 'mainSearchAjax.mu',
		        success : function(returnData) {
		        	// console.log("통신성공");
		            var data = returnData.rows;
		            // console.log(data);
		            var html = "";
		            if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
		                  $("#lists").html(""); 
		            }
		            if (returnData.totCnt == 0) {
		            	html += "<br><br><h4 align='center'>해당 검색 결과가 없습니다.</h4>";
		            }
		            if (returnData.startNum<=returnData.totCnt){
		                if(data.length>0){
		   					for(var i in data){
		   						// console.log(data[i].projectNo );
		   						/* var ccc = data[i].fundingTotalCost / data[i].projectTargetAmount * 100;
		   						console.log(ccc);
		   						var ddd = data[i].fundingTotalCost;
		   						console.log(ddd); */
		   						var per = ((data[i].fundingTotalCost / data[i].projectTargetAmount * 100).toFixed(0));
		   						// console.log(per);
		   						var totalcost = data[i].fundingTotalCost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		   						html +=
		   							"<div class='list'>" + 
		   							"<input type='hidden' value='" + data[i].projectNo + "'>" + 
		   							"<div><img src='${pageContext.servletContext.contextPath}/resources/images/uploadFiles/" + data[i].projectImg + "'></div>" +
		   							"<div><h4 style='height:60px;'><b>" + data[i].projectName + "</b></h4></div>" +
		   							"<div class='maker'>" + data[i].projectCategory + " | " + data[i].makerName + "</div>" + 
		   							"<div><progress value='" + data[i].fundingTotalCost / data[i].projectTargetAmount * 100 + "' max='100'></progress></div>" +
		   							"<div>" + 
		   							"<span>" + per + "% &nbsp;&nbsp;" + totalcost + "원</span>" + 
									"<span class='dday'>" + 
									"<img src='${pageContext.servletContext.contextPath}/resources/images/time.png'>&nbsp;" + data[i].projectDday + "일 남음</span></div>" +
									"</div>";

									
		   					    /* 펀딩프로젝트 상세보기 페이지 이동 */
		   				       	$(function(){
		   				    		$(".list").click(function(){
		   				    			var pno = $(this).children().eq(0).val();
		   				    			location.href = "detail.pro?pno=" + pno;
		   				    		});
		   				    	});
		   					}
		                }else{
		                //데이터가 없을경우
		                 // console.log("데이터없음");
		                }
		            }
		             html = html.replace(/%20/gi, " ");
		            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
		                $("#lists").html(html); 
		            }else{ 
		                $("#busStopList").append(html);
		            }
		       },error:function(e){
		    	   console.log("통신실패");
		            if(e.status==300){
		               alert("데이터를 가져오는데 실패하였습니다.");
		           }; 
		       }
		    }) 
		}
	    
    });
    
		</script>
		</body>
</html>
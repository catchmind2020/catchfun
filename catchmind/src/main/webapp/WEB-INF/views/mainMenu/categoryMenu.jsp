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
progress::-webkit-progress-bar { background-color: lightgray; }
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
<body>

<jsp:include page="../common/menubar.jsp" />


	<br>
	<br><br><br>
	<div>
		<!-- category -->
		<div align="center">
			<form>
				<table id="categoryTable">
					<!-- category  -->
					<tr align="center">
						<td class="tdAll">
							<div class="box" style="background: #BDBDBD;">
								<img class="profile" src="${pageContext.servletContext.contextPath}/resources/images/all.png">
							</div>
							<div class="caname"><b>전체보기</b></div>
							
						</td>
						
						<c:forEach items="${ listCategory }" var="c">
						
						<td class="td">
							<input type="hidden" value="${c.categoryNo}">
							<div class="box" style="background: #BDBDBD;">
								
								<img class="profile" src="${pageContext.servletContext.contextPath}/resources/images/${c.categoryImg }">
							</div>
							<div class="caname"><b>${c.categoryName }</b></div>
							
						</td>
						</c:forEach>
					</tr>
				</table>
			</form>
		</div>
<br><br>

		<div style="height: 20px;"></div>
		<div class="content">
			<!--  -->
			<div><h2>
					<b>${ cgmsg }</b>
					<input type="hidden" value="${msgs}" id="msgs">

					<!-- 드롭다운2  -->
					<div class="orderSelect">
						<select name="order" id="order" onchange="order()">
							<option value="totalcost" >추천순 </option>
							<option value="totalcost">모금액순</option>
							<option value="project_startdate">최신순</option>
							<option value="project_finishdate">마감임박순</option>
						</select>
					</div>

	
		
		
				</h2>
  			</div>
			<hr style="border: solid 1px #2ed5d5;">
			<!-- list -->
			<form>
				<div class="categoryList">
				<br>
					
						<%-- <c:forEach items="${ listCategoryProject }" var="p">
							
								<div class="list">
									<input type="hidden" value="${p.projectNo}">
									<div>
										<img src="${pageContext.servletContext.contextPath}/resources/images/projectimages/${p.projectImg }">
									</div>
									<div>
										<h4 style="height:60px;">
											<b>${p.projectName}</b>
										</h4>
									</div>
									<div class="maker">${p.projectCategory} | ${p.makerName}</div>
									<div>
										<progress value="${p.fundingTotalCost / p.projectTargetAmount * 100 }" max="100"></progress>
									</div>
									<div>
										<span><fmt:formatNumber value="${p.fundingTotalCost / p.projectTargetAmount * 100 }" pattern="0" />% &nbsp;&nbsp; <fmt:formatNumber value="${ p.fundingTotalCost}"/>원</span><span class="dday">
												<img src="${pageContext.servletContext.contextPath}/resources/images/time.png">&nbsp;${p.projectDday }일 남음</span>
									</div>
								 </div>
							 
						 </c:forEach> --%>
			<!-- 	<div  id="list" class="stList list"> -->
   				 
   				 <div id="list" class="stList">

				</div>
				<div id="busStopList" class="stList">

				</div>
				
				</div>
			</form>
		</div>
	</div>
	
	
	
	<script>
	$(document).ready(function(){
		
		// 자바스크립트에서 주소(URL)상으로 넘어오는 인자(QueryString) 값을 쉽게 파싱해서 사용할 수있는 함수
		function getUrlParams() {
		    var params = {};
		    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
		    return params;
		}
		
		pp = getUrlParams();

		var cno = pp.cno;		// 카테고리넘버
		var order = pp.order;	// 정렬값
		
		var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
/* 		var cno = $("#msgs").val();
		var order = $("#order").val();  */
		
		// console.log(cno);
		// console.log(order);
		 
		$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
		     getList(page);
		     page++;
		}); 
		 
		$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		     if($(window).scrollTop() >= $(document).height() - $(window).height()){
		          getList(page);
		           page++;   
		     } 
		});
		 
		function getList(page){
		 
		    $.ajax({
		        type : 'POST',  
		        dataType : 'json', 
		        data : {"page" : page , "cno":cno, "order":order },
		        url : 'ajax.mu',
		        success : function(returnData) {
		        	// console.log("통신성공");
		            var data = returnData.rows;
		            // console.log(data);
		            var html = "";
		            if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
		                  $("#list").html(""); 
		            }
		            if (returnData.startNum<=returnData.totCnt){
		                if(data.length>0){
		   					for(var i in data){
		   						// console.log(data[i].projectNo );
		   						var per = ((data[i].fundingTotalCost / data[i].projectTargetAmount * 100).toFixed(0));
		   						// console.log(per);
		   						var totalcost = data[i].fundingTotalCost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		   						// console.log(data[i].fundingTotalCost.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		   						/* var ccc = data[i].fundingTotalCost / data[i].projectTargetAmount * 100;
		   						console.log(ccc);
		   						var ddd = data[i].fundingTotalCost;
		   						console.log(ddd); */
		   						html +=
		   							"<div class='list'>" + 
		   							"<input type='hidden' value='" + data[i].projectNo + "'>" + 
		   							"<div><img src='${pageContext.servletContext.contextPath}/resources/images/projectimages/" + data[i].projectImg + "'></div>" +
		   							"<div><h4 style='height:60px;'><b>" + data[i].projectName + "</b></h4></div>" +
		   							"<div class='maker'>" + data[i].projectCategory + " | " + data[i].makerName + "</div>" + 
		   							"<div><progress value='" + data[i].fundingTotalCost / data[i].projectTargetAmount * 100 + "' max='100'></progress></div>" +
		   							"<div>" + 
		   							"<span>" + per + "% &nbsp;&nbsp;" + totalcost + "원</span>" + 
									"<span class='dday'>" + 
									"<img src='${pageContext.servletContext.contextPath}/resources/images/time.png'>&nbsp;" + data[i].projectDday + "일 남음</span></div>" +
									"</div>";

		   					}
		                } else {
		                //데이터가 없을경우
		                 // console.log("데이터없음");
		                 html += "검색결과가 없습니다.";
		                }
		            }
		             html = html.replace(/%20/gi, " ");
		            if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
		                $("#list").html(html); 
		            }else{ 
		                $("#busStopList").append(html);
		            }
		       },error:function(e){
		    	   // console.log("통신실패");
		            if(e.status==300){
		               alert("데이터를 가져오는데 실패하였습니다.");
		           }; 
		       }
		    }); 
		}

		
	    /* 카테고리전체 불러오기 */
      	$(function(){
    		$(".tdAll").click(function(){
    			location.href = "category.mu";
    		});
    	}); 
	    
	    
	    /* 카테고리 리스트 불러오기 */
    	$(function(){
    		$(".td").click(function(){
    			var cno = $(this).children().eq(0).val();
    			
    		 	 location.href = "category.mu?cno=" + cno; 
    		});
    	});
 
	    
        $(function(){
        	
        	
            $("#order").change(function(){
            	
    			var category = $("#msgs").val();
    			console.log(category);
                
                var order = $(this).val();
                // $(this).val().prop("selected", true); 
                
                if(category == ""){
                	location.href = "category.mu?&order=" + order;
                }else {
                	location.href = "category.mu?cno=" + category + "&order=" + order;
                	
                }
                
            });
            
        });
		 
		
	    /* 펀딩프로젝트 상세보기 페이지 이동 */
       	$(function(){
    		$(".list").click(function(){
    			var pno = $(this).children().eq(0).val();
    			location.href = "detail.pro?pno=" + pno;
    		});
    		
    	});
	    
	});
	</script>
	

</body>
</html>
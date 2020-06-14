<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지_메인</title>
<style>




.wrap {
	width: 1000px;
	height: 1000px;
	margin: auto;
	text-align: center;
	font-size: 30px;
	color: black;
}
.wrap>#header {
	width: 100%;
	height: 5%;
	margin-bottom: 60px;
}

.wrap>#content {
	width: 100%;
	height: 70%;
}

.wrap>#content>#content_1 {
	width: 100%;
	height: 25%;
	border: 0.05px solid grey;
	margin-bottom: 10px;
}

.wrap>#content>#content_2 {
	width: 100%;
	height: 75%;
	font-size: 15px;
	background-color: rgb(243, 242, 242);
}

.wrap>#content>#content_1>table {
	width: 40%;
	height: 100%;
	padding: 20px;
	font-size: 15px;
}

.wrap>#footer {
	width: 100%;
	height: 20%;
}

#myFunding{
	border: 1px solid black;
	text-align: center;
	margin: auto;
	padding: 20px;
}
#myFunding thead{ border-collapse: collapse; }
#myFunding th{
	border-bottom: 1px solid black;
	padding-bottom: 10px;
}
#myFunding td{padding: 10px;}

#wishList img {
   width: 370px;
   height: 200px;
   margin:0px;
}

</style>
<!-- wrap>#content>#content_2>.w3-row2{width:100%; height:100%; overflow: scroll;} -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<jsp:include page="../common/menubar.jsp" />
	<div class="wrap">
		<div id="header">

			



			<script>
				function expand() {
					$(".search").toggleClass("close");
					$(".input").toggleClass("square");
					if ($('.search').hasClass('close')) {
						$('input').focus();
					} else {
						$('input').blur();
					}
				}
				$('button').on('click', expand);
			</script>
		</div>

		<div id="content">
			<div id="content_1">
				<table>
					<tr>
						<td style="font-size: 40px;"><strong>김한경님</strong></td>
						<td style="font-size: 20px;">참여한펀딩</td>
						<td></td>
					</tr>
					<tr>
						<td style="font-size: 13px; color: gray;">개인회원</td>
						<td style="font-size: 25px;">1회</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<button class="w3-btn w3-white w3-border w3-round-large">프로필변경</button>
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>

			<div id="content_2">
				<div class="w3-container" >


					<div class="w3-row">
						<a href="javascript:void(0)" onclick="openCity(event, 'Invest');">
							<div
								class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">참여한펀딩</div>
						</a> <a href="javascript:void(0)" onclick="openCity(event, 'Wish');">
							<div
								class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding" id="wishBtn">찜한펀딩</div>
						</a><!--  <a href="javascript:void(0)" onclick="openCity(event, 'create');">
							<div
								class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">만든펀딩</div>
						</a> -->
					</div>

					<div id="Invest" class="w3-container city funBtn" style="display: none" >
						<h2>참여한펀딩</h2>
						
						<table id="myFunding">
							<thead>
								<tr>
									<th width="50px">번호</th>
									<th width="100px">카테고리</th>
									<th width="300px">프로젝트명</th>	
									<th width="100px">펀딩액</th>
									<th width="120px">프로젝트 마감일</th>		
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ fl }" var ="f" varStatus="status">
									<tr>
										<input type="hidden" value="${ f.projectNumber }" >	
										<td>${ status.count }</td>
										<td>${ f.categoryName }</td>
										<td>${ f.projectName }</td>	
										<td>${ f.total }</td>
										<td>${ f.projectFinishDate }</td>		
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>

					<div id="wish" class="w3-container city disWish" style="display: none">
						<h2>찜한펀딩</h2>
						
						<div id="wishList" style="display: inline-block;">
							<c:forEach items="${ myWish }" var="w">
								<div style="display: inline-block; margin-right: 20px;">
									<img src="${pageContext.servletContext.contextPath}/resources/uploadFiles/${ w.changeName }"><br>
									${ w.projectName }<br>
									${ w.projectCategoryName } | ${ w.makerName }<br>
								</div>
	                    	</c:forEach>
	                    </div>
					</div>

					<!-- <div id="create" class="w3-container city" style="display: none">
						<h2>만든펀딩</h2>
					</div> -->
				</div>

				<script>
					/* function openCity(evt, cityName) {
						
						var i, x, tablinks;
						x = document.getElementsByClassName("city");
						
						for (i = 0; i < x.length; i++) {
							x[i].style.display = "none";
						}
						
						tablinks = document.getElementsByClassName("tablink");
						for (i = 0; i < x.length; i++) {
							tablinks[i].className = tablinks[i].className
									.replace(" w3-border-cyan", "");
						}
						document.getElementById(cityName).style.display = "block";
						evt.currentTarget.firstElementChild.className += " w3-border-cyan";
					} */
				</script>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$("#myFunding tbody tr").click(function(){
			
			var pno = $(this).children().eq(0).val();
			console.log(pno);
			location.href="selectPayDetail.pro?pno=" + pno;
		});
		
		$("#wishBtn").click(function(){
			console.log("gggg");
			/* location.href="myWish.me?userNo=${loginUser.userNo}"; */
			//$(".disWish").prop("style", "display:block");
			
			$(".disWish").css("display", "block");
			 $(".funBtn").css("display", "none");
			 
			 /* 에지작스 시작 */
			 /*  */
			 /*  */
			 
			 $.ajax({
	    			url:"myWish.me",
	    			data:{userNo:"${loginUser.userNo}"},
	    			success:function(list){
	    				
	    				var value="";
	    				for(var i in list){
	    					value += '<div style="display: inline-block; margin-right: 20px;">'+
	    							  '<img src="${pageContext.servletContext.contextPath}/resources/uploadFiles/${ list[i].changeName }"><br>' +
				                       list[i].projectName + "<br>" +
				                       list[i].projectCategoryName + " | " + list[i].makerName + "<br>" +
				                     "</div>";
	    				}
	    				
	    				$("#wishList").html(value);
	    				
	    			},error:function(){
	    				console.log("댓글 리스트 조회용 ajax 통신실패!!");	
	    			}
	    		});
		});
		
		$(".disWish").click(function(){
			console.log("ddd");
			$(".disWish").css("display", "block");
			$(".funBtn").css("display", "none");
		});
		
		$("#Invest").click(function(){
			$(".disWish").css("display", "none");
			$(".funBtn").css("display", "block");
		});
		 
	</script>
</body>
</html>
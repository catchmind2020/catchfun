<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지_메인</title>
<link
	href="<%=request.getContextPath()%>/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link
	href="<%=request.getContextPath()%>/resources/admin/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Custom styles for this page -->
<link
	href="<%=request.getContextPath()%>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<style>
#content1, #content2, #content3 {
	width: 550px;
	height: auto;
}

.scrollDown {
	position: fixed;
	top: 0px;
	/* transform: translateY(0px); */
}

/* 리워드 리스트 */
.rewardArea {
	padding-left: 10px;
	width: 200px;
	text-align: left;
	/* margin: 50px; */
	/* padding-top: 5px; */
	vertical-align: top;
}
/* 리워드 박스 */
#rewardTable div {
	border: 1px solid darkgray;
	width: 200px;
	height: 130px;
	margin-bottom: 10px;
	padding: 20px;
	color: gray;
	font-size: 12px;
}

#rewardTable div:hover {
	border: 1px solid darkgray;
	width: 200px;
	height: 130px;
	margin-bottom: 10px;
	padding: 20px;
	color: gray;
	font-size: 12px;
	font-color: darkgray;
	background: rgb(31, 205, 211, 0.2);
}

/* #info_text{
        width: 540px;
        height: 500px;
        border: 1px solid white;
        resize: none;
        
    } */
.reward_money {
	font-size: 18px;
	color: black;
}

.reward_name {
	font-size: 15px;
}

.reward_sum {
	border: 1px solid rgb(31, 205, 211);
	background-color: rgb(31, 205, 211);
	width: 50px;
	height: 25px;
	padding: 2px;
	text-align: center;
	border-radius: 3px;
	color: white;
	font-size: 12px;
}

text {
	width: 600px;
}

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
</style>
<!-- wrap>#content>#content_2>.w3-row2{width:100%; height:100%; overflow: scroll;} -->
</head>
<body>
	<jsp:include page="../../common/menubar.jsp" />
	<div class="wrap">
		<div id="header">
			<br> <br>
			<h1 style="font-size: 25px;">
				<strong>프로젝트 리스트</strong>
			</h1>

			<br>

			<c:choose>
				<c:when test="${ empty projectList }">
					<h1 style="font-size: 28px;">
						<strong>프로젝트 리스트가 존재하지 않습니다.</strong>
					</h1>
				</c:when>
				<c:otherwise>

					<div class="row" style="width: 100%;">
						<c:forEach items="${ projectList }" var="p">
							<div class="card mb-5"
								style="width: 320px; margin-left: 1%; text-align: left; border: 2px solid darkgray;">
								<div class=" card-header bg-success-600 py-3">
									<h6 class="m-0 font-weight-bold">${ p.projectName }</h6>
								</div>
								<div class="card-body ">
									<h6 class="black">
										<br> 등록일 : ${ p.projectDate }
									</h6>

									<form action="<%=contextPath%>/ptest.pa" method="post">


										<input type="hidden" name="projectName"
											value="${ p.projectName }"> <input type="hidden"
											name="projectNo" value="${ p.projectNo }">


										<c:choose>


											<c:when test="${ p.projectStatus eq 'S' }">					
												<h6>진행상황: <div class="badge badge-warning badge-warning">작성중</div></h6>
											
											</c:when>
											<c:when test="${ p.projectStatus eq 'E' }">
											
												<h6>진행상황: <div class="badge badge-info badge-info">제출완료</div> </h6>
											</c:when>
											<c:when test="${ p.projectStatus eq 'Y' }">
												<h6>진행상황: <div class="badge badge-success badge-success">진행중</div></h6>
											</c:when>
											<c:otherwise>
												<h6>진행상황: <div class="badge badge-success badge-danger">반려</div></h6>
											</c:otherwise>
										</c:choose>
										<div class="row">




										<c:choose>


											<c:when test="${ p.projectStatus eq 'N' }">		
											<div class="col-auto text-right" id="addReply">
												<button type="submit" class="btn btn-success " disabled>프로젝트
													바로가기</button>
											</div>
											</c:when>
												<c:otherwise>
												<div class="col-auto text-right" id="addReply">
												<button type="submit" class="btn btn-success ">프로젝트
													바로가기</button>
											</div>
											</c:otherwise>
											</c:choose>
										</div>
									</form>
								</div>

							</div>

							<br>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>






			<a href="<%=contextPath%>/projectEnroll.pa">
				<button type="button" class="btn btn-primary">등록하기</button>
			</a>

		</div>






		<br>
	</div>

	<br>
	<br>
	<jsp:include page="../../common/footer.jsp" />

	<script>
$(function(){
   		/* 	selectReplyList(); */
   			
   			$("#addReply").click(function(){
   				
   				$.ajax({
   					url:"rinsert.bo",
   					data:{replyContent:$("#content").val(),
   						  refBoardNo:${b.boardNo},
   						  replyWriter:"${loginUser.userId}"},
   					type:"post",
   					success:function(status){
   						
   						if(status == "success"){
   							
   							$("#content").val("");
   							
   							selectReplyList();
   							
   						}else{
   							alert("댓글등록실패!");
   						}
   						
   					},error:function(){
   						console.log("댓글 작성용   통신 실패!");
   					}
   				});
   				
   			});
   			
   		});
</script>
</body>
</html>
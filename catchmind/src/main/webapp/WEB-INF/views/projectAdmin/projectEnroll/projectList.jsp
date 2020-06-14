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
/* 메뉴바 영역 */
.header-area {
	width: 1200px;
	margin-left: 40px;
	color: gray;
	padding-top: 10px;
	margin-top: 20px;
	margin-bottom: 10px;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto;
}

/* 메뉴 */
.header {
	display: table-cell; /* width:200px; */
	padding-right: 40px;
	height: 35px;
	text-align: center;
	vertical-align: bottom;
	font-size: 25px;
	font-weight: 900;
	color: black;
}

/* 검색바 */
#header_searchbar {
	margin-left: 1400px;
	margin-top: 10px;
	position: absolute;
	height: 50px;
	width: 5px;
	transform: translate(-50%, -50%);
	position: absolute;
}

#header_searchbar.on {
	-webkit-animation-name: in-out;
	animation-name: in-out;
	-webkit-animation-duration: 0.7s;
	animation-duration: 0.7s;
	-webkit-animation-timing-function: linear;
	animation-timing-function: linear;
	-webkit-animation-iteration-count: 1;
	animation-iteration-count: 1;
	float: right;
}

/*돋보기 */
input {
	box-sizing: border-box;
	width: 30px; /*돋보기동글이 크기*/
	height: 30px; /*돋보기동글이 크기*/
	border: 4px solid #28d7d7;
	border-radius: 50%;
	background: none;
	color: #fff;
	font-size: 16px;
	font-weight: 400;
	font-family: Roboto;
	outline: 0;
	-webkit-transition: width 0.4s ease-in-out, border-radius 0.8s
		ease-in-out, padding 0.2s;
	transition: width 0.4s ease-in-out, border-radius 0.8s ease-in-out,
		padding 0.2s;
	-webkit-transition-delay: 0.4s;
	transition-delay: 0.4s;
	-webkit-transform: translate(-100%, -50%);
	-ms-transform: translate(-100%, -50%);
	transform: translate(-100%, -50%);
}

.search {
	background: none;
	position: absolute;
	top: 0; /* !!!!!!!!!!!!!!!!*/
	left: 0; /* !!!!!!!!!!!!!!!!*/
	height: 30px; /* 돋보기바 위치설정*/
	width: 30px; /* 돋보기바 위치설정*/
	padding: 0;
	border-radius: 100%;
	outline: 0;
	border: 0;
	color: inherit;
	cursor: pointer;
	-webkit-transition: 0.2s ease-in-out;
	transition: 0.2s ease-in-out;
	-webkit-transform: translate(-100%, -50%);
	-ms-transform: translate(-100%, -50%);
	transform: translate(-100%, -50%);
}

.search:before {
	content: "";
	position: absolute;
	width: 10px; /* 돋보기바 크기설정(얇고굵은)*/
	height: 4px; /* 돋보기바 크기설정(얇고굵은)*/
	background-color: #28d7d7;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	margin-top: 12px; /* 돋보기바 위치설정*/
	margin-left: 8px; /* 돋보기바 위치설정*/
	-webkit-transition: 0.2s ease-in-out;
	transition: 0.2s ease-in-out;
	float: right;
}

.close {
	-webkit-transition: 0.4s ease-in-out;
	transition: 0.4s ease-in-out;
	-webkit-transition-delay: 0.4s;
	transition-delay: 0.4s;
}

.close:before { /*   \   */
	content: "";
	position: absolute;
	width: 20px; /**/
	height: 4px;
	margin-top: -1px;
	margin-left: -13px;
	background-color: black;
	-webkit-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	transform: rotate(45deg);
	-webkit-transition: 0.2s ease-in-out;
	transition: 0.2s ease-in-out;
	float: right;
}

.close:after { /*   /   */
	content: "";
	position: absolute;
	width: 20px; /**/
	height: 4px;
	background-color: black;
	margin-top: -1px;
	margin-left: -13px;
	cursor: pointer;
	-webkit-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	transform: rotate(-45deg);
	float: right;
}

.square {
	box-sizing: border-box;
	padding: 0 40px 0 10px;
	width: 200px;
	height: 30px; /*크기 */
	border: 3px solid #28d7d7;
	border-radius: 0;
	background: none;
	color: black;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 400;
	outline: 0;
	-webkit-transition: width 0.4s ease-in-out, border-radius 0.4s
		ease-in-out, padding 0.2s;
	transition: width 0.4s ease-in-out, border-radius 0.4s ease-in-out,
		padding 0.2s;
	-webkit-transition-delay: 0.4s, 0s, 0.4s;
	transition-delay: 0.4s, 0s, 0.4s;
	-webkit-transform: translate(-100%, -50%);
	-ms-transform: translate(-100%, -50%);
	transform: translate(-100%, -50%);
}

/* 로그인 부분*/
.login {
	position: relative;
	bottom: -6px;
	display: table-cell;
	font-size: 15px;
	color: gray;
	padding-left: 220px;
	padding-right: 0px;
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

			<h1 style="font-size: 40px;">
				<strong>프로젝트 리스트</strong>
			</h1>



			<c:choose>
				<c:when test="${ empty projectList }">
					<h1 style="font-size: 28px;">
						<strong>프로젝트 리스트가 존재하지 않습니다.</strong>
					</h1>
				</c:when>
				<c:otherwise>

					<div class="row" style="width: 100%;">
						<c:forEach items="${ projectList }" var="p">
							<div class="card mb-5" style="width: 320px; margin-left: 1%;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">${ p.projectName }</h6>
								</div>
								<div class="card-body py-1">
									<h6 class="black">
										<br> 등록일 : ${ p.projectDate }
									</h6>

									<form action="<%=contextPath%>/ptest.pa" method="post">
										<input type="hidden" name="projectNo" value="${ p.projectNo }">
										<div class="col-auto text-right" id="addReply">
											<button type="submit" class="btn btn-success ">작성</button>
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
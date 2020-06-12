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
<br>
			<h1 style="font-size: 20px;">
				<strong>프로젝트 리스트</strong>
			</h1>
			
			
<br>
				<c:choose>
					<c:when test="${ empty projectList }">
						<h1 style="font-size: 28px; ">
							<strong>프로젝트 리스트가 존재하지 않습니다.</strong>
						</h1>
					</c:when>
					<c:otherwise>
					
					<div class="row" style="width: 100%; ">
						<c:forEach items="${ projectList }" var="p">
							<div class="card mb-5" style="width: 320px; margin-left: 1%;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">${ p.projectName }</h6>
								</div>
								<div class="card-body py-1">
									<h6 class="black">
										<br> 등록일 : ${ p.projectDate }
									</h6>
								</div>
								<form action="<%=contextPath%>/ptest.pa" method="post">
									<input type="hidden" name="projectNo" value="${ p.projectNo }">
									<div class="col-auto text-right">
										<button type="submit" class="btn btn-success ">작성</button>
									</div>
								</form>
								</div>
							</div>
							<br>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			

			<a href="<%=contextPath%>/projectEnroll.pa">
				<button type="button" class="btn btn-primary">등록하기</button>
			</a> <br>
		</div>
	</div>
	<br>
	<br>
	<jsp:include page="../../common/footer.jsp" />


</body>
</html>
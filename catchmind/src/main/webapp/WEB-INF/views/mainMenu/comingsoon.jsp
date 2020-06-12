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
.profile:hover { border: 1px solid white; }

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

.list img { width: 370px; height: 200px; margin:0px; }
.list h4 { margin: 0px; }
.dday { float: right; }
.maker {
	color: darkgray;
	font-weight: 800;
	font-size: 13px;
}

.content {
	width: 1200px;
	height:auto;
	font-size: 15px;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto;
	
}

.list:nth-child(3n), .list:nth-child(3n+2){ margin-right: 45px; margin-left:0px; }
.list:nth-child(3n+1) { margin-right: 0px; margin-left:0px; }
td { padding: 0px;}
tr { box-sizing: border-box; }

.categoryList {
	border-collapse: collapse;
	box-sizing: border-box; 
}

.dropdown{ float:right; }
.dropdown-item{ width:50px; }
.dropbax{ font-size:17px; border:0px; float:right; }
.openDate{color:#28d7d7; font-size:20px; font-weight:900;}
</style>
<body>
<jsp:include page="../common/menubar.jsp" />
	<br>
	<br><br><br>
	<div>

		<div style="height: 20px;"></div>
		<div class="content">
			<!--  -->
			<div><h2><b>오픈예정 둘러보기</b></h2></div>
			<hr style="border: solid 1px #2ed5d5;">
			<!-- list -->
			<form>
				<div class="categoryList">
				<br>
					<c:choose>
						<c:when test="${ empty list}">
							<br><br><h4 align='center'>
							오픈예정인 프로젝트가 없습니다. <br></h4>
						</c:when>
						 <c:otherwise>
							<c:forEach items="${ list }" var="p">
								<div class="list">
								<input type="hidden" value="${p.projectNo}">
									<div>
										<img src="${pageContext.servletContext.contextPath}/resources/images/uploadFiles/${p.projectImg }">
									</div>
									<div>
										<h4 style="height:60px;">
												<b>${p.projectName}</b>
											</h4>
									</div>
									<div class="maker">${p.projectCategory} | ${p.makerName}</div>
									<div class="openDate">${p.comingsoonDate}일 오픈예정</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</form>

		</div>

	</div>
	<br>

</body>
</html>
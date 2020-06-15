<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%--회원전체조회 화면 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.area {
	width: 300px;
	height: 100px;
	font-size: 50px;
	color: black;
	background-color: white;
	border: 1px solid black;
	position: absolute;
}

.question {
	font-size: 30px;
	color: blue;
}

.questiontext {
	width: 700px;
	height: 100px;
}

.grey {
	font-size: 15px;
	color: grey;
}

.answer {
	font-size: 22px;
	color: green;
}

.outer {
	min-width: 800px;
}

.blacktool {
	/* vertical-align: middle; */
	width: 700px;
	height: 120px;
	background-color: white;
	border: 1px solid black;
	font-size: 15px;
	color: black;
}

.black {
	color: black;
	font-size: 15px;
}

.cardsize {
	width: 700px;
	height: 100px;
}
</style>

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

</head>

<body>


	<div style="position: fixed";>
		<%@ include file="../common/menubarIm.jsp"%>
	</div>

	<div class="outer">
		<form style="margin-left: 270px;" action="basicinsert.pa"
			method="post">
			<div style="height: 700px;">
				<br>
				<h1 class="h3 text-gray-900 mb-4">펀딩 준비</h1>
				<h1 style="color: black; font-size: 15px;">본격적으로 펀딩을 오픈하기 위해
					프로젝트에 대한 6가지 메뉴의 필수항목을 작성하세요.</h1>



				<div class="cardsize card mb-4 py-3 border-left-primary">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">

								<div class="h5 mb-0 font-weight-bold text-gray-800">기본요건</div>
							</div>




							<c:choose>
								<c:when test="${ project.projectStatus eq 'E' }">
								제출완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">
										
											<button type="button" class="btn btn-info">제출완료</button>
										
									</div>
								</c:when>
								<c:when test="${ !empty projectBasic }">
								작성완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">
										<a href="<%=contextPath%>/basicSelect.pa">
											<button type="button" class="btn btn-warning">확인하기</button>
										</a>
									</div>

									<c:set var="condition1" value="1" />
								</c:when>
								<c:otherwise>
									작성전&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/basicSelect.pa">
											<button type="button" class="btn btn-primary">작성하기</button>
										</a>
									</div>

								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<br>
				<div class="cardsize card mb-4 py-3 border-left-primary">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">

								<div class="h5 mb-0 font-weight-bold text-gray-800">기본정보/스토리</div>
							</div>

							<c:choose>
							<c:when test="${ project.projectStatus eq 'E' }">
								제출완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">
										
											<button type="button" class="btn btn-info">제출완료</button>
										
									</div>
								</c:when>
								<c:when test="${ !empty project.projectContent }">
								작성완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/selectProject.pa">
											<button type="button" class="btn btn-warning">확인하기</button>
										</a>
									</div>
									<c:set var="condition2" value="1" />
								</c:when>
								<c:otherwise>
								작성전&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/selectProject.pa">
											<button type="button" class="btn btn-primary">작성하기</button>
										</a>
									</div>

								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
				<br>
				<div class="cardsize card mb-4 py-3 border-left-primary">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="h5 mb-0 font-weight-bold text-gray-800">아이템설계</div>
							</div>

							<c:choose>
							<c:when test="${ project.projectStatus eq 'E' }">
								제출완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">
										
											<button type="button" class="btn btn-info">제출완료</button>
										
									</div>
								</c:when>
								<c:when test="${ !empty ilist }">
								작성완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/itemList.pa">
											<button type="button" class="btn btn-warning">확인하기</button>
										</a>
									</div>

									<c:set var="condition3" value="1" />
								</c:when>
								<c:otherwise>
								작성전&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/itemList.pa">
											<button type="button" class="btn btn-primary">작성하기</button>
										</a>
									</div>

								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
				<br>

				<div class="cardsize card mb-4 py-3 border-left-primary">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="h5 mb-0 font-weight-bold text-gray-800">리워드설계</div>
							</div>

							<c:choose>
							<c:when test="${ project.projectStatus eq 'E' }">
								제출완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">
										
											<button type="button" class="btn btn-info">제출완료</button>
										
									</div>
								</c:when>
								<c:when test="${ !empty rlist }">
								작성완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/rewardList.pa">
											<button type="button" class="btn btn-warning">확인하기</button>
										</a>
									</div>

									<c:set var="condition4" value="1" />
								</c:when>
								<c:otherwise>
								작성전&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/rewardList.pa">
											<button type="button" class="btn btn-primary">작성하기</button>
										</a>
									</div>

								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
				<br>
				<div class="cardsize card mb-4 py-3 border-left-primary">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">

								<div class="h5 mb-0 font-weight-bold text-gray-800">메이커정보</div>
							</div>
							<c:choose>
							<c:when test="${ project.projectStatus eq 'E' }">
								제출완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">
										
											<button type="button" class="btn btn-info">제출완료</button>
										
									</div>
								</c:when>
								<c:when test="${ !empty projectMaker }">
								작성완료&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/selectMaker.pa">
											<button type="button" class="btn btn-warning">확인하기</button>
										</a>
									</div>

									<c:set var="condition5" value="1" />
								</c:when>
								<c:otherwise>
								작성전&nbsp;&nbsp;&nbsp;
									<div class="col-auto">

										<a href="<%=contextPath%>/selectMaker.pa">
											<button type="button" class="btn btn-primary">작성하기</button>
										</a>
									</div>

								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
				<br>

				<c:choose>



					<c:when test="${ project.projectStatus eq 'E' }">
						
						<div class="col-auto">

							<a href="<%=contextPath%>/enrollProject.pa">
								<button type="button"  style="width: 200px;" class="btn btn-primary">제출완료</button>
							</a> 
								<a href="<%=contextPath%>">
								<button type="button" style="width: 200px;" class="btn btn-primary">메인페이지</button>
							</a>
							<a href="<%=contextPath%>/enrollProject.pa">
								<button type="button" style="width: 200px;" class="btn btn-primary">수정요청</button>
							</a>
							
							
						</div>
					</c:when>

					<c:when
						test="${ !empty condition1 and !empty condition2
					and !empty condition3 and !empty condition4
					and !empty condition5  }">

						<div class="col-auto">

							<a href="<%=contextPath%>/enrollProject.pa">
								<button type="button" style="width: 200px;" class="btn btn-primary">제출하기</button>
							</a> 
						</div>
							<a href="<%=contextPath%>">
								<button type="button" style="width: 200px;" class="btn btn-primary">메인페이지</button>
							</a>
						
					</c:when>

					<c:otherwise>

						<div class="col-auto row">

							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;" disabled>제출하기</button>
							</div>
								<a href="<%=contextPath%>">
								<button type="button" style="width: 200px;" class="btn btn-primary">메인페이지</button>
							</a>

						
						</div>

					</c:otherwise>
				</c:choose>





			</div>

		</form>
	</div>
	<script>
		
	</script>

</body>
</html>
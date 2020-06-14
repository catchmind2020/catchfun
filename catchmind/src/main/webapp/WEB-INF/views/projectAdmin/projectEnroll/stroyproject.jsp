<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
%>

<%--회원전체조회 화면 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


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

.questioninput {
	width: 700px;
	height: 35px;
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

.black {
	color: black;
	font-size: 15px;
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
</style>

<!--써머노트  -->





<!-- include summernote css/js-->
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.js"></script>





</head>

<body>


	<div style="position: fixed";>
		<%@ include file="../common/menubarIm.jsp"%>
	</div>

	<c:choose>
		<c:when test="${ empty project.projectStatus }">
			<div class="outer">
				<div style="height: 700px; margin-left: 270px;">
					<form action="updateProject.pa" method="post"
						enctype="multipart/form-data">
						<br>
						<h1 class="h3 text-gray-900 mb-4">기본 정보</h1>
						<div class="card shadow mb-4" style="width: 1000px;">
							<div class="card-header py-3">

								<h6 class="m-0 font-weight-bold text-primary">프로젝트를 대표할 주요
									기본 정보를 입력하세요.</h6>
							</div>

							<div class="card-body">

								<h6 class="m-0 font-weight-bold text-primary">프로젝트제목</h6>
								<input id="question3" name="projectName" class="questioninput"
									value="${  projectUser.projectName }"  disabled></input> <br> <br>

								<h6 class="m-0 font-weight-bold text-primary">목표금액</h6>
								<input id="question4" name="projectTargetAmount"
									class="questioninput" value="${project.projectTargetAmount}"
									required></input> <br> <br>

								<h6 class="m-0 font-weight-bold text-primary">카테고리</h6>

								<select id="question5" name="projectCategory"
									class="questioninput" required>

									
									<c:forEach items="${ categoryList }" var="c">
										<option value="${ c.categoryNo}">${ c.categoryName}</option>


									</c:forEach>

								</select> <br> <br>

								<h6 class="m-0 font-weight-bold text-primary">대표이미지</h6>
								<label for="upfile">첨부파일</label> <input type="file" id="upfile"
									class="form-control-file border" name="uploadFile" required>
								<c:choose>
									<c:when test="${ !empty project.originName }">
	                        	업로드된파일:<a
											href="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${project.changeName}"
											download="${ project.originName }">${ project.originName }</a>
									</c:when>
									<c:otherwise>
	                                                        첨부파일이 없습니다.
                        	</c:otherwise>
								</c:choose>
								<h1 class="grey">
									3MB 이하의 JPEG, PNG 파일<br> 사이즈 : 1200X675 픽셀 이상<br> 텍스트
									및 로고 삽입 금지
								</h1>
								<br>


								<%-- <c:choose>
							<c:when test="${ empty project.projectStatus }">
 --%>
								<h6 class="m-0 font-weight-bold text-primary" required>프로젝트
									시작일</h6>
								<input type="date" id="startDate" name="projectStartDate">
								<h1 class="grey">리워드를 설계하기 위해 프로젝트 시작일을 선택하세요.</h1>
								${project.projectStartDate} <br>


								<h6 class="m-0 font-weight-bold text-primary">프로젝트 종료일</h6>
								<input type="date" id="finishDate" name="projectFinishDate"
									required>
								<h1 class="grey">리워드를 설계하기 위해 프로젝트 종료일을 선택하세요.</h1>
								${project.projectFinishDate}
								<%-- 	</c:when>
							<c:otherwise>
								<h6 class="m-0 font-weight-bold text-primary">프로젝트 시작일</h6>
								
								<br>
								<br>
								<h6 class="m-0 font-weight-bold text-primary">프로젝트 종료일</h6>
							
							</c:otherwise>
						</c:choose> --%>


								<h6 class="m-0 font-weight-bold text-primary">검색용태그</h6>
								<input id="tag" name="hhsh" class="questioninput"
									value="${project.hhsh}" required placeholder="ex: 오징어,나무,바람"></input>
								<br> <br>

								<!-- <div class="btn btn-info btn-icon-split">
							<span class="text">사망 X</span>
						</div>
						<div class="btn btn-info btn-icon-split">
							<span class="text">사아망 X</span>
						</div> -->
							</div>
						</div>


						<br> <br>

						<div class="card shadow mb-4" style="width: 1000px;">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">스토리 작성</h6>
							</div>
							<div class="card-body">

								<textarea id="summernote" name="projectContent" required>${project.projectContent}</textarea>
							</div>
						</div>

						<br>


						<%-- <c:choose>
					<c:when test="${ !empty project.projectStatus }">

						<div class="col-auto">

							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;">수정하기</button>
							</div>
						</div>
					</c:when>
					<c:otherwise> --%>

						<div class="col-auto">

							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;">저장하기</button>
							</div>
						</div>
						<%-- 
					</c:otherwise>
				</c:choose>
 --%>
					</form>

				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="outer">
				<div style="height: 700px; margin-left: 270px;">
					<form action="updateProject2.pa" method="post"
						enctype="multipart/form-data">
						<br>
						<h1 class="h3 text-gray-900 mb-4">기본 정보</h1>
						<div class="card shadow mb-4" style="width: 1000px;">
							<div class="card-header py-3">

								<h6 class="m-0 font-weight-bold text-primary">프로젝트를 대표할 주요
									기본 정보를 입력하세요.</h6>
							</div>

							<div class="card-body">

								<h6 class="m-0 font-weight-bold text-primary">프로젝트제목</h6>
								<input id="question3" name="projectName" class="questioninput"
									value="${  projectUser.projectName }"  disabled></input> <br> <br>

								<h6 class="m-0 font-weight-bold text-primary">목표금액</h6>
								<input id="question4" name="projectTargetAmount"
									class="questioninput" value="${project.projectTargetAmount}"
									required></input> <br> <br>

								<h6 class="m-0 font-weight-bold text-primary">카테고리</h6>
								<%-- 	<c:choose>
							<c:when test="${ empty project.projectStatus }"> --%>
							<select id="question5" name="projectCategory"
									class="questioninput" required>

									
									<c:forEach items="${ categoryList }" var="c">
										<option value="${ c.categoryNo}">${ c.categoryName}</option>


									</c:forEach>

								</select> <br> <br>

								<h6 class="m-0 font-weight-bold text-primary">대표이미지</h6>
								<label for="upfile">첨부파일</label> <input type="file" id="upfile"
									class="form-control-file border" name="uploadFile" required>
								<c:choose>
									<c:when test="${ !empty project.originName }">
	                        	업로드된파일:<a
											href="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${project.changeName}"
											download="${ project.originName }">${ project.originName }</a>
									</c:when>
									<c:otherwise>
	                                                        첨부파일이 없습니다.
                        	</c:otherwise>
								</c:choose>
								<h1 class="grey">
									3MB 이하의 JPEG, PNG 파일<br> 사이즈 : 1200X675 픽셀 이상<br> 텍스트
									및 로고 삽입 금지
								</h1>
								<br>


								<%-- <c:choose>
							<c:when test="${ empty project.projectStatus }">
 --%>
								<h6 class="m-0 font-weight-bold text-primary" required>프로젝트
									시작일</h6>
								<input type="date" id="startDate" name="projectStartDate">
								<h1 class="grey">리워드를 설계하기 위해 프로젝트 시작일을 선택하세요.</h1>
								${project.projectStartDate} <br>


								<h6 class="m-0 font-weight-bold text-primary">프로젝트 종료일</h6>
								<input type="date" id="finishDate" name="projectFinishDate"
									required>
								<h1 class="grey">리워드를 설계하기 위해 프로젝트 종료일을 선택하세요.</h1>
								${project.projectFinishDate}
								<%-- 	</c:when>
							<c:otherwise>
								<h6 class="m-0 font-weight-bold text-primary">프로젝트 시작일</h6>
								
								<br>
								<br>
								<h6 class="m-0 font-weight-bold text-primary">프로젝트 종료일</h6>
							
							</c:otherwise>
						</c:choose> --%>


								<h6 class="m-0 font-weight-bold text-primary">검색용태그</h6>
								<input id="tag" name="hhsh" class="questioninput"
									value="${project.hhsh}" required placeholder="ex: 오징어,나무,바람"></input>
								<br> <br>

								<!-- <div class="btn btn-info btn-icon-split">
							<span class="text">사망 X</span>
						</div>
						<div class="btn btn-info btn-icon-split">
							<span class="text">사아망 X</span>
						</div> -->
							</div>
						</div>


						<br> <br>

						<div class="card shadow mb-4" style="width: 1000px;">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">스토리 작성</h6>
							</div>
							<div class="card-body">

								<textarea id="summernote" name="projectContent" required>${project.projectContent}</textarea>
							</div>
						</div>

						<br>



						<div class="col-auto">

							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;">수정하기</button>
							</div>
						</div>


					</form>

				</div>
			</div>
		</c:otherwise>

	</c:choose>


	<script>
		$('#summernote').summernote({
			placeholder : '스토리 작성하세요!',
			tabsize : 2,
			height : 500
		});
	</script>


	<script>
		$(function() {
			$("#datepicker").datepicker({
				minDate : 0
			});
			$.datepicker
					.setDefaults({
						dateFormat : 'yy-mm-dd' //Input Display Format 변경
						,
						changeYear : true //콤보박스에서 년 선택 가능
						,
						changeMonth : true //콤보박스에서 월 선택 가능  
						,
						showOn : "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
						,
						buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
						,
						buttonImageOnly : true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
						,
						buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
						,
						yearSuffix : "년" //달력의 년도 부분 뒤에 붙는 텍스트
						,
						monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7',
								'8', '9', '10', '11', '12' ] //달력의 월 부분 텍스트
						,
						monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월',
								'7월', '8월', '9월', '10월', '11월', '12월' ] //달력의 월 부분 Tooltip 텍스트
						,
						dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ] //달력의 요일 부분 텍스트
						,
						dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
								'토요일' ] //달력의 요일 부분 Tooltip 텍스트
						,
						minDate : "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						,
						maxDate : "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)     
					});

		});

		/*썸노  */
	</script>
	<!-- Bootstrap core JavaScript-->

</body>
</html>
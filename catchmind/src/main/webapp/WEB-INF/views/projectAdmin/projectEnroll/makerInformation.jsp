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


</head>

<body>
	<div style="position: fixed">
		<%@ include file="../common/menubarIm.jsp"%>
	</div>


<c:choose>
		<c:when test="${ empty projectMaker }">
	<div class="outer">

		<div style="height: 700px; margin-left: 270px;">
			<br>

			<form action="insertMaker.pa" method="post"
				enctype="multipart/form-data">
				<h1 class="h3 text-gray-900 mb-4">메이커 정보</h1>
				<h1 class="h4 text-gray-900 mb-4">메이커 기본 정보</h1>

				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">

						<h6 class="m-0 font-weight-bold text-primary">프로젝트 상세 페이지에
							노출되는 정보이니, 서포터와 소통이 가능한 정확한 정보를 입력해주세요.</h6>
					</div>

					<div class="card-body">

						<h6 class="m-0 font-weight-bold text-primary">메이커명</h6>
						<h1 class="grey">법인사업자는 법인등기부상 법인명 / 개인 사업자는 주민등록상 성명 또는 상호 /
							개인은 주민등록상 성명을 입력하세요.</h1>
						<input id="question6" name="makerName" class="questioninput"
							value="${projectMaker.makerName}" required></input> <br> <br>



						<h6 class="m-0 font-weight-bold text-primary">메이커 프로필 이미지</h6>

						<label for="upfile"></label> <input type="file" id="upfile"
							class="form-control-file border" name="uploadFile">


						<c:choose>
							<c:when test="${ !empty projectMaker.originName }">
	                        	업로드된파일:<a
									href="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${projectMaker.changeName}"
									download="${ projectMaker.originName }">${ projectMaker.originName }</a>
							</c:when>
							<c:otherwise>
	                                                        첨부파일이 없습니다.
                        	</c:otherwise>
						</c:choose>
						<h1 class="grey">
							3MB 이하의 JPEG, PNG 파일<br> 사이즈 : 300x300 픽셀 이상
						</h1>
						<br>

						<h6 class="m-0 font-weight-bold text-primary">문의 이메일</h6>
						<input id="question7" name="makerEmail" class="questioninput"
							value="${projectMaker.makerEmail}" required></input> <br> <br>

						<h6 class="m-0 font-weight-bold text-primary">문의 전화번호</h6>
						<input id="question8" name="makerPhone" class="questioninput"
							value="${projectMaker.makerPhone}" required></input> <br> <br>

						<h6 class="m-0 font-weight-bold text-primary">홈페이지</h6>
						<input id="question9" name="makerHomepage" class="questioninput"
							value="${projectMaker.makerHomepage}" required></input> <br>
						<br>


					</div>



				</div>


				<br> <br>
				<h1 class="h4 text-gray-900 mb-4">대표자 정보</h1>
				<div class="card shadow mb-4" style="width: 1000px;">

					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">프로젝트 상세 페이지에
							노출되는 정보이니, 서포터와 소통이 가능한 정확한 정보를 입력해주세요.</h6>
					</div>
					<div class="card-body">

						<!-- <h6 class="m-0 font-weight-bold text-primary">통장 사본</h6>
					<h1 class="grey">
						펀딩 성공 시 펀딩 금액을 수령할 법인 명의의 계좌 사본을 첨부하세요.<br> jpg, jpeg, png,
						pdf / 10MB 이하 파일 1개만 업로드 가능합니다.
					</h1>
					<input id="question10" name="question10" class="questioninput"
						required></input>
					<button>등록하기</button>
					<h1 class="grey">
						3MB 이하의 JPEG, PNG 파일<br> 사이즈 : 300x300 픽셀 이상
					</h1>
					<br> -->

						<h6 class="m-0 font-weight-bold text-primary">대표자명</h6>
						<input name="rName" class="questioninput"
							value="${projectMaker.RName}" required></input> <br> <br>
						<h6 class="m-0 font-weight-bold text-primary">대표자 이메일</h6>
						<input name="rEmail" class="questioninput"
							value="${projectMaker.REmail}" required></input> <br>
					</div>
				</div>
				<br>


				<%-- <c:choose>
					<c:when test="${ !empty projectMaker }">
						<div class="col-auto">
							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;">수정하기</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>

						<div class="col-auto">
							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;">저장하기</button>
							</div>
						</div>

					</c:otherwise>
				</c:choose> --%>
				
						<div class="col-auto">
							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;">저장하기</button>
							</div>
						</div>

			</form>
		</div>


	</div>
</c:when>
<c:otherwise>
<div class="outer">

		<div style="height: 700px; margin-left: 270px;">
			<br>

			<form action="updateMaker2.pa" method="post"
				enctype="multipart/form-data">
				<h1 class="h3 text-gray-900 mb-4">메이커 정보</h1>
				<h1 class="h4 text-gray-900 mb-4">메이커 기본 정보</h1>

				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">

						<h6 class="m-0 font-weight-bold text-primary">프로젝트 상세 페이지에
							노출되는 정보이니, 서포터와 소통이 가능한 정확한 정보를 입력해주세요.</h6>
					</div>

					<div class="card-body">

						<h6 class="m-0 font-weight-bold text-primary">메이커명</h6>
						<h1 class="grey">법인사업자는 법인등기부상 법인명 / 개인 사업자는 주민등록상 성명 또는 상호 /
							개인은 주민등록상 성명을 입력하세요.</h1>
						<input id="question6" name="makerName" class="questioninput"
							value="${projectMaker.makerName}" required></input> <br> <br>



						<h6 class="m-0 font-weight-bold text-primary">메이커 프로필 이미지</h6>

						<label for="upfile"></label> <input type="file" id="upfile"
							class="form-control-file border" name="uploadFile">


						<c:choose>
							<c:when test="${ !empty projectMaker.originName }">
	                        	업로드된파일:<a
									href="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${projectMaker.changeName}"
									download="${ projectMaker.originName }">${ projectMaker.originName }</a>
							</c:when>
							<c:otherwise>
	                                                        첨부파일이 없습니다.
                        	</c:otherwise>
						</c:choose>
						<h1 class="grey">
							3MB 이하의 JPEG, PNG 파일<br> 사이즈 : 300x300 픽셀 이상
						</h1>
						<br>

						<h6 class="m-0 font-weight-bold text-primary">문의 이메일</h6>
						<input id="question7" name="makerEmail" class="questioninput"
							value="${projectMaker.makerEmail}" required></input> <br> <br>

						<h6 class="m-0 font-weight-bold text-primary">문의 전화번호</h6>
						<input id="question8" name="makerPhone" class="questioninput"
							value="${projectMaker.makerPhone}" required></input> <br> <br>

						<h6 class="m-0 font-weight-bold text-primary">홈페이지</h6>
						<input id="question9" name="makerHomepage" class="questioninput"
							value="${projectMaker.makerHomepage}" required></input> <br>
						<br>


					</div>



				</div>


				<br> <br>
				<h1 class="h4 text-gray-900 mb-4">대표자 정보</h1>
				<div class="card shadow mb-4" style="width: 1000px;">

					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">프로젝트 상세 페이지에
							노출되는 정보이니, 서포터와 소통이 가능한 정확한 정보를 입력해주세요.</h6>
					</div>
					<div class="card-body">

						<!-- <h6 class="m-0 font-weight-bold text-primary">통장 사본</h6>
					<h1 class="grey">
						펀딩 성공 시 펀딩 금액을 수령할 법인 명의의 계좌 사본을 첨부하세요.<br> jpg, jpeg, png,
						pdf / 10MB 이하 파일 1개만 업로드 가능합니다.
					</h1>
					<input id="question10" name="question10" class="questioninput"
						required></input>
					<button>등록하기</button>
					<h1 class="grey">
						3MB 이하의 JPEG, PNG 파일<br> 사이즈 : 300x300 픽셀 이상
					</h1>
					<br> -->

						<h6 class="m-0 font-weight-bold text-primary">대표자명</h6>
						<input name="rName" class="questioninput"
							value="${projectMaker.RName}" required></input> <br> <br>
						<h6 class="m-0 font-weight-bold text-primary">대표자 이메일</h6>
						<input name="rEmail" class="questioninput"
							value="${projectMaker.REmail}" required></input> <br>
					</div>
				</div>
				<br>


				<%-- <c:choose>
					<c:when test="${ !empty projectMaker }">
						<div class="col-auto">
							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;">수정하기</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>

						<div class="col-auto">
							<div class="btns">
								<button type="submit" class="btn btn-primary btn-user btn-block"
									style="width: 200px;">저장하기</button>
							</div>
						</div>

					</c:otherwise>
				</c:choose> --%>
				
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
	</script>
	<!-- Bootstrap core JavaScript-->

</body>
</html>
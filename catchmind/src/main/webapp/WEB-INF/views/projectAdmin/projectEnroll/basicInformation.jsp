<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	<c:set var="q1ch1" value="" />
	<c:set var="q1ch2" value="" />
	<c:set var="q2ch1" value="" />
	<c:set var="q2ch2" value="" />
	<c:set var="q2ch3" value="" />
	<c:set var="q2ch4" value="" />
	<c:set var="q2ch5" value="" />

	<c:choose>
		<c:when test="${ projectBasic.check1 eq 'q1c1' }">
			<c:set var="q1ch1" value="checked" />

		</c:when>
		<c:when test="${ projectBasic.check1 eq 'q1c2' }">
			<c:set var="q1ch2" value="checked" />

		</c:when>
	</c:choose>

	<%-- 
<c:choose>
		<c:when test="${ ProjectBasic.check1 eq q1c1 }">
			<c:set var="q1ch1" value="checked='true1'" />
		
		</c:when>
		<c:when test="${ ProjectBasic.check1 eq q1c2 }">
			<c:set var="q1ch2" value="checked='true2'" />
		
		</c:when>
		<c:otherwise>
		<c:set var="q1ch1" value="checked='true3'" />
			<b>안녕하세요</b>
		</c:otherwise>
</c:choose>
 --%>


	<c:choose>
		<c:when test="${ projectBasic.check2 eq 'q2c1' }">
			<c:set var="q2ch1" value="checked" />

		</c:when>
		<c:when test="${ projectBasic.check2 eq 'q2c2' }">
			<c:set var="q2ch2" value="checked" />

		</c:when>
		<c:when test="${ projectBasic.check2 eq 'q2c3' }">
			<c:set var="q2ch3" value="checked" />

		</c:when>
		<c:when test="${ projectBasic.check2 eq 'q2c4' }">
			<c:set var="q2ch4" value="checked" />

		</c:when>
		<c:when test="${ projectBasic.check2 eq 'q2c5' }">
			<c:set var="q2ch5" value="checked" />

		</c:when>
		<c:otherwise>
			<c:set var="q2ch1" value="checked" />

		</c:otherwise>
	</c:choose>




	<div style="position: fixed";>
		<%@ include file="../common/menubarIm.jsp"%>
	</div>

 <c:choose>
		<c:when test="${ empty projectBasic }">
	<div class="outer">
		<form style="margin-left: 270px;" action="insertBasic.pa"
			method="post">
			<div style="height: 700px;">
				<br>
				<h1 class="h3 text-gray-900 mb-4">기본 요건</h1>
				<h1 style="color: black; font-size: 15px;">
					펀딩 진행을 위한 기본 요건을 확인하고자 합니다. 심사 시 확인하는 중요한 정보이므로 반드시 정확한 정보를 입력하세요.
					답변 내용이 사실과 다른 경우,<br> 약정 위반에 따른 불이익이 발생할 수 있습니다.
				</h1>


				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Q1. 리워드가 타 크라우드
							펀딩사 및 온라인 커머스, 자사홈페이지등 다른 판매처에서 유통된 적이 있거나 현재 유통중인가요?</h6>
					</div>
					<div class="card-body">
						<fieldset style="color: black; font-size: 15px;">

							<input name="check1" type="radio" class="q1_type" value="q1c1"
								id="agree2" ${q1ch1}> <label for="pay_type_1">아니요.
								다른 곳에서 유통한 적이 없으며 캐치펀를 통해 처음 선보이는 제품입니다.</label> <br> <input
								name="check1" type="radio" class="q1_type" value="q1c2"
								id="agree" ${q1ch2}> <label for="pay_type_2">예,
								다른 곳에서 유통한 적이 있습니다. 또는 현재 유통 중입니다.</label>

						</fieldset>
						<div id="area1" style="display: none">
							<h6>
								리워드가 다른 판매처에서 유통된 적이 있다면 리워드로 제공할 수 없습니다.<br> 기존에 유통하던
								제품/서비스에 비해 개선된 점이 있다면 아래에 상세하게 작성해주세요.
							</h6>

							<textarea id="answer1" name="answer1" class="questiontext">${projectBasic.answer1}</textarea>

						</div>

					</div>
				</div>




				<br>

				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Q2. 리워드가 금형을
							이용하여 제작되는 제품인지 확인하고 리워드에 맞는 제조 형태를 선택해주세요</h6>
						<br>
						<h1 class="grey">
							※ 금형을 이용하지 않고 제작되는 리워드라면 다섯번째 답변을 선택해주세요.<br> ※ 제조 형태에 따라
							필요한 서류는 반드시 아래 리워드 필수 인증 서류 항목에 업로드해주세요.
						</h1>
					</div>

					<div class="card-body black" style="line-height: 225%;">
						<input name="check2" type="radio" class="q2_type" id="agree3"
							value="q2c1" ${q2ch1}> 금형을 이용하여 제작되는 리워드이며, 메이커가 아이디어
						단계부터 리워드의 기획 및 개발, 생산까지의 전 과정을 담당합니다.<br>

						<div id="area2" style="display: block">
							<h1 class="grey">
								· 금형의 독점 소유권을 확인할 수 있는 금형 제조사와의 (제작 의뢰) 계약서를 업로드해주세요. <br>
								· 금형 보관증 혹은 금형 구매 영수증 등을 업로드해주세요.
							</h1>
						</div>


						<input name="check2" type="radio" class="q2_type" id="agree4"
							value="q2c2" ${q2ch2}> 금형을 이용하여제작되는 리워드이며, 메이커가 아이디어 단계부터
						직접 기획 및 개발한 제품이지만 , 제품의 양산 등의<br> 과정은 메이커가 아닌 위탁 생산 업체가
						담당합니다.<br>

						<div id="area3" style="display: none">
							<h1 class="grey">
								· 금형의 독점 소유권을 확인할 수 있는 금형 제조사와의 (제작 의뢰) 계약서를 업로드해주세요.<br> ·
								금형 보관증 혹은 금형 구매 영수증 등을 업로드해주세요.<br> · 리워드 위탁 생산 업체와의 업무협약서를
								업로드해주세요. (원본+한글 번역본)
							</h1>
						</div>

						<input name="check2" type="radio" class="q2_type" id="agree5"
							value="q2c3" ${q2ch3}> 금형을 이용하여 제작되는 리워드이며, 메이커가 국내외
						제조업체에서 개발이 완료된 제품의 일부를<br> 개선 혹은 변경한 뒤 자신의 브랜드로 위탁 생산을
						의뢰하였습니다.<br>

						<div id="area4" style="display: none">
							<h1 class="grey">
								· 국내외 생산 업체와의 위탁제조계약서를 업로드해주세요. 메이커가 의뢰하여 개선한 리워드의 변경 내용을 확인할 수
								있어야 합니다.<br> · 국내외 타 채널에서 유사 제품이 판매되고 있다면 리워드가 해당 제품과 기능,
								외관상 어떠한 차이가 있는지 스토리 최상단에 작성해주세요.
							</h1>
						</div>

						<input name="check2" type="radio" class="q2_type" id="agree6"
							value="q2c4" ${q2ch4}> 금형 이용 여부와 관계없이 이미 제작 완료된 해외 브랜드의
						제품을 메이커가 국내 첫 단독 총판의 자격으로 수입하여 유통합니다<br>

						<div id="area5" style="display: none">
							<h1 class="grey">
								· 해외 브랜드와의 국내 독점 총판 계약서 및 리워드의 수입신고필증을 업로드해주세요.<br> · 서포터들이
								메이커의 총판 지위를 확인할 수 있도록 해외 브랜드로부터 제공받은 공식 소개 영상 혹은 공문(레터 형식)을 스토리에
								작성해주세요.
							</h1>
						</div>

						<input name="check2" type="radio" class="q2_type" id="agree7"
							value="q2c5" ${q2ch5}>패션잡화, 디자인 소품, 화장품, 식품, 서비스 이용권 등
						금형을 이용하지 않고 제작되는 리워드입니다.

						<div id="area6" style="display: none">
							<h1 class="grey">메이커가 리워드의 제작 및 유통 과정에서 어떤 역할을 담당하였는지 스토리에
								작성해주세요.</h1>
						</div>
					</div>
				</div>



				<br>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Q3. 현재까지 진행된
							리워드의 준비 상태 및 앞으로의 계획을 구체적으로 설명해주세요.</h6>
					</div>
					<div class="card-body">
						<h1 class="grey">
							1) 리워드가 유형의 제품인 경우 제작 공정에 따른 현재 리워드의 제작 상태 및 제조 시설명과 일일 최대 생산
							가능량을 포함한 앞으로의 생산 계획을 작성해주세요. <br> 2) 공연, 영화, 전시 등 무형 서비스인
							경우, 장소 대관, 촬영 일정 등의 현재 준비 상태 및 앞으로의 계획을 작성해주세요.
						</h1>
						<textarea id="answer2" name="answer2" class="questiontext"
							required>${projectBasic.answer2}</textarea>
					</div>
				</div>



				<br>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Q4. 리워드의 전달 계획을
							알려주세요.</h6>
					</div>
					<div class="card-body">
						<h1 class="grey">
							1) 리워드의 전달 방법(택배 or SMS 등)을 입력하고, 리워드 제작 및 전달 일정이 변동될 가능성이 있다면
							사유를 알려주세요.<br> 2) 발송 업체명 및 일일 최대 발송 가능량을 입력해주세요.<br> 3)
							공연, 영화, 전시 등 무형 서비스의 경우 좌석수, 일 최대 예약 가능 수량 등을 작성해주세요.
						</h1>
						<textarea id="answer3" name="answer3" class="questiontext"
							required>${projectBasic.answer3}</textarea>
					</div>
				</div>


				<br>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">수수료 정책 동의</h6>
					</div>
					<div class="card-body">
						<div class="blacktool" style="display: block">
							펀딩 오픈 수수료는 7% (VAT별도)입니다.<br> · 부가 서비스 이용 시, 추가 수수료가 발생될 수
							있습니다.<br> · 리워드가 없는 기부후원 프로젝트의 경우, 수수료가 다르게 적용됩니다<br>.
							· 자세한 내용은캐치펀 수수료 정책을 확인해주세요.
						</div>
						<div class="custom-control custom-checkbox small">
							<input name="check3" type="checkbox" class="custom-control-input"
								id="customCheck" value="checked" ${projectBasic.check3} required>
							<label class="custom-control-label" for="customCheck">캐치펀
								수수료 정책을 확인하였습니다</label>
						</div>
						<br>
						<div class="blacktool" style="display: block">
							오픈예정 서비스란?<br> 프로젝트 오픈에 대하여, 사전에 알림 홍보를 할 수 있는 서비스 페이지를
							말합니다. 프로젝트 펀딩에 관심 있는 예비 서포터들이 펀딩 시작 전에 내용을 둘러 보고, 관심이 있을 경우 알림
							신청을 할 수 있는 페이지입니다.<br> 성공 프로젝트의 경우 평균적으로 오픈 직후 3일 안에 전체 펀딩액의
							약 35%를 모집합니다.<br>
						</div>
						<div class="custom-control custom-checkbox small">
							<input name="check4" type="checkbox" class="custom-control-input"
								id="customCheck2" value="checked" ${projectBasic.check4}
								required> <label class="custom-control-label"
								for="customCheck2">오픈예정 서비스 신청</label>
						</div>

					</div>
				</div>




				<br>

				<%-- <c:choose>
					<c:when test="${ !empty projectBasic }">

						<div class="col-auto">

							<a href="<%=contextPath%>/updateBasic2.pa">
								<button type="button" class="btn btn-primary">수정하기</button>
							</a>
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
			</div>

		</form>
	</div>
	
	</c:when>
	<c:otherwise>
	
	<div class="outer">
		<form style="margin-left: 270px;" action="updateBasic2.pa"
			method="post">
			<div style="height: 700px;">
				<br>
				<h1 class="h3 text-gray-900 mb-4">기본 요건</h1>
				<h1 style="color: black; font-size: 15px;">
					펀딩 진행을 위한 기본 요건을 확인하고자 합니다. 심사 시 확인하는 중요한 정보이므로 반드시 정확한 정보를 입력하세요.
					답변 내용이 사실과 다른 경우,<br> 약정 위반에 따른 불이익이 발생할 수 있습니다.
				</h1>


				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Q1. 리워드가 타 크라우드
							펀딩사 및 온라인 커머스, 자사홈페이지등 다른 판매처에서 유통된 적이 있거나 현재 유통중인가요?</h6>
					</div>
					<div class="card-body">
						<fieldset style="color: black; font-size: 15px;">

							<input name="check1" type="radio" class="q1_type" value="q1c1"
								id="agree2" ${q1ch1}> <label for="pay_type_1">아니요.
								다른 곳에서 유통한 적이 없으며 캐치펀를 통해 처음 선보이는 제품입니다.</label> <br> <input
								name="check1" type="radio" class="q1_type" value="q1c2"
								id="agree" ${q1ch2}> <label for="pay_type_2">예,
								다른 곳에서 유통한 적이 있습니다. 또는 현재 유통 중입니다.</label>

						</fieldset>
						<div id="area1" style="display: none">
							<h6>
								리워드가 다른 판매처에서 유통된 적이 있다면 리워드로 제공할 수 없습니다.<br> 기존에 유통하던
								제품/서비스에 비해 개선된 점이 있다면 아래에 상세하게 작성해주세요.
							</h6>

							<textarea id="answer1" name="answer1" class="questiontext">${projectBasic.answer1}</textarea>

						</div>

					</div>
				</div>




				<br>

				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Q2. 리워드가 금형을
							이용하여 제작되는 제품인지 확인하고 리워드에 맞는 제조 형태를 선택해주세요</h6>
						<br>
						<h1 class="grey">
							※ 금형을 이용하지 않고 제작되는 리워드라면 다섯번째 답변을 선택해주세요.<br> ※ 제조 형태에 따라
							필요한 서류는 반드시 아래 리워드 필수 인증 서류 항목에 업로드해주세요.
						</h1>
					</div>

					<div class="card-body black" style="line-height: 225%;">
						<input name="check2" type="radio" class="q2_type" id="agree3"
							value="q2c1" ${q2ch1}> 금형을 이용하여 제작되는 리워드이며, 메이커가 아이디어
						단계부터 리워드의 기획 및 개발, 생산까지의 전 과정을 담당합니다.<br>

						<div id="area2" style="display: block">
							<h1 class="grey">
								· 금형의 독점 소유권을 확인할 수 있는 금형 제조사와의 (제작 의뢰) 계약서를 업로드해주세요. <br>
								· 금형 보관증 혹은 금형 구매 영수증 등을 업로드해주세요.
							</h1>
						</div>


						<input name="check2" type="radio" class="q2_type" id="agree4"
							value="q2c2" ${q2ch2}> 금형을 이용하여제작되는 리워드이며, 메이커가 아이디어 단계부터
						직접 기획 및 개발한 제품이지만 , 제품의 양산 등의<br> 과정은 메이커가 아닌 위탁 생산 업체가
						담당합니다.<br>

						<div id="area3" style="display: none">
							<h1 class="grey">
								· 금형의 독점 소유권을 확인할 수 있는 금형 제조사와의 (제작 의뢰) 계약서를 업로드해주세요.<br> ·
								금형 보관증 혹은 금형 구매 영수증 등을 업로드해주세요.<br> · 리워드 위탁 생산 업체와의 업무협약서를
								업로드해주세요. (원본+한글 번역본)
							</h1>
						</div>

						<input name="check2" type="radio" class="q2_type" id="agree5"
							value="q2c3" ${q2ch3}> 금형을 이용하여 제작되는 리워드이며, 메이커가 국내외
						제조업체에서 개발이 완료된 제품의 일부를<br> 개선 혹은 변경한 뒤 자신의 브랜드로 위탁 생산을
						의뢰하였습니다.<br>

						<div id="area4" style="display: none">
							<h1 class="grey">
								· 국내외 생산 업체와의 위탁제조계약서를 업로드해주세요. 메이커가 의뢰하여 개선한 리워드의 변경 내용을 확인할 수
								있어야 합니다.<br> · 국내외 타 채널에서 유사 제품이 판매되고 있다면 리워드가 해당 제품과 기능,
								외관상 어떠한 차이가 있는지 스토리 최상단에 작성해주세요.
							</h1>
						</div>

						<input name="check2" type="radio" class="q2_type" id="agree6"
							value="q2c4" ${q2ch4}> 금형 이용 여부와 관계없이 이미 제작 완료된 해외 브랜드의
						제품을 메이커가 국내 첫 단독 총판의 자격으로 수입하여 유통합니다<br>

						<div id="area5" style="display: none">
							<h1 class="grey">
								· 해외 브랜드와의 국내 독점 총판 계약서 및 리워드의 수입신고필증을 업로드해주세요.<br> · 서포터들이
								메이커의 총판 지위를 확인할 수 있도록 해외 브랜드로부터 제공받은 공식 소개 영상 혹은 공문(레터 형식)을 스토리에
								작성해주세요.
							</h1>
						</div>

						<input name="check2" type="radio" class="q2_type" id="agree7"
							value="q2c5" ${q2ch5}>패션잡화, 디자인 소품, 화장품, 식품, 서비스 이용권 등
						금형을 이용하지 않고 제작되는 리워드입니다.

						<div id="area6" style="display: none">
							<h1 class="grey">메이커가 리워드의 제작 및 유통 과정에서 어떤 역할을 담당하였는지 스토리에
								작성해주세요.</h1>
						</div>
					</div>
				</div>



				<br>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Q3. 현재까지 진행된
							리워드의 준비 상태 및 앞으로의 계획을 구체적으로 설명해주세요.</h6>
					</div>
					<div class="card-body">
						<h1 class="grey">
							1) 리워드가 유형의 제품인 경우 제작 공정에 따른 현재 리워드의 제작 상태 및 제조 시설명과 일일 최대 생산
							가능량을 포함한 앞으로의 생산 계획을 작성해주세요. <br> 2) 공연, 영화, 전시 등 무형 서비스인
							경우, 장소 대관, 촬영 일정 등의 현재 준비 상태 및 앞으로의 계획을 작성해주세요.
						</h1>
						<textarea id="answer2" name="answer2" class="questiontext"
							required>${projectBasic.answer2}</textarea>
					</div>
				</div>



				<br>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Q4. 리워드의 전달 계획을
							알려주세요.</h6>
					</div>
					<div class="card-body">
						<h1 class="grey">
							1) 리워드의 전달 방법(택배 or SMS 등)을 입력하고, 리워드 제작 및 전달 일정이 변동될 가능성이 있다면
							사유를 알려주세요.<br> 2) 발송 업체명 및 일일 최대 발송 가능량을 입력해주세요.<br> 3)
							공연, 영화, 전시 등 무형 서비스의 경우 좌석수, 일 최대 예약 가능 수량 등을 작성해주세요.
						</h1>
						<textarea id="answer3" name="answer3" class="questiontext"
							required>${projectBasic.answer3}</textarea>
					</div>
				</div>


				<br>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">수수료 정책 동의</h6>
					</div>
					<div class="card-body">
						<div class="blacktool" style="display: block">
							펀딩 오픈 수수료는 7% (VAT별도)입니다.<br> · 부가 서비스 이용 시, 추가 수수료가 발생될 수
							있습니다.<br> · 리워드가 없는 기부후원 프로젝트의 경우, 수수료가 다르게 적용됩니다<br>.
							· 자세한 내용은캐치펀 수수료 정책을 확인해주세요.
						</div>
						<div class="custom-control custom-checkbox small">
							<input name="check3" type="checkbox" class="custom-control-input"
								id="customCheck" value="checked" ${projectBasic.check3} required>
							<label class="custom-control-label" for="customCheck">캐치펀
								수수료 정책을 확인하였습니다</label>
						</div>
						<br>
						<div class="blacktool" style="display: block">
							오픈예정 서비스란?<br> 프로젝트 오픈에 대하여, 사전에 알림 홍보를 할 수 있는 서비스 페이지를
							말합니다. 프로젝트 펀딩에 관심 있는 예비 서포터들이 펀딩 시작 전에 내용을 둘러 보고, 관심이 있을 경우 알림
							신청을 할 수 있는 페이지입니다.<br> 성공 프로젝트의 경우 평균적으로 오픈 직후 3일 안에 전체 펀딩액의
							약 35%를 모집합니다.<br>
						</div>
						<div class="custom-control custom-checkbox small">
							<input name="check4" type="checkbox" class="custom-control-input"
								id="customCheck2" value="checked" ${projectBasic.check4}
								required> <label class="custom-control-label"
								for="customCheck2">오픈예정 서비스 신청</label>
						</div>

					</div>
				</div>




				<br>

				<%-- <c:choose>
					<c:when test="${ !empty projectBasic }">

						<div class="col-auto">

							<a href="<%=contextPath%>/updateBasic2.pa">
								<button type="button" class="btn btn-primary">수정하기</button>
							</a>
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
			</div>

		</form>
	</div>
	
	
	</c:otherwise>
	</c:choose>
	
	<script>
		$(function() {
			$(".q1_type").on('click', function() {
				var area1 = $('input:radio[id="agree"]').is(":checked");
				if (area1 == true) {
					$("#area1").css("display", "block");
				} else {
					$("#area1").css("display", "none");
				}
			});
		});
		$(function() {
			$(".q2_type").on('click', function() {
				var area2 = $('input:radio[id="agree3"]').is(":checked");
				var area3 = $('input:radio[id="agree4"]').is(":checked");
				var area4 = $('input:radio[id="agree5"]').is(":checked");
				var area5 = $('input:radio[id="agree6"]').is(":checked");
				var area6 = $('input:radio[id="agree7"]').is(":checked");
				if (area2 == true) {
					$("#area2").css("display", "block");
				} else {
					$("#area2").css("display", "none");
				}

				if (area3 == true) {
					$("#area3").css("display", "block");
				} else {
					$("#area3").css("display", "none");
				}
				if (area4 == true) {
					$("#area4").css("display", "block");
				} else {
					$("#area4").css("display", "none");
				}
				if (area5 == true) {
					$("#area5").css("display", "block");
				} else {
					$("#area5").css("display", "none");
				}
				if (area6 == true) {
					$("#area6").css("display", "block");
				} else {
					$("#area6").css("display", "none");
				}
			});
		});
	</script>

</body>
</html>
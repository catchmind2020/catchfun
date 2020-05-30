<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.catchmind.catchfun.member.model.vo.*, com.catchmind.catchfun.common.model.vo.PageInfo"%>
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
	min-width: 1920px;
}
 .black{
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

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/owl.carousel.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.marquee.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
<!-- Custom fonts for this template-->

  <link href="<%=request.getContextPath()%>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/resources/admin/css/sb-admin-2.css" rel="stylesheet">

</head>

<body>
	<!-- <div  style="position: fixed";> -->
	<%@ include file="../common/menubarIm.jsp"%>
	<div class="outer">
		<form style="margin-left: 13%;">
			<div style="width: 100%; height: 1000px; overflow: auto;">
				<br>
				<h1 class="h3 text-gray-900 mb-4">기본 정보</h1>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">

						<h6 class="m-0 font-weight-bold text-primary">프로젝트를 대표할 주요 기본
							정보를 입력하세요.</h6>
					</div>

					<div class="card-body">

						<h6 class="m-0 font-weight-bold text-primary">프로젝트제목</h6>
						<input id="question3" name="question3" class="questioninput"
							required></input> <br>
						<br>

						<h6 class="m-0 font-weight-bold text-primary">목표금액</h6>
						<input id="question4" name="question4" class="questioninput"
							required></input> <br>
						<br>

						<h6 class="m-0 font-weight-bold text-primary">카테고리</h6>
						<select id="question5" name="question5" class="questioninput">
							<option value="ko">한국</option>
							<option value="us" selected>공연컬쳐</option>
							<option value="eu">영국</option>
						</select> <br>
						<br>

						<h6 class="m-0 font-weight-bold text-primary">대표이미지</h6>
						<button>등록하기</button>
						<h1 class="grey">
							3MB 이하의 JPEG, PNG 파일<br> 사이즈 : 1200X675 픽셀 이상<br> 텍스트 및
							로고 삽입 금지
						</h1><br>

						<h6 class="m-0 font-weight-bold text-primary">프로젝트 시작일</h6>
						<input type="date" id="startDate" name="startDate"><br>
						<br>
						<h6 class="m-0 font-weight-bold text-primary">프로젝트 종료일</h6>
						<input type="date" id="finishDate" name="finishDate"> <input
							type="text" id="datepickerr" name="res_date" class="ipt black"
							placeholder="날짜버튼">
						<h1 class="grey">리워드를 설계하기 위해 프로젝트 종료일을 선택하세요.</h1>

						<h6 class="m-0 font-weight-bold text-primary">검색용태그</h6>
						<input id="tag" name="tag" class="questioninput"></input>
						<br><br>
						
						 <div class="btn btn-info btn-icon-split">
		                    <span class="text">사망 X</span>
		                  </div>
		                   <div class="btn btn-info btn-icon-split">
		                    <span class="text">사아망 X</span>
		                  </div>
					</div>
				</div>
				
				
				<br><br>
				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">스토리 작성</h6>
					</div>
					<div class="card-body">
					
						<textarea id="question1" name="question1" class="questiontext"
							required></textarea>
					</div>
				</div>
				
					<br>
				<div class="btns">
					<button type="submit" class="btn btn-primary btn-user btn-block"
						style="width: 200px;">저장하기</button>
				</div>
			</div>

		</form>
	</div>


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
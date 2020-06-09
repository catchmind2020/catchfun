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
	height: 40px;
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
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


	<div class="outer">
		<div style="height: 700px; margin-left: 270px;">

<br>
<h1 class="h3 text-gray-900 mb-4">스토리등록</h1>
			<form action="insertNews.pa" method="post">

				<div class="card shadow mb-4" style="width: 1000px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">스토리 등록</h6>
					</div>
					<div class="card-body">
						제목:<input class="questiontext" name="newsTitle" required></inputs><br>
						<textarea id="summernote" name="newsContent" required></textarea>
					</div>
				</div>

				<br>



				<div class="col-auto">

					<div class="btns">
						<button type="submit" class="btn btn-primary btn-user btn-block"
							style="width: 200px;">등록하기</button>
					</div>
					
					<div class="btns">
						<button type="submit" class="btn btn-primary btn-user btn-block"
							style="width: 200px;">등록하기</button>
					</div>
				</div>


		</form>

		</div>
	</div>



	<script>
		$('#summernote').summernote({
			placeholder : '스토리 작성하세요!',
			tabsize : 2,
			height : 500
		});
	</script>



	<!-- Bootstrap core JavaScript-->

</body>
</html>
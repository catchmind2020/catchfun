<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
.outer {
	text-align: center;
	/* padding: 70px; */
	margin-left: 250px;
	margin-top: 50px;
	min-width: 1200px;
	width: 1200px;
}
.tb tr{
	text-align: center;
}

.c-align>div{
	float: none;
}
.c-align-l{
	width: 600px;
}
.c-align-r{
	width: 30%;
	display: none;
	/* position: relative; */
}
.c-align-r-r{
	width: 30%;
	display: none;
	/* position: relative; */
}
.c-align-r-all{
	width: 400px;
	height: 200px;
	/* position: relative; */
	/* margin: auto; */
	
}
.c-align-r-inner{
	width:300px;
	background-color: lightgray;
}
.category-imgs{
	border-radius: 70%;
}

/* 삭제 모달 css */
.modal-body{ 
	text-align: center; 
	display: block; 
	margin: 0 auto; 
	font-size: 16px; 
	color: #999; 
} 
h1{ 
	font-family: 'Oswald', sans-serif; 
	font-size: 30px; 
	color: #216182; 
}
label { 
	display: block; 
	margin-top: 20px; 
	letter-spacing: 2px; 
} 
form { 
	margin: 0 auto; 
	width: 459px; 
} 
/* .m-input, .m-textarea { 
	width: 439px; 
	height: 27px; 
	background-color: #efefef; 
	border-radius: 6px; 
	border: 1px solid #dedede; 
	padding: 10px; 
	margin-top: 3px; 
	font-size: 0.9em; 
	color: #3a3a3a; 
} */
input:focus, textarea:focus{ 
	border: 1px solid #97d6eb; 
} 

textarea{ 
	height: 60px; 
	background-color: #efefef; 
} 
#submit{ 
	width: 127px; 
	height: 48px; 
	text-align: center; 
	border: none; 
	margin-top: 20px; 
	cursor: pointer; 
} 
#submit:hover{ 
	color: #fff; 
	background-color: #216282; 
	opacity: 0.9; 
} 
#cancel { 
	width: 127px; height: 48px; 
	text-align: center; 
	border: none; 
	margin-top: 20px; 
	cursor: pointer; 
} 
#cancel:hover{ 
	color: #fff; 
	background-color: #216282; 
	opacity: 0.9; 
}

.modal { 
	position: fixed; 
	left: 0; 
	top: 0; 
	width: 100%; 
	height: 100%; 
	background-color: rgba(0, 0, 0, 0.5); 
	opacity: 0; 
	visibility: hidden; 
	transform: scale(1.1); 
	transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
} 
.modal-content { 
	position: absolute; 
	top: 50%; 
	left: 50%; 
	transform: translate(-50%, -50%); 
	background-color: white; 
	padding: 1rem 1.5rem; 
	width: 500px; 
	height: 350px; 
	border-radius: 0.5rem; 
} 
.close-button { 
	float: right; 
	width: 1.5rem; 
	line-height: 1.5rem; 
	text-align: center; 
	cursor: pointer; 
	border-radius: 0.25rem; 
	background-color: lightgray; 
} 
.close-button:hover { 
	background-color: darkgray; 
} 
.show-modal { 
	opacity: 1; 
	visibility: visible; 
	transform: scale(1.0); 
	transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
}

</style>
</head>
<body>
	<jsp:include page="../common/admin.jsp"/>	
	
	<div class="outer">
	<h2>카테고리</h2><br>
	<label>카테고리를 관리합니다.</label>

	<br><br>
	
		<center>
			<div class="c-align">

				<!-- 카테고리 리스트 -->
				<div class="c-align-l">
					<table class="tb" border="1">
						<thead>
							<tr>
								<th width="100px" style="height: 50px;">번호</th>
								<th width="100px" style="height: 50px;">카테고리명</th>
								<th width="200px">이미지</th>
								<th width="150px"><button type="button" class="categoryEnroll j-btn">등록</button></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ clist }" var="c">
								<tr>
			                        <td width="100px" style="height: 50px;">${ c.refNo }</td>
			                        <td width="100px" style="height: 50px;">${ c.projectName }</td>
			                        <td width="200px"><img class="category-imgs" src="${ pageContext.servletContext.contextPath }/resources/uploadFiles/${c.changeName}" style="width: 80px; height: 80px"></td>
			                        <td width="230px"><button type="button" class="categoryUpdate j-btn">수정</button>&nbsp;&nbsp;<button type="button" class="trigger categoryDelete j-btn">삭제</button></td>
			                    </tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 카테고리 등록 -->
				<form id="enrollCategoryForm" method="post" action="insertCategory.ad" enctype="multipart/form-data">
					<div class="c-align-r">
						<div class="c-align-r-all">
							<div class="c-align-r-inner" style="margin-left: 100px;">
								<br>
								<!-- <img class="category-imgs" src="camera.png" style="width: 30px;"><br><br> -->
								제목 <input type="text" name="projectCategoryName" id="projectCategoryName"><br><br>
								<input type="file" id="uploadFile" name="uploadFile" id="upfile" style="margin-left: 10px;" required>
								<br><br>
								<button type="submit" class="enrollBtn">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="enrollCancel">취소하기</button>
								<br><br>
							</div>
						</div>
					</div>
				</form>

				<!-- 카테고리 수정 -->
				<form id="updateCategoryForm" method="post" action="updateCategory.ad" enctype="multipart/form-data">
					<div class="c-align-r-r">
						<div class="c-align-r-all-r">
							<div class="c-align-r-inner" style="margin-left: 100px;">
								<br>
								<img id="detailImg" src="" style="width: 150px;"><br><br>
								<input hidden class="projectCategory" name="projectCategory">
								제목 <input type="text" name="projectCategoryName" id="detailTitle" value=""><br><br>
								<input type="file" name="reUploadFile" id="" style="margin-left: 10px;" required>
								<br><br>
								<button type="submit">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="updateCancel">취소하기</button>
								<br><br>
							</div>
						</div>
					</div>
				</form>
			</div>
			</center>
	</div>

	<!-- 팝업 될 레이어 --> 
	<div class="modal modal-body"> 
		<div class="modal-content"> 
			<span class="close-button">&times;</span> 
			<h1 class="title">확인창</h1> 
			<form action="" method="POST"><br><br>
			  <label for="category">정말로 삭제하시겠습니까?</label> <br><br>
			  <!-- <input type="email" name="email" placeholder="Your email" required="required"> -->
			  <label></label>
			  <!-- <textarea name="message" placeholder="Test Message" required="required"></textarea> -->
			  <input type="button" id="cancel" value="취소"> 
			  <input type="submit" id="submit" value="삭제"> 
			</form> 
		</div> 
	</div>

	<script>
		$('.categoryEnroll').click(function () {  
			if($(".c-align-r").css("display") == "none"){   
				$('.c-align-r').css("display", "block");
				$('.c-align>div').css("float", "left");
				$('.c-align-r-r').css("display", "none");
			}
		});

		$('.categoryUpdate').click(function () {  
			if($(".c-align-r-r").css("display") == "none"){   
				$('.c-align-r-r').css("display", "block");
				$('.c-align>div').css("float", "left");
				$('.c-align-r').css("display", "none");
			}
		});
		
		$('.enrollCancel').click(function () {  
			$('.c-align-r').css("display", "none");
			$('.c-align-r-r').css("display", "none");
			$('.c-align>div').css("float", "none"); 
		});

		$('.updateCancel').click(function () {  
			$('.c-align-r').css("display", "none");
			$('.c-align-r-r').css("display", "none");
			$('.c-align>div').css("float", "none"); 
		});
	</script>
	
	<!-- 업로드 스크립트 -->
	
	<script type="text/javascript">
	
		/* $(".enrollBtn").click(function(){ */
			
			/* 
			var uploadFile = new FormData($("#enrollCategoryForm")[0]);
			
			$('#enrollCategoryForm').ajaxSubmit({
				url:"insertCategory.ad",
				enctype:'multipart/form-data',
    			data:{projectCategoryName:$("#projectCategoryName").val(),
    				  uploadFile:uploadFile},
   				processData: false,
   				contentType: false,
    			type="post",
    			success:function(status){
    				
    			},error:function(){
    				console.log("카테고리 등록용 ajax 통신실패!!");	
    			}
			});
			 */
			 /* function fileUpload(){ */
		/* }); */
		/* 
		$(".enrollBtn").click(function(){
			
			$.ajax({
				url: "insertCategory.ad",
				enctype:"multipart/form-data", // 여기에 url과 enctype은 꼭 지정해주어야 하는 부분이며 multipart로 지정해주지 않으면 controller로 파일을 보낼 수 없음
				data:{projectCategoryName:$("#projectCategoryName").val()},
				success:function(status){
					alert(status);
				},error:function(){
    				console.log("카테고리 등록용 ajax 통신실패!!");	
    			}
			});
			
			$("#enrollCategoryForm").submit();
		});
		 */
	</script>

	<script>
		$(".categoryUpdate").click(function(){
			var cno = $(this).parent().parent().children().eq(0).text();
			$(".projectCategory").val(cno);
			console.log(cno);
			
			$.ajax({
    			url:"categoryDetail.ad",
    			data:{cno:cno},
    			success:function(cu){
    			
    				console.log(cu.projectName);
    				console.log(cu.fileNo);
    				console.log(cu.originName);
    				console.log(cu.changeName);
    				
    				var img1 = "${ pageContext.servletContext.contextPath }/resources/uploadFiles/";
    				var img2 = cu.changeName;
    				
    				var img = img1 + img2;
    				
    				console.log(img1);
    				console.log(img2);
    				console.log(img);
    			
    				$("#detailTitle").val(cu.projectName);
    				$("#detailImg").attr("src", img);
    			},error:function(){
    				console.log("공지 디테일 조회용 ajax 통신실패!!");	
    			}
    		});
		});
		
		$(".categoryDelete").click(function(){

			var cno = $(this).parent().parent().children().eq(0).text();
			console.log("삭제확인 cno : " + cno);
			
			$.ajax({
    			url:"deleteCategory.ad",
    			data:{cno:cno},
    			success:function(){
    				console.log("삭제성공!!");	
    			},error:function(){
    				console.log("ajax 통신실패!!");	
    			}
    		});
			
		});
	</script>
	<!-- 모달 스크립트 -->

	<script type="text/javascript"> 
		var modal = document.querySelector(".modal"); 
		var trigger = document.querySelector(".trigger"); 
		var closeButton = document.querySelector(".close-button"); 
		var cancelButton = document.querySelector("#cancel");

	   //console.log(modal);

	   function toggleModal() { 
			modal.classList.toggle("show-modal"); 
		}

	   function windowOnClick(event) { 
			if (event.target === modal) { 
				toggleModal(); 
			} 
		}

		trigger.addEventListener("click", toggleModal); 
		closeButton.addEventListener("click", toggleModal); 
		cancel.addEventListener("click", toggleModal); 
		window.addEventListener("click", windowOnClick); 
	</script>

</body>
</html>
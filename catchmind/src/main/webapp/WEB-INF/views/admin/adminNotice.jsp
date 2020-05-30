<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
}
.tb tr{
	text-align: center;
}

/* 버튼 css */
/* 1:1 상담문의 버튼 */
a.ready-btn {
border: 1px solid #fff;
border-radius: 30px;
color: #fff;
cursor: pointer;
display: inline-block;
font-size: 15px;
font-weight: 600;
margin-top: 10px;
padding: 10px 20px;
text-align: center;
text-transform: uppercase;
transition: all 0.4s ease 0s;
z-index: 222;
text-decoration:none;
}

a.ready-btn:hover {
	color: #fff;
	background: rgb(203, 61, 36);
	border: 1px solid rgb(203, 61, 36);
	text-decoration: none;
}

.ready-btn.right-btn {
margin-right: 15px;
background: rgb(203, 61, 36);
border: 1px solid rgb(203, 61, 36) !important;
}

/* 답변보기 버튼 */
.ready-btn.right-btn:hover {
background: transparent !important;
border: 1px solid rgb(203, 61, 36) !important;
color:rgb(203, 61, 36);
}
/* 등록하기 버튼 */
.enrollBtn{
border-radius: 30px;
background: rgb(203, 61, 36);
color:white;
border: 1px solid rgb(203, 61, 36) !important;
	font-size: 15px;
font-weight: 600;
margin-top: 10px;
padding: 10px 20px;
cursor: pointer;
	transition: all 0.4s ease 0s;
z-index: 222;
text-decoration:none;
}
.enrollBtn:hover{
color: rgb(203, 61, 36);
background: white;
border: 1px solid rgb(203, 61, 36) !important;
}
.cancelBtn{
border-radius: 30px;
background: lightgrey;
color:white;
border: 1px solid lightgrey !important;
	font-size: 15px;
font-weight: 600;
margin-top: 10px;
padding: 10px 20px;
cursor: pointer;
	transition: all 0.4s ease 0s;
z-index: 222;
text-decoration:none;
}
.cancelBtn:hover{
color: grey;
background: white;
border: 1px solid grey !important;
}

/* 폰트 */
body {
	/* background: #fff none repeat scroll 0 0; */
	color: #444;
	font-family: 'Open Sans', sans-serif;
	font-size: 14px;
	/* text-align: left; */
	/* overflow-x: hidden; */
	/* line-height: 22px; */
}
h2 {
font-size: 38px;
line-height: 40px;
}

.section-headline h2 {
display: inline-block;
font-size: 40px;
font-weight: 600;
margin-bottom: 70px;
position: relative;
text-transform: capitalize;
text-align: center;
}
/* 글씨 아래 줄 */
.section-headline h2::after {
border: 1px solid #333;
bottom: -20px;
content: "";
left: 0;
margin: 0 auto;
position: absolute;
right: 0;
width: 40%;
}

.wrap *{
	margin:auto;
	text-align: center;
}

/* 제목창 css */
.text_con_title{
	width:600px; 
	text-align:left; 
	font-size:20px;
}
/* 내용창 css */
#text_con{
	width: 700px; 
	height: 100px; 
	text-align: left; 
	font-size: 20px; 
	resize: none;
}
.font-all{
	font-size: 20px; 
}
#qnaEvent{
	display: none;
}

/* 등록페이지 이벤트 */
#noticeEvent{
	display: none;
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

/* 페이징바 */
#pagingArea{width:fit-content;margin:auto;}

</style>
</head>
<body>
	<jsp:include page="../common/admin.jsp"/>
	
	<div class="outer">
	<h2>공지사항 관리</h2><br>
	<label>공지사항을 등록/수정/삭제합니다.</label>
	
	<div class="k_btn">
		<input type="text" name="keyword" placeholder="키워드 입력"> <button type="button">조회</button>
	</div>
	<br><br>
		<center>
			<table class="tb" border="1">
				<thead>
					<tr>
						<th width="100px">글번호</th>
						<th width="350px">제목</th>
						<th width="100px">작성자</th>
						<th width="150px">작성일</th>
						<th width="150px"><button type="button" class="createBtn">글쓰기</button></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ list }" var="b">
	                    <tr>
	                        <td>${ b.boardNo }</td>
	                        <td>${ b.boardTitle }</td>
	                        <td>${ b.boardWriter }</td>
	                        <td>${ b.count }</td>
	                        <td>${ b.createDate }</td>
	                        <c:choose>
	                        	<c:when test="${ !empty b.originName }">
		                        	<td>★</td>
		                        </c:when>
		                        <c:otherwise>
		                        	<td>&nbsp;</td>
	                        	</c:otherwise>
	                        </c:choose>
	                    </tr>
                    </c:forEach>
					<tr>
						<td>3</td>
						<td>개설준비</td>
						<td>admin</td>
						<td>2020.05.24</td>
						<td><button class="updateNotice" type="button">수정</button>&nbsp;&nbsp;<button type="button" class="trigger">삭제</button></td>
					</tr>

				</tbody>
			</table>


			<!-- test2 답변 보낼 폼-->
			<div id="noticeEvent">
				<form id="" name="" method="post" action="">
				<br>
				<!-- 제목 -->
					<div class="faq_input_title relative mtop20">

						<input type="text" id="noTitle" name="title_temp" placeholder="제목" class="text_con_title" maxlength="50" required><br>
						<!-- <span id="text_counter_title" style="text-align:right">###</span> -->

					</div><br>

				<!-- 시작일, 종료일, 디데이 -->
						<input class="startDate" type="date"> <input class="endDate" type="date"> <input class="dday" type="text" size="5"> &nbsp;&nbsp;&nbsp;&nbsp; <img src="camera.png" style="width: 30px;"> <input type="file" class="fileName"> <input hidden type="text" placeholder="파일첨부" value="">
					<br><br>
				<!-- 내용 -->
					<div class="faq_input relative mtop20">
						<textarea class="noContent" name="contents" placeholder="내용을 입력해주세요" class="width100 p10 f_666" id="text_con" maxlength="4000"></textarea><br>
						<!-- <div style="width:800px; text-align:right" required><span id="text_counter">0</span> / 4000</div> -->
						<br>

					</div>

					<div class="text-center">
						<!-- <a class="ready-btn right-btn page-scroll" href="insert.cs" onclick="submit();">등록하기</a> -->           
						<button class="enrollBtn" type="submit">등록하기</button>
						<a class="cancelBtn" href="javascript:history.back();">취소</a>
						
					</div>
				</form>
			</div>

		</center>

	</div>
	
	<div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
	                    </c:when>
	                    <c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>

	<!-- 팝업 될 레이어 --> 
	<div class="modal modal-body"> 
		<div class="modal-content"> 
			<span class="close-button">&times;</span> 
			<h1 class="title">확인창</h1> 
			<form action="" method="POST"><br><br>
			  <label for="email">정말로 삭제하시겠습니까?</label> <br><br>
			  <!-- <input type="email" name="email" placeholder="Your email" required="required"> -->
			  <label></label>
			  <!-- <textarea name="message" placeholder="Test Message" required="required"></textarea> -->
			  <input type="button" id="cancel" value="취소"> 
			  <input type="submit" id="submit" value="삭제"> 
			</form> 
		</div> 
	</div>

	<script>

		$(".dday").click(function(){
			
			//var nno = $(".td_area>tbody>tr").children().eq(0).text();
			//var nno = $(this).parent().parent().children().eq(0).text(); // 반허값 뽑아오기
			var startDate = $(".startDate").val();
			var endDate = $(".endDate").val();

			// 날짜 스플릿
			var startDateSplit = startDate.split("-");
			var endDateSplit = endDate.split("-");

			var sYear = startDateSplit[0];		//년
			var sMonth = startDateSplit[1]; 	//월
			var sDay = startDateSplit[2];		//일
			
			var sInputDate = sYear +""+ sMonth +""+ sDay;

			var eYear = endDateSplit[0];	//년
			var eMonth = endDateSplit[1];  	//월
			var eDay = endDateSplit[2];		//일

			var eInputDate = eYear +""+ eMonth +""+ eDay;


			var dday = eInputDate - sInputDate;
			
			$(".dday").val("D-"+dday)
			// 뽑아온 값을 ajax를 통해 보내고
			// 보낸값을 통해 조회하여 display:none -> block로 바꿔 출력
			console.log(dday);
			<%-- location.href="<%=contextPath%>/detail.no?nno=" + nno; --%>
		});

		$(".createBtn").click(function(){

			$("#noTitle").val("");
			$(".noContent").val("");
			$(".startDate").val("");
			$(".endDate").val("");

			if($("#noticeEvent").css("display") == "none"){   
				$('#noticeEvent').css("display", "block");   
			}
		});

		$(".cancelBtn").click(function(){

			$('#noticeEvent').css("display", "none");   
			
		});

		$(".updateNotice").click(function(){
			//var nno = $(".td_area>tbody>tr").children().eq(0).text();
			 var nno = $(this).parent().parent().children().eq(0).text(); // 번호(기본키) 뽑아오기
			
			// class="noTitle" class="noContent"

			$("#noTitle").val("개설준비");
			$(".noContent").val("지금은 준비를 하고 있습니다.");
			$(".startDate").val("2020-05-04");
			$(".endDate").val("2020-05-20");


			 if($("#noticeEvent").css("display") == "none"){   
				$('#noticeEvent').css("display", "block");   
			}



			console.log(nno);
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
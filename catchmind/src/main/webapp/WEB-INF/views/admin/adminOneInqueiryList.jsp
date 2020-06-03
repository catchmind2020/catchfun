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
}
.tb tr{
	text-align: center;
}
.t-align{
	position: relative;
	width: 1200px;
	height: 150px;
}
.t-align>div{
	float: left;
}
.t-inner-l, .t-inner-r{
	height: 150px;
}
.t-inner-l{
	width: 30%;
}
.t-inner-r{
	width: 70%;
}
.t-inner-all{
	margin-top: 50px;
	border-right-width: 50px;
	width: 100%;
}
.t-inner-all>div{
	float: left ;
}
.t-inner-r-1{
	width: 40%;
}
.t-inner-r-2{
	width: 40%;
}
.t-inner-r-3{
	width: 20%;
}

/* css 답변하기 */

.head_title_font {
	font-size: 30px;
	font-weight: 400;
	color: white;
	}	
    #outside{min-width: 1000px;}
    /* 상단이미지 css */
    .reviews-area {
    /* background: url(Front/2.jpg); */
    /* overflow: hidden; */
    background-repeat: no-repeat;
    background-size: cover;
    background-position: top center;
    background-attachment: fixed;
    width: 100%;
    height: 170px;
    position: relative;
    margin-top:87px;
    }

    .work-left-text {
    background: #3EC1D5 none repeat scroll 0 0;
    }

    .work-left-text {
    width: 100%;
    }

    .work-right-text {
    background: rgba(0, 0, 0, 0.8) none repeat scroll 0 0;
    /* float: right; */
    text-align: center;
    height: 100%;
    overflow: hidden;
    padding: 5px 0;
    width: 100%;
    position: absolute;
    right: 0;
    top: 0;
    }

    .work-right-text h2 {
    color: #fff;
    text-transform: uppercase;
    font-size: 30px;
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
      width:800px; 
      text-align:left; 
      font-size:20px;
    }
    /* 내용창 css */
    #text_con{
      width: 800px; 
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
	
	/* 페이징바 */
	#pagingArea{width:fit-content;margin:auto;}

</style>
</head>
<body>
	<jsp:include page="../common/admin.jsp"/>
	<div class="outer">
		<center>
		<div class="t-align">
			<div class="t-inner-l">
				<h2>상담구분</h2><br>
				<label>1:1문의를 관리합니다.</label>
			</div>

			<div class="t-inner-r">
				<div class="t-inner-all">
					<div class="t-inner-r-1">

					</div>
					1
					<div class="t-inner-r-2">
						<input type="checkbox" name="" value=""> 주문/결제
						<input type="checkbox" name="" value=""> 반품/교환
						<br>
						<input type="checkbox" name="" value=""> 배송 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="" value=""> 기타 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					
					<div class="t-inner-r-3">
						<button type="button" style="width: 100px; height: 50px;">조회</button>
					</div>
				</div>
			</div>
		</div>
	
		<br><br>
		
			<table class="tb" border="1">
				<thead>
					<tr>
						<th width="100px">번호</th>
						<th width="100px">회원아이디</th>
						<th width="100px">보낸유형</th>
						<th width="100px">상담유형</th>
						<th width="300px">제목</th>
						<th width="150px">상담신청일</th>
						<th width="150px">답변여부</th>
						<th width="150px">답변하기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ qlist }" var="q">
	                    <tr>
							<td>${ q.questionNo }</td>
							<td>${ q.userNo }</td>
							<td>${ q.questionType }</td>
							<td>${ q.counseling }</td>
							<td>${ q.questionTitle }</td>
							<td>${ q.questionDate }</td>
							<td>${ q.questionYn }</td>
							<td><button class="updateQuestion" type="button">수정</button>&nbsp;&nbsp;<button type="button" class="trigger deleteQuestion">삭제</button></td>
	                    </tr>
                    </c:forEach>
				</tbody>
				<!-- <tr>
					<td>1</td>
					<td>arisong</td>
					<td>기타</td>
					<td>문의할게 있어요</td>
					<td>2020년 05월 24일</td>
					<td>답변완료</td>
				</tr> -->
			</table>

			<div id="qnaEvent">
				<!-- test1 내용 보여지는 곳 -->
				<div class="mtop30 ptop30 pbottom30 list_bg ">
					<div class="wrap">
		
					<br>
						<table>
							<tr class="font-all">
								<td style="width: 250px;" id="counseling"></td>
								<td style="width: 300px;" id="qName"></td>
								<td style="width: 420px;" id="qDate"></td>
							</tr>
						</table>
					<!-- 제목 -->
						<div class="faq_input_title relative mtop20">
						
							<label class="font-all">제목 : </label><input type="text" id="qTitle" name="title_temp" class="text_con_title" maxlength="50" value="배송문의입니다." readonly><br>
						</div>
					<br>
					<!-- 내용 -->
						<div class="faq_input relative mtop20">
							<label class="font-all">내용 : </label><textarea name="contents" placeholder="내용" class="width100 p10 f_666" id="qContent" maxlength="4000" readonly>배송문의 드려요 ~~~~~~ㅎㅎ</textarea>
						</div>
					</div>
				</div>

				<!-- test2 답변 보낼 폼-->

				<form id="" name="" method="post" action="">
				<br>
				<!-- 제목 -->
					<div class="faq_input_title relative mtop20">

						<label class="font-all">제목 : </label><input type="text" name="title_temp" placeholder="제목을 적어주세요." class="text_con_title" maxlength="50" required><br>
						<!-- <span id="text_counter_title" style="text-align:right">###</span> -->

					</div><br>

				<!-- 내용 -->
					<div class="faq_input relative mtop20">
						<label class="font-all">내용 : </label><textarea name="contents" placeholder="내용" class="width100 p10 f_666" id="text_con" maxlength="4000"></textarea><br>
						<!-- <div style="width:800px; text-align:right" required><span id="text_counter">0</span> / 4000</div> -->
						<br>

					</div>

					<div class="text-center">
						<!-- <a class="ready-btn right-btn page-scroll" href="insert.cs" onclick="submit();">등록하기</a> -->           
						<button class="enrollBtn" type="submit">등록하기</button>
						<!-- <a class="cancelBtn" href="javascript:history.back();">취소</a> -->
					</div>
				</form>
			</div>
		</center>
		<br>
		<div id="pagingArea">
	        <ul class="pagination">
	        	
        	 	<c:choose>
	        		<c:when test="${ qpi.currentPage eq 1 }">
	             		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
		            </c:when>
		            <c:otherwise>
	            		<li class="page-item"><a class="page-link" href="question.ad?currentPage=${ qpi.currentPage-1 }">Previous</a></li>
	            	</c:otherwise>
	            </c:choose>
	            
	            <c:forEach var="p" begin="${ qpi.startPage }" end="${ qpi.endPage }">
	            	<c:choose>
	            		<c:when test="${ p eq qpi.currentPage }">
	             		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
	             	</c:when>
	             	<c:otherwise>
	             		<li class="page-item"><a class="page-link" href="question.ad?currentPage=${ p }">${ p }</a></li>
	            		</c:otherwise>
	            	</c:choose>
	            </c:forEach>
	            
	            <c:choose>
	            	<c:when test="${ qpi.currentPage eq qpi.maxPage }">
	             	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	             </c:when>
	             <c:otherwise>
	             	<li class="page-item"><a class="page-link" href="question.ad?currentPage=${ qpi.currentPage+1 }">Next</a></li>
	            	</c:otherwise>
	            </c:choose>
	        </ul>
	    </div>

	</div>

	<script>
		$('.updateQuestion').click(function () {  
			if($("#qnaEvent").css("display") == "none"){   
				$('#qnaEvent').css("display", "block");   
			} else {  
				$('#qnaEvent').css("display", "none");   
			}
		});

		$(".updateQuestion").click(function(){
			//var nno = $(".td_area>tbody>tr").children().eq(0).text();
			 var qno = $(this).parent().parent().children().eq(0).text(); // 번호(기본키) 뽑아오기
			 // 뽑아온 값을 ajax를 통해 보내고
			 // 보낸값을 통해 조회하여 display:none -> block로 바꿔 출력
			 console.log(qno);
			 
			 $.ajax({
	    			url:"qnaDetail.ad",
	    			data:{qno:qno},
	    			success:function(qnaList){
	    				$("#counseling").text("상담유형 : " + qnaList.counseling);
	    				$("#qName").text("작성자 : " + qnaList.userNo);
	    				$("#qDate").text("문의날짜 : " + qnaList.questionDate);
	    				$("#qTitle").val(qnaList.questionTitle);
	    				$("#qContent").val(qnaList.questionContent);
	    			},error:function(){
	    				console.log("질문 디테일 조회용 ajax 통신실패!!");	
	    			}
	    		});
			 <%-- location.href="<%=contextPath%>/detail.no?nno=" + nno; --%>
		});


	</script>

</body>
</html>
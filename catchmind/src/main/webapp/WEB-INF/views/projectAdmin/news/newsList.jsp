<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>

<%



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin-Envent</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.0/summernote.js"></script>


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
	min-width: 1800px;
}

.black {
	color: black;
	font-size: 15px;
}

.blacktool {
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
	<!-- <div  style="position: fixed";> -->

	<div class="outer">
	
	
	<div style=" height: 700px ; margin-left: 270px;">

			<br>
			<h1 class="h3 text-gray-900 mb-4">새소식</h1>
		
			
		 <h1 class="h3 text-gray-900 mb-4">새소식리스트</h1>
		 <table class="table-bordered table-hover table-sm listArea" style="width:1000px;">
            <thead>
              <tr>
               
                <th width="150px">새소식번호</th>
                <th width="400px">제목</th>
                <th width="200px">날짜</th>
                
              </tr>
            </thead>
            <tbody>
            
		
			<!-- tr>
				<td colspan="6">존재하는 공지사항이 없습니다.</td>
			</tr> -->
			
			<c:forEach items="${ newsList }" var="b">
		
				
	                    <tr>
	                        <td>${ b.newsNo }</td>
	                        <td>${ b.newsTitle }</td>
	                        <td>${ b.newsDate }</td>
	                       
	                    </tr>
	              
                 </c:forEach>
                    
            </tbody>
          </table>
          <br>
             	<a href="<%=contextPath%>/newsEnroll.pa">
								<button type="button" class="btn btn-primary">등록하기</button>
							</a>

   	<br><br>
   			<div id="pagingArea " style="margin-right: 30%;">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
	                    </c:when>
	                    <c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="news.pa?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="news.pa?currentPage=${ p }">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="news.pa?currentPage=${ pi.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
			
			
			
			
			
			</div>

		
	</div>
 
 <script>
		$(function(){
			$("table>tbody>tr").click(function(){
				
				//console.log("클릭");
		
				// 현재 클릭했을 때의 해당 공지사항 번호
				var nno = $(this).children().eq(0).text();
				
				// 쿼리스트링을 이용해서 전달값 전달
				 location.href="<%=contextPath%>/newDetail.pa?nno=" + nno;
			});
		});
		
		$('#summernote').summernote({
			placeholder : '새소식 작성하세요!',
			tabsize : 2,
			height : 500
		});
	
		
		</script>
	
		
</body>
</html>
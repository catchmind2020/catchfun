<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
    <style>


/* 폰트 초기화*/
body, input, textarea, select, button, table {
    font-family: 'Nanum Gothic',  'Noto Sans KR', 'Malgun Gothic','맑은 고딕', 'dotum','돋움',sans-serif; 
    color: #222; font-size: 18px; line-height: 1.5;} 

        .content{
           
            width:80%;
            margin:auto;
        }
        
        .innerOuter{
            border:1px solid lightgray;
            width:90%;
            margin:auto;
            padding:5% 15%;
            background:white;
        }

        #boardList{text-align: center;}
        #boardList>tbody>tr:hover{cursor:pointer;}

       /*  #pagingArea{width:100%; margin:auto; text-align: center;} */
       
        #searchForm{
            width:80%;
            margin:auto;
        }
        #searchForm>*{
            float:left;
            margin:5px;
        }
        .select{width:20%;}
        .text{width:53%;}
        .searchBtn{Width:20%;}

        .pagination {
       
        display: inline-block;
        }

        .pagination a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
        }

        .pagination a.active {
        background-color: #4CAF50;
        color: white;
        border-radius: 5px;
        }

        .pagination a:hover:not(.active) {
        background-color: #ddd;
        border-radius: 5px;
        }

        #boardList{
        margin-top: 50px;
        }

        #answerBtn{
            width: 90px;
            height: 30px;
            background-color: white;
            border-color: rgb(196, 4, 4);
        }
        #pagingArea{width:fit-content;margin:auto;}
    </style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>프로젝트 개설자의 메세지함</h2>
            <table id="questionList" class="table table-hover" align="center">
                <thead>
                  <tr>
                  	<th>글번호</th>
                    <th>제목</th>
                    <th>보낸사람</th>
                    <th>작성일</th>
                    <th>답변상태</th>
                  </tr>
                </thead>
                <tbody>
	                <c:forEach items="${ list }" var="q">
	                    <tr>
	                    	<td>${ q.questionNo }</td>
							<td>${ q.questionTitle }</td>
							<td>${ q.userId }</td>
							<td>${ q.questionDate }</td>
							<c:choose>
								<c:when test="${ q.questionYn eq 'N' }">
									<td><button id="answerBtn">답변하기</button></td>
								</c:when>
								<c:otherwise>
									<td>답변완료</td>
								</c:otherwise>
							</c:choose>
	                    </tr>
                    </c:forEach>
                 </tbody>
            </table>
            <br>
<!-- 
            <div id="pagingArea">
                <ul class="pagination" style="width: 400px; height:100px; align:center;">
                    <li class="page-item disabled"><a class="page-link" href="#"><<</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">>></a></li>
                </ul>
            </div>
             -->
             
             <script>
             	$(function(){
             		$("#questionList tbody tr").click(function(){
             			location.href = "sellerMessageAnswer.me?qno=" + $(this).children().eq(0).text();
             			
             		});
             	});
             </script>
             
             
             <div id="pagingArea">
		        <ul class="pagination" style="width:300px; height:70px;">
		        	
		        	 <c:choose>
		        		<c:when test="${ pi.currentPage eq 1 }">
		             		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
		             	</c:when>
		             	<c:otherwise>
		            		<li class="page-item"><a class="page-link" href="sellerMessageRest.me?counseling=${ loginUser.userNo }&currentPage=${ pi.currentPage-1 }">Previous</a></li>
		            	</c:otherwise>
		            </c:choose>
		            
		            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		            	<c:choose>
		            		<c:when test="${ p eq pi.currentPage }">
		             			<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
		             		</c:when>
		             		<c:otherwise>
		             			<li class="page-item"><a class="page-link" href="sellerMessageRest.me?counseling=${ loginUser.userNo }&currentPage=${ p }">${ p }</a></li>
		            		</c:otherwise>
		            	</c:choose>
		            </c:forEach>
		            <c:choose>
		            	<c:when test="${ pi.currentPage eq pi.maxPage }">
		             	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		             </c:when>
		             <c:otherwise>
		             	<li class="page-item"><a class="page-link" href="sellerMessageRest.me?counseling=${ loginUser.userNo }&currentPage=${ pi.currentPage+1 }">Next</a></li>
		            	</c:otherwise>
		            </c:choose>
		        </ul>
		    </div>
            <br clear="both"><br>
        </div>
        <br><br>
    </div>
</body>
</html>
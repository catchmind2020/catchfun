<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    
<style>
/* 서브메뉴 영역 CSS */
a{color:black;  text-decoration:none !important }
a:hover{color:#28d7d7;  text-decoration:none !important }
.submenu{width:140px; font-size:15px; font-weight: 900; display:table-cell; padding-top:10px; padding-bottom: 20px;}
.submenu:hover { color:#28d7d7; cursor: pointer;}
.choice{border-bottom: 3px solid rgb(31, 205, 211); padding-bottom: 5px;}
#hr{width:auto; margin:0px; color:gray; margin-top:-10px;}


.content{ width:800px; margin:auto;}
.innerOuter{
    width:800px;
    margin:auto;
    background:white; }

        #boardList{text-align: center;}
        #boardList>tbody>tr:hover{cursor:pointer; background-color: rgb(179, 230, 253);}

		#pagingArea{width:fit-content;margin:auto;}
       
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
        .searchBtn{Width:15%; background-color:cornflowerblue;}



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
        background-color: rgb(158, 221, 250);
        border-radius: 5px;
        }

        #boardList{
        margin-top: 50px;
        
        }

        #Writing_btn{
        margin-top: 50px;
           width: 100px;
           height: 30px;
        }
        .button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 3px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 15px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
        height: 35px;
        }

        
        .button4 {
        background-color: white;
        color: black;
        border: 2px solid #e7e7e7;
        margin-top: 10px;
        float: right;
        }

        .button4:hover {background-color: #e7e7e7;}

        
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<br><br><br>
    
    <!-- 서브메뉴 영역 -->
    <div align="center" style="height:60px;">
        <div class="submenu" id="notice"><a href="list.no?currentPage=1">공지사항</a></div>
        <div class="submenu" id="guide"><a href="guide.gu">이용가이드</a></div>
        <div class="submenu choice" id="question"><a href="list.cq?currentPage=1">캐치펀 1:1문의</a></div>
    </div>
 		<hr id="hr">
    <div class="content">
        <br>
        <div class="innerOuter" style="padding:5% 10%;">
            <table id="boardList" class="table table-hover" align="center">
            <c:if test="${ !empty loginUser }">
                <button class="button button4" onclick="location.href='enrollForm.cq'">글쓰기</button>
            </c:if>
                <thead>
                  <tr>
                  	<th>글번호</th>
                    <th rowspan="2">제목</th>
                    <th>작성일</th>
                    <th>답변상태</th>
                  </tr>
                </thead>
                <tbody>
                <c:if test="${ !empty loginUser }">
	            <c:forEach items="${ list }" var="q">
	                    <tr>
	                    	<%-- <td>${ q.cqWriter }</td> --%>
	                        <td>${ q.cqNo }</td>
	                        <td>${ q.cqTitle }</td>
	                        <td>${ q.cqDate }</td>
	                        <c:choose>
	                        	<c:when test="${ q.cqYn eq 'N' }">
	                        		<td>답변대기</td>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<td>답변완료</td>
	                        	</c:otherwise>
	                        </c:choose>
                        </tr>
				</c:forEach>
				</c:if>
				</tbody>
            </table>
            
            
             <script>
            	$(function(){
            		$("#boardList tbody tr").click(function(){
            			location.href = "detail.cq?qno=" + $(this).children().eq(0).text();
            		});
            	});
            </script>
            
            <br>

                 <div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
	                    </c:when>
	                    <c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="list.cq?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="list.cq?currentPage=${ p }">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.cq?currentPage=${ pi.currentPage+1 }">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div>
           
           
            <br clear="both"><br>

            <br><br>
        </div>
        <br><br>
    </div>
    
</body>
</html>
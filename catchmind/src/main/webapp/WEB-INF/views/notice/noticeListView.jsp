<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>

/* 서브메뉴 영역 CSS */
a{color:black;  text-decoration:none !important }
a:hover{color:#28d7d7;  text-decoration:none !important }
.submenu{width:140px; font-size:15px; font-weight: 900; display:table-cell; padding-top:10px; padding-bottom: 20px;}
.submenu:hover { color:#28d7d7; cursor: pointer;}
.choice{border-bottom: 3px solid rgb(31, 205, 211); padding-bottom: 5px;}
#hr{width:auto; margin:0px; color:gray; margin-top:-10px;}


/* 게시판 css*/
.content{ width:800px; margin:auto;}
.innerOuter{
    width:800px;
    margin:auto;
    background:white; }

#boardList{text-align: center;}
#boardList>tbody>tr:hover{cursor:pointer; background-color: rgb(179, 230, 253);}
#searchForm{width:80%; margin:auto;}
#searchForm>*{float:left;margin:5px;}
#pagingArea{width:fit-content;margin:auto;}
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
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
        height: 50px;
        }

        
        .button4 {
        background-color: white;
        color: black;
        border: 2px solid #e7e7e7;
        margin-top: 20px;
        float: right;
        }

        .button4:hover {background-color: #e7e7e7;}
        
        

</style>
<body>
<jsp:include page="../common/menubar.jsp" />
	<br><br><br>
    
    <!-- 서브메뉴 영역 -->
    <div align="center" style="height:60px;">
        <div class="submenu choice" id="notice"><a href="list.no?currentPage=1">공지사항</a></div>
        <div class="submenu" id="guide"><a href="guide.gu">이용가이드</a></div>
        <div class="submenu" id="question"><a href="list.cq?currentPage=1">캐치펀 1:1문의</a></div>
    </div>
 		<hr id="hr">
 
 
    <div class="content">
        <br>
        <div class="innerOuter">
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${ list }" var="n">
	                    <tr>
	                        <td>${ n.noticeNo }</td>
	                        <td>${ n.noticeTitle }</td>
	                        <td>${ n.noticeWriter }</td>
	                        <td>${ n.noticeDate }</td>
	                        <td>${ n.noticeCount }</td>
                        </tr>
				</c:forEach>
				</tbody>
            </table>
            <br>
            
            <script>
            	$(function(){
            		$("#boardList tbody tr").click(function(){
            			location.href = "detail.no?nno=" + $(this).children().eq(0).text();
            		});
            	});
            </script>
            

                <div id="pagingArea">
                <ul class="pagination" align="center">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
	                    </c:when>
	                    <c:otherwise>
	                   		<li class="page-item"><a class="page-link" href="list.no?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="list.no?currentPage=${ p }">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    </c:when>
	                    <c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="list.no?currentPage=${ pi.currentPage+1 }">Next</a></li>
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
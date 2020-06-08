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
 /* 메뉴바 영역 */
.header-area {width: 1200px; margin-left: 40px; color: gray; padding-top: 10px; margin-top: 20px; margin-bottom: 10px;
	top: 0; right: 0; bottom: 0; left: 0; margin: auto;
}

/* 메뉴 */
.header { display: table-cell; /* width:200px; */ padding-right: 40px; height: 35px; text-align: center; vertical-align: bottom;
	font-size: 25px; font-weight: 900; color: black; }

/* 폰트 초기화*/
body, input, textarea, select, button, table {
    font-family: 'Nanum Gothic',  'Noto Sans KR', 'Malgun Gothic','맑은 고딕', 'dotum','돋움',sans-serif; 
    color: #222; font-size: 18px; line-height: 1.5;} 

/* 로그인 부분*/
.login {
	position: relative;
	bottom:-6px;
	display: table-cell;
	font-size: 15px;
	color: gray;
	padding-left: 220px;
	padding-right: 0px;
}
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

        #pagingArea{width:100%; margin:auto; text-align: center;}
       
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
    </style>
</head>
<body>
    <div id="header">
            
        <div class="header-area">
            <div class="header">
                <img src="<%=request.getContextPath() %>/resources/images/catchfun_logo.png">
            </div>
            <div class="header">카테고리</div>
            <div class="header">오픈예정</div>
            <div class="header">프로젝트오픈</div>
            <div class="header">공지</div>
            <div class="header"></div>
            <div class="header login">
            <img src="<%=request.getContextPath() %>/resources/images/bellicon32.png">&nbsp;&nbsp;&nbsp;&nbsp;
            <img src="<%=request.getContextPath() %>/resources/images/usericon32.png"></div>
    
        </div>
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>메세지함</h2>
            <c:if test="${ loginUser.userType eq 2 }" >
            	<button><a href="sellerMessageRest.me?counseling=${ loginUser.userNo }&currentPage=1">프로젝트개설자 메세지함</a></button>
            </c:if>
            <table id="questionList" class="table table-hover" align="center">
                <thead>
                  <tr>
                  	<th>글번호</th>
                    <th>제목</th>
                    <th>보낸사람</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
	                <c:forEach items="${ list }" var="q">
	                    <tr>
	                    	<td>${ q.questionNo }</td>
							<td>${ q.questionTitle }</td>
							<td>${ q.userId }</td>
							<td>${ q.questionDate }</td>
	                    </tr>
                    </c:forEach>
                 </tbody>
            </table>
            <br>
            <script>
             	$(function(){
             		$("#questionList tbody tr").click(function(){
             			location.href = "messageView2.me?qno=" + $(this).children().eq(0).text();
             			
             		});
             	});
             </script>
            
             <div id="pagingArea">
		        <ul class="pagination">
		        	
		        	 <c:choose>
		        		<c:when test="${ pi.currentPage eq 1 }">
		             		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
		             	</c:when>
		             	<c:otherwise>
		            		<li class="page-item"><a class="page-link" href="MessageRest.me?userNo=${ loginUser.userNo }&currentPage=${ pi.currentPage-1 }">Previous</a></li>
		            	</c:otherwise>
		            </c:choose>
		            
		            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		            	<c:choose>
		            		<c:when test="${ p eq pi.currentPage }">
		             			<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
		             		</c:when>
		             		<c:otherwise>
		             			<li class="page-item"><a class="page-link" href="MessageRest.me?userNo=${ loginUser.userNo }&currentPage=${ p }">${ p }</a></li>
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

            <form id="searchForm" action="" method="Get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">보낸사람</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
        </div>
        <br><br>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<style>
	  .outer {
		text-align: left;
		/* padding: 70px; */
	
		margin-left: 250px;
		margin-top: 50px;
		min-width: 1050px;
	}
	.tb{
		text-align: center;
	  
	 
	}
	
	#blackList{
	  display:none;
	}
	.mybtn {
	
		background:linear-gradient(to bottom, #79bbff 5%, #378de5 100%);
		background-color:#79bbff;
		border-radius:5px;
		border:1px solid #337bc4;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:14px;
		font-weight:bold;
		padding:5px 15px;
		text-decoration:none;
	
	}
	.mybtn:hover {
		background:linear-gradient(to bottom, #378de5 5%, #79bbff 100%);
		background-color:#378de5;
	}
	.mybtn:active {
		position:relative;
		top:1px;
	}
	</style>
</head>
<body>
<jsp:include page="../common/admin.jsp"/>

<div class="outer">
  <h2>회원관리</h2><br>
  <button class="mybtn" onclick="member();">회원</button>&nbsp;<button class="mybtn" onclick="blackList();">블랙리스트</button><br>
  <br><br>

    <!-- 블랙리스트 -->
    <div id="blackList"> 
      <form action="bsearch.ad" method="POST">
        <div class="k_btn">
          <input type="text" name="keyword" placeholder="키워드 입력"> <button class="mybtn" type="submit">조회</button>
          <input type="hidden" name="currentPage" value="1">
        </div>
        <br>
        회원 수 : <input type="text" style="border: unset;" value="${ pi.listCount }">
        <br>
      </form>
      <br>
          <table class="tb" border="1">
            <thead>
                <tr>
                    <th width="100px">회원번호</th>
                    <th width="200px">아이디</th> 
                    <th width="100px">구분</th>
                    <th width="330px">신고내용</th>
                    <th width="150px">제제일자</th>
                    <th width="120px">상태</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${ blist }" var="b">
	                <tr>
	                    <td>${ b.userNo }</td>
	                    <td>${ b.userId }</td>
	                    <td>${ b.userType }</td>
	                    <td>그냥그냥</td>
	                    <td>2020-05-24</td>
	                    <td>${ b.status }</td>
	                </tr>
                </c:forEach>
              
            </tbody>
        </table> 
            <br><br>
          	<div id="pagingArea">
		        <ul class="pagination">
		        	
		        	 <c:choose>
		        		<c:when test="${ pi.currentPage eq 1 }">
		             	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
		             </c:when>
		             <c:otherwise>
		            		<li class="page-item"><a class="page-link" href="msearch.ad?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		            	</c:otherwise>
		            </c:choose>
		            
		            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		            	<c:choose>
		            		<c:when test="${ p eq pi.currentPage }">
		             		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
		             	</c:when>
		             	<c:otherwise>
		             		<li class="page-item"><a class="page-link" href="msearch.ad?currentPage=${ p }">${ p }</a></li>
		            		</c:otherwise>
		            	</c:choose>
		            </c:forEach>
		            
		            <c:choose>
		            	<c:when test="${ pi.currentPage eq pi.maxPage }">
		             	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		             </c:when>
		             <c:otherwise>
		             	<li class="page-item"><a class="page-link" href="msearch.ad?currentPage=${ pi.currentPage+1 }">Next</a></li>
		            	</c:otherwise>
		            </c:choose>
		        </ul>
		    </div>   
    </div>    
    
  
  </div>
 

</body>
</html>
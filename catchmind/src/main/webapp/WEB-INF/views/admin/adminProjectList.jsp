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
	#pagingArea{
		width:500px;
		padding-left:550px;
	}
	</style>
</head>
<body>
<jsp:include page="../common/admin.jsp"/>

<div class="outer">
  <h2>프로젝트 리스트</h2><br>
  <br>

    <div id="projectList"> 
      <form action="projectSearch.ad" method="POST">
        	<input type="hidden" name="currentPage" value="1">
        			<select name="proCategory">
	        			<option value="E">승인요청</option>
	                	<option value="B">수정요청</option>
        		    </select> <button type="submit">조회</button><br>
   	  </form>
   	  
        <br>
        프로젝트 수 : <input type="text" style="border: unset;" value="${ pi.listCount }" readonly>
        <br>
      <br>
          <table class="tb" border="1">
            <thead>
                <tr>
                    <th width="150px">프로젝트 번호</th>
                    <th width="150px">프로젝트 명</th>
                    <th width="200px">아이디</th> 
                    <th width="100px">목표액</th>
                    <th width="120px">시작일</th>
                    <th width="120px">종료일</th>
                    <th width="150px">프로젝트타입</th>
                    <th width="120px">상태</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${ plist }" var="p">
	                <tr>
	                    <td>${ p.projectNumber }</td>
	                    <td>${ p.projectName }</td>
	                    <td>${ p.userId }</td>
	                    <td>${ p.projectTargetAmount }</td>
	                    <td>${ p.projectStartDate }</td>
	                    <td>${ p.projectFinishDate }</td>
	                    <td>${ p.projectCategory }</td>
	                    <td>
	                    <c:choose>
	                    	<c:when test="${ p.projectStatus eq 'B'}">수정요청</c:when>
	                    	<c:when test="${ p.projectStatus eq 'E'}">등록요청</c:when>
	                    </c:choose>
	                    </td>	
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
		            		<li class="page-item"><a class="page-link" href="proejectList.ad?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		            	</c:otherwise>
		            </c:choose>
		            
		            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		            	<c:choose>
		            		<c:when test="${ p eq pi.currentPage }">
		             		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
		             	</c:when>
		             	<c:otherwise>
		             		<li class="page-item"><a class="page-link" href="projectList.ad?currentPage=${ p }">${ p }</a></li>
		            		</c:otherwise>
		            	</c:choose>
		            </c:forEach>
		            
		            <c:choose>
		            	<c:when test="${ pi.currentPage eq pi.maxPage }">
		             	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		             </c:when>
		             <c:otherwise>
		             	<li class="page-item"><a class="page-link" href="projectList.ad?currentPage=${ pi.currentPage+1 }">Next</a></li>
		            	</c:otherwise>
		            </c:choose>
		        </ul>
		    </div>   
    </div>    
    
  
  </div>
      <script>
   		$(function(){
   			$(".tb>tbody>tr").click(function(){
	   				
	   			var pno = $(this).children().eq(0).text();
	   			// 프로젝트 번호 밸류값이 넘어감  projectDetail로
	   			location.href="projectDetail.ad?pno=" + pno; 
 			});
 
   		});   
   	  </script>
 

  
</body>
</html>
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
	#pagingArea{
		width:800px;
		padding-left:400px;
	}
	</style>
</head>
<body>
<jsp:include page="../common/admin.jsp"/>

<div class="outer">
  <h2>회원리스트</h2><br>
  <br>
  <!-- 회원리스트 -->
    <div id="member">
      <form action="msearch.ad" method="POST">
        <div class="k_btn">
          <input type="text" name="keyword" placeholder="키워드 입력"> <button type="submit" class="mybtn">조회</button>
          <input type="hidden" name="currentPage" value="1">
        </div>
        <br>
      </form>
        회원 수 : <input type="text" style="border: unset;" value="${ pi.listCount }" readonly>
      <br>
      
        <table class="tb" border="1">
          <thead>
	          <tr>
	            
	            <th width="100px">회원번호</th>
	            <th width="200px">아이디</th>
	            <th width="100px">구분</th>
	            <th width="100px">회원명</th>
	            <th width="150px">연락처</th>
	            <th width="150px">이메일</th>
	            <th width="100px">포인트</th>
	            <th width="120px">가입일</th>
	            <th width="100px">변경</th>
	            <th width="50px">버튼</th>
	          </tr>
	      </thead>
	      <tbody> 
			<c:forEach items="${ mlist }" var="m">       
	          <tr>
	            <td>${ m.userNo }</td>
	            <td>${ m.userId }</td>
	            <td>
	            <c:choose>
	            	<c:when test="${ m.userType eq '1'}">일반회원</c:when>
	            	<c:when test="${ m.userType eq '2'}">프로잭트회원(등록전)</c:when>
	            	<c:when test="${ m.userType eq '3'}">프로잭트회원(등록후)</c:when>
	            	<c:when test="${ m.userType eq '4'}">관리자</c:when>
	            </c:choose>	
	            </td>
	            <td>${ m.userName }</td>
	            <td>${ m.phone }</td>
	            <td>${ m.email }</td>
	            <td>${ m.userPoint }</td>
	            <td>${ m.userEnrolldate }</td>
	            <form action="adMemberSelect.ad" method="POST">
		            <input type="hidden" name="currentPage" value="1">
		            <input type="hidden" name="userNo" value="${ m.userNo }">
		            <td>
		                <select name="status">
		                  <option value="Y">활동회원</option>
		                  <option value="B">블랙리스트</option>
		                </select>
	      	        </td>
	      	        <td><input class="mybtn" type="submit" value="변경"></td>
	            </form>
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
		            		<li class="page-item"><a class="page-link" href="member.ad?currentPage=${ pi.currentPage-1 }">Previous</a></li>
		            	</c:otherwise>
		            </c:choose>
		            
		            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		            	<c:choose>
		            		<c:when test="${ p eq pi.currentPage }">
		             		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
		             	</c:when>
		             	<c:otherwise>
		             		<li class="page-item"><a class="page-link" href="member.ad?currentPage=${ p }">${ p }</a></li>
		            		</c:otherwise>
		            	</c:choose>
		            </c:forEach>
		            
		            <c:choose>
		            	<c:when test="${ pi.currentPage eq pi.maxPage }">
		             	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
		             </c:when>
		             <c:otherwise>
		             	<li class="page-item"><a class="page-link" href="member.ad?currentPage=${ pi.currentPage+1 }">Next</a></li>
		            	</c:otherwise>
		            </c:choose>
		        </ul>
		    </div>
    </div> 

      
  
 

  
</body>
</html>
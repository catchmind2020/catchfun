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
		width:800px;
		padding-left:250px;
	  }

</style>
</head>
<body>
 
<jsp:include page="../common/admin.jsp"/>
<div class="outer">
  <h2>댓글 신고관리</h2><br>
  <br>
      <!-- 댓글신고 -->
      <div id="userReport">
          <form action="rSearch.ad" method="POST">
              <div class="k_btn">
                <input type="text" name="keyword" placeholder="키워드 입력"> <button class="mybtn" type="submit">조회</button>
                <input type="hidden" name="currentPage" value="1">
              </div>
              <br>
          </form>
              신고리스트 수 : <input type="text" style="border:unset" value="${ pi.listCount }" readonly>
          <br>
         	 <div class="report">
		          <table class="tb" border="1">
			          <thead>
			              <tr>
			                
			                <th width="100px">댓글번호</th>
			                <th width="200px">아이디</th>
			                <th width="100px">구분</th>
			                <th width="100px">회원명</th>
			                <th width="150px">연락처</th>
			                <th width="150px">이메일</th>                  
			                <th width="150px">가입일</th>
			                <th width="100px">신고수</th>
			              </tr>
		              </thead>
		              <tbody>
		              	<c:forEach items="${ rlist }" var="r">
				              <tr>
				                <td>${ r.replyNo }</td>
				                <td>${ r.userId }</td>
				                <td>
				                <c:choose>
			                    	<c:when test="${ r.userType eq '1'}">일반회원</c:when>
					            	<c:when test="${ r.userType eq '2'}">프로잭트회원(등록전)</c:when>
					            	<c:when test="${ r.userType eq '3'}">프로잭트회원(등록후)</c:when>
					            	<c:when test="${ r.userType eq '4'}">관리자</c:when>
			                    </c:choose>	
			                    </td>
				                <td>${ r.userName }</td>
				                <td>${ r.phone }</td>
				                <td>${ r.email }</td>                 
				                <td>${ r.userEnrolldate }</td>
				                <td>${ r.replyBanCount }</td>
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
			            		<li class="page-item"><a class="page-link" href="rSearch.ad?currentPage=${ pi.currentPage-1 }">Previous</a></li>
			            	</c:otherwise>
			            </c:choose>
			            
			            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            	<c:choose>
			            		<c:when test="${ p eq pi.currentPage }">
			             		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
			             	</c:when>
			             	<c:otherwise>
			             		<li class="page-item"><a class="page-link" href="rSearch.ad?currentPage=${ p }">${ p }</a></li>
			            		</c:otherwise>
			            	</c:choose>
			            </c:forEach>
			            
			            <c:choose>
			            	<c:when test="${ pi.currentPage eq pi.maxPage }">
			             	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
			             </c:when>
			             <c:otherwise>
			             	<li class="page-item"><a class="page-link" href="rSearch.ad?currentPage=${ pi.currentPage+1 }">Next</a></li>
			            	</c:otherwise>
			            </c:choose>
			        </ul>
			    </div>
            </div>
      </div>  

</div>
    <script>
   		$(function(){
   			$(".tb>tbody>tr").click(function(){
   				// console.log("클릭");
	   				
	   			var rd = $(this).children().eq(0).text();
	   			// 상품코드 밸류값이 넘어감 
	   			
	 			location.href="reportDetail.ad?rd=" + rd; 
 			});
 
   		});   
    </script>


</body>
</html>
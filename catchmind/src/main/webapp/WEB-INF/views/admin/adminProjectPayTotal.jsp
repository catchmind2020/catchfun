<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer {
	text-align: center;
	/* padding: 70px; */
	margin-left: 250px;
	margin-top: 50px;
	min-width: 1050px;
}
.tb tr{
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../common/admin.jsp"/>
	
	<div class="outer">
	<h2>결제내역 리스트(입금대기)</h2><br>
	<label>결제를 관리합니다.</label><br>
	
	
	<div class="k_btn">
		<input type="text" name="keyword" placeholder="아이디 입력"> <button type="button">조회</button>
	</div>
	<br>
	입금대기 수 : ${ payListCount } 개
	<br><br>

	<div>
		<center>
			<table class="tb" border="1">
				<thead>
					<tr>
						<th width="200px">프로젝트명</th>
						<th width="150px">등록자ID</th>
						<th width="130px">목표액</th>
						<th width="150px">펀딩액(달성률)</th>
						<th width="150px">종료일</th>
						<th width="100px">카테고리</th>
						<th width="150px">포인트 예상금액(93%)</th>
						<th width="150px">포인트 발급 상태</th>
						<th width="100px">발급(버튼)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ payList }" var="p">
	                    <tr>
	                    	<td style="display: none"><fmt:formatNumber value="${ p.total * 0.93 }" pattern="###" /></td>
	                    	<td style="display: none"><fmt:formatNumber value="${ p.total * 0.07 }" pattern="###" /></td>
	                    	<td style="display: none">${p.projectNumber}</td>
							<td>${ p.projectName }</td>
							<td>${ p.userId }</td>
							<td><fmt:formatNumber value="${ p.projectTargetAmount }" pattern="#,###" />원</td>
							<td><fmt:formatNumber value="${ p.total }" pattern="#,###" />원(<fmt:formatNumber type="percent" value="${ p.total/p.projectTargetAmount }"  pattern="0%"/>)</td>
							<td>${ p.projectFinishDate }</td>
							<td>${ p.categoryName }</td>
							<td><fmt:formatNumber value="${ p.total * 0.93 }" pattern="#,###" />원</td>
							<c:choose>
								<c:when test="${ p.totalStatus eq 'N'}">
									<td>미발급</td>
									<td><button type="button" class="mBtn">발급하기</button></td>
								</c:when>
								<c:otherwise>
									<td>발급</td>
									<td><button type="button" class="mBtn" disabled="disabled">발급하기</button></td>
								</c:otherwise>
							</c:choose>
	                    </tr>
                    </c:forEach>
				</tbody>
			</table>
		</center>
	</div>
	<br><br>
	<div id="pagingArea">
        <ul class="pagination">
        	
        	 <c:choose>
        		<c:when test="${ pi.currentPage eq 1 }">
             	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>     
             </c:when>
             <c:otherwise>
            		<li class="page-item"><a class="page-link" href="adminProjectPayTotal.ad?currentPage=${ pi.currentPage-1 }">Previous</a></li>
            	</c:otherwise>
            </c:choose>
            
            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            	<c:choose>
            		<c:when test="${ p eq pi.currentPage }">
             		<li class="page-item disabled"><a class="page-link" href="#">${ p }</a></li>
             	</c:when>
             	<c:otherwise>
             		<li class="page-item"><a class="page-link" href="adminProjectPayTotal.ad?currentPage=${ p }">${ p }</a></li>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            
            <c:choose>
            	<c:when test="${ pi.currentPage eq pi.maxPage }">
             	<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
             </c:when>
             <c:otherwise>
             	<li class="page-item"><a class="page-link" href="adminProjectPayTotal.ad?currentPage=${ pi.currentPage+1 }">Next</a></li>
            	</c:otherwise>
            </c:choose>
        </ul>
    </div>

	<script>
		$(".mBtn").click(function(){
			var projectPay = $(this).parent().parent().children().eq(0).text();
			var adminPay = $(this).parent().parent().children().eq(1).text();
			var projectNumber = $(this).parent().parent().children().eq(2).text();
			var projectId = $(this).parent().parent().children().eq(4).text();
			
			/* ajax 시작 */
			$.ajax({
    			url:"adminProjectPayUpdate.ad",
    			data:{projectPay:projectPay,
    				  adminPay:adminPay,
    				  projectNumber:projectNumber,
    				  userId:projectId},
    			success:function(status){
    				if(status == "success"){
   						alert("발급성공!");
    					location.href="<%=request.getContextPath()%>/adminProjectPayTotal.ad?currentPage=1"
					}else{
						alert("발급실패!");
					}
    			},error:function(){
    				console.log("Pay지급 ajax 통신실패!!");	
    			}
    		});
			
			/* ajax 끝 */
			
		});
	</script>
	
</body>
</html>
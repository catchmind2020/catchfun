<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>마이페이지_메인</title>


<style>
/* 탭 css */
body {
    color: #555;
    /* background: #eeeeee; */
    margin:0;
    padding: 0;
    box-sizing: border-box;}


p {
    margin: 0 0 20px;
    line-height: 1.5;}

.main {
    min-width: 320px;
    max-width: 800px;
    padding: 50px;
    margin: 0 auto;
    background: #ffffff;}

section {
    display: none;
    padding: 20px 0 0;
    border-top: 1px solid #ddd;}

/*라디오버튼 숨김*/
#tab1,#tab2 {
      display: none;}

label {
    display: inline-block;
    margin: 0 0 -1px;
    padding: 15px 25px;
    font-weight: 600;
    text-align: center;
    color: #bbb;
    border: 1px solid transparent;}

label:hover {
    color: #2e9cdf;
    cursor: pointer;}

/*input 클릭시, label 스타일*/
input:checked + label {
      color: #555;
      border: 1px solid #ddd;
      border-top: 2px solid #2e9cdf;
      border-bottom: 1px solid #ffffff;}

#tab1:checked ~ #content1,
#tab2:checked ~ #content2,
#tab3:checked ~ #content3,
#tab4:checked ~ #content4 {
    display: block;}
/* 탭 css 끝 */


.wrap {
	width: 1000px;
	height: 1000px;
	margin: auto;
	text-align: center;
	/* font-size: 30px; */
	color: black;
}
.wrap>#header {
	width: 100%;
	height: 5%;
	margin-bottom: 60px;
}

.wrap>#content {
	width: 100%;
	height: 70%;
}

.wrap>#content>#content_1 {
	width: 100%;
	height: 25%;
	border: 0.05px solid grey;
	margin-bottom: 10px;
}

.wrap>#content>#content_2 {
	width: 100%;
	height: 75%;
	font-size: 15px;
	background-color: rgb(243, 242, 242);
}

.wrap>#content>#content_1>table {
	width: 40%;
	height: 100%;
	padding: 20px;
	font-size: 15px;
}

.wrap>#footer {
	width: 100%;
	height: 20%;
}

#myFunding{
	border: 1px solid black;
	text-align: center;
	margin: auto;
	padding: 20px;
}
#myFunding thead{ border-collapse: collapse; }
#myFunding th{
	border-bottom: 1px solid black;
	padding-bottom: 10px;
}
#myFunding td{padding: 10px;}

#wishList img {
   width: 370px;
   height: 200px;
   margin:0px;
}


</style>
<!-- wrap>#content>#content_2>.w3-row2{width:100%; height:100%; overflow: scroll;} -->
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->

</head>
<body>

<jsp:include page="../common/menubar.jsp" />



	<div class="wrap">
		<div id="header">
			
		</div>



		<div id="content">
			<div id="content_1">
				<table>
					<tr>
						<td style="font-size: 40px;"><strong>${ loginUser.userName }님</strong></td>
						<td style="font-size: 20px;">참여한펀딩</td>
						<td></td>
					</tr>
					<tr>
						<td style="font-size: 13px; color: gray;">개인회원</td>
						<td style="font-size: 25px;">${ fl.size() }회</td>
						<td></td>
					</tr>
					<tr>
						<td>
							<button class="w3-btn w3-white w3-border w3-round-large">프로필변경</button>
						</td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>


	
	
	<div class="main">
	    <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
	    <label for="tab1">참여한 펀딩</label>
	
	    <input id="tab2" type="radio" name="tabs">
	    <label for="tab2">찜한 펀딩</label>
	
	
	    <section id="content1">
			
			<h2>참여한펀딩</h2>
						
			<table id="myFunding">
				<thead>
					<tr>
						<th width="50px">번호</th>
						<th width="100px">카테고리</th>
						<th width="300px">프로젝트명</th>	
						<th width="100px">펀딩액</th>
						<th width="120px">프로젝트 마감일</th>		
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ fl }" var ="f" varStatus="status">
						<tr>
							<input type="hidden" value="${ f.projectNumber }" >	
							<td>${ status.count }</td>
							<td>${ f.categoryName }</td>
							<td>${ f.projectName }</td>	
							<td>${ f.total }</td>
							<td>${ f.projectFinishDate }</td>		
						</tr>
					</c:forEach>
				</tbody>
			</table>

	    </section>
	
	
	
	
	    <section id="content2">
	        
	        <h2>찜한 펀딩</h2>
	        
	        <div id="wishList" style="display: inline-block;">
	        
				<c:forEach items="${ myWish }" var="w">
					<div style="display: inline-block; margin-right: 20px;">
						<img src="${pageContext.servletContext.contextPath}/resources/uploadFiles/${ w.changeName }"><br>
						${ w.projectName }<br>
						${ w.projectCategoryName } | ${ w.makerName }<br>
					</div>
                 </c:forEach>
                 
            </div>
	                    
	                    
	    </section>
	
	</div>
	
	
	
	
	<script>
		$("#myFunding tbody tr").click(function(){
			
			var pno = $(this).children().eq(0).val();
			console.log(pno);
			location.href="selectPayDetail.pro?pno=" + pno;
		});
		
		/* $("#tab2").click(function(){
			
			location.href="myWish.me";
		}); */
	
	</script>

	<jsp:include page="../common/footer.jsp" />
	
</body>


</html>
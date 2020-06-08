<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>

<%



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin-Envent</title>
<style>
.area {
	width: 300px;
	height: 100px;
	font-size: 50px;
	color: black;
	background-color: white;
	border: 1px solid black;
	position: absolute;
}

.question {
	font-size: 30px;
	color: blue;
}

.questiontext {
	width: 700px;
	height: 100px;
}

.questioninput {
	width: 700px;
	height: 35px;
}

.grey {
	font-size: 15px;
	color: grey;
}

.answer {
	font-size: 22px;
	color: green;
}

.outer {
	min-width: 1800px;
}

.black {
	color: black;
	font-size: 15px;
}

.blacktool {
	width: 700px;
	height: 120px;
	background-color: white;
	border: 1px solid black;
	font-size: 15px;
	color: black;
}
</style>
</head>

<body>
	<%@ include file="../menubarIm.jsp"%>

<hr>
	<div class="outer">
	
		<form style="margin-left: 13%;">
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">새소식</h1><br><br>
	</div>
			<!-- Begin table  -->
			<div class="Memtable">
				<div style="float: left;">
					<button class="btn btn-primary btn-sm" onclick="location.href='<%=contextPath%>/adEnrollForm.ev';">등록</button>
					<button class="btn btn-primary btn-sm">수정</button>
					<button class="btn btn-primary btn-sm">삭제</button>
				</div>
				<br> <br>

				<table class="table table-bordered table-hover table-sm"
					style="width:1300px; height: 500px;" cellspacing="0">
					<thead>
						<tr>
							<th width="50px;" style="text-align: center;">
								<div class="">
									<label><input class="checkbox " type="checkbox" name=""
										value=""
										style="vertical-align: middle; transform: scale(1.4);"
										disabled></label>
								</div>
							</th>
							<th width="70px">번호</th>
							<th width="300px">제목</th>
							<th width="100px">날짜</th>
						
						</tr>
					</thead>
					<tbody>


						<% if (list.isEmpty()) { // 리스트가 비어있을 경우 %>
						<tr>
							<td colspan="6">존재하는 이벤트가 없습니다.</td>
						</tr>
						<% } else { // 리스트가 비어있지 않을 경우 %>

						<% for (Event e : list) { %>
						<tr>
							<td class="firsttd" style="text-align: center;"><div
									class="">
									<label><input class="checkbox " type="checkbox" name=""
										value=""
										style="vertical-align: middle; transform: scale(1.4);"></label>
								</div></td>
							<td><%=e.getEventNum()%></td>
							<td><%=e.getEventType()%></td>
							<td><%=e.getEventTitle()%></td>
					
						</tr>
							<% } %>
						<% } %>

					</tbody>
				</table>

			<div class="pagingArea" align="center">

						<%
							if (currentPage != 1) {
						%>

						<!-- 맨 처음으로(<<) -->
						<button onclick="location.href='adList.ev?currentPage=1';">&lt;&lt;</button>

						<!-- 이전페이지(<) -->
						<button
							onclick="location.href='adList.ev?currentPage=<%=currentPage - 1%>';">&lt;</button>

						<%
							}
						%>

						<%
							for (int p = startPage; p <= endPage; p++) {
						%>
						<%
							if (currentPage != p) {
						%>
						<button onclick="location.href='adList.ev?currentPage=<%=p%>';"><%=p%></button>
						<%
							} else {
						%>
						<button disabled><%=p%></button>
						<%
							}
						%>
						<%
							}
						%>

						<%
							if (currentPage != maxPage) {
						%>

						<!-- 이전페이지(<) -->
						<button
							onclick="location.href='adList.ev?currentPage=<%=currentPage + 1%>';">&gt;</button>
						<!-- 맨 마지막으로(>>) -->
						<button
							onclick="location.href='adList.ev?currentPage=<%=maxPage%>';">&gt;&gt;</button>

						<%
							}
						%>
					</div>
					<!-- 페이징끝  -->

				</div>
				
				</form>
				</div>
				<!-- /.container-fluid -->
		
	</section>	
	<script>
		$(function() {
			$("table>tbody>tr").click(function() {

				//console.log("클릭");

				// 현재 클릭했을 때의 해당 공지사항 번호
				var nno = $(this).children().eq(1).text();

				// 쿼리스트링을 이용해서 전달값 전달
				location.href = "<%=contextPath%>/adDetail.brno?nno=" + nno;
			});
		});
	</script>
</body>
</html>
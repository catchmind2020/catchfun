<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/admin/js/jquery-3.4.1.js"></script>
<script src="resources/admin/js/jquery-3.4.1.min.js"></script>

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
    <h2>매출통계</h2><br>
    <br>
   
      <div id="sales">
        <form action="salesSearch.ad" method="get">
          <div class="k_btn">
            <input type="date" name="sDate"> <button type="submit" class="mybtn">조회</button>
          </div>
          <br>
        </form>
        <br>
       
        <table id="sale1" border="1" style="text-align: center;">
            <tr style="font-size:25px;" >
                <th width="300">펀딩 결제 예약 금액</th>
                <th width="250">펀딩 건수</th>
                <th width="300">진행중인 프로젝트 수</th>
                <th width="250">종료된 프로젝트 수</th>
                <th width="300">오픈예정 프로젝트 수<br>(1주일 이내)</th>
            </tr>
            <tr style="font-size:40px">
                <td>52,320,000원</td>
                <td>120건</td>
                <td>420건</td>
                <td>13건</td>
                <td>50건</td>
            </tr>
        </table>

      </div> 

    

</body>
</html>
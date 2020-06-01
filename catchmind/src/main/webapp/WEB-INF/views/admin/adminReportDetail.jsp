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
#report1{
  border: 1px solid;
  width:700px;
  background-color: gray;
  color:white;
  padding-left: 15px;
  padding-top:15px;
  padding-bottom: 15px;
}

</style>
</head>
<body>
 <div class="outer">
    <h2>댓글 신고내용</h2><br>
     <div id="report1">   
      <table >
        <tr height="50">
          <th width="100">댓글 작성자 : </th>
          <td width="100">user01</td>
          <th width="90">신고자 ID : </th>
          <td width="100">관리자</td>
          <th width="90">신고날짜 : </th>
          <td width="100">2020-10-10</td>
       </tr>
       <tr>
          <th>댓글 내용</th>
          <td colspan="5"><textarea rows="4" cols="60" style="resize: none;">하하하하</textarea></td> 
       </tr>
       <tr>
          <th>신고자 내용</th>
          <td colspan="5"><textarea rows="4" cols="60" style="resize: none;"></textarea></td>
       </tr>
       <tr align="center">
         <th colspan="6">
           <form action="" method="POST">
              <input type="hidden" value="">
              <input type="submit" value="블랙리스트 등록">&nbsp;
              <input type="button" value="목록으로">
           </form> 
        </th>
       </tr>

      </table>
    </div>
  </div>
<!-- ---------------------------------------------------- -->
  <div class="outer">
    <h2>프로젝트 신고내용</h2><br>
     <div id="report1">   
      <table >
        <tr height="50">
          <th width="150">프로젝트 작성자 : </th>
          <td width="100">user01</td>
          <th width="90">신고자 ID : </th>
          <td width="100">관리자</td>
          <th width="90">신고날짜 : </th>
          <td width="100">2020-10-10</td>
       </tr>
       <tr>
          <th>프로젝트 내용</th>
          <td colspan="5"><textarea rows="4" cols="60" style="resize: none;">하하하하</textarea></td> 
       </tr>
       <tr>
          <th>신고자 내용</th>
          <td colspan="5"><textarea rows="4" cols="60" style="resize: none;"></textarea></td>
       </tr>
       <tr align="center">
         <th colspan="6">
           <form action="" method="POST">
              <input type="hidden" value="">
              <input type="submit" value="블랙리스트 등록">&nbsp;
              <input type="button" value="목록으로">
           </form> 
        </th>
       </tr>

      </table>
    </div>
  </div>
 
</body>
</html>
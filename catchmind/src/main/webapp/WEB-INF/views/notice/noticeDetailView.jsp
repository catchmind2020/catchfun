<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<style>
 

        /*버튼*/
    #btn {
        background-color: gray;
        border: none;
        color: white;
        padding: 6px 8px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        transition-duration: 0.4s;
        cursor: pointer;
        }

    #btn:hover {
        background-color: #28d7d7;
        color: white;
        }

.content{ width:800px; margin:auto;}
.innerOuter{
    width:800px;
    margin:auto;
    background:white; }


        table *{margin:5px;}
        table{width:100%;}
        
        /* 서브메뉴 영역 CSS */
.submenu>a{color:black;  text-decoration:none !important; }
.submenu>a:hover{color:#28d7d7;  text-decoration:none important!; }
.submenu{width:140px; font-size:15px; font-weight: 900; display:table-cell; padding-top:10px; padding-bottom: 20px;}
.submenu:hover { color:#28d7d7; cursor: pointer;}
.choice{border-bottom: 3px solid rgb(31, 205, 211); padding-bottom: 5px;}
#hr{width:auto; margin:0px; color:gray; margin-top:-10px;}
        
    </style>
<body>
<jsp:include page="../common/menubar.jsp" />
	<br><br><br>
    
    <!-- 서브메뉴 영역 -->
    <div align="center" style="height:60px;">
        <div class="submenu choice" id="notice"><a href="list.no?currentPage=1">공지사항</a></div>
        <div class="submenu" id="guide"><a href="guide.gu">이용가이드</a></div>
        <div class="submenu" id="question"><a href="list.cq?currentPage=1">캐치펀 1:1문의</a></div>
    </div>
 		<hr id="hr">
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="70px;">제목</th>
                    <td width="350px;">${ n.noticeTitle }</td>
               		<th width="70px;">작성일</th>
                    <td width="100px;">${ n.noticeDate }</td>
                </tr>

                <tr>
                    <td colspan="4"><p style="height:150px">${ n.noticeContent }</p></td>
                </tr>
            </table>
            <center>
            <input type=button id="btn" value="목록으로" onclick="location.href='${pageContext.servletContext.contextPath}/list.no?currentPage=1';">
            </center>
            <br>
			
			
 
        </div>
  
    </div>
</body>
</html>
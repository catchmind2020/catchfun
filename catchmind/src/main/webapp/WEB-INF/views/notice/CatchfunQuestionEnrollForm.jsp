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
    <title>Document</title>
    <style>


    .btn {
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

    .btn:hover {
        background-color: #28d7d7;
        color: white;
        }



.content{ width:800px; margin:auto;}
.innerOuter{
    width:800px;
    margin:auto;
    background:white; }

       textarea{
        width: 400px;
        height: 200px;
        padding-top:20px;
        padding-left:100px;
        padding-right:100px; 
        margin:0 auto;
        text-align:left;
        }

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
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<br><br><br>
    
    <!-- 서브메뉴 영역 -->
    <div align="center" style="height:60px;">
        <div class="submenu" id="notice"><a href="list.no?currentPage=1">공지사항</a></div>
        <div class="submenu" id="guide"><a href="guide.gu">이용가이드</a></div>
        <div class="submenu choice" id="question"><a href="list.cq?currentPage=1">캐치펀 1:1문의</a></div>
    </div>
 		<hr id="hr">
 		
<div class="content">
        <br><br><br>
        <div class="innerOuter">
		<form action="insert.cq" method="post">
            <table id="contentArea" align="center" class="table">
                <tr>
                    <td colspan="3"><input type="text" id="cqTitle" class="form-control" name="cqTitle" placeholder="문의 제목을 입력해주세요"></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <textarea class="form-control" name="cqContent" id="cqContent" rows="10" style="resize:none;" placeholder="문의 내용을 입력해주세요"></textarea>
                    </td>
                </tr>
            </table>
            <center>
                <button type="button" class="btn" onClick="history.back();">취소하기</button>&nbsp;&nbsp;
                <button type="submit" class="btn">문의하기</button>
            </center>
            <br>
</form>

 
        </div>
        <br><br>
    </div>
</body>
</html>
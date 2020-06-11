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

        /*버튼*/
    .button {
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        padding: 3px 32px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        transition-duration: 0.4s;
        cursor: pointer;
        height: 50px;
        }

    .button2 {
        background-color: white; 
        color: black; 
        border: 2px solid #008CBA;
        }

    .button2:hover {
        background-color: #008CBA;
        color: white;
        }
    
    .button3 {
        background-color: white; 
        color: black; 
        border: 2px solid #f44336;
        }

    .button3:hover {
        background-color: #f44336;
        color: white;
        }

    .content{
           
        width:80%;
        margin:auto;
       }
       
     .innerOuter{
        border:1px solid lightgray;
        width:90%;
        margin:auto;
        padding:5% 15%;
        background:white;
       }

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
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="content">
        <br><br>
        <div class="innerOuter" style="background-color: rgb(243, 242, 242);">
            <h2>캐치펀에게  문의하기</h2>
            <br>
            
          
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3"><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                    <th>작성일</th>
                    <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                </tr>

                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <textarea class="form-control" required name="boardContent" id="content" rows="10" style="resize:none;"></textarea>
                    </td>
                </tr>
            </table>
            <center>
                <button class="button button2" >취소하기</button>
                <button class="button button3" >문의하기</button>
            </center>
            <br>


 
        </div>
        <br><br>
    </div>
</body>
</html>
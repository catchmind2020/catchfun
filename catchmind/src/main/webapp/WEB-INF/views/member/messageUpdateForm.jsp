<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <style>
        #updateForm>table{width:100%;}
        #updateForm>table *{ margin:5px;}
        
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
    </style>
</head>
<body>
    <!-- 이쪽에 메뉴바 포함 할꺼임 -->
   <jsp:include page="../common/menubar.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="updateForm.qu" enctype="multipart/form-data">
            	<input type="hidden" name="questionNo" value="${ q.questionNo }">
                <table id="contentArea" align="center" class="table">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="questionTitle" value="${ q.questionTitle }" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="userId" class="form-control" value="${ q.userId }" readonly></td>
                    </tr>

                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="questionContent" id="content" rows="10" style="resize:none;">${ q.questionContent }</textarea></th>
                    </tr>
                </table> 
                <br>
                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>

    <!-- 이쪽에 푸터바 포함할꺼임 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
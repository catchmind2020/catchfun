<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
    /* 폰트 초기화*/
    body, input, textarea, select, button, table {
    font-family: 'Nanum Gothic',  'Noto Sans KR', 'Malgun Gothic','맑은 고딕', 'dotum','돋움',sans-serif; 
    color: #222; font-size: 18px; line-height: 1.5;} 


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
        height: 30px;
        width: 100px;
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
        margin-top: 20px;
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


        table *{margin:5px;}
        table{width:100%;}
    </style>
</head>
<body>
    
    
     <jsp:include page="../common/menubar.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter" style="background-color: rgb(243, 242, 242);">
            <h2>메세지 상세</h2>
            <br>

            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="120">제목</th>
                    <td colspan="3">${ q.questionTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ q.userId }</td>
                    <th>작성일</th>
                    <td>${ q.questionDate }</td>
                </tr>

                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${ q.questionContent }</p></td>
                </tr>
            </table>
            
            <!-- 수정하기, 삭제하기 버튼은 본인이 단 댓글에(프로젝트개설자)에 대해서 보여져야됨 -->
            <c:if test="${ loginUser.userNo eq q.counseling }">
	            <div align="center">
	            	<button class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</button>
	            	<button class="btn btn-danger" onclick="postFormSubmit(2)">삭제하기</button>
	            </div>
	            
	            <form action="" id="postForm" method="post">
	            	<input type="hidden" name="qno" value="${ q.questionNo }">
	            </form>
	            
	            <script>
                  function postFormSubmit(num){
                     if(num == 1){ // 수정하기클릭시
                        $('#postForm').attr("action", "updateForm.qu");
      
                     } else { // 삭제하기 클릭시
                        $('#postForm').attr("action", "delete.qu");                  
                     }
                     $('#postForm').submit();
                  }
               </script>
	            
            </c:if>

            <br>
             <!-- 댓글 기능은 나중에 ajax 배우고 접목시킬예정! 우선은 화면구현만 해놓음 -->
             <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                        <td colspan="2">
                            <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
                        </td>
                        <td><button class="button button3">등록</button></td>
                    </tr>
                    <tr>
                    	<td colspan="3">댓글(<span id="rcount">3</span>) </td>
                    </tr>
                   
                </thead>
                <tbody>
                    <tr>
                        <th>${ q.userId }</th>
                        <td>${ q.ansContent }</td>
                        <td>${ q.ansDate }</td>
                    </tr>

                </tbody>
            </table>
        </div>
        <br><br>
    </div>

   
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
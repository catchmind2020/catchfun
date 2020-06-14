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
    </style>
    
</head>
<body>
    
    <jsp:include page="../common/menubar.jsp"/>

    <div class="content">
        <br><br><br>
        <div class="innerOuter">
            <h3>메세지 상세</h3>
            <br>
            
          
            <br><br>
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
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
                    <td colspan="4"><p style="height:150px">${q.questionContent}</p></td>
                </tr>
            </table>
            <center>
            <input type=button id="btn" value="목록으로" onclick="javascript:history.back(-1);">
            </center>
<!--            수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨
               <div align="center">
                  <button class="button button2" onclick="postFormSubmit(1);">목록으로</button>
                  <button class="button button3"><a href = "sellerMessageAnswer.me">답변보내기</a></button>
               </div>
               
               <script>
                  function postFormSubmit(num){
                     if(num == 1){ // 목록으로 클릭시
                        $('#postForm').attr("action", "message_rest.me");
      
                     } else {
                        $('#postForm').attr("action", "");                  
                     }
                     $('#postForm').submit();
                  }
               </script>
                -->
                
             <!-- 수정하기, 삭제하기 버튼은 본인이 단 댓글에(프로젝트개설자)에 대해서 보여져야됨 -->
            <c:if test="${ loginUser.userNo eq q.counseling }">
	            <div align="center">
	            	<button class="button button2" onclick="postFormSubmit(1)">수정하기</button>
	            	<button class="button button3" onclick="postFormSubmit(2)">삭제하기</button>
	            </div>
	            
	            <form action="" id="postForm" method="post">
	            	<input type="hidden" name="qno" value="${ q.questionNo }">
	            </form>
	            
	            <script>
                  function postFormSubmit(num){
                     if(num == 1){ // 수정하기클릭시 messageUpdateForm.qu
                        $('#postForm').attr("action", "messageUpdateForm.qu");
      
                     } else { // 삭제하기 클릭시
                        $('#postForm').attr("action", "delete.qu");                  
                     }
                     $('#postForm').submit();
                  }
               </script>
	            
            </c:if>

            <br>
                
                
                
        <!-- 게시글에 딸려있는 댓글 조회용 ajax  -->
        <script>
       
        	$(function(){
        		selectReplyList();
        		
        		$("#addReply").click(function(){ // 등록하기
        			
        			$.ajax({
						url:"rinsert.bo",
						data:{replyContent:$("#content").val(),
							  refBoardNo:${b.boardNo},
        					  replyWriter:"${loginUser.userId}"},
						type="post",	 
						success:{function(){
							
							if(status == "success"){
								$("#content").val("");
								
								selectReplyList();
								
							}else{
								alert("댓글등록실패!");
							})
						})
							
							
						},error:function(){
							console.log("댓글 작서용 ajax 통신 실패!");	
						});
						
        			});
        		});
        		
        	});
        	
        	// 해당 게시글에 딸려있는 댓글 리스트 ajax로 조회해서 화면에 뿌려주는 메소드  
        	function selectReplyList(){
        		
        		$.ajax({
        			url:"rlist.bo",
        			data:{bno:${b.boardNo}},
        			success:function(list){
        				
        				//console.log(list);
        				
        				$("#rcount").text(list.length);
        				
        				var value = "";
        				
        				for(var i in list){
        					value += "<tr>" +
			                            "<th>" + list[i].replyWriter + "</th>" +
			                            "<td>" + list[i].replyContent + "</td>" + 
			                            "<td>" + list[i].createDate + "</td>" + 
			                         "</tr>";
        				}
        				
        				$("#replyArea tbody").html(value);
        				
        			},error:function(){
        				console.log("댓글리스트 조회용 ajax 통신 실패!!");
        			}
        		});
        		
        	}
        
        </script>
            
               
            <br>
        </div>
        <br><br>
    </div>

   <jsp:include page="../common/footer.jsp" />
    
</body>
</html>
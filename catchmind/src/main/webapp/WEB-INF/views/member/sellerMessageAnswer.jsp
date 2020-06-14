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

    .button4 {
        background-color: white; 
        color: black; 
        border: 2px solid black;
        margin-top: 20px;
        }

    .button4:hover {
        background-color: #f44336;
        color: white;
        }
    .content{
           
        width:80%;
        margin:auto;
       }
       
     .innerOuter{
        border:1px solid lightgray;
        width:100%;
        margin:auto;
        padding:5% 12%;
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
<%--             <c:if test="${ loginUser.userNo eq q.counseling }">
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
	            
            </c:if> --%>

            <br>
             <!-- 댓글 기능은 나중에 ajax 배우고 접목시킬예정! 우선은 화면구현만 해놓음 -->
             <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                        <td colspan="3">
                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%"></textarea>
                        </td>
                        <td><button class="button button3" id="addReply">등록</button>
                        <td><button class="button button4" id="btnReplyDelete">삭제</button></td>
                    </tr>
                </thead>
                <tbody>

                </tbody>
                
            </table>
        </div>
        
        <script>
        
        	$(function(){
        		selectReplyList();
        		
        		$("#addReply").click(function(){
        			
        			$.ajax({
        				url:"ainsert.qu",
        				data:{ansContent:$("#content").val(),
        					questionNo:"${q.questionNo}",
        					ansNo:"${loginUser.userId}"
        					},
        				type:"post",
        				success:function(status){
        					if(status == "success"){
   								location.href="<%=request.getContextPath()%>/sellerMessageAnswer.me?qno=${q.questionNo}"
							}else{
								alert("업데이트실패!!");
							}
        				}, error:function(){
        					console.log("댓글작성용 통신실패!");
        				}
        			});
        			
        		});
        		
        		
        	});
        	
        	// 해당 게시글에 딸려있는 댓글 리스트를 ajax로 조회해서 화면에 뿌려주는
        	/* 
        	function selectReplyList(){
        		
        		$.ajax({
        			url:"alist.qu",
        			data:{qno:"${q.questionNo}"},
        			success:function(list1){
        				
        				console.log("gggggg123 : " + list1);
        				
        				
        				// 댓글갯수
        				$("#rcount").text(list1.length);
        				var value = "";
        				for(var i in list1){
        					if(list1[i].questionYn == 'Y'){
        					console.log("qqqqq : " + list1[i].questionYn);
	        					value += "<tr>" +
	        								"<th>" + list1[i].userId +"<th>" +
	        								"<th>" + list1[i].ansContent +"<th>" +
	        								"<th>" + list1[i].ansDate +"<th>" +
	        							"<tr>";
        					}
        				}
        				
        				$("#replyArea tbody").html(value);
        				
        				
        			}, error:function(){
        				console.log("댓글리스트 조회용 ajax 통신실패!!");
        			}
        		});
        	}
        	 */
        	function selectReplyList(){
					$.ajax({
		    			url:"alist.qu",
		    			data:{qno:"${q.questionNo}"},
	    				type:"post",
		    			success:function(list){
		    				console.log("성공!");
		        					var value = "<tr>" +
		        								"<td>" + list.ansNo +"<td>" +
		        								"<td>" + list.ansContent +"<td>" +
		        								"<td>" + list.ansDate +"<td>" +
		        							"<tr>";
		        							
		        					$("#replyArea tbody").html(value);
		    				
						},error:function(){
		    				console.log("공지 디테일 조회용 ajax 통신실패!!");	
		    			}
		    		});
        	 }
        </script>
        
       <!--  댓글삭제 -->
        <script>
        $("#btnReplyDelete").click(function(){
        	if(confirm("답변을 삭제하시겠습니까?")){
        		$.ajax({
        			url: "deleteAnswer.qu",
        			data: {qno:"${q.questionNo}"}, 
        			type: "post",
        			success:function(result){
        				if(result == "success"){
                            alert("삭제성공!");
                          location.href="<%=request.getContextPath()%>/sellerMessageAnswer.me?qno=${q.questionNo}"
        				}
        			}
        		});
        	}
        });
        </script>
        
        
        
        
    </div>

   
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
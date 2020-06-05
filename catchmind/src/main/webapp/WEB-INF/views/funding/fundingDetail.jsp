<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <title>Document</title>
</head>
<style>
    #outer {
        margin: auto;
        text-align: center;
        width: 810px;
    }

    .condition {
        border: 1px solid gray;
        background: white;
        color: gray;
    }

    .search_tag {
        margin-top: 5px;
        border: 1.2px solid rgb(31, 205, 211);
        border-radius: 12px;
        background-color: white;
        color: rgb(31, 205, 211);
        font-size: 12px;
        font-weight: 1000;
        padding: 5px;
        padding-right: 10px;
        padding-left: 10px;
    }
    #imgArea {
        /* border: 1px solid black; */
        width: 550px;
        height: 300px;
    }
    /* 모인금액 퍼센트 */
    #percent{
    	width: 230px;
    	/* background-color: rgb(0, 0, 0); */
    	color: rgb(31, 205, 211);
    }
    .info_title {
        padding-left: 20px;
        width: 230px;
        font-size: 12px;
    }

    /* 참여하기 버튼 */
    .main_button {
        background-color: rgb(31, 205, 211);
        border: 1px solid rgb(31, 205, 211);
        color: white;
        height: 50px;
        cursor: pointer;
        border-radius: 3px;
        font-size: 15px;
        font-weight: 700;
    }

    /* 공유 & 찜하기 */
    .side_button {
        width: 110px;
        height: 40px;
        font-size: 13px;
        background-color: white;
        border: 1px solid darkgray;
        color: black;
        cursor: pointer;
        border-radius: 3px;
    }

    /* 메이커 정보 & 문의 버튼 */
    .maker_button {
        height: 40px;
        font-size: 11px;
        background-color: gray;
        border: 1px solid gray;
        color: white;
        cursor: pointer;
        border-radius: 3px;
    }
    #maker_img{
        width: 50px;
        height: 50px;
        border: 1px solid gray;
        border-radius: 50px;
        margin: 10px;
        margin-right: 0px;
    }

    /* 메이커 홈페이지 & SNS 버튼 */
    #maker_detail {
        width: 15px;
        height: 15px;
        padding-bottom: 0px;
        /* background-color: gray; */
        /* border: 1px solid gray; */
        /* color: white; */
        cursor: pointer;
    }

    /* 소개 ~ 댓글 탭 css 시작 */
    section {
        display: none;
        padding: 20px 0 0;
        border-top: 1px solid #ddd;}

    /*라디오버튼 숨김*/
    .tapArea input {
        display: none;}

    .tapArea label {
        display: inline-block;
        margin: 0 0 -1px;
        padding: 15px 25px;
        font-weight: 600;
        text-align: center;
        color: #bbb;
        border: 1px solid transparent;}

    .tapArea label:hover {
        color: rgb(31, 205, 211);
        cursor: pointer;}

    /*input 클릭시, label 스타일*/
    .tapArea input:checked + label {
        color: #555;
        /* border: 1px solid #ddd; */
        border-bottom: 2px solid rgb(31, 205, 211);
        /* border-bottom: 1px solid #ffffff; */
    }

    #tab1:checked ~ #content1,
    #tab2:checked ~ #content2,
    #tab3:checked ~ #content3,
    #tab4:checked ~ #content4 {
        display: block;}
    /* 탭 css 끝 */

	/* 탭 사이즈 지정 */
    .tapArea {
        width: 600px;
        transition: all 0.5s;
        /* z-index: 997; */
        background-color: white;
        vertical-align: top;
        /* border: 1px solid darkgray */
        /* position: absolute; */
        /* position: fixed; */
        /* top: 300px; */
        word-break:break-all;
    }
    /* .tapArea a {
        margin: 40px;
        color: black;
        text-decoration: none;
        cursor: pointer;
    } */
    #content1, #content2, #content3{
        width: 550px;
        height: auto;
    }
    .scrollDown {
        position: fixed;
        top: 0px;
        /* transform: translateY(0px); */
    }

    /* 리워드 리스트 */
    .rewardArea {
        padding-left: 10px;
        width: 200px;
        text-align: left;
        /* margin: 50px; */
        /* padding-top: 5px; */
        vertical-align: top;
    }
    /* 리워드 박스 */
    #rewardTable div{
        border: 1px solid darkgray;
        width: 200px;
        height: 130px;
        margin-bottom: 10px;
        padding: 20px;
        color:gray;
        font-size: 12px;
    }

    /* #info_text{
        width: 540px;
        height: 500px;
        border: 1px solid white;
        resize: none;
        
    } */
    .reward_money{
        font-size: 18px;
        color: black;
    }
    .reward_name{
        font-size: 15px;
    }
    .reward_sum{
        border: 1px solid rgb(31, 205, 211);
        background-color: rgb(31, 205, 211);
        width: 50px; 
        height: 25px; 
        padding: 2px;
        text-align: center;
        border-radius: 3px;
        color: white;
        font-size: 12px;
    }

    text{
        width: 600px;
    }


	/* 새소식 테이블 css */
    #noTable {
        width: 500px;
        margin: 0px;
        text-align:left;
        align-self: center;
        margin:auto;                        /* 중앙에 테이블 두기위해 */
        border-collapse: collapse;          /* 테이블 라인이어지게 하기위해 */
    }
    #noTable th{
        padding-top: 50px;
        /* border-top: 1px solid gray;*/
        height: 30px;
        border-bottom: 2px solid gray;
    }
    #noTable td{
    	background: rgb(31, 205, 211, 0.1);
    	padding-top: 30px;
    	padding-bottom: 30px;
    }
    /* #noTable a{
        text-decoration: none;
        color: #444;
    } */
    #noTable h1{ /* 타이틀 */
        text-align: center;
        color:black;
    }
    #noTable P{ /* 날짜 */
        text-align: right;
        font-size: 13px;
        color:rgb(156, 156, 156);
    }
    #noContent{ /* 내용 */
        height:auto;
        padding: 30px;
    }
    #noTable span{color:rgb(31, 205, 211);}
    
    /* 댓글 버튼 */
    #addReply{
        background-color: rgb(31, 205, 211);
        border: 1px solid rgb(31, 205, 211);
        color: white;
        width: 80px;
        height: 50px;
        cursor: pointer;
        border-radius: 3px;
    }
    #replyArea{border-collapse: collapse;}
    #replyArea thead>tr{
    	vertical-align: middle;
    	height: 100px;   	
    }
    #replyArea td{
    	text-align: left;
    	font-weight: 500;
    	font-size: 13px;
    	border-bottom: 1px solid gray;
    	padding-bottom: 20px;
    	padding-top: 20px;
    }
    #replyUserId b{font-size: 17px;}
</style>

<script>

    // 600px;
	// tap 고정
    $(document).ready(function () {

        var c, currentScrollTop = 0;
        var tapbar = $(".tapArea");


        $(window).scroll(function () {
            var a = $(window).scrollTop() - 0;
            var b = tapbar.height();

            currentScrollTop = a;

            if (c < currentScrollTop && a > b + b) {
                tapbar.addClass("scrollDown");
                
            } else if (c > currentScrollTop && !(a <= b)) {
                tapbar.removeClass("scrollDown");
                
            }
            c = currentScrollTop;
        });

    }); 

</script>

<body>

	<jsp:include page="../common/menubar.jsp"/>
	<br><br>
	<hr>
	<br>
    <div id="outer">
        <br>

        <!-- 상세페이지 타이틀 -->
        <div>
            <button class="condition">${ p.projectCategory }</button>
            <h1>${ p.projectName }</h1>
            <div id="tag">
                <!-- <button class="search_tag">#${ p.hashtags }</button>
                <button class="search_tag">#들깨</button>
                <button class="search_tag">#참기름</button>
                <button class="search_tag">#남사애담촌</button> -->
            </div>
        </div>
        <br><br>
        
        <script>
			// hashtags
			$(function(){
				
				var hashtags = "${ p.hashtags }"; 
				var hashtagsSplit = hashtags.split(",");
				var hashtagHtml = "";
				
				for(var i=0; i<hashtagsSplit.length; i++){
					
					hashtagHtml += '<button class="search_tag">#' + hashtagsSplit[i] + '</button> ';
				}
				
				$("#tag").html(hashtagHtml);
			});
        </script>

        <!-- 상단 프로젝트 정보 -->
        <div style="text-align: left;">
            <table style="margin: auto;">
                <tr>
                    <td id="imgArea" rowspan="5" colspan="4"> <!-- 대표이미지 -->
                    	<img src="${ p.filePath }/${ p.changeName }" id="imgArea">
                    </td>
                    <td class="info_title">
                        <b>모인금액</b><br>
                        <span style="font-size: 30px;"><fmt:formatNumber value="${ fl.sumPrice + fl.sumSponsership }" pattern="#,###" /></span>원 모금
                    </td>

                </tr>
                <tr>
                    <td class="info_title" style="border-color:chartreuse; text-align:right">
                        <!-- <hr> -->
                        <progress value="${ (fl.sumPrice + fl.sumSponsership) / p.projectTargetAmount * 100}" 
                                  max="100" id="percent"></progress>
                        <span><fmt:formatNumber value="${ (fl.sumPrice + fl.sumSponsership) / p.projectTargetAmount * 100 }" pattern="0" />%</span>
                    </td>
                </tr>
                <tr>
                    <td class="info_title">
                        <b>참여인원</b><br>
                        <span style="font-size: 25px;">${ fl.personCount }</span>명 참여
                    </td>
                </tr>
                <tr>
                    <td class="info_title">
                        <b>남은기간</b><br>
                        <span style="font-size: 25px;" id="dday"></span>일 남음 
                    </td>
                </tr>
                <tr>
                    <td class="info_title"><button class="main_button" style="width: 230px;">참여하기</button></td>
                </tr>

                <tr>
                    <td style="width: 70px;">
                    	<img src="${ m.filePath }/${ m.changeName }" id="maker_img">
                    </td>
                    <td>
                        ${ m.makerName } <a href="https://www.iei.or.kr/main/main.kh" target="_blank"><img src="resources/images/maker_homepage.png" id="maker_detail"></a>
                        <!-- <button class="maker_detail">SNS</button> --><br>
                        ${ m.makerEmail }
                    </td>
                    <td align="right" style="padding-right:0px;"><button class="maker_button">개설자문의</button></td>
                    <td></td>
                    <td class="info_title" style="vertical-align: middle;"><button class="side_button">공유</button>&nbsp;&nbsp;<button class="side_button">♡</button></td>
                </tr>
            </table>
        </div><br>
        <hr>

        <!-- 하단 프로젝트 디테일 -->
        <div>

            <table>
                <thead>
                    <tr>
                        <th class="tapArea">
                            <!-- <a>소개</a><a>새소식</a><a>FAQ</a><a>응원댓글</a> -->

                            <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
                            <label for="tab1">소개</label>
                        
                            <input id="tab2" type="radio" name="tabs">
                            <label for="tab2">새소식</label>
                        
                            <input id="tab3" type="radio" name="tabs">
                            <label for="tab3">응원댓글</label>
                        
                            <!-- <input id="tab4" type="radio" name="tabs">
                            <label for="tab4">tab menu4</label> -->
                                <br clear="both">
                                
                                
                            <!-- 소개 -->
                            <section id="content1">
                                <div style="float:left;width: 600px;">
                                    <div style="width:550px; word-break:break-all;">
                                        <br><br> <!-- summernote -->
                                        <p>${ p.projectContent }</p>
                                    </div>
                                </div>
                            </section>
                        
                        
                        	<!-- 새소식 -->
                            <section id="content2">
                            	<div style="word-break:break-all;">
                                <table id="noTable">
                                	
                                	<!-- for문 -->
	                                <c:forEach items="${ nlist }" var ="n" varStatus="status">
	                                    <tr>
	                                        <th colspan="2">
	                                        	<span>#${status.count}</span>
	                                            <h1>${ n.newsTitle }</h1>
	                                            <p>${ n.newsDate }</p>
	                                        </th>
	                                    </tr>                                    
	                                    <tr>
	                                        <td colspan="2">
	                                            <div id="noContent">${ n.newsContent }</div>
	                                        </td>
	                                    </tr>
	                                </c:forEach>
                                    
                                </table>
                                </div>
                            </section>
                        
                        
                        	<!-- 응원댓글 -->
                            <section id="content3">
                                    <!--  댓글 관련 영역 -->
                                    <div>
                                        <table align="center" id="replyArea">
                                            <thead>
                                                <tr>  
                                                	<c:choose>
	                        							<c:when test="${ !empty loginUser }">                             
                                                    		<th style="padding:0px" colspan="3">
			                                                	<textarea rows="3" cols="60" id="replyContent" style="resize:none; padding:0"></textarea>
			                                                </th>
                                                    		<th><button id="addReply">등록</button></th>
                                                    	</c:when>
                                                    	
                                                    	<c:otherwise>                                  
                                                    		<th style="padding:0px" colspan="3">
			                                                	<textarea  readonly rows="3" cols="60" id="replyContent" style="resize:none; padding:0">로그인한 사용자만 이용가능한 서비스입니다. 로그인 후 이용해주세요.</textarea>
			                                                </th>
                                                    		<th><button id="addReply">등록</button></th>
                                                    	</c:otherwise>                       
                                                    </c:choose>
                                                </tr>
                                            </thead>
											
										   <!-- 댓글들 -->
							               <tbody>
							               
							 					<!-- 
							 					<tr>
							                        <td width="80px" id="replyUserId"><b>user02</b></td>
							                        <td width="330px" colspan="2">댓글입니다. 너무웃기다앙</td>
							                        <td width="70px">2020-04-10</td>
							 					</tr> 
							 					-->
							 					
							                </tbody>

                                        </table>
                                        <br><br><br><br><br>
                                    </div>
                            </section>
                        
                            <!-- <section id="content4">
                                <p>tab menu4의 내용</p>
                            </section> -->
                        </th>
                        <td class="rewardArea" >
                            <!-- 리워드들 -->
                            <table id="rewardTable">
                                <tr>
                                    <td><div>
                                        <b class="reward_money">30,000원 펀딩</b>
                                        <p class="reward_name">희망머그컵 1개<br></p>
                                        <p>발송예정일 : 2020년 6월29일부터<br></p>
                                        <button class="reward_sum">100명</button>&nbsp;&nbsp;참여 / 수량 90개 남음
                                    </div></td>
                                </tr>
                                <tr>
                                    <td><div>
                                        <b class="reward_money">50,000원 펀딩</b>
                                        <p class="reward_name">희망머그컵 2개<br></p>
                                        <p>발송예정일 : 2020년 6월29일부터<br></p>
                                        <button class="reward_sum">50명</button>&nbsp;&nbsp;참여 / 수량 70개 남음
                                    </div></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>

            </table>
            
            
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>	

    </div>

	<jsp:include page="../common/footer.jsp"/>
	
	
    <script>

		// D-day 
		$(function(){
			
			var now = new Date();
			var endDate = new Date("${ p.projectFinishDate }"); 
			var gap = endDate.getTime() - now.getTime();
			
			dday = Math.floor(gap / (1000 * 60 * 60 * 24)) + 1;
			//document.write("크리스마스 : " + dday + " day left");
			//console.log(dday);
			
			$("#dday").html("D-" + dday);
		});
		
		
		 // 댓글 등록
		$(function(){
    		selectReplyList();
    		
    		/*
    		$("#addReply").click(function(){
    			
    			$.ajax({
    				url: "rinsert.pro",
    				data: {replyContent:$("#replyContent").val(),
    					   refBoardNo:${p.projectNumber},
    					   replyWriter:"${loginUser.userId}"},
    				type: "post",
    				success: function(status){
    					
    					if(status == "success"){
    						$("#replyContent").val(""); // 칸 비우기
    						
    						selectReplyList(); // 다시 댓글 조회
    						
    					}else{
    						alert("댓글 등록 실패");
    					}
    					
    				}, error: function(){
    					console.log("댓글 작성용 ajax 통신 실패");
    				}
    			});
    			
    		});
    		
    		*/
    	}); 
    	
    	// 댓글 출력
    	function selectReplyList(){
    			
    		$.ajax({
    			url: "rlist.pro",
    			data: { pno:"${ p.projectNumber }" },
    			success: function(list){
    				
    				//console.log(list);
    				
    				//$("#rcount").text(list.length); // 댓글 수
    				
    				var value = "";
    				
    				for(var i in list){ // Gson 기본 포맷에 맞게 날짜가 나옴 
    					
				        value += "<tr>" +
				        			"<td width='80px' id='replyUserId'><b>" + list[i].userNo + "</b></td>" +
				                    "<td width='330px' colspan='2'>" + list[i].replyContent + "</td>" +
				                    "<td width='70px'>" + list[i].replyDate + "</td>" + 
				                 "</tr>";
    				}
    				
    				$("#replyArea tbody").html(value);
    				
    			}, error: function(){
    				console.log("댓글 리스트 조회용 ajax 통신 실패!!");
    			}
    		});
    	}
    	
    </script>

</body>

</html>
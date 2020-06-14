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
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> <!-- 공유하기  -->
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
    	height: 10px;
    	/* background-color: rgb(0, 0, 0); */
    	color: rgb(31, 205, 211);
    	background-color: #2ed5d5;
    	
    }
    progress::-webkit-progress-bar { background-color: lightgray; }
	progress::-webkit-progress-value { background-color: #2ed5d5; }
	
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


    /* 공유 */
    .side_button2 {
        width: 109px;
        height: 40px;
        font-size: 14px;
        /* background-color: rgb(31, 205, 211, 0.2); */
        background-color: white;
        border: 1px solid darkgray;
        color: black;
        cursor: pointer;
        border-radius: 3px;
    }
    /* 찜하기 */
    .side_button {
        width: 109px;
        height: 40px;
        font-size: 15px;
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
    #maker_ban_button {
        height: 40px;
        font-size: 11px;
        background-color: rgb(255, 0, 0, 0.5);
        border: 1px solid rgb(255, 0, 0, 0.5);
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
    #rewardTable div:hover{
        border: 1px solid darkgray;
        width: 200px;
        height: 130px;
        margin-bottom: 10px;
        padding: 20px;
        color:gray;
        font-size: 12px;
        font-color:darkgray;
        background: rgb(31, 205, 211, 0.2);
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
    
    .rBtn{
    	width: 40px;
    	height: 25px;
    	background-color: rgb(31, 205, 211, 0.1);
    	border: 1px solid rgb(31, 205, 211, 0.1);
    	font-size: 11px;
    	cursor: pointer;
        border-radius: 3px;
        float: right;
        margin-right: 3px;
    }
    .rBanBtn{
    	width: 40px;
    	height: 25px;
    	background-color: rgb(255, 0, 0, 0.1);
    	border: 1px solid rgb(255, 0, 0, 0.1);
    	font-size: 11px;
    	cursor: pointer;
        border-radius: 3px;
        float: right;
        margin-right: 3px;
    }
    
    
    /* popup css */
    .modal h1 { 
         font-family: 'Oswald', sans-serif; 
         font-size: 30px; 
         color: black; 
         padding-left: 25px;
     } 
     .modal2 h1{ 
         font-family: 'Oswald', sans-serif; 
         font-size: 30px; 
         color: rgb(203, 61, 36); 
         padding-left: 25px;
     } 
     
     .modal h4, .modal2 h4 {color: gray; padding-left: 25px; padding-top: 0px; }
     .modal label, .modal2 label { 
         display: block; 
         margin-top: 20px; 
         letter-spacing: 2px; 
     } 
     .modal form, .modal2 form { 
         margin: 0 auto; 
         width: 459px; 
     } 
     .modal input, .modal textarea, .modal2 input, .modal2 textarea { 
         width: 439px; 
         height: 27px; 
         background-color: #efefef; 
         border-radius: 6px; 
         border: 1px solid #dedede; 
         padding: 10px; 
         margin-top: 3px; 
         font-size: 0.9em; 
         color: #3a3a3a; 
     } 
     .modal input:focus, .modal textarea:focus, .modal2 input:focus, .modal2 textarea:focus{ 
             border: 1px solid #97d6eb; 
         } 
     
     .modal textarea, .modal2 textarea{ 
         height: 120px; 
         background-color: #efefef; 
         font-size: 1.2em; 
     } 
     #submit, #submit2{ 
         width: 127px; 
         height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #submit:hover, #submit2:hover{ 
         color: #fff; 
         background-color: rgb(31, 205, 211); 
         opacity: 0.9; 
     } 
     #cancel, #cancel2 { 
         width: 127px; height: 48px; 
         text-align: center; 
         border: none; 
         margin-top: 20px; 
         cursor: pointer; 
     } 
     #cancel:hover, #cancel2:hover{ 
         color: #fff; 
         background-color: rgb(31, 205, 211); 
         opacity: 0.9; 
     }

    .modal, .modal2 { 
         position: fixed; 
         left: 0; 
         top: 0; 
         width: 100%; 
         height: 100%; 
         background-color: rgba(0, 0, 0, 0.5); 
         opacity: 0; 
         visibility: hidden; 
         transform: scale(1.1); 
         transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
     .modal-content { 
         position: absolute; 
         top: 50%; 
         left: 50%; 
         transform: translate(-50%, -50%); 
         background-color: white; 
         padding: 1rem 1.5rem; 
         width: 500px; 
         height: 450px; 
         border-radius: 0.5rem; 
     } 
     .close-button, .close-button2 { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         font-size: 30px;
         /* background-color: lightgray;  */
     } 
     .close-button:hover, .close-button2:hover { 
         background-color: darkgray; 
         font-size: 30px;
     } 
     .show-modal, .show-modal2 { 
         opacity: 1; 
         visibility: visible; 
         transform: scale(1.0); 
         transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
     } 
	/* popup css */
	#content1 img{
		width: 500px;
		max-width: 550px;
	}
    
</style>
<!-- 
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
 -->
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
					
					hashtagHtml += '<button id="tag2" class="search_tag">#' + hashtagsSplit[i] + '</button> ';
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
                        <span style="font-size: 25px;" id="dday"></span>일 남음 (${ p.projectFinishDate }일 마감)
                    </td>
                </tr>
                <tr>
                	<c:choose>
	                	<c:when test="${ !empty loginUser }"> 
                    		<td class="info_title"><button class="main_button" style="width: 230px;" onclick="location.href='rewardList.pay?pno=${ p.projectNumber }&rno=0'">참여하기</button></td>
                    	</c:when>
                		<c:otherwise>
                			<td class="info_title"><button class="main_button" style="width: 230px;" onclick="alert('로그인 후 서비스 이용이 가능합니다.');">참여하기</button></td>
                		</c:otherwise>
                	</c:choose>
                </tr>

                <tr>
                    <td style="width: 70px;">
                    	<img src="resources/uploadFiles/${ m.makerChangeName }" id="maker_img">
                    </td>
                    <td>
                        ${ m.makerName } <a href="${ m.makerType }" target="_blank"><img src="resources/images/maker_homepage.png" id="maker_detail"></a>
                        <!-- <button class="maker_detail">SNS</button> --><br>
                        ${ m.makerEmail }
                    </td>
                    
                    <c:choose>
	                	<c:when test="${ !empty loginUser }">  
		                    <td align="right" style="padding-right:0px;"><button class="maker_button trigger">개설자문의</button> <button id="maker_ban_button" class="trigger2">개설자신고</button></td>
		                    <td></td>
		                    <td class="info_title" style="vertical-align: middle;">
			                    <!-- <input type="button" class="side_button2" value="공유">&nbsp; -->
			                    <a id="kakao-link-btn" href="javascript:sendLink()"><input type="button" class="side_button2" value="공유"></a>
			                    <span id="zzimDir"></span>			                    
		                    </td>
                		</c:when>
                		<c:otherwise>
                			<td></td>
                			<td></td>
                			<td></td>
                		</c:otherwise>
                	</c:choose>

                	
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
                                        <%-- <button onclick="location.href='selectPayDetail.pro?pno=${p.projectNumber}'">펀딩내역</button> --%>
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
			                                                	<textarea  readonly rows="3" cols="60" id="replyContent" style="resize:none; padding:0">로그인 후 댓글작성이 가능합니다.</textarea>
			                                                </th>
                                                    		<th><button id="addReply" onclick="alert('로그인 후 댓글 작성이 가능합니다.');">등록</button></th>
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
                            
                                <!-- for문 -->
	                            <c:forEach items="${ rlist }" var ="r">
	                                <tr>
	                                    <td>
		                                    <div>
		                                    	<input type="hidden" name="rewardNo" value="${ r.rewardNo }" class="rno">
		                                        <b class="reward_money"><fmt:formatNumber value="${ r.rewardCost }" pattern="#,###" />원 펀딩</b>
		                                        <p class="reward_name">${ r.rewardTitle }<br></p>
		                                        <p>${ r.rewardContent }<br></p>
		                                        <button disabled class="reward_sum">${ r.rewardFundingCount }명</button>&nbsp;&nbsp;참여 / 수량 ${ r.rewardRemainingQuantity }개 남음
		                                    </div>
	                                    </td>
	                                </tr>
                                </c:forEach>
                                
								<!--                                 
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
                                 -->
                                
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
        <br><br><br><br><br><br><br><br><br><br><br><br>	

    </div>

	<%-- <jsp:include page="../common/footer.jsp"/> --%>
	<input hidden id="dddd" value="${ loginUser.userId }" >

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
    		selectReplyList(); // 댓글 조회
    		
    		$("#addReply").click(function(){
    			
    			$.ajax({
    				url: "rinsert.pro",
    				data: { userNo: "${ loginUser.userNo }", 					    
    						replyContent: $("#replyContent").val(),
    						projectNumber: "${p.projectNumber}"
    					    },
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
    		
    	}); 
    	
    	// 댓글 출력
    	function selectReplyList(){
    						
    		$.ajax({
    			url: "rlist.pro",
    			data: { pno:"${ p.projectNumber }" },
    			success: function(list){
    				
    				//$("#rcount").text(list.length); // 댓글 수
    				
    				var value = "";
    				
    				
    				for(var i in list){ // Gson 기본 포맷에 맞게 날짜가 나옴 
    					
     					if( $("#dddd").val() != "" ){ // 로그인 했을 때
    						
        					if( $("#dddd").val() == list[i].userNo ){ // 로그인한 id와 동일할 때 --> 신고 x, 삭제/수정 o
        						
        				        value += "<tr>" +
						        			"<td width='80px' id='replyUserId'><b>" + list[i].userNo + "</b></td>" +
						                    "<td width='330px' colspan='2'>" + list[i].replyContent + 
						                    
						                    	/* "<form action='updateReply.pro' method='POST'>" + 
							                    	"<input type='hidden' name='replyContent' value='" + list[i].replyContent + "'>"  + 
							                    	"<input type='hidden' name='replyNo' value='" + list[i].replyNo + "'>"  +  */
							                    	
							                    "<button type='button' class='rBtn trigger3' key=" + list[i].replyNo + ">수정</button>" + 
							                    "<button class='rBtn' key=" + list[i].replyNo + " onclick='deleteReply();'>삭제</button>" + "</td>" +
						                    "<td width='70px'>" + list[i].replyDate + "</td>" +
						                 "</tr>";
			                 
        					}else{ // 동일하지않을 때
        						
        				        value += "<tr>" +
						        			"<td width='80px' id='replyUserId'><b>" + list[i].userNo + "</b></td>" +
						                    "<td width='330px' colspan='2'>" + list[i].replyContent + " <button class='rBanBtn' key=" + list[i].replyNo + " onclick='replyBan();'>신고</button></td>" +
						                    "<td width='70px'>" + list[i].replyDate + "</td>" + 						                   
						                 "</tr>";
        					}
    						
    					}else{	// 로그인 안했을 때
    						
    				        value += "<tr>" +
    				        			"<td width='80px' id='replyUserId'><b>" + list[i].userNo + "</b></td>" +
					                    "<td width='330px' colspan='2'>" + list[i].replyContent + "</td>" +
					                    "<td width='70px'>" + list[i].replyDate + "</td>" + 
					                 "</tr>";
    					}
    					

     			    	
    				 
    				/* //var a = "list[i].replyNo";
    				 
			        value += "<tr>" +
			        				"<td style='display:none'>" + list[i].replyNo + "</td>" +
				        			"<td width='80px' id='replyUserId'><b>" + list[i].userNo + "</b></td>" +
				                    "<td width='330px' colspan='2'>" + list[i].replyContent + " <button class='rBtn'>수정</button> <button class='rBtn'>삭제</button>" + "<button class='rBanBtn' onclick='replyBan(\'" + list[i].replyNo + "\');'>신고</button></td>" +
				                    "<td width='70px'>" + list[i].replyDate + "</td>" + 
				                 "</tr>"; 
    				 */
    				}
    				$("#replyArea tbody").html(value);
    				
    			}, error: function(){
    				console.log("댓글 리스트 조회용 ajax 통신 실패!!");
    			}
    		});
    	}

    	
   	
    	// 댓글 신고
    	function replyBan(){ 
    		
    		var replyNo = window.event.target.getAttribute("key"); 
    		
			$.ajax({
				url: "rBan.pro",
				data: { replyNo: replyNo  },
				type: "post",
				success: function(status){
				
					if(status == "success"){
						
						alert("댓글 신고 성공");
						selectReplyList(); 
						
					}else if(status == "already"){
						alert("이미 신고된 댓글입니다.");
					}else{
						alert("댓글 신고 실패");
					}
				}, error: function(){
					alert("댓글 신고 ajax 통신 실패");
				}
			});
			
    	}
    	
    	
    	// 댓글 삭제
    	function deleteReply(){
    		
    		var replyNo = window.event.target.getAttribute("key"); 
    		
    		$.ajax({
				url: "deleteReply.pro",
				data: { replyNo: replyNo },
				type: "post",
				success: function(status){
				
					if(status == "success"){
						
						alert("댓글 삭제 성공");
						selectReplyList(); // 다시 댓글 조회
						
					}else{
						alert("댓글 삭제 실패");
					}
				}, error: function(){
					alert("댓글 삭제 ajax 통신 실패");
				}
			});
    	}
    	
    	
    	

    	// 댓글 수정
    	function updateReply(){
    		
    		var replyNo = window.event.target.getAttribute("key");
    		
    		 var a = $("#replyNo");//.delete();
    		 console.log(a);
    		/*
    		$.ajax({
				url: "updateReply.pro",
				data: { replyNo: replyNo },
				type: "post",
				success: function(status){
				
					if(status == "success"){
						
						alert("댓글 삭제 성공");
						selectReplyList(); // 다시 댓글 조회
						
					}else{
						alert("댓글 삭제 실패");
					}
				}, error: function(){
					alert("댓글 삭제 ajax 통신 실패");
				}
			});
    		 */
    		
    	}
    	
    	
    	
    	
    	
    // 찜 불러오기
   	$(function(){
   		
		var projectNumber = $("#zzimNumber").val();
		var userNo = $("#zzimNo").val()
		 
   		$.ajax({
   			url:"selectWishlist.pro",
			data:{projectNumber:projectNumber,
				  userNo:userNo},
		    type:"post",
   			
   			success:function(status){
   				
   				if(status == "no"){
					value = "<input type='button' class='side_button' id='addWish' onclick='addWish();' value='♡'>";
				
				}else{
					value = "<input type='button' style='color:red; font-size:23px;' class='side_button' id='addWish' onclick='addWish();' value='♥'>";
					
				}
   				$("#zzimDir").html(value);
   				
   			},error:function(){
   				console.log("ajax 통신실패!!");	
   			}
   		});
   		
   	});	
    		
    // 찜 리스트 추가 및 삭제
	function addWish(){
		 
		 //console.log("a");
		 var projectNumber = $("#zzimNumber").val();
		 var userNo = $("#zzimNo").val()
		 
		 
		 $.ajax({
    			url:"updateWish.pro",
    			data:{projectNumber:projectNumber,
    				  userNo:userNo},
    			type:"post",
    			
    			success:function(status){
    				
    				if(status == "delete"){
    					
							alert("찜하기가 취소되었습니다.");
							$("#addWish").val("♡");	
							$("#addWish").css({'color':'black', 'font-size':'15px', 'cursor':'pointer'});

					}else{
						
						alert("해당 프로젝트가 찜되었습니다. 찜목록은 마이페이지에서 확인 가능합니다.");
						$("#addWish").val("♥");
						$("#addWish").css({'color':'red', 'font-size':'23px', 'cursor':'pointer'});
						
					}
    				
    			},error:function(){
    				console.log("ajax 통신실패!!");	
    			}
    		});
	 }

    
    
    <!-- 리워드 선택 -->
   	$(function(){
   		if( $("#dddd").val() != "" ){ // 로그인 했을 때
	   		$("#rewardTable tr").click(function(){
	   			
	   			var rewardNo = $(this).children().children().children().eq(0).val();
	   			//console.log(rewardNo);
	   			
	   			location.href="rewardList.pay?pno=${ p.projectNumber }&rno=" + rewardNo; //?rewardTitle=" + $(this).find(".reward_name").text();
	   			
	   		});
   		
   		}else{
   			$("#rewardTable tr").click(function(){
   				alert('로그인 후 서비스 이용이 가능합니다.');
   			});
   		}
   	});
   	
    
    </script>
    
    <!--------------------------------- 팝업 ---------------------------------------------------------------->
	<!-- 개설자 문의 popup -->
	<div class="modal"> 
		 <div class="modal-content"> 
		     <span class="close-button">&times;</span> 
		     <h1 class="title">개설자 문의</h1> 
		     <h4>프로젝트 : ${ p.projectName }</h4>
		     
		     <form action="qinsert.pro?pno=${ p.projectNumber }" method="POST"> 
		       <!-- <label for="text">제목</label>  -->
		       <input hidden id="zzimNumber" value="${ p.projectNumber }">
		       <input type="text" id="zzimNo" name="userNo" style="display:none" value="${ loginUser.userNo }">
		       <input type="text" name="counseling" style="display:none" value="${ p.userNo }">
		       <input type="text" name="questionTitle" placeholder="제목" required="required"> 
		       <label></label> 
		       <textarea name="questionContent" placeholder="내용" required="required" style="resize:none"></textarea>
		            
	          <div align="center">
	           	<input type="submit" id="submit" value="보내기"> 
	            <input type="button" id="cancel" value="취소"> 
	           </div>
	         </form> 
	     </div> 
	 </div>
	 
	 
	 <!-- 개설자 신고 popup -->
	<div class="modal2"> 
	    <div class="modal-content"> 
	        <span class="close-button2">&times;</span> 
	        <h1 class="title">개설자 신고</h1> 
	        <h4>프로젝트 : ${ p.projectName }</h4>
	        
	        <form action="binsert.pro" method="POST"> 
	          <input type="text" name="userNo" style="display:none" value="${ loginUser.userNo }"> <!-- 신고한 사람 -->
	          <input type="text" name="reportNo" style="display:none" value="${ p.projectNumber }"> <!-- 신고 프로젝트 -->
	          <input type="text" name="reportTitle" placeholder="제목" required="required"> 
	          <label></label> 
	          <textarea name="reportContent" placeholder="신고 내용" required="required" style="resize:none"></textarea>
	            
	           <div align="center">
	           	   <input type="submit" id="submit2" value="보내기"> 
	            <input type="button" id="cancel2" value="취소"> 
	           </div>
	         </form> 
	     </div> 
	 </div>
	 
	
	<!--------------------------------- 팝업 ---------------------------------------------------------------->
		
		
	<!--------------------------------- 팝업  스크립트---------------------------------------------------------------->
	<script type="text/javascript"> 
	
		window.onload = function(){
		
			<!-- 개설자 문의 popup -->
		    var modal = document.querySelector(".modal"); 
		    var trigger = document.querySelector(".trigger"); 
		    var closeButton = document.querySelector(".close-button"); 
		    var cancelButton = document.querySelector("#cancel");
		
		   function toggleModal() { 
		        modal.classList.toggle("show-modal"); 
		    }
		
		   function windowOnClick(event) { 
		        if (event.target === modal) { 
		            toggleModal(); 
		        } 
		    }
		
		   trigger.addEventListener("click", toggleModal); 
		    closeButton.addEventListener("click", toggleModal); 
		    cancel.addEventListener("click", toggleModal); 
		    window.addEventListener("click", windowOnClick);
			<!-- 개설자 문의 popup 끝 -->	
	
			
			<!-- 개설자 신고 popup -->	
		    var modal2 = document.querySelector(".modal2"); 
		    var trigger2 = document.querySelector(".trigger2"); 
		    var closeButton2 = document.querySelector(".close-button2"); 
		    var cancelButton2 = document.querySelector("#cancel2");
		
		   function toggleModal2() { 
		        modal2.classList.toggle("show-modal2"); 
		    }
		
		   function windowOnClick2(event) { 
		        if (event.target === modal2) { 
		            toggleModal2(); 
		        } 
		    }
		
		    trigger2.addEventListener("click", toggleModal2); 
		    closeButton2.addEventListener("click", toggleModal2); 
		    cancel2.addEventListener("click", toggleModal2); 
		    window.addEventListener("click", windowOnClick2); 
		    <!-- 개설자 신고 popup 끝 -->	
		    

		}
		
	</script>
	<!--------------------------------- 팝업 ---------------------------------------------------------------->



<!-- 카톡 공유하기 -->
<script type="text/javascript">
  // input your appkey
  Kakao.init('cdc7db801af54bae62d1a08b2d60aad8')
  function sendLink() {
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '${ p.projectName }',
        description: '${ p.hashtags }',
        imageUrl:
          /* 'http://localhost:8888/catchfun/resources/images/ss3.png', */
          'http://localhost:8888/catchfun/resources/uploadFiles/${ p.changeName }',
          /* 'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png', */
        link: {
          mobileWebUrl: 'http://localhost:8888/catchfun/detail.pro?pno=${ p.projectNumber }',
          webUrl: 'http://localhost:8888/catchfun/detail.pro?pno=${ p.projectNumber }',
        },
      }
      /* social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845,
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
      ], */
    })
  }
</script>
<!-- 카톡 공유하기 끝-->


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
    
/* 서브메뉴 영역 CSS */
.submenu>a{color:black;  text-decoration:none !important; }
.submenu>a:hover{color:#28d7d7;  text-decoration:none important!; }
.submenu{width:140px; font-size:15px; font-weight: 900; display:table-cell; padding-top:10px; padding-bottom: 20px;}
.submenu:hover { color:#28d7d7; cursor: pointer;}
.choice{border-bottom: 3px solid rgb(31, 205, 211); padding-bottom: 5px;}
#hr{width:auto; margin:0px; color:gray; margin-top:-10px;}



        .div1{
            width:700px;         
            border-left: 0.25rem solid #28d7d7 !important;
            padding: 15px;position: relative;
            flex-direction: column;
            min-width: 0;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid #e3e6f0;
            border-radius: 0.35rem;
            margin-bottom: 15px;

        }
        p.content{
        
            width:700px;
            height:auto;
            margin-top:5px;
            margin-left:10px;
            border-radius: 10px;
            display: none;
        }
        .icon_site{
            background-color:lightsalmon;
            color:white;
            padding:5px;
            margin-right:5px;
        }

        .icon_project{
            background-color:lightblue;
            color:white;
            padding:5px;
            margin-right:5px;
        }

        .icon_funding{
            background-color:lightgrey;
            color:white;
            padding:5px;
            margin-right:5px;
        }
        
      
        
        

.contentbody{ width:40%; margin:auto;}
.innerOuter{
	border:1px solid rgb(105, 103, 103);
    width:90%;
    margin:auto;
    padding:5% 15%;
    background:white; }
    </style>
            <script>
        $(function(){
            $(".div1").click(function(){
                // $(this).next().slideDown();

                var p = $(this).next();

                if(p.css("display") == "none"){
                    $(this).siblings("p").slideUp();
                    p.slideDown();
                }else{
                    p.slideUp();
                }
            });
        });

    </script>
    </head>

              
<body>

<jsp:include page="../common/menubar.jsp" />
	<br><br><br>
    
    <!-- 서브메뉴 영역 -->
    <div align="center" style="height:60px;">
        <div class="submenu" id="notice"><a href="list.no?currentPage=1">공지사항</a></div>
        <div class="submenu choice" id="guide"><a href="guide.gu">이용가이드</a></div>
        <div class="submenu" id="question"><a href="list.cq?currentPage=1">캐치펀 1:1문의</a></div>
    </div>
 		<hr id="hr">
 		
    <br><br><br>

<div class="body">


    <div class="contentbody">
        <div class="div1"><span class="icon_funding">펀딩하기</span> 펀딩하는 방법이 궁금하다면
        </div>
        <p class="content">
           
            Q. 캐치펀 프로젝트? 쇼핑몰과 다른건가요?<br>
A : 캐치펀은 결제하고 바로 배송하는 쇼핑몰이 아닙니다 :) 세상에 아직 출시되지 않은 제품을 생산자(메이커)가 직접 소개하고 정해진 기간동안 오픈예정(펀딩)을 받는 방식이랍니다. 따라서 프로젝트가 종료되고 목표금액을 달성 해야만 카드결제가 실행이 되며, 프로젝트가 종료 이후인 '리워드 발송 시작일'부터 제품 발송이 시작됩니다.
<br><br>
꼭 읽어주세요!<br><br>
펀딩을 하고 나서 리워드를 받기까지 2주 ~ 6개월까지 기다리실 수 있습니다.<br>
지금은 카드결제 예약을 하시는 거구요! 프로젝트 종료 후에 일괄 결제됩니다.<br>
펀딩 참여가 아니더라도 프로젝트를 SNS에 공유해주시거나 댓글을 달아주시면 메이커에게는 정말 큰 힘이 되오니 많은 참여 부탁드립니다.
        </p>

        

    <div class="div1"><span class="icon_funding">펀딩하기</span>후원을 했는데 언제 결제되나요?</div>
    <p class="content">프로젝트가 펀딩에 성공하면 마감일 다음날 오후 중으로 결제가 진행됩니다.<br><br>

        결제 예정일 오전에 미리 알림을 드리고, 혹시 결제와 관련하여 문제가 발생했을 때에도 문자, 메일로 알림을 드리니 안심하시고 기다리셔도 좋습니다.</p>




    <div class="div1"><span class="icon_project">프로젝트오픈</span> 프로젝트를 올리려면 어떻게 해야 하나요?</div>
    <p class="content">캐치펀에서는 만들고자 하는 창작 아이디어만 있다면 누구나 쉽고 간단하게 프로젝트를 선보일 수 있습니다. <br>
        미리 모든 계획이 서 있지 않더라도, 프로젝트를 작성해 나가면서 필요한 사항들에 대한 안내를 확인하고 준비할 수 있습니다. <br>
        올리기 전에 캐치펀 프로젝트 규칙을 꼭 확인해 주세요.<br><br>

        로그인 후 프로젝트 올리기 페이지에서 새로운 프로젝트를 만들어 주세요.<br>
        프로젝트 개요, 펀딩 및 선물 구성, 스토리텔링, 계좌 설정 총 4가지 탭의 항목들을 작성해 주세요.<br>
        작성이 끝나면 검토 요청하기를 선택해 캐치펀 운영팀의 공개 검토를 요청하세요. 공개 검토 결과는 이메일로 안내드립니다.<br>
        프로젝트에 보완이 필요한 경우, 이메일로 안내드린 보완 사항을 반영하고 나서 재검토 요청하기를 눌러 다시 검토를 받으시면 됩니다.<br>
        공개 검토가 승인되면, 직접 펀딩 시작하기를 눌러 프로젝트 페이지를 공개하고, 후원자를 만날 수 있습니다.<br>
        로그인 후 프로젝트 올리기 페이지에서 새로운 프로젝트를 만들어 주세요.<br>
        프로젝트 개요, 펀딩 및 선물 구성, 스토리텔링, 계좌 설정 총 4가지 탭의 항목들을 작성해 주세요.<br>
        작성이 끝나면 검토 요청하기를 선택해 캐치펀 운영팀의 공개 검토를 요청하세요. 공개 검토 결과는 이메일로 안내드립니다.<br>
        프로젝트에 보완이 필요한 경우, 이메일로 안내드린 보완 사항을 반영하고 나서 재검토 요청하기를 눌러 다시 검토를 받으시면 됩니다.<br>
        공개 검토가 승인되면, 직접 펀딩 시작하기를 눌러 프로젝트 페이지를 공개하고, 후원자를 만날 수 있습니다.
        로그인 후 프로젝트 올리기 페이지에서 새로운 프로젝트를 만들어 주세요.<br>
        프로젝트 개요, 펀딩 및 선물 구성, 스토리텔링, 계좌 설정 총 4가지 탭의 항목들을 작성해 주세요.<br>
        작성이 끝나면 검토 요청하기를 선택해 캐치펀 운영팀의 공개 검토를 요청하세요. 공개 검토 결과는 이메일로 안내드립니다.<br>
        프로젝트에 보완이 필요한 경우, 이메일로 안내드린 보완 사항을 반영하고 나서 재검토 요청하기를 눌러 다시 검토를 받으시면 됩니다.<br>
        공개 검토가 승인되면, 직접 펀딩 시작하기를 눌러 프로젝트 페이지를 공개하고, 후원자를 만날 수 있습니다.</p>



        <div class="div1"><span class="icon_project">프로젝트오픈</span> 펀딩 수수료는 얼마인가요?</div>
        <p class="content">

            펀딩 성공 후 발생하는 수수료에는 플랫폼 수수료와 후원금액의 집금 대행으로 발생하는 결제 및 송금 처리 수수료가 있습니다.<br>
            캐치펀 플랫폼 이용 수수료<br>
먼저 캐치펀은 모집이 성사된 프로젝트에 한해 모금액의 5%를 유지비용으로 수수하고 있습니다. <br><br>

캐치펀 플랫폼 수수료는 총 모금액의 5%(VAT 별도)입니다. <br>
펀딩에 실패한 프로젝트는 애당초 결제가 발생하지 않으므로 수수료 또한 없습니다.<br><br>

 

캐치펀 결제 수수료<br>
결제 수수료는 결제 성공 금액의 3%(VAT 별도)입니다.<br>
이는 캐치펀이 창작자의 프로젝트에 대한 후원 결제를 진행하는 데에 발생한 비용을 받아 결제 대행사에 납부하는 비용입니다.<br><br>

세금계산서 발행<br>
캐치펀은 부가가치세법 18조에 의거하여, 모집에 소요된 모든 수수료에 대해 프로젝트 진행자가 비용을 증빙할 수 있도록 전자세금계산서를 발행해드리고 있습니다.

        </p>
    

            


    
    <div class="div1"><span class="icon_site">사이트이용</span><span>비밀번호는 어떻게 바꾸나요?</span></div>
    <p class="content">

        캐치펀 메인화면 우측 상단의 로그인/회원가입을 클릭하시면 로그인 페이지로 이동합니다.
        로그인 상자 하단의 혹시 비밀번호를 잊으셨나요?를 클릭하시면 비밀번호를 재설정하실 수 있습니다.
    </p>

    <div class="div1"><span class="icon_site">사이트이용</span><span>계정 삭제는 어떻게 하나요? (탈퇴)</span></div>
    <p class="content">

     마이페이지에서 탈퇴하기 하시면 됩니다.
    </p>

</div>
</div>

</body>

</html>
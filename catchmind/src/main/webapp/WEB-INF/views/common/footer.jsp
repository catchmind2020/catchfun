<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .footer{
            width:1200px;
            font-size:12px;
            top:0;
            right:0;
            bottom: 0;
            left:0;
            margin:auto;
        }
        .footer-area{
            margin-left:40px;
            color:black;
        }
        .footermenu{
            display:table-cell;
            width:200px;
            height:35px;
            text-align:center;
            vertical-align:middle;
        }
        .footer-copyright{
            margin-left:100px;
            margin-right: 70px;
            color:black;
            font-weight: 900;
        }
        .sizef{font-size: 10px; float:right; color:black}
        hr{margin:5px;}
</style>
</head>
<body>
	<div class="footer">
		<div style="height:100px;"></div>
        <hr>
        <div class="footer-area">
            <div class="footermenu">회원가입약관</div>
            <div class="footermenu">서비스이용약관</div>
            <div class="footermenu">개인정보처리방침</div>
            <div class="footermenu">운영정책</div>
            <div class="footermenu">이용가이드</div>
            <div class="footermenu">캐치펀문의</div>
        </div>
        <hr>
        <div>
            <div class="footer-copyright">
                캐치펀은 플랫폼 제공자로서 프로젝트의 당사자가 아니며, 직접적인 통신판매를 진행하지 않습니다. <br>
                프로젝트의 완수 및 리워드제공의 책임은 해당 프로젝트의 창작자에게 있으며, 프로젝트와 관련하여 후원자와 발생하는 법적 분쟁에 대한 책임은 해당 창작자가 부담합니다.
            </div>
            <div class="footer-copyright">
                <b>캐치펀(주) | 서울시 강남구 테헤란로 14길 6 남도빌딩 3F | 대표전화 02-6080-0760</b>
            </div>
            <div class="footer-copyright sizef"><b>Copyright © 2020 CATCHFUN</b></div>
        </div>
    </div>
    <br><br>
</body>
</html>
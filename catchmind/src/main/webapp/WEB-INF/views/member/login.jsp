<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<style>
.wrap{width:1000px; height:700px; margin:auto; 
        text-align: center; }
.wrap>#header{width:100%; height:5%; margin-bottom:60px;}
.wrap>#content{width:100%; height:70%;}
.wrap>#footer{width:100%; height:20%;}

form {margin: 0 auto; border: 3px solid #f1f1f1; width:400px; height:400px;}    

body {font-family: Arial, Helvetica, sans-serif;}


input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color:#28d7d7;
  color: white;
  padding: 14px 20px;
  margin: 15px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {opacity: 0.8;}

.cancelbtn {width: auto; padding: 10px 18px; background-color: rgb(134, 122, 122);}

.imgcontainer {text-align: center;margin: 24px 0 12px 0;}

img.avatar {width: 40%;border-radius: 50%;}

.container {padding: 16px;}

span.psw {float: right;padding-top: 16px;}

span.uname {float: right; padding-top: 16px;}

@media screen and (max-width: 300px) {
  span.psw {display: block;float: none;}
  .cancelbtn {width: 100%;}
}
/* 메뉴바 영역 */
.header-area {width: 1200px; margin-left: 40px; color: gray; padding-top: 10px; margin-top: 20px; margin-bottom: 10px;
	top: 0; right: 0; bottom: 0; left: 0; margin: auto;}

</style>
   
</head>
<body>
    <jsp:include page="../common/menubar.jsp"/>
    
    <div class="wrap">
        

        <h1 style="margin-top: 150px;">로그인</h1>

        <form id="loginForm" action="login.me" method="post">
          
          <div id="content">
          <div class="container" >
            <label for="uname"><b>아이디</b></label>
            <input type="text" placeholder="Enter Username" id="userId" name="userId" required>

            <label for="psw"><b>비밀번호</b></label>
            <input type="password" placeholder="Enter Password" id="userPwd" name="userPwd" required>

            <div class="container" style="background-color:#f1f1f1">
                <label>
                    <input type="checkbox" checked="checked" name="remember">아이디 저장하기
                  </label>
              
                <span class="psw"><a href="#">/비밀번호찾기</a></span>
                <span class="uname"><a href="#">아이디찾기</a></span>                   
              </div>
                
            <button type="submit">Login</button>

            <center>
              아직계정이 없나요? &nbsp;
             <button type="button" class="cancelbtn">회원가입</button>
            </center>
        
</form>
</div>

</body>
</html>